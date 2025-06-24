import React, { useState } from 'react';
import axios from 'axios';

const Consulta = () => {
  const [nombreAcudiente, setNombreAcudiente] = useState('');
  const [resultado, setResultado] = useState(null);
  const [mensaje, setMensaje] = useState('');

  const manejarConsulta = async () => {
    try {
      const res = await axios.get(`http://localhost:3001/consultar/${nombreAcudiente}`);
      setResultado(res.data);
      setMensaje('');
    } catch (error) {
      setResultado(null);
      setMensaje('No se encontró información para ese acudiente');
    }
  };

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-4">Consultar Estudiante</h1>
      <input
        type="text"
        placeholder="Nombre del acudiente"
        value={nombreAcudiente}
        onChange={(e) => setNombreAcudiente(e.target.value)}
        className="border p-2 rounded mb-4 w-full"
      />
      <button
        onClick={manejarConsulta}
        className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700"
      >
        Consultar
      </button>

      {mensaje && <p className="mt-4 text-red-600">{mensaje}</p>}

      {resultado && (
        <div className="mt-6 border p-4 rounded bg-gray-100">
          <p><strong>Estudiante:</strong> {resultado.estudiante}</p>
          <p><strong>Fecha de nacimiento:</strong> {resultado.fecha_nacimiento}</p>
          <p><strong>Municipio:</strong> {resultado.municipio}</p>
          <p><strong>Institución:</strong> {resultado.tipo_institucion || 'No asignada aún'}</p>
          <p><strong>Dirección Institución:</strong> {resultado.direccion_institucion || 'No asignada'}</p>
        </div>
      )}
    </div>
  );
};

export default Consulta;
