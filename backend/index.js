const express = require('express');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
app.use(cors());
app.use(express.json());

const conexion = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '626892',
  database: 'school'
});

conexion.connect(err => {
  if (err) {
    console.error('Error de conexión:', err);
    return;
  }
  console.log('Conectado a MySQL');
});

app.post('/inscribir', async (req, res) => {
  const { acudiente_nombre, acudiente_telefono, estudiante_nombre, estudiante_edad, municipio } = req.body;

  try {
    // Verificar si el municipio existe
    const [munRow] = await conexion.promise().query('SELECT id FROM Municipio WHERE nombre = ?', [municipio]);
    if (!munRow.length) return res.status(400).send({ error: 'Municipio no encontrado' });
    const municipio_id = munRow[0].id;

    // Insertar acudiente
    const [acudienteRes] = await conexion.promise().query(
      'INSERT INTO Acudiente (nombre, telefono, municipio_id) VALUES (?, ?, ?)',
      [acudiente_nombre, acudiente_telefono, municipio_id]
    );
    const acudiente_id = acudienteRes.insertId;

    // Buscar institución con cupos
    const [institucionRow] = await conexion.promise().query(
      'SELECT id, nombre FROM Institucion WHERE municipio_id = ? AND cupos_disponibles > 0 LIMIT 1',
      [municipio_id]
    );
    if (!institucionRow.length) return res.status(400).send({ error: 'No hay instituciones disponibles' });
    const institucion_id = institucionRow[0].id;
    const institucion = institucionRow[0].nombre;

    // Insertar estudiante
    await conexion.promise().query(
      'INSERT INTO Estudiante (nombre, edad, acudiente_id, institucion_id) VALUES (?, ?, ?, ?)',
      [estudiante_nombre, estudiante_edad, acudiente_id, institucion_id]
    );

    // Reducir cupo disponible
    await conexion.promise().query(
      'UPDATE Institucion SET cupos_disponibles = cupos_disponibles - 1 WHERE id = ?',
      [institucion_id]
    );

    res.json({
      acudiente_nombre,
      acudiente_telefono,
      estudiante_nombre,
      estudiante_edad,
      municipio,
      institucion
    });
  } catch (err) {
    console.error('Error en inscripción:', err);
    res.status(500).send({ error: 'Error en el servidor' });
  }
});

app.listen(3001, () => {
  console.log('Servidor backend en http://localhost:3001');
});
