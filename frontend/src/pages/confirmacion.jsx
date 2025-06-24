import React from 'react';
import { Link } from 'react-router-dom';

const Confirmacion = () => {
  return (
    <div className="max-w-xl mx-auto bg-white p-8 mt-10 shadow-md rounded text-center">
      <h2 className="text-2xl font-bold text-green-600 mb-4">¡Inscripción enviada con éxito!</h2>
      <p className="mb-6 text-gray-700">Te notificaremos pronto en qué institución fue aceptado el estudiante.</p>
      <Link to="/resultado" className="text-blue-600 hover:underline">
        Ver resultado ahora
      </Link>
    </div>
  );
};

export default Confirmacion;