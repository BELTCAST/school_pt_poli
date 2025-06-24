import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import FormularioInscripcion from './components/formulario_inscripcion';
import Confirmacion from './pages/confirmacion';
import Resultado from './pages/resultado';
import Inicio from './pages/inicio';
import Consulta from './pages/consulta';

function App() {
  return (
    <Router>
      <div className="min-h-screen bg-gray-100 p-4">
        <Routes>
          <Route path="/" element={<Inicio />} />
          <Route path="/inscripcion" element={<FormularioInscripcion />} />
          <Route path="/consulta" element={<Consulta />} />
          <Route path="/confirmacion" element={<Confirmacion />} />
          <Route path="/resultado" element={<Resultado />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
