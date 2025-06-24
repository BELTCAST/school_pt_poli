import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';

const Resultado = () => {
  const [datos, setDatos] = useState(null);
  const location = useLocation();
  const estudianteId = new URLSearchParams(location.search).get('estudianteId');

  useEffect(() => {
    if (!estudianteId) return;
    axios.get(`http://localhost:3001/resultado/${estudianteId}`)
      .then(res => setDatos(res.data))
      .catch(err => {
        console.error(err);
        setDatos({ error: 'No se pudo cargar el resultado' });
      });
  }, [estudianteId]);

  if (!datos) return <p className="text-center mt-10 text-gray-700">Cargando...</p>;
  if (datos.error) return <p className="text-center mt-10 text-red-500">{datos.error}</p>;

  return (
    <div className="max-w-2xl mx-auto mt-10 p-6 bg-white rounded shadow-md">
      <h2 className="text-2xl font-semibold mb-4">Resultado de Inscripción</h2>
      <p><strong>Acudiente:</strong> {datos.acudiente.nombre}, {datos.acudiente.edad} años, {datos.acudiente.ocupacion}</p>
      <p><strong>Correo:</strong> {datos.acudiente.correo}</p>
      <p><strong>Dirección:</strong> {datos.acudiente.direccion} - {datos.acudiente.municipio}</p>
      <hr className="my-3" />
      <p><strong>Estudiante:</strong> {datos.estudiante.nombre} (nacido el {datos.estudiante.fecha_nacimiento})</p>
      <hr className="my-3" />
      <p><strong>Institución asignada:</strong> {datos.institucion.nombre}</p>
      <p><strong>Dirección:</strong> {datos.institucion.direccion}</p>
      <p><strong>Correo:</strong> {datos.institucion.correo}</p>
    </div>
  );
};

export default Resultado;
