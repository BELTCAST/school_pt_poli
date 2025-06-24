import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const FormularioInscripcion = () => {
  const [nombreAcudiente, setNombreAcudiente] = useState('');
  const [edad, setEdad] = useState('');
  const [correo, setCorreo] = useState('');
  const [ocupacion, setOcupacion] = useState('');
  const [direccion, setDireccion] = useState('');
  const [municipioId, setMunicipioId] = useState('');
  const [municipios, setMunicipios] = useState([]);
  const [viveConElJoven, setViveConElJoven] = useState(false);
  const [nombreEstudiante, setNombreEstudiante] = useState('');
  const [fechaNacimiento, setFechaNacimiento] = useState('');
  const [mensaje, setMensaje] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    axios.get('http://localhost:3001/municipios')
      .then(response => {
        setMunicipios(response.data);
      })
      .catch(error => {
        console.error('Error al obtener municipios:', error);
      });
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const datos = {
        nombreAcudiente,
        edad,
        correo,
        ocupacion,
        direccion,
        municipio_id: municipioId,
        vive_con_el_joven: viveConElJoven ? 1 : 0,
        nombreEstudiante,
        fecha_nacimiento: fechaNacimiento
      };

      const response = await axios.post('http://localhost:3001/inscribir', datos);
      setMensaje('Inscripción exitosa');
      navigate('/resultado');
    } catch (error) {
      console.error('Error al inscribir:', error);
      setMensaje('Fallo de conexión con el servidor');
    }
  };

  return (
    <div className="max-w-md mx-auto mt-10 bg-white p-8 rounded shadow">
      <h2 className="text-2xl font-bold mb-4">Formulario de Inscripción</h2>
      {mensaje && (
        <p className={`text-sm mb-4 ${mensaje.includes('exitosa') ? 'text-blue-600' : 'text-red-600'}`}>
          {mensaje}
        </p>
      )}
      <form onSubmit={handleSubmit}>
        <input className="w-full mb-2 p-2 border rounded" type="text" placeholder="Nombre del acudiente *" value={nombreAcudiente} onChange={e => setNombreAcudiente(e.target.value)} required />
        <input className="w-full mb-2 p-2 border rounded" type="number" placeholder="Edad *" value={edad} onChange={e => setEdad(e.target.value)} required />
        <input className="w-full mb-2 p-2 border rounded" type="email" placeholder="Correo *" value={correo} onChange={e => setCorreo(e.target.value)} required />
        <input className="w-full mb-2 p-2 border rounded" type="text" placeholder="Ocupación *" value={ocupacion} onChange={e => setOcupacion(e.target.value)} required />
        <input className="w-full mb-2 p-2 border rounded" type="text" placeholder="Dirección *" value={direccion} onChange={e => setDireccion(e.target.value)} required />

        <select className="w-full mb-2 p-2 border rounded" value={municipioId} onChange={e => setMunicipioId(e.target.value)} required>
          <option value="">Seleccione un municipio *</option>
          {municipios.map(muni => (
            <option key={muni.municipio_id} value={muni.municipio_id}>{muni.nombre}</option>
          ))}
        </select>

        <div className="flex items-center mb-2">
          <input id="viveCon" type="checkbox" checked={viveConElJoven} onChange={() => setViveConElJoven(!viveConElJoven)} className="mr-2" />
          <label htmlFor="viveCon">¿Vive con el estudiante?</label>
        </div>

        <input className="w-full mb-2 p-2 border rounded" type="text" placeholder="Nombre del estudiante *" value={nombreEstudiante} onChange={e => setNombreEstudiante(e.target.value)} required />
        <input className="w-full mb-4 p-2 border rounded" type="date" value={fechaNacimiento} onChange={e => setFechaNacimiento(e.target.value)} required />

        <button type="submit" className="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition duration-200">
          Enviar inscripción
        </button>
      </form>
    </div>
  );
};

export default FormularioInscripcion;
