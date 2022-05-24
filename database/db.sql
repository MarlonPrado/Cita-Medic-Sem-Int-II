CREATE DATABASE database_medic;
USE  database_medic;

-- Tabla Usuarios
CREATE TABLE user(
    id INT(11) NOT NULL,
    correo  VARCHAR(20) NOT NULL,
    clave  VARCHAR(30) NOT NULL,
    nombre VARCHAR(15) NOT NULL,
    edad INT(2) NOT NULL,
    tipodocumento VARCHAR(15) NOT NULL,
    numerodocumento INT(10) NOT NULL,
    rol VARCHAR(10) NOT NULL
);


ALTER TABLE user
    ADD PRIMARY KEY(id);
ALTER TABLE user
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

-- Tabla Pacientes
CREATE TABLE paciente(
    idp INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT=1,
    nombrep  VARCHAR(20) NOT NULL,
    edadp INT(2) NOT NULL,
    eps  VARCHAR(20) NOT NULL,
    anioingres INT(2) NOT NULL,
    user_id INT(11) NOT NULL,
    created_at timestamp  NOT NULL DEFAULT current_timestamp,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id)
);
ALTER TABLE paciente
    MODIFY anioingres INT(4) NOT NULL ;

ALTER TABLE paciente
    MODIFY idp INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, AUTO_INCREMENT=1;
    MODIFY user_id INT(11) ;
ALTER TABLE paciente
 MODIFY user_id INT(11) ;


DESCRIBE user;
DESCRIBE paciente;