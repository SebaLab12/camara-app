--Crear la base de datos
CREATE DATABASE IF NOT EXISTS SistemaCamaras;
USE SistemaCamaras;

--Crear tabla USUARIO
CREATE TABLE USUARIO (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Usuario VARCHAR(255) NOT NULL,
    Contrasenia VARCHAR(255),
    Correo VARCHAR(255) UNIQUE
);

--Crear tabla CAMARA
CREATE TABLE CAMARA (
    ID_Camara INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Nombre_Camara VARCHAR(255),
    Direccion_IP VARCHAR(15) UNIQUE,
    FOREIGN KEY (ID_Usuario) REFERENCES USUARIO(ID_Usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--Crear tabla VIDEO
CREATE TABLE VIDEO (
    ID_Video INT AUTO_INCREMENT PRIMARY KEY,
    ID_Camara INT NOT NULL,
    Fecha_Hora DATETIME NOT NULL,
    Ubicacion_Archivo VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Camara) REFERENCES CAMARA(ID_Camara)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--Ingresar datos en USUARIO
INSERT INTO USUARIO (Nombre_Usuario, Contrasenia, Correo) VALUES
('jgarcia', 'clave123', 'jgarcia@gmail.com'),
('mlopez', 'pass456', 'mlopez@gmail.com');

--Ingresar datos en CAMARA
INSERT INTO CAMARA (ID_Usuario, Nombre_Camara, Direccion_IP) VALUES
(1, 'Camara Salon', '192.168.1.10'),
(1, 'Entrada', '192.168.1.13'),
(2, 'Pieza Bebe', '192.168.1.12'),
(1, 'Cocina', '192.168.1.11');

--Ingresar datos en VIDEO
INSERT INTO VIDEO (ID_Camara, Fecha_Hora, Ubicacion_Archivo) VALUES
(2, '2025-04-12 14:23:42', '/videos/camara2/vid_20250412_1423.mp4'),
(1, '2025-04-12 13:51:28', '/videos/camara1/vid_20250412_1351.mp4'),
(4, '2025-04-10 12:08:55', '/videos/camara4/vid_20250410_1208.mp4'),
(3, '2025-04-11 10:42:12', '/videos/camara3/vid_20250411_1042.mp4');
