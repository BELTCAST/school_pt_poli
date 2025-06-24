import { useNavigate } from 'react-router-dom';

function Inicio() {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gray-100">
      <h1 className="text-2xl font-bold mb-6">Bienvenido al sistema de inscripción</h1>
      <div className="flex gap-4">
        <button
          className="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700"
          onClick={() => navigate('/formulario')}
        >
          Inscribir estudiante
        </button>
        <button
          className="bg-green-600 text-white px-6 py-2 rounded hover:bg-green-700"
          onClick={() => navigate('/consulta')}
        >
          Consultar estudiantes
        </button>
      </div>
    </div>
  );
}

export default Inicio;
