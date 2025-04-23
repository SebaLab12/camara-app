import React, { useState } from 'react';
import './App.css';

function App() {
  const [camaraSeleccionada, setCamaraSeleccionada] = useState(null);
  const [mostrarGrabaciones, setMostrarGrabaciones] = useState(false);

  const camaras = ['Cámara 1', 'Cámara 2', 'Cámara 3', 'Cámara 4'];

  const handleSeleccion = (camara) => {
    setCamaraSeleccionada(camara);
  };

  const handleMostrarGrabaciones = () => {
    setCamaraSeleccionada(null);
    setMostrarGrabaciones(true);
  };

  const handleVolver = () => {
    setCamaraSeleccionada(null);
    setMostrarGrabaciones(false);
  };
  

  return (
    <div className="app-container">
      <aside className="sidebar">
        <div className="menu-box">
          <div className="menu-title">MENU</div>
          {camaras.map((camara, index) => (
            <button key={index} className="menu-button" onClick={() => handleSeleccion(camara)}>
              {camara}
            </button>
          ))}
        </div>

        <div className="bottom-controls">
          <button className="menu-button movimiento" onClick={handleMostrarGrabaciones}>Detección de Movimiento</button>
          <div className="settings-icon">⚙️</div>
        </div>
      </aside>

      <main className="main-content">
        <header className="header">
          {camaraSeleccionada ? camaraSeleccionada : mostrarGrabaciones ? 'Grabaciones de Movimento' : 'Cámaras'}
        </header>

        {camaraSeleccionada ? (
          <div className="camara-grande">
            <div className="volver-btn-container">
              <button className="volver-btn" onClick={handleVolver}>← Volver</button>
            </div>
            <div className="camara-box grande">
              Mostrando {camaraSeleccionada}
            </div>
          </div>
        ) : mostrarGrabaciones ? (
          <div className="camara-grande">
            <div className="volver-btn-container">
              <button className="volver-btn" onClick={handleVolver}>← Volver</button>
            </div>
            <div className="grabaciones">
              <ul>
                <li>🎥 Movimiento detectado en Cámara 2 - 14:23</li>
                <li>🎥 Movimiento detectado en Cámara 1 - 13:51</li>
                <li>🎥 Movimiento detectado en Cámara 4 - 12:08</li>
                <li>🎥 Movimiento detectado en Cámara 3 - 10:42</li>
              </ul>
            </div>
          </div>
        ) : (
          <div className="camera-grid">
            {camaras.map((camara, index) => (
              <div className="camera-box" key={index}>
                {camara}
              </div>
            ))}
          </div>
        )}
      </main>
    </div>
  );
}

export default App;

