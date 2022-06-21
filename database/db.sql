CREATE DATABASE database_odontologia;
USE  database_odontologia;

-- Tabla Usuarios
CREATE TABLE user(
    id INT(11) NOT NULL,
    nombre  VARCHAR(30) NOT NULL,
    cc INT(12) NOT NULL,
    edad INT(2) NOT NULL,
    titulo  VARCHAR(100) NOT NULL,
    correo  VARCHAR(100) NOT NULL,
    clave  VARCHAR(3000) NOT NULL,
   
    rol VARCHAR(20) NOT NULL
);


ALTER TABLE user
    ADD PRIMARY KEY(id);
ALTER TABLE user
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

-- Tabla Pacientes
CREATE TABLE paciente(
    idp INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombrep  VARCHAR(20) NOT NULL,
    edadp INT(2) NOT NULL,
    eps  VARCHAR(20) NOT NULL,
    anioingres INT(2) NOT NULL,
    user_id INT(11) ,
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

ALTER TABLE paciente
    MODIFY anioingres date NOT NULL ;

CREATE TABLE cita(
    idc INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombrep  VARCHAR(20) NOT NULL,
    motivo  VARCHAR(30) NOT NULL,
    descrp  VARCHAR(60) NOT NULL,
    fechai date NOT NULL,
    fechaf date NOT NULL,
    nombreo  VARCHAR(20) NOT NULL,
    estado  VARCHAR(20) NOT NULL,
    user_id INT(11) ,
    created_at timestamp  NOT NULL DEFAULT current_timestamp,
    CONSTRAINT fk_userCita FOREIGN KEY (user_id) REFERENCES user(id)
);

ALTER TABLE cita
    ADD observaciones VARCHAR(50) NULL  DEFAULT 'No hay Observacion';
    ADD odontograma VARCHAR(1000) NULL DEFAULT 'No hay Odontograma anexado todavia';
    ADD recomendaciones VARCHAR(50) NULL DEFAULT 'No hay Recomendaciones';
    MODIFY estado  NULL VARCHAR(20) DEFAULT 'Agendado'
ALTER TABLE cita
   MODIFY estado VARCHAR(20)  NULL  DEFAULT 'Agendado';
DESCRIBE user;
DESCRIBE paciente;