--Script Clínica Odontológica 

CREATE DATABASE ClinicaOdontologica;
\c clinicaodontologica;

-- Creación de usuarios
CREATE ROLE adminuser
WITH LOGIN PASSWORD 'admin123' CREATEDB CREATEROLE;
CREATE ROLE odontologo
WITH LOGIN PASSWORD 'odontologo';
CREATE ROLE paciente
WITH LOGIN PASSWORD 'paciente';

ALTER ROLE adminuser WITH SUPERUSER;

-- Creación de Schemas para la BD

CREATE SCHEMA Seguridad;
CREATE SCHEMA Personal;
CREATE SCHEMA Pacientes;
CREATE SCHEMA Clinica;
CREATE SCHEMA Tratamientos;
CREATE SCHEMA Facturacion;
CREATE SCHEMA Auditoria;

-- Creación de Enums para BD

CREATE TYPE estadoConsultorio AS ENUM
('Disponible', 'Ocupado', 'En mantenimiento');
CREATE TYPE estadoOcupadoDisponible AS ENUM
('Disponible', 'Ocupado');
CREATE TYPE estadoCitacpc AS ENUM
('Confirmada', 'Pendiente', 'Cancelada');
CREATE TYPE estadopagoppc AS ENUM
('Pagado', 'Pendiente', 'Cancelado');
CREATE TYPE estadoactivoInactivo AS ENUM
('Activo', 'Inactivo');

-- Creación de tablas de auditoria 

CREATE TABLE Auditoria.RolAuditoria
(
    idauditoriarol INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.AfiliacionAuditoria
(
    idauditoriaafiliacion INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.DescuentoAuditoria
(
    idauditoriadescuento INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.ConsultorioAuditoria
(
    idauditoriaconsultorio INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.InformacionPersonalOdontologoAuditoria
(
    idauditoriainformacionpersonalodontologo INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.EstadoTratamientoTablaAuditoria
(
    idauditoriaestadotratamientotabla INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.EstadoDienteTablaAuditoria
(
    idauditoriaestadodientetabla INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.MetodoPagoTablaAuditoria
(
    idauditoriametodopagotabla INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.UsuarioAuditoria
(
    idauditoriausuario INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.OdontologoAuditoria
(
    idauditoriaodontologo INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.CategoriaTratamientoTablaAuditoria
(
    idauditoriacategoriatratamientotabla INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.AnguloAuditoria
(
    idauditoriaangulo INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.PacienteAuditoria
(
    idauditoriapaciente INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.DienteAuditoria
(
    idauditoriadiente INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.HistorialClinicoAuditoria
(
    idauditoriahistorialclinico INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.NumeroTelefonoPacienteAuditoria
(
    idauditorianumerotelefonopaciente INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.NumeroTelefonoEmpleadoAuditoria
(
    idauditorianumerotelefonoempleado INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.PesoPacienteAuditoria
(
    idauditoriapesopaciente INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.CitaAuditoria
(
    idauditoriacita INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.TratamientoAuditoria
(
    idauditoriatratamiento INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.FacturacionAuditoria
(
    idauditoriafacturacion INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.HistorialClinicoDienteAuditoria
(
    idauditoriahistorialclinicodiente INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.HorarioOdontologoAuditoria
(
    idauditoriahorarioodontologo INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);

CREATE TABLE Auditoria.CItaTratamientoAuditoria
(
    idauditoriacitatratamiento INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    nombreTabla VARCHAR(50) NOT NULL,
    tipoOperacion VARCHAR(25) NOT NULL,
    fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    datosAnteriores JSONB,
    datosNuevos JSONB
);



-- Creación de tablas para BD

CREATE TABLE Seguridad.Rol
(
    IdRol int not null,
    NombreRol VARCHAR(15) not null,
    EstadoRol estadoactivoInactivo not null
);

CREATE TABLE Pacientes.Afiliacion
(
    CodAfiliacion int not null,
    TipoAfiliacion VARCHAR(25) not null,
    PorcentajeCobertura DECIMAL(5,2) not null,
    EstadoAfiliacion estadoactivoInactivo not null
);

CREATE TABLE Facturacion.Descuento
(
    IdDescuento int not null,
    MotivoDescuento VARCHAR(120) not null,
    EstadoDescuento estadoactivoInactivo not null
);

CREATE TABLE Personal.Consultorio
(
    CodConsultorio int not null,
    EstadoConsultorio estadoConsultorio not null,
    NumeroConsultorio int not null,
    CapacidadConsultorio int not null
);

CREATE TABLE Personal.InformacionPersonalOdontologo
(
    NumDocumentoOdontolo int not null,
    NombreUnoOdontologo VARCHAR(50) not null,
    NombreDosOdontologo VARCHAR(50) null,
    ApellidoUnoOdontologo VARCHAR(50) not null,
    ApellidoDosOdontologo VARCHAR(50) not null
);

CREATE TABLE Clinica.EstadoTratamientoTabla
(
    IdEstadoTratamiento int not null,
    EstadoTratamiento VARCHAR(20)
);

CREATE TABLE Clinica.EstadoDienteTabla
(
    IdEstadoDiente int not null,
    EstadoDiente VARCHAR(20) not null
);

CREATE TABLE Facturacion.MetodoPagoTabla
(
    IdMetodoPago int not null,
    MetodoPago VARCHAR(30) not null,
    EstadoMetodoPago estadoactivoInactivo not null
);

CREATE TABLE Seguridad.Usuario
(
    IdUsuario int not null,
    EmailUsuario VARCHAR(100) not null,
    ContraseñaUsuario VARCHAR(50) not null,
    EstadoUsuario estadoactivoInactivo not null,
    IdRol int not null
);

CREATE TABLE Personal.Odontologo
(
    CodOdontologo int not null,
    AniosExperiencia int not null,
    FechaContratacion DATE not null,
    HoraEntrada TIME not null,
    HoraSalida TIME not null,
    Especialidad VARCHAR(30) not null,
    EstadoOdontologo estadoactivoInactivo not null,
    IdUsuario int not null ,
    CodConsultorio int not null ,
    NumDocumentoOdontolo int not null
);


CREATE TABLE Tratamientos.CategoriaTratamientoTabla
(
    IdCategoriaTratamiento int not null,
    CategoriaTratamiento VARCHAR(25) not null,
    EstadoCategoriaTratamiento estadoactivoInactivo not null
);

CREATE TABLE Clinica.Angulo
(
    IdAngulo int not null,
    CaraCoronaCervical VARCHAR(40) not null,
    TercioOclusal VARCHAR(40) not null,
    Corona VARCHAR(40) not null,
    RaizCervical VARCHAR(40) not null,
    TercioLabioLingual VARCHAR(40) not null,
    EstadoAngulo estadoactivoInactivo not null
);

CREATE TABLE Pacientes.Paciente
(
    NumDocumentoPaciente int not null,
    FechaNacimiento DATE not null,
    AlturaPaciente DECIMAL(3,2) not null,
    NombreUnoPaciente VARCHAR(25) not null,
    NombreDosPaciente VARCHAR(25) null,
    ApellidoUnoPaciente VARCHAR(25) not null,
    ApellidoDosPaciente VARCHAR(25) not null,
    EstadoPaciente estadoactivoInactivo not null,
    CodHistorial int not null,
    CodAfiliacion int not null ,
    IdUsuario int not null
);


CREATE TABLE Clinica.Diente
(
    IdDiente int not null,
    NumeroDiente int not null,
    Cuadrante int not null,
    TipoDiente VARCHAR(50) not null,
    EstadoDiente estadoactivoInactivo not null,
    IdAngulo int not null
);

CREATE TABLE Clinica.HistorialClinico
(
    CodHistorial int not null,
    DiagnosticoHistorialClinico VARCHAR(180) not null,
    EstadoHistorialClinico estadoactivoInactivo not null,
    IdEstadoTratamiento int not null
);


CREATE TABLE Pacientes.NumeroTelefonoPaciente
(
    CodNumeroTelefonoPa int not null,
    NumeroTelefonoPa VARCHAR(12) not null,
    EstadoNumeroTelPaciente estadoactivoInactivo not null,
    NumeroIdentificacionPaciente int not null
);

CREATE TABLE Personal.NumeroTelefonoEmpleado
(
    CodNumeroTelefonoOd int not null,
    NumeroTelefonoOd VARCHAR(12) not null,
    EstadoNumeroTelOdontologo estadoactivoInactivo not null,
    NumeroIdentificacionOdontologo int not null
);

CREATE TABLE Pacientes.PesoPaciente
(
    CodPeso int not null,
    PesoPaciente int not null,
    EstadoPeso estadoactivoInactivo not null,
    NumeroIdentificacionPaciente int not null
);

CREATE TABLE Clinica.Cita
(
    CodCita int not null,
    EstadoCita estadoCitacpc not null,
    Observaciones VARCHAR(180) not null,
    Duracion VARCHAR(40) not null,
    CodHorario int not null ,
    NumeroIdentificadorPaciente int not null
);

CREATE TABLE Tratamientos.Tratamiento
(
    IdTratamiento int not null,
    NombreTratamiento VARCHAR(30) not null,
    DescripcionTratamiento VARCHAR(180) not null,
    CostoTratamiento Bigint not null,
    EstadoTratamiento estadoactivoInactivo not null,
    IdCategoriaTratamiento int not null
);

CREATE TABLE Facturacion.Facturacion
(
    IdFactura int not null,
    EstadoPago estadopagoppc not null,
    FechaFacturacion DATE not null,
    IdMetodoPago int not null ,
    CodCita int not null ,
    IdDescuento int not null
);

CREATE TABLE Clinica.HistorialClinicoDiente
(
    PFK_idDiente int not null ,
    PFK_CodHistorial int not null ,
    FechaRegistro DATE not null,
    ResultadoTratamiento VARCHAR(150) not null,
    EstadoHistorialClinicoDiente estadoactivoInactivo not null,
    IdEstadoDiente int not null
);


CREATE TABLE Personal.HorarioOdontologo
(
    CodHorario int not null,
    Fechahorario DATE not null,
    HoraHorario TIME not null,
    EstadoHorario estadoOcupadoDisponible not null,
    CodOdontologo int not null
);

CREATE TABLE CLinica.CItaTratamiento
(
    PFK_CodCita int not null,
    PFK_IdTratamiento int not null,
    CantidadRecursosUsados int not null,
    DescripcionRecursosUsados VARCHAR(180) not null,
    EstadoTratamiento estadoactivoInactivo not null
);










-- Creación de secuencias de ID para las tablas

-- Seguridad
CREATE SEQUENCE Seguridad.seq_idrol
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Seguridad.seq_idusuario
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;

-- Pacientes
CREATE SEQUENCE Pacientes.seq_codafiliacion
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Pacientes.seq_codnumerotelefonopa
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Pacientes.seq_codpeso
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;

-- Facturacion
CREATE SEQUENCE Facturacion.seq_iddescuento
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Facturacion.seq_idmetodopago
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Facturacion.seq_idfactura
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;

-- Personal
CREATE SEQUENCE Personal.seq_codconsultorio
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Personal.seq_cododontologo
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Personal.seq_codnumerotelefonood
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Personal.seq_codhorario
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;

-- Clinica
CREATE SEQUENCE Clinica.seq_idestadotratamiento
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Clinica.seq_idestadodiente
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Clinica.seq_idangulo
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Clinica.seq_iddiente
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Clinica.seq_codhistorial
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Clinica.seq_codcita
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;

-- Tratamientos
CREATE SEQUENCE Tratamientos.seq_idcategoriatratamiento
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
CREATE SEQUENCE Tratamientos.seq_idtratamiento
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;

-- Creación de secuencias y llaves primarias para las tablas de auditoria

CREATE SEQUENCE auditoria.seq_idauditoriarol
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.RolAuditoria 
    ALTER COLUMN idauditoriarol
SET
DEFAULT nextval
('auditoria.seq_idauditoriarol');
ALTER TABLE auditoria.RolAuditoria 
    ADD CONSTRAINT PK_RolAuditoria PRIMARY KEY (idauditoriarol);

CREATE SEQUENCE auditoria.seq_idauditoriaafiliacion
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.AfiliacionAuditoria 
    ALTER COLUMN idauditoriaafiliacion
SET
DEFAULT nextval
('auditoria.seq_idauditoriaafiliacion');
ALTER TABLE auditoria.AfiliacionAuditoria 
    ADD CONSTRAINT PK_AfiliacionAuditoria PRIMARY KEY (idauditoriaafiliacion);

CREATE SEQUENCE auditoria.seq_idauditoriadescuento
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.DescuentoAuditoria 
    ALTER COLUMN idauditoriadescuento
SET
DEFAULT nextval
('auditoria.seq_idauditoriadescuento');
ALTER TABLE auditoria.DescuentoAuditoria 
    ADD CONSTRAINT PK_DescuentoAuditoria PRIMARY KEY (idauditoriadescuento);

CREATE SEQUENCE auditoria.seq_idauditoriaconsultorio
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.ConsultorioAuditoria 
    ALTER COLUMN idauditoriaconsultorio
SET
DEFAULT nextval
('auditoria.seq_idauditoriaconsultorio');
ALTER TABLE auditoria.ConsultorioAuditoria 
    ADD CONSTRAINT PK_ConsultorioAuditoria PRIMARY KEY (idauditoriaconsultorio);

CREATE SEQUENCE auditoria.seq_idauditoriainformacionpersonalodontologo
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.InformacionPersonalOdontologoAuditoria 
    ALTER COLUMN idauditoriainformacionpersonalodontologo
SET
DEFAULT nextval
('auditoria.seq_idauditoriainformacionpersonalodontologo');
ALTER TABLE auditoria.InformacionPersonalOdontologoAuditoria 
    ADD CONSTRAINT PK_InformacionPersonalOdontologoAuditoria PRIMARY KEY (idauditoriainformacionpersonalodontologo);

CREATE SEQUENCE auditoria.seq_idauditoriaestadotratamientotabla
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.EstadoTratamientoTablaAuditoria 
    ALTER COLUMN idauditoriaestadotratamientotabla
SET
DEFAULT nextval
('auditoria.seq_idauditoriaestadotratamientotabla');
ALTER TABLE auditoria.EstadoTratamientoTablaAuditoria 
    ADD CONSTRAINT PK_EstadoTratamientoTablaAuditoria PRIMARY KEY (idauditoriaestadotratamientotabla);

CREATE SEQUENCE auditoria.seq_idauditoriaestadodientetabla
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.EstadoDienteTablaAuditoria 
    ALTER COLUMN idauditoriaestadodientetabla
SET
DEFAULT nextval
('auditoria.seq_idauditoriaestadodientetabla');
ALTER TABLE auditoria.EstadoDienteTablaAuditoria 
    ADD CONSTRAINT PK_EstadoDienteTablaAuditoria PRIMARY KEY (idauditoriaestadodientetabla);

CREATE SEQUENCE auditoria.seq_idauditoriametodopagotabla
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.MetodoPagoTablaAuditoria 
    ALTER COLUMN idauditoriametodopagotabla
SET
DEFAULT nextval
('auditoria.seq_idauditoriametodopagotabla');
ALTER TABLE auditoria.MetodoPagoTablaAuditoria 
    ADD CONSTRAINT PK_MetodoPagoTablaAuditoria PRIMARY KEY (idauditoriametodopagotabla);

CREATE SEQUENCE auditoria.seq_idauditoriausuario
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.UsuarioAuditoria 
    ALTER COLUMN idauditoriausuario
SET
DEFAULT nextval
('auditoria.seq_idauditoriausuario');
ALTER TABLE auditoria.UsuarioAuditoria 
    ADD CONSTRAINT PK_UsuarioAuditoria PRIMARY KEY (idauditoriausuario);

CREATE SEQUENCE auditoria.seq_idauditoriaodontologo
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.OdontologoAuditoria 
    ALTER COLUMN idauditoriaodontologo
SET
DEFAULT nextval
('auditoria.seq_idauditoriaodontologo');
ALTER TABLE auditoria.OdontologoAuditoria 
    ADD CONSTRAINT PK_OdontologoAuditoria PRIMARY KEY (idauditoriaodontologo);

CREATE SEQUENCE auditoria.seq_idauditoriacategoriatratamientotabla
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.CategoriaTratamientoTablaAuditoria 
    ALTER COLUMN idauditoriacategoriatratamientotabla
SET
DEFAULT nextval
('auditoria.seq_idauditoriacategoriatratamientotabla');
ALTER TABLE auditoria.CategoriaTratamientoTablaAuditoria 
    ADD CONSTRAINT PK_CategoriaTratamientoTablaAuditoria PRIMARY KEY (idauditoriacategoriatratamientotabla);

CREATE SEQUENCE auditoria.seq_idauditoriaangulo
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.AnguloAuditoria 
    ALTER COLUMN idauditoriaangulo
SET
DEFAULT nextval
('auditoria.seq_idauditoriaangulo');
ALTER TABLE auditoria.AnguloAuditoria 
    ADD CONSTRAINT PK_AnguloAuditoria PRIMARY KEY (idauditoriaangulo);

CREATE SEQUENCE auditoria.seq_idauditoriapaciente
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.PacienteAuditoria 
    ALTER COLUMN idauditoriapaciente
SET
DEFAULT nextval
('auditoria.seq_idauditoriapaciente');
ALTER TABLE auditoria.PacienteAuditoria 
    ADD CONSTRAINT PK_PacienteAuditoria PRIMARY KEY (idauditoriapaciente);

CREATE SEQUENCE auditoria.seq_idauditoriadiente
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.DienteAuditoria 
    ALTER COLUMN idauditoriadiente
SET
DEFAULT nextval
('auditoria.seq_idauditoriadiente');
ALTER TABLE auditoria.DienteAuditoria 
    ADD CONSTRAINT PK_DienteAuditoria PRIMARY KEY (idauditoriadiente);

CREATE SEQUENCE auditoria.seq_idauditoriahistorialclinico
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.HistorialClinicoAuditoria 
    ALTER COLUMN idauditoriahistorialclinico
SET
DEFAULT nextval
('auditoria.seq_idauditoriahistorialclinico');
ALTER TABLE auditoria.HistorialClinicoAuditoria 
    ADD CONSTRAINT PK_HistorialClinicoAuditoria PRIMARY KEY (idauditoriahistorialclinico);

CREATE SEQUENCE auditoria.seq_idauditorianumerotelefonopaciente
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.NumeroTelefonoPacienteAuditoria 
    ALTER COLUMN idauditorianumerotelefonopaciente
SET
DEFAULT nextval
('auditoria.seq_idauditorianumerotelefonopaciente');
ALTER TABLE auditoria.NumeroTelefonoPacienteAuditoria 
    ADD CONSTRAINT PK_NumeroTelefonoPacienteAuditoria PRIMARY KEY (idauditorianumerotelefonopaciente);

CREATE SEQUENCE auditoria.seq_idauditorianumerotelefonoempleado
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.NumeroTelefonoEmpleadoAuditoria 
    ALTER COLUMN idauditorianumerotelefonoempleado
SET
DEFAULT nextval
('auditoria.seq_idauditorianumerotelefonoempleado');
ALTER TABLE auditoria.NumeroTelefonoEmpleadoAuditoria 
    ADD CONSTRAINT PK_NumeroTelefonoEmpleadoAuditoria PRIMARY KEY (idauditorianumerotelefonoempleado);

CREATE SEQUENCE auditoria.seq_idauditoriapesopaciente
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.PesoPacienteAuditoria 
    ALTER COLUMN idauditoriapesopaciente
SET
DEFAULT nextval
('auditoria.seq_idauditoriapesopaciente');
ALTER TABLE auditoria.PesoPacienteAuditoria 
    ADD CONSTRAINT PK_PesoPacienteAuditoria PRIMARY KEY (idauditoriapesopaciente);

CREATE SEQUENCE auditoria.seq_idauditoriacita
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.CitaAuditoria 
    ALTER COLUMN idauditoriacita
SET
DEFAULT nextval
('auditoria.seq_idauditoriacita');
ALTER TABLE auditoria.CitaAuditoria 
    ADD CONSTRAINT PK_CitaAuditoria PRIMARY KEY (idauditoriacita);

CREATE SEQUENCE auditoria.seq_idauditoriatratamiento
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.TratamientoAuditoria
    ALTER COLUMN idauditoriatratamiento
SET
DEFAULT nextval
('auditoria.seq_idauditoriatratamiento');
ALTER TABLE auditoria.TratamientoAuditoria
    ADD CONSTRAINT PK_TratamientoAuditoria PRIMARY KEY (idauditoriatratamiento);

CREATE SEQUENCE auditoria.seq_idauditoriahorarioodontologo
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.horarioodontologoauditoria 
    ALTER COLUMN idauditoriahorarioodontologo 
SET
DEFAULT nextval
('auditoria.seq_idauditoriahorarioodontologo');
ALTER TABLE auditoria.horarioodontologoauditoria
    ADD CONSTRAINT PK_Horarioodontologoauditoria PRIMARY KEY (idauditoriahorarioodontologo);

    CREATE SEQUENCE auditoria.seq_idauditoriacitatratamiento
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.CItaTratamientoAuditoria 
    ALTER COLUMN idauditoriacitatratamiento 
SET
DEFAULT nextval
('auditoria.seq_idauditoriacitatratamiento');
ALTER TABLE auditoria.CItaTratamientoAuditoria
    ADD CONSTRAINT PK_citatratamientoauditoria PRIMARY KEY (idauditoriacitatratamiento);

    CREATE SEQUENCE auditoria.seq_idauditoriahistorialclinicodiente
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.HistorialClinicoDienteAuditoria 
    ALTER COLUMN idauditoriahistorialclinicodiente
SET
DEFAULT nextval
('auditoria.seq_idauditoriahistorialclinicodiente');
ALTER TABLE auditoria.HistorialClinicoDienteAuditoria
    ADD CONSTRAINT PK_historialclinicodienteauditoria PRIMARY KEY (idauditoriahistorialclinicodiente);

        CREATE SEQUENCE auditoria.seq_idauditoriafacturacion
START 1 INCREMENT 1 MINVALUE 1 NO MAXVALUE CACHE 1;
ALTER TABLE auditoria.FacturacionAuditoria 
    ALTER COLUMN idauditoriafacturacion
SET
DEFAULT nextval
('auditoria.seq_idauditoriafacturacion');
ALTER TABLE auditoria.FacturacionAuditoria
    ADD CONSTRAINT PK_facturacionauditoria PRIMARY KEY (idauditoriafacturacion);

-- Declaración de foráneas y primarias

-- Llaves primarias

-- Seguridad

ALTER TABLE Seguridad.Rol ADD CONSTRAINT PK_Rol PRIMARY KEY (IdRol);
ALTER TABLE Seguridad.Rol ALTER COLUMN IdRol
SET
DEFAULT nextval
('Seguridad.seq_idrol');

ALTER TABLE Seguridad.Usuario ADD CONSTRAINT PK_Usuario PRIMARY KEY (IdUsuario);
ALTER TABLE Seguridad.Usuario ALTER COLUMN IdUsuario
SET
DEFAULT nextval
('Seguridad.seq_idusuario');

-- Pacientes
ALTER TABLE Pacientes.Afiliacion ADD CONSTRAINT PK_Afiliacion PRIMARY KEY (CodAfiliacion);
ALTER TABLE Pacientes.Afiliacion ALTER COLUMN CodAfiliacion
SET
DEFAULT nextval
('Pacientes.seq_codafiliacion');

ALTER TABLE Pacientes.Paciente ADD CONSTRAINT PK_Paciente PRIMARY KEY (NumDocumentoPaciente);

ALTER TABLE Pacientes.NumeroTelefonoPaciente ADD CONSTRAINT PK_NumTelPaciente PRIMARY KEY (CodNumeroTelefonoPa);
ALTER TABLE Pacientes.NumeroTelefonoPaciente ALTER COLUMN CodNumeroTelefonoPa
SET
DEFAULT nextval
('Pacientes.seq_codnumerotelefonopa');

ALTER TABLE Pacientes.PesoPaciente ADD CONSTRAINT PK_PesoPaciente PRIMARY KEY (CodPeso);
ALTER TABLE Pacientes.PesoPaciente ALTER COLUMN CodPeso
SET
DEFAULT nextval
('Pacientes.seq_codpeso');

-- Facturación
ALTER TABLE Facturacion.Descuento ADD CONSTRAINT PK_Descuento PRIMARY KEY (IdDescuento);
ALTER TABLE Facturacion.Descuento ALTER COLUMN IdDescuento
SET
DEFAULT nextval
('Facturacion.seq_iddescuento');

ALTER TABLE Facturacion.MetodoPagoTabla ADD CONSTRAINT PK_MetodoPago PRIMARY KEY (IdMetodoPago);
ALTER TABLE Facturacion.MetodoPagoTabla ALTER COLUMN IdMetodoPago
SET
DEFAULT nextval
('Facturacion.seq_idmetodopago');

ALTER TABLE Facturacion.Facturacion ADD CONSTRAINT PK_Facturacion PRIMARY KEY (IdFactura);
ALTER TABLE Facturacion.Facturacion ALTER COLUMN IdFactura
SET
DEFAULT nextval
('Facturacion.seq_idfactura');

-- Personal
ALTER TABLE Personal.Consultorio ADD CONSTRAINT PK_Consultorio PRIMARY KEY (CodConsultorio);
ALTER TABLE Personal.Consultorio ALTER COLUMN CodConsultorio
SET
DEFAULT nextval
('Personal.seq_codconsultorio');

ALTER TABLE Personal.InformacionPersonalOdontologo ADD CONSTRAINT PK_InfoPersOdontologo PRIMARY KEY (NumDocumentoOdontolo);

ALTER TABLE Personal.Odontologo ADD CONSTRAINT PK_Odontologo PRIMARY KEY (CodOdontologo);
ALTER TABLE Personal.Odontologo ALTER COLUMN CodOdontologo
SET
DEFAULT nextval
('Personal.seq_cododontologo');

ALTER TABLE Personal.NumeroTelefonoEmpleado ADD CONSTRAINT PK_NumTelEmpleado PRIMARY KEY (CodNumeroTelefonoOd);
ALTER TABLE Personal.NumeroTelefonoEmpleado ALTER COLUMN CodNumeroTelefonoOd
SET
DEFAULT nextval
('Personal.seq_codnumerotelefonood');

ALTER TABLE Personal.HorarioOdontologo ADD CONSTRAINT PK_HorarioOdontologo PRIMARY KEY (CodHorario);
ALTER TABLE Personal.HorarioOdontologo ALTER COLUMN CodHorario
SET
DEFAULT nextval
('Personal.seq_codhorario');

-- Clínica
ALTER TABLE Clinica.EstadoTratamientoTabla ADD CONSTRAINT PK_EstadoTratamiento PRIMARY KEY (IdEstadoTratamiento);
ALTER TABLE Clinica.EstadoTratamientoTabla ALTER COLUMN IdEstadoTratamiento
SET
DEFAULT nextval
('Clinica.seq_idestadotratamiento');

ALTER TABLE Clinica.EstadoDienteTabla ADD CONSTRAINT PK_EstadoDiente PRIMARY KEY (IdEstadoDiente);
ALTER TABLE Clinica.EstadoDienteTabla ALTER COLUMN IdEstadoDiente
SET
DEFAULT nextval
('Clinica.seq_idestadodiente');

ALTER TABLE Clinica.Angulo ADD CONSTRAINT PK_Angulo PRIMARY KEY (IdAngulo);
ALTER TABLE Clinica.Angulo ALTER COLUMN IdAngulo
SET
DEFAULT nextval
('Clinica.seq_idangulo');

ALTER TABLE Clinica.Diente ADD CONSTRAINT PK_Diente PRIMARY KEY (IdDiente);
ALTER TABLE Clinica.Diente ALTER COLUMN IdDiente
SET
DEFAULT nextval
('Clinica.seq_iddiente');

ALTER TABLE Clinica.HistorialClinico ADD CONSTRAINT PK_HistorialClinico PRIMARY KEY (CodHistorial);
ALTER TABLE Clinica.HistorialClinico ALTER COLUMN CodHistorial
SET
DEFAULT nextval
('Clinica.seq_codhistorial');

ALTER TABLE Clinica.Cita ADD CONSTRAINT PK_Cita PRIMARY KEY (CodCita);
ALTER TABLE Clinica.Cita ALTER COLUMN CodCita
SET
DEFAULT nextval
('Clinica.seq_codcita');

ALTER TABLE Clinica.CItaTratamiento ADD CONSTRAINT PK_CItaTratamiento PRIMARY KEY (PFK_CodCita, PFK_IdTratamiento);

ALTER TABLE Clinica.HistorialClinicoDiente ADD CONSTRAINT PK_HistorialClinicoDiente PRIMARY KEY (PFK_idDiente, PFK_CodHistorial);

-- Tratamientos
ALTER TABLE Tratamientos.CategoriaTratamientoTabla ADD CONSTRAINT PK_CategoriaTratamiento PRIMARY KEY (IdCategoriaTratamiento);
ALTER TABLE Tratamientos.CategoriaTratamientoTabla ALTER COLUMN IdCategoriaTratamiento
SET
DEFAULT nextval
('Tratamientos.seq_idcategoriatratamiento');

ALTER TABLE Tratamientos.Tratamiento ADD CONSTRAINT PK_Tratamiento PRIMARY KEY (IdTratamiento);
ALTER TABLE Tratamientos.Tratamiento ALTER COLUMN IdTratamiento
SET
DEFAULT nextval
('Tratamientos.seq_idtratamiento');


-- Llaves foráneas 
ALTER TABLE Seguridad.Usuario ADD CONSTRAINT FK_UsuarioRol FOREIGN KEY (IdRol) REFERENCES Seguridad.Rol(IdRol);

ALTER TABLE Personal.Odontologo ADD CONSTRAINT FK_OdontologoUsuario FOREIGN KEY (IdUsuario) REFERENCES Seguridad.Usuario(IdUsuario);
ALTER TABLE Personal.Odontologo ADD CONSTRAINT FK_OdontologoConsultorio FOREIGN KEY (CodConsultorio) REFERENCES Personal.Consultorio(CodConsultorio);
ALTER TABLE Personal.Odontologo ADD CONSTRAINT FK_OdontologoInfoPers FOREIGN KEY (NumDocumentoOdontolo) REFERENCES Personal.InformacionPersonalOdontologo(NumDocumentoOdontolo);

ALTER TABLE Pacientes.Paciente ADD CONSTRAINT FK_PacienteAfiliacion FOREIGN KEY (CodAfiliacion) REFERENCES Pacientes.Afiliacion(CodAfiliacion);
ALTER TABLE Pacientes.Paciente ADD CONSTRAINT FK_PacienteUsuario FOREIGN KEY (IdUsuario) REFERENCES Seguridad.Usuario(IdUsuario);
ALTER TABLE Pacientes.Paciente ADD CONSTRAINT FK_HistorialClinico FOREIGN KEY (CodHistorial) REFERENCES Clinica.HistorialClinico(CodHistorial);

ALTER TABLE Clinica.Diente ADD CONSTRAINT FK_IdAngulo FOREIGN KEY (IdAngulo) REFERENCES Clinica.Angulo(IdAngulo);

ALTER TABLE Clinica.HistorialClinico ADD CONSTRAINT FK_HistorialEstadoTratamiento FOREIGN KEY (IdEstadoTratamiento) REFERENCES Clinica.EstadoTratamientoTabla(IdEstadoTratamiento);

ALTER TABLE Pacientes.NumeroTelefonoPaciente ADD CONSTRAINT FK_TelPacientePaciente FOREIGN KEY (NumeroIdentificacionPaciente) REFERENCES Pacientes.Paciente(NumDocumentoPaciente);

ALTER TABLE Personal.NumeroTelefonoEmpleado ADD CONSTRAINT FK_TelOdontologoInfoPers FOREIGN KEY (NumeroIdentificacionOdontologo) REFERENCES Personal.InformacionPersonalOdontologo(NumDocumentoOdontolo);

ALTER TABLE Pacientes.PesoPaciente ADD CONSTRAINT FK_PesoPaciente FOREIGN KEY (NumeroIdentificacionPaciente) REFERENCES Pacientes.Paciente(NumDocumentoPaciente);

ALTER TABLE Clinica.Cita ADD CONSTRAINT FK_CitaPaciente FOREIGN KEY (NumeroIdentificadorPaciente) REFERENCES Pacientes.Paciente(NumDocumentoPaciente);
ALTER TABLE Clinica.Cita ADD CONSTRAINT FK_CitaHorario FOREIGN KEY (CodHorario) REFERENCES Personal.HorarioOdontologo(CodHorario);

ALTER TABLE Personal.HorarioOdontologo ADD CONSTRAINT FK_HorarioOdontologo FOREIGN KEY (CodOdontologo) REFERENCES Personal.Odontologo(CodOdontologo);

ALTER TABLE Tratamientos.Tratamiento ADD CONSTRAINT FK_TratamientoCategoria FOREIGN KEY (IdCategoriaTratamiento) REFERENCES Tratamientos.CategoriaTratamientoTabla(IdCategoriaTratamiento);

ALTER TABLE Facturacion.Facturacion ADD CONSTRAINT FK_FacturacionMetodoPago FOREIGN KEY (IdMetodoPago) REFERENCES Facturacion.MetodoPagoTabla(IdMetodoPago);
ALTER TABLE Facturacion.Facturacion ADD CONSTRAINT FK_FacturacionCita FOREIGN KEY (CodCita) REFERENCES Clinica.Cita(CodCita);
ALTER TABLE Facturacion.Facturacion ADD CONSTRAINT FK_FacturacionDescuento FOREIGN KEY (IdDescuento) REFERENCES Facturacion.Descuento(IdDescuento);

ALTER TABLE Clinica.HistorialClinicoDiente ADD CONSTRAINT FK_HCD_Diente FOREIGN KEY (PFK_idDiente) REFERENCES Clinica.Diente(IdDiente);
ALTER TABLE Clinica.HistorialClinicoDiente ADD CONSTRAINT FK_HCD_Historial FOREIGN KEY (PFK_CodHistorial) REFERENCES Clinica.HistorialClinico(CodHistorial);
ALTER TABLE Clinica.HistorialClinicoDiente ADD CONSTRAINT FK_HCD_EstadoDiente FOREIGN KEY (IdEstadoDiente) REFERENCES Clinica.EstadoDienteTabla(IdEstadoDiente);

ALTER TABLE Clinica.CItaTratamiento ADD CONSTRAINT FK_CIT_Cita FOREIGN KEY (PFK_CodCita) REFERENCES Clinica.Cita(CodCita);
ALTER TABLE Clinica.CItaTratamiento ADD CONSTRAINT FK_CIT_Tratamiento FOREIGN KEY (PFK_IdTratamiento) REFERENCES Tratamientos.Tratamiento(IdTratamiento);

-- Permisos para las diferentes tablas 

--usuario Adminuser
    GRANT ALL ON ALL TABLES IN SCHEMA Seguridad, Pacientes, Personal, Clinica, Tratamientos, Facturacion, Auditoria TO adminuser;
    GRANT ALL ON ALL SEQUENCES IN SCHEMA Seguridad, Pacientes, Personal, Clinica, Tratamientos, Facturacion, Auditoria TO adminuser;
    GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA Seguridad, Pacientes, Personal, Clinica, Tratamientos, Facturacion TO adminuser;

--usuario odontologo
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA Pacientes, Personal, Clinica, Tratamientos TO odontologo;
    GRANT SELECT ON ALL SEQUENCES IN SCHEMA Pacientes, Personal, Clinica, Tratamientos TO odontologo;
    GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA Pacientes, Personal, Clinica, Tratamientos TO odontologo;

--usuario paciente
    GRANT SELECT ON Pacientes.InformacionPaciente TO paciente;
    GRANT SELECT ON Clinica.HistorialClinicoVista TO paciente;
    GRANT SELECT ON Clinica.historialclinicopacientediente TO paciente;
    GRANT SELECT ON Facturacion.FacturacionesConMonto TO paciente;
    GRANT SELECT ON Clinica.TodaslasCitas TO paciente;
    GRANT SELECT ON Clinica.CitasPendientes TO paciente;
    GRANT SELECT ON Clinica.CitasConfirmadas TO paciente;

    GRANT USAGE ON SCHEMA Pacientes TO paciente;
    GRANT USAGE ON SCHEMA Clinica TO paciente;
    GRANT USAGE ON SCHEMA Facturacion TO paciente;


-- Funciones para las tablas de auditoria

-- Insert 
CREATE OR REPLACE FUNCTION registroAuditoriaInsert
()
            RETURNS trigger AS $$
BEGIN
    EXECUTE format
    (
                    'INSERT INTO auditoria.%I(
                        usuario,
                        nombreTabla,
                        tipoOperacion,
                        fechaOperacion,
                        datosNuevos
                    ) VALUES ($1, $2, $3, $4, $5)',
                    TG_TABLE_NAME || 'auditoria'
                )
                USING CURRENT_USER, TG_TABLE_NAME, TG_OP, NOW
    (), row_to_json
    (NEW)::JSONB;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Update
CREATE OR REPLACE FUNCTION registroAuditoriaUpdate
()
            RETURNS trigger AS $$
BEGIN
    EXECUTE format
    (
                    'INSERT INTO auditoria.%I(
                        usuario,
                        nombreTabla,
                        tipoOperacion,
                        fechaOperacion,
                        datosAnteriores,
                        datosNuevos
                    ) VALUES ($1, $2, $3, $4, $5, $6)',
                    TG_TABLE_NAME || 'auditoria'
                )
                USING CURRENT_USER, TG_TABLE_NAME, TG_OP, NOW
    (), row_to_json
    (OLD)::JSONB, row_to_json
    (NEW)::JSONB;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Delete
CREATE OR REPLACE FUNCTION registroAuditoriaDelete
()
            RETURNS trigger AS $$
BEGIN
    EXECUTE format
    (
                    'INSERT INTO auditoria.%I(
                        usuario,
                        nombreTabla,
                        tipoOperacion,
                        fechaOperacion,
                        datosAnteriores
                    ) VALUES ($1, $2, $3, $4, $5)',
                    TG_TABLE_NAME || 'auditoria'
                )
                USING CURRENT_USER, TG_TABLE_NAME, TG_OP, NOW
    (), row_to_json
    (OLD)::JSONB;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

--Triggers para cambios en las tablas

-- Seguridad.Rol

CREATE TRIGGER rol_auditoria_insert
AFTER
INSERT ON
Seguridad.Rol
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER rol_auditoria_update
AFTER
UPDATE ON Seguridad.Rol
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER rol_auditoria_delete
AFTER
DELETE ON Seguridad.Rol
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Pacientes.Afiliacion


CREATE TRIGGER afiliacion_auditoria_insert
AFTER
INSERT ON
Pacientes.Afiliacion
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER afiliacion_auditoria_update
AFTER
UPDATE ON Pacientes.Afiliacion
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER afiliacion_auditoria_delete
AFTER
DELETE ON Pacientes.Afiliacion
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Facturacion.Descuento


CREATE TRIGGER descuento_auditoria_insert
AFTER
INSERT ON
Facturacion.Descuento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER descuento_auditoria_update
AFTER
UPDATE ON Facturacion.Descuento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER descuento_auditoria_delete
AFTER
DELETE ON Facturacion.Descuento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Personal.Consultorio


CREATE TRIGGER consultorio_auditoria_insert
AFTER
INSERT ON
Personal.Consultorio
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER consultorio_auditoria_update
AFTER
UPDATE ON Personal.Consultorio
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER consultorio_auditoria_delete
AFTER
DELETE ON Personal.Consultorio
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Personal.InformacionPersonalOdontologo


CREATE TRIGGER informacionpersonalodontologo_auditoria_insert
AFTER
INSERT ON
Personal.InformacionPersonalOdontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER informacionpersonalodontologo_auditoria_update
AFTER
UPDATE ON Personal.InformacionPersonalOdontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER informacionpersonalodontologo_auditoria_delete
AFTER
DELETE ON Personal.InformacionPersonalOdontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Clinica.EstadoTratamientoTabla


CREATE TRIGGER estadotratamientotabla_auditoria_insert
AFTER
INSERT ON
Clinica.EstadoTratamientoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER estadotratamientotabla_auditoria_update
AFTER
UPDATE ON Clinica.EstadoTratamientoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER estadotratamientotabla_auditoria_delete
AFTER
DELETE ON Clinica.EstadoTratamientoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Clinica.EstadoDienteTabla


CREATE TRIGGER estadodientetabla_auditoria_insert
AFTER
INSERT ON
Clinica.EstadoDienteTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER estadodientetabla_auditoria_update
AFTER
UPDATE ON Clinica.EstadoDienteTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER estadodientetabla_auditoria_delete
AFTER
DELETE ON Clinica.EstadoDienteTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Facturacion.MetodoPagoTabla


CREATE TRIGGER metodopagotabla_auditoria_insert
AFTER
INSERT ON
Facturacion.MetodoPagoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER metodopagotabla_auditoria_update
AFTER
UPDATE ON Facturacion.MetodoPagoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER metodopagotabla_auditoria_delete
AFTER
DELETE ON Facturacion.MetodoPagoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Seguridad.Usuario


CREATE TRIGGER usuario_auditoria_insert
AFTER
INSERT ON
Seguridad.Usuario
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER usuario_auditoria_update
AFTER
UPDATE ON Seguridad.Usuario
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER usuario_auditoria_delete
AFTER
DELETE ON Seguridad.Usuario
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Personal.Odontologo


CREATE TRIGGER odontologo_auditoria_insert
AFTER
INSERT ON
Personal.Odontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER odontologo_auditoria_update
AFTER
UPDATE ON Personal.Odontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER odontologo_auditoria_delete
AFTER
DELETE ON Personal.Odontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Tratamientos.CategoriaTratamientoTabla


CREATE TRIGGER categoriatratamientotabla_auditoria_insert
AFTER
INSERT ON
Tratamientos.CategoriaTratamientoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER categoriatratamientotabla_auditoria_update
AFTER
UPDATE ON Tratamientos.CategoriaTratamientoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER categoriatratamientotabla_auditoria_delete
AFTER
DELETE ON Tratamientos.CategoriaTratamientoTabla
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Clinica.Angulo


CREATE TRIGGER angulo_auditoria_insert
AFTER
INSERT ON
Clinica.Angulo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER angulo_auditoria_update
AFTER
UPDATE ON Clinica.Angulo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER angulo_auditoria_delete
AFTER
DELETE ON Clinica.Angulo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();




-- Pacientes.Paciente


CREATE TRIGGER paciente_auditoria_insert
AFTER
INSERT ON
Pacientes.Paciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER paciente_auditoria_update
AFTER
UPDATE ON Pacientes.Paciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER paciente_auditoria_delete
AFTER
DELETE ON Pacientes.Paciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Clinica.Diente


CREATE TRIGGER diente_auditoria_insert
AFTER
INSERT ON
Clinica.Diente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER diente_auditoria_update
AFTER
UPDATE ON Clinica.Diente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER diente_auditoria_delete
AFTER
DELETE ON Clinica.Diente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Clinica.HistorialClinico


CREATE TRIGGER historialclinico_auditoria_insert
AFTER
INSERT ON
Clinica.HistorialClinico
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER historialclinico_auditoria_update
AFTER
UPDATE ON Clinica.HistorialClinico
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER historialclinico_auditoria_delete
AFTER
DELETE ON Clinica.HistorialClinico
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Pacientes.NumeroTelefonoPaciente


CREATE TRIGGER numerotelefonopaciente_auditoria_insert
AFTER
INSERT ON
Pacientes.NumeroTelefonoPaciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER numerotelefonopaciente_auditoria_update
AFTER
UPDATE ON Pacientes.NumeroTelefonoPaciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER numerotelefonopaciente_auditoria_delete
AFTER
DELETE ON Pacientes.NumeroTelefonoPaciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Personal.NumeroTelefonoEmpleado


CREATE TRIGGER numerotelefonoempleado_auditoria_insert
AFTER
INSERT ON
Personal.NumeroTelefonoEmpleado
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER numerotelefonoempleado_auditoria_update
AFTER
UPDATE ON Personal.NumeroTelefonoEmpleado
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER numerotelefonoempleado_auditoria_delete
AFTER
DELETE ON Personal.NumeroTelefonoEmpleado
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Pacientes.PesoPaciente


CREATE TRIGGER pesopaciente_auditoria_insert
AFTER
INSERT ON
Pacientes.PesoPaciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER pesopaciente_auditoria_update
AFTER
UPDATE ON Pacientes.PesoPaciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER pesopaciente_auditoria_delete
AFTER
DELETE ON Pacientes.PesoPaciente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Clinica.Cita


CREATE TRIGGER cita_auditoria_insert
AFTER
INSERT ON
Clinica.Cita
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER cita_auditoria_update
AFTER
UPDATE ON Clinica.Cita
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER cita_auditoria_delete
AFTER
DELETE ON Clinica.Cita
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Tratamientos.Tratamiento


CREATE TRIGGER tratamiento_auditoria_insert
AFTER
INSERT ON
Tratamientos.Tratamiento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER tratamiento_auditoria_update
AFTER
UPDATE ON Tratamientos.Tratamiento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER tratamiento_auditoria_delete
AFTER
DELETE ON Tratamientos.Tratamiento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Facturacion.Facturacion


CREATE TRIGGER facturacion_auditoria_insert
AFTER
INSERT ON
Facturacion.Facturacion
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER facturacion_auditoria_update
AFTER
UPDATE ON Facturacion.Facturacion
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER facturacion_auditoria_delete
AFTER
DELETE ON Facturacion.Facturacion
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Clinica.HistorialClinicoDiente


CREATE TRIGGER historialclinicodiente_auditoria_insert
AFTER
INSERT ON
Clinica.HistorialClinicoDiente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER historialclinicodiente_auditoria_update
AFTER
UPDATE ON Clinica.HistorialClinicoDiente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER historialclinicodiente_auditoria_delete
AFTER
DELETE ON Clinica.HistorialClinicoDiente
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Facturacion.CitaTratamiento


CREATE TRIGGER CitaTratamiento_auditoria_insert
AFTER
INSERT ON
Clinica.CitaTratamiento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER CitaTratamiento_auditoria_update
AFTER
UPDATE ON Clinica.CitaTratamiento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER CitaTratamiento_auditoria_delete
AFTER
DELETE ON Clinica.CitaTratamiento
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Personal.HorarioOdontologo


CREATE TRIGGER horarioodontologo_auditoria_insert
AFTER
INSERT ON
Personal.HorarioOdontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaInsert
();


CREATE TRIGGER horarioodontologo_auditoria_update
AFTER
UPDATE ON Personal.HorarioOdontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaUpdate
();


CREATE TRIGGER horarioodontologo_auditoria_delete
AFTER
DELETE ON Personal.HorarioOdontologo
FOR EACH ROW
EXECUTE FUNCTION registroAuditoriaDelete
();


-- Funciones 

    --Funcion para obtener un historialcliniico en especifico 
    CREATE OR REPLACE FUNCTION Clinica.obtenerHistorialClinico(num_documento INT)
    RETURNS TABLE
    (
            numdocumentopaciente INT,
            Nombre_completo TEXT,
            Alturapaciente NUMERIC(3,2),
            TratamientoRealizado TEXT, 
            Diagnostico VARCHAR(180),
            EstadoTratamiento VARCHAR(20),
            FechaRegistro DATE
        ) AS $$
    BEGIN

        IF num_documento IS NULL THEN
            RAISE EXCEPTION 'El número de documento no puede ser nulo.';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Pacientes.Paciente p WHERE p.NumDocumentoPaciente = num_documento) THEN
            RAISE EXCEPTION 'El paciente con número de documento % no existe.', num_documento;
        END IF;

        RETURN QUERY
        SELECT 
            hc.numdocumentopaciente,
            hc.Nombre_completo::TEXT,
            hc.AlturaPaciente,
            hc."Tratamiento/s"::TEXT,
            hc.diagnosticohistorialclinico,
            hc.EstadoTratamiento,
            hc.fecharegistro
        FROM Clinica.HistorialClinicoVista hc
        WHERE hc.NumDocumentoPaciente = num_documento ;
    END;
    $$ LANGUAGE plpgsql;



    --Funcion para verificar la disponibilidad de un horario
    CREATE OR REPLACE FUNCTION Personal.VerificarDisponibilidadHorario(
        p_FechaHorario DATE,
        p_HoraHorario TIME
    )
    RETURNS BOOLEAN AS $$
    DECLARE
        EstadoHorario TEXT;
    BEGIN
        SELECT horodon.estadohorario
        INTO EstadoHorario
        FROM Personal.HorarioOdontologo horodon
        WHERE horodon.Fechahorario = p_FechaHorario 
        AND horodon.HoraHorario = p_HoraHorario;

        IF EstadoHorario IS NULL THEN
            RAISE EXCEPTION 'No se encontró un horario con la fecha % y hora % especificadas.', p_FechaHorario, p_HoraHorario;
        END IF;

        RETURN EstadoHorario = 'Disponible';
    END;
    $$ LANGUAGE plpgsql;


    --Funcion para actualizar el estado de un horario - Retorna un trigger
    CREATE OR REPLACE FUNCTION Personal.actualizarEstadoHorario()
        RETURNS TRIGGER AS $$
    BEGIN
        UPDATE Personal.HorarioOdontologo
        SET EstadoHorario = 'Ocupado'
        WHERE CodHorario = NEW.CodHorario;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    --Funcion para obtener un descuento de un tratamiento
    CREATE OR REPLACE FUNCTION Facturacion.ObtenerDescuentoTratamiento
    (
            p_costotratamiento BIGINT, 
            p_porcentaje_descuento NUMERIC(5,2)
        )
        RETURNS BIGINT AS $$
    BEGIN
        RETURN p_costotratamiento * (p_porcentaje_descuento / 100);
    END;
    $$ LANGUAGE plpgsql;

    --Funcion para obtener el monto total de una cita
    CREATE OR REPLACE FUNCTION Facturacion.ObtenerMontoTotal(p_idcita int)
        RETURNS BIGINT AS $$
    DECLARE
            V_precioTratamiento BIGINT;
            V_porcentajeCobertura NUMERIC(5,2);
            V_montoTotal BIGINT;
    BEGIN

        IF p_idcita IS NULL THEN
            RAISE EXCEPTION 'El ID de la cita no puede ser nulo.';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Clinica.Cita c WHERE c.CodCita = p_idcita) THEN
            RAISE EXCEPTION 'La cita con ID % no existe en la base de datos.', p_idcita;
        END IF;

        SELECT totalCostoTratamiento, Porcentajecobertura
        INTO V_precioTratamiento, V_porcentajeCobertura
        FROM (
            SELECT 
                SUM(trat.CostoTratamiento) AS totalCostoTratamiento,
                af.Porcentajecobertura
            FROM Clinica.CitaTratamiento cittra
            INNER JOIN Clinica.Cita cita ON cittra.PFK_CodCita = cita.CodCita
            INNER JOIN Tratamientos.Tratamiento trat ON cittra.PFK_IdTratamiento = trat.IdTratamiento
            INNER JOIN Pacientes.Paciente pac ON cita.NumeroIdentificadorPaciente = pac.NumDocumentoPaciente
            INNER JOIN Pacientes.afiliacion af ON pac.CodAfiliacion = af.CodAfiliacion
            WHERE cita.CodCita = p_idcita
            GROUP BY af.Porcentajecobertura
        );

        IF V_precioTratamiento IS NULL OR V_porcentajeCobertura IS NULL THEN
            RAISE EXCEPTION 'No se encontró información para la cita con ID %.', p_idcita;
        END IF;

        V_montoTotal := V_precioTratamiento - Facturacion.ObtenerDescuentoTratamiento(V_precioTratamiento, V_porcentajeCobertura);
        RETURN V_montoTotal;
    END;
    $$ LANGUAGE plpgsql;

    --Funcion para obtener una facturacion en especifico a traves del codigo de la cita
    CREATE OR REPLACE FUNCTION Facturacion.ObtenerFacturacionPorCita(p_idcita INT)
    RETURNS TABLE (
        codcita INT,
        motivodescuento TEXT,
        tratamientos TEXT,
        montototal BIGINT,
        fechafacturacion DATE,
        metodopago TEXT,
        numdocumentopaciente INT,
        nombre_completo TEXT
    ) AS $$
    BEGIN

        IF p_idcita IS NULL THEN
            RAISE EXCEPTION 'El ID de la cita no puede ser nulo';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Clinica.Cita c WHERE c.CodCita = p_idcita) THEN
            RAISE EXCEPTION 'La cita con ID % no existe en la base de datos', p_idcita;
        END IF;

        RETURN QUERY
        SELECT 
            f.codcita,
            f.motivodescuento::TEXT,
            f.tratamientos::TEXT,
            f.montototal,
            f.fechafacturacion,
            f.metodopago::TEXT,
            f.numdocumentopaciente,
            f.nombre_completo::TEXT
        FROM Facturacion.FacturacionesConMonto f
        WHERE f.codcita = p_idcita;
    END;
    $$ LANGUAGE plpgsql;

    --Funcion para obtener una facturacion en especifico a traves del numero de documento del paciente
    CREATE OR REPLACE FUNCTION Facturacion.ObtenerFacturacionPorNumDoc(p_numdoc INT)
    RETURNS TABLE (
        codcita INT,
        motivodescuento TEXT,
        tratamientos TEXT,
        montototal BIGINT,
        fechafacturacion DATE,
        metodopago TEXT,
        numdocumentopaciente INT,
        nombre_completo TEXT
    ) AS $$
    BEGIN
        IF p_numdoc IS NULL THEN
        RAISE EXCEPTION 'El número de documento no puede ser nulo';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Pacientes.Paciente p WHERE p.numdocumentopaciente = p_numdoc) THEN
        RAISE EXCEPTION 'El número de documento % no existe en la base de datos', p_numdoc;
        END IF;

        RETURN QUERY
        SELECT 
            f.codcita,
            f.motivodescuento::TEXT,
            f.tratamientos::TEXT,
            f.montototal,
            f.fechafacturacion,
            f.metodopago::TEXT,
            f.numdocumentopaciente,
            f.nombre_completo::TEXT
        FROM Facturacion.FacturacionesConMonto f
        WHERE f.numdocumentopaciente = p_numdoc;
    END;
    $$ LANGUAGE plpgsql;


    --Funcion para obtener todas las citas de un paciente en especifico
    CREATE OR REPLACE FUNCTION Clinica.ObtenerCitasPorNumDoc(p_numdoc INT)
    RETURNS TABLE (
        p_NombreCompleto TEXT, 
        p_fechahorario DATE,
        p_horahorario TIME,
        p_codcita INT,
        p_Observaciones TEXT,
        p_EstadoCita TEXT,
        p_Duracion TEXT,
        p_NombreTratamiento TEXT
    ) AS $$
    BEGIN

    IF p_numdoc IS NULL THEN
    RAISE EXCEPTION 'El número de documento no puede ser nulo';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Pacientes.Paciente p WHERE p.numdocumentopaciente = p_numdoc) THEN
    RAISE EXCEPTION 'El número de documento % no existe en la base de datos', p_numdoc;
    END IF;

    RETURN QUERY
    SELECT
        cpn.Nombre_completo::TEXT,
        cpn.fechahorario,
        cpn.horahorario,
        cpn.codcita,
        cpn.Observaciones::TEXT,
        cpn.EstadoCita::TEXT,
        cpn.Duracion::TEXT,
        cpn."Tratamiento/s"::TEXT
    FROM Clinica.TodaslasCitas cpn
    WHERE cpn.NumDocumentoPaciente = p_numdoc;
    END;
    $$ LANGUAGE plpgsql;



-- Vistas 

    --Vista para ver la informacióndelpaciente
    CREATE OR REPLACE VIEW Pacientes.InformacionPaciente AS
    SELECT
        p.numdocumentopaciente,
        p.NombreUnoPaciente || ' ' || COALESCE(p.NombreDosPaciente, '(Sin segundo nombre)') || ' ' || p.ApellidoUnoPaciente || ' ' || 	p.ApellidoDosPaciente AS Nombre_completo,
        p.AlturaPaciente AS Altura_del_paciente,
        ntp.numerotelefonopa AS Numero_telefonico_del_paciente,
        pes.pesopaciente AS Peso_del_paciente,
        p.Fechanacimiento AS Fecha_nacimiento_del_paciente,
        af.tipoafiliacion AS Afiliacion_del_paciente,
        ROUND(af.porcentajecobertura, 2)::INT || '%'AS Porcentaje_Cobertura
    FROM Pacientes.paciente p
        INNER JOIN Pacientes.afiliacion af ON p.codafiliacion = af.codafiliacion
        INNER JOIN Pacientes.numerotelefonopaciente ntp ON ntp.numeroidentificacionpaciente = p.numdocumentopaciente
        INNER JOIN Pacientes.pesopaciente pes ON pes.numeroidentificacionpaciente = p.numdocumentopaciente;

    --Vista para ver la información del odontologo
    CREATE OR REPLACE VIEW Personal.InformacionOdontologo AS
    SELECT
        p.numdocumentoodontolo,
        pio.NombreUnoOdontologo || ' ' || COALESCE(pio.NombreDosOdontologo, '(Sin segundo nombre)') || ' ' || pio.ApellidoUnoOdontologo || ' ' || pio.ApellidoDosOdontologo AS Nombre_completo,
        nt.numerotelefonood,
        c.NumeroConsultorio,
        p.AniosExperiencia,
        p.Especialidad,
        p.HoraEntrada,
        p.HoraSalida
    FROM Personal.Odontologo p
        INNER JOIN Personal.InformacionPersonalOdontologo pio ON p.numdocumentoodontolo = pio.NumDocumentoOdontolo
        INNER JOIN Personal.Numerotelefonoempleado nt ON nt.numeroidentificacionodontologo = pio.numdocumentoodontolo
        INNER JOIN Personal.Consultorio c ON p.CodConsultorio = c.CodConsultorio;



    --Vista para ver todos los historiales clinicos
        CREATE OR REPLACE VIEW Clinica.HistorialClinicoVista AS
        SELECT DISTINCT
            p.NumDocumentoPaciente,
            p.NombreUnoPaciente || ' ' || 
                COALESCE(p.NombreDosPaciente, '(Sin segundo nombre)') || ' ' || 
                p.ApellidoUnoPaciente || ' ' || 
                p.ApellidoDosPaciente AS Nombre_Completo,
            p.AlturaPaciente,
            COALESCE(STRING_AGG(DISTINCT trat.NombreTratamiento, ', '), 'Sin tratamiento asignado') AS "Tratamiento/s",
            hist.DiagnosticoHistorialClinico,
            esttrat.EstadoTratamiento,
            histdiente.FechaRegistro
        FROM Pacientes.Paciente p
            INNER JOIN Clinica.HistorialClinico hist ON p.CodHistorial = hist.CodHistorial
            INNER JOIN Clinica.EstadoTratamientoTabla esttrat ON hist.IdEstadoTratamiento = esttrat.IdEstadoTratamiento
            INNER JOIN Clinica.HistorialClinicoDiente histdiente ON hist.CodHistorial = histdiente.PFK_CodHistorial
            INNER JOIN Clinica.EstadoDienteTabla estdiente ON histdiente.IdEstadoDiente = estdiente.IdEstadoDiente
            INNER JOIN Clinica.Diente diente ON histdiente.PFK_idDiente = diente.IdDiente
            INNER JOIN (
                SELECT 
                    NumeroIdentificadorPaciente,
                    MAX(fechahorario) AS FechaUltimaCita
                FROM Clinica.Cita cita
                INNER JOIN Personal.HorarioOdontologo hor ON Cita.CodHorario = hor.CodHorario
                GROUP BY NumeroIdentificadorPaciente
            ) ultimaCita ON p.NumDocumentoPaciente = ultimaCita.NumeroIdentificadorPaciente
            INNER JOIN Clinica.Cita cita ON p.NumDocumentoPaciente = cita.NumeroIdentificadorPaciente
            INNER JOIN Personal.HorarioOdontologo hor ON cita.CodHorario = hor.CodHorario AND hor.fechahorario = ultimaCita.FechaUltimaCita
            LEFT JOIN Clinica.CitaTratamiento citrat ON cita.CodCita = citrat.PFK_CodCita
            LEFT JOIN Tratamientos.Tratamiento trat ON citrat.PFK_IdTratamiento = trat.IdTratamiento

        WHERE histdiente.FechaRegistro = (
            SELECT MAX(FechaRegistro)
            FROM Clinica.HistorialClinicoDiente 
            WHERE PFK_CodHistorial = hist.CodHistorial
        )
        GROUP BY 
            p.NumDocumentoPaciente, p.NombreUnoPaciente, p.NombreDosPaciente, 
            p.ApellidoUnoPaciente, p.ApellidoDosPaciente, p.AlturaPaciente, 
            hist.DiagnosticoHistorialClinico, esttrat.EstadoTratamiento, 
            histdiente.FechaRegistro, estdiente.EstadoDiente, 
            diente.NumeroDiente, diente.TipoDiente;




    --Vista para el historial clinico de los dientes de un paciente 
    CREATE OR REPLACE VIEW Clinica.historialclinicopacientediente AS
    SELECT 
        p.NumDocumentoPaciente,
        p.NombreUnoPaciente || ' ' || 
            COALESCE(p.NombreDosPaciente, '(Sin segundo nombre)') || ' ' || 
            p.ApellidoUnoPaciente || ' ' || 
            p.ApellidoDosPaciente AS Nombre_completo,
        STRING_AGG(diente.NumeroDiente::TEXT, ', ') AS "NumeroDiente/s",
        diente.TipoDiente,
        STRING_AGG(estdiente.EstadoDiente, ', ') AS "EstadoDiente/s",
        histdiente.FechaRegistro
        FROM Pacientes.Paciente p
        INNER JOIN Clinica.HistorialClinico hist ON p.CodHistorial = hist.CodHistorial
        INNER JOIN Clinica.HistorialClinicoDiente histdiente ON histdiente.PFK_CodHistorial = hist.CodHistorial
        INNER JOIN Clinica.EstadoDienteTabla estdiente ON histdiente.IdEstadoDiente = estdiente.IdEstadoDiente
        INNER JOIN Clinica.Diente diente ON histdiente.PFK_idDiente = diente.IdDiente
        GROUP BY p.NumDocumentoPaciente, p.NombreUnoPaciente, p.NombreDosPaciente, p.ApellidoUnoPaciente,
                    p.ApellidoDosPaciente, diente.TipoDiente, histdiente.FechaRegistro;



    --Vista para ver todos los historiales clinicos con el estado de "finalizado"
    CREATE OR REPLACE VIEW Clinica.HistorialClinicoFinalizado AS
    SELECT 
        hc.numdocumentopaciente,
        hc.Nombre_completo,
        hc.AlturaPaciente,
        hc."Tratamiento/s",
        hc.diagnosticohistorialclinico,
        hc.EstadoTratamiento,
        hc.fecharegistro
    FROM Clinica.HistorialClinicoVista hc
        WHERE hc.EstadoTratamiento = 'Finalizado';

    --vista para ver todos los historiales clinicos con el estado de "en progreso"
    CREATE OR REPLACE VIEW Clinica.HistorialClinicoEnProgreso AS
    SELECT 
        hc.numdocumentopaciente,
        hc.Nombre_completo,
        hc.AlturaPaciente,
        hc."Tratamiento/s",
        hc.diagnosticohistorialclinico,
        hc.EstadoTratamiento,
        hc.fecharegistro
    FROM Clinica.HistorialClinicoVista hc
        WHERE hc.EstadoTratamiento = 'En progreso';


    --Vista para ver todos los historiales clinicos con el estado de "pendiente"
    CREATE OR REPLACE VIEW Clinica.HistorialClinicoPendiente AS
    SELECT 
        hc.numdocumentopaciente,
        hc.Nombre_completo,
        hc.AlturaPaciente,
        hc."Tratamiento/s",
        hc.diagnosticohistorialclinico,
        hc.EstadoTratamiento,
        hc.fecharegistro
    FROM Clinica.HistorialClinicoVista hc
    WHERE hc.EstadoTratamiento = 'Pendiente';


    --Vista para ver la facturacion de todas las citas
    CREATE OR REPLACE VIEW Facturacion.FacturacionesConMonto AS 
    SELECT 
        cit.codcita,
        descu.MotivoDescuento,
        STRING_AGG(trat.NombreTratamiento, ', ') AS Tratamientos,
        facturacion.ObtenerMontoTotal(cit.codcita) AS MontoTotal,
        fac.fechafacturacion,
        met.metodopago,
        pac.numdocumentopaciente,
        pac.NombreUnoPaciente || ' ' || COALESCE(pac.NombreDosPaciente, '(Sin segundo nombre)') || ' ' || pac.ApellidoUnoPaciente || ' ' || pac.ApellidoDosPaciente AS Nombre_completo,
        fac.estadopago
    FROM Facturacion.facturacion fac
    INNER JOIN Facturacion.metodopagotabla met ON fac.idmetodopago = met.idmetodopago
    INNER JOIN Clinica.cita cit ON fac.codcita = cit.codcita
    INNER JOIN Pacientes.paciente pac ON cit.numeroidentificadorpaciente = pac.numdocumentopaciente
    INNER JOIN Facturacion.descuento descu ON fac.iddescuento = descu.iddescuento
    LEFT JOIN Clinica.citatratamiento citrat ON citrat.pfk_codcita = cit.codcita  
    LEFT JOIN Tratamientos.tratamiento trat ON citrat.pfk_idtratamiento = trat.idtratamiento
    GROUP BY cit.codcita, descu.MotivoDescuento, fac.fechafacturacion, met.metodopago, 
        pac.numdocumentopaciente, pac.NombreUnoPaciente, pac.NombreDosPaciente, 
        pac.ApellidoUnoPaciente, pac.ApellidoDosPaciente, fac.estadopago
    ORDER BY fac.fechafacturacion DESC;


    --Vista para ver todas las citas de un paciente 
    CREATE OR REPLACE VIEW Clinica.TodaslasCitas AS 
    SELECT
        pac.NumDocumentoPaciente,
        pac.NombreUnoPaciente || ' ' || COALESCE(pac.NombreDosPaciente, '(Sin segundo nombre)') || ' ' || pac.ApellidoUnoPaciente || ' ' || pac.ApellidoDosPaciente AS Nombre_completo, 
        horodon.fechahorario,
        horodon.horahorario,
        cita.codcita,
        cita.Observaciones,
        cita.EstadoCita,
        cita.Duracion,
        COALESCE (STRING_AGG(trat.NombreTratamiento, ', '), '(Sin tratamiento/s asignado)' ) AS "Tratamiento/s"  
    FROM Clinica.Cita cita
        INNER JOIN Pacientes.Paciente pac ON cita.NumeroIdentificadorPaciente = pac.NumDocumentoPaciente
        LEFT JOIN Clinica.CitaTratamiento citrat ON cita.CodCita = citrat.PFK_CodCita
        LEFT JOIN Tratamientos.Tratamiento trat ON citrat.PFK_IdTratamiento = trat.IdTratamiento
        INNER JOIN Pacientes.Afiliacion af ON pac.CodAfiliacion = af.CodAfiliacion
        INNER JOIN Personal.HorarioOdontologo horodon ON cita.CodHorario = horodon.CodHorario
        GROUP BY pac.numdocumentopaciente, pac.NombreUnoPaciente, pac.NombreDosPaciente, pac.ApellidoUnoPaciente, pac.ApellidoDosPaciente, 
            horodon.fechahorario, horodon.horahorario , cita.codcita, cita.Observaciones, 
            cita.EstadoCita, cita.Duracion
        ORDER BY horodon.fechahorario DESC, horodon.horahorario DESC;


    --Vistas para ver las citas con el estado de "pendiente"
    CREATE OR REPLACE VIEW Clinica.CitasPendientes AS
    SELECT 
        cpnd.Nombre_completo,
        cpnd.fechahorario,
        cpnd.horahorario,
        cpnd.codcita,
        cpnd.Observaciones,
        cpnd.EstadoCita,
        cpnd.Duracion,
        cpnd."Tratamiento/s"
    FROM Clinica.TodaslasCitas cpnd
        WHERE cpnd.EstadoCita = 'Pendiente';

    --Vista para ver las citas con el estado de "Confirmada"
    CREATE OR REPLACE VIEW Clinica.CitasConfirmadas AS
    SELECT 
        cpnd.Nombre_completo,
        cpnd.fechahorario,
        cpnd.horahorario,
        cpnd.codcita,
        cpnd.Observaciones,
        cpnd.EstadoCita,
        cpnd.Duracion,
        cpnd."Tratamiento/s"
    FROM Clinica.TodaslasCitas cpnd
        WHERE cpnd.EstadoCita = 'Confirmada';

    --Vista para ver las citas con el estado de "Cancelada"
    CREATE OR REPLACE VIEW Clinica.CitasCanceladas AS
    SELECT 
        cpnd.Nombre_completo,
        cpnd.fechahorario,
        cpnd.horahorario,
        cpnd.codcita,
        cpnd.Observaciones,
        cpnd.EstadoCita,
        cpnd.Duracion,
        cpnd."Tratamiento/s"
    FROM Clinica.TodaslasCitas cpnd
        WHERE cpnd.EstadoCita = 'Cancelada';

    --Vista para ver las facturas pagadas
    CREATE OR REPLACE VIEW Facturacion.FacturasPagadas AS
    SELECT 
        f.codcita,
        f.motivodescuento,
        f.tratamientos,
        f.montototal,
        f.fechafacturacion,
        f.metodopago,
        f.numdocumentopaciente,
        f.nombre_completo,
        f.Estadopago
    FROM Facturacion.FacturacionesConMonto f
    WHERE f.estadopago = 'Pagado';

    --Vista para ver las facturas pendientes
    CREATE OR REPLACE VIEW Facturacion.FacturasPendientes AS
    SELECT 
        f.codcita,
        f.motivodescuento,
        f.tratamientos,
        f.montototal,
        f.fechafacturacion,
        f.metodopago,
        f.numdocumentopaciente,
        f.nombre_completo,
        f.Estadopago
    FROM Facturacion.FacturacionesConMonto f
    WHERE f.estadopago = 'Pendiente';

    --Vista para ver las facturas canceladas
    CREATE OR REPLACE VIEW Facturacion.FacturasCanceladas AS
    SELECT 
        f.codcita,
        f.motivodescuento,
        f.tratamientos,
        f.montototal,
        f.fechafacturacion,
        f.metodopago,
        f.numdocumentopaciente,
        f.nombre_completo,
        f.Estadopago
    FROM Facturacion.FacturacionesConMonto f
    WHERE f.estadopago = 'Cancelado';

--Trigger

--Trigger para actualizar el estado de un horario a "Ocupado" al registrar una cita
    CREATE TRIGGER triggerActualizarEstadoHorario
    AFTER INSERT ON Clinica.Cita
    FOR EACH ROW
    EXECUTE FUNCTION Personal.actualizarEstadoHorario();



--Procedimientos

--Procedimiento para registrar una cita
CREATE OR REPLACE PROCEDURE Clinica.agendarCita
(
    p_FechaHorario DATE,
    p_HoraHorario TIME,
    p_observacion TEXT,
    p_duracion TEXT,
    p_numeroDocumentoPaciente INT
)
LANGUAGE plpgsql AS $$
DECLARE 
    V_codHorario INT;
BEGIN
    IF p_FechaHorario < CURRENT_DATE THEN 
        RAISE EXCEPTION 'La fecha de la cita no puede ser anterior a la fecha actual: %', p_FechaHorario;
    END IF;

    IF NOT Personal.VerificarDisponibilidadHorario(p_FechaHorario, p_HoraHorario) THEN 
        RAISE EXCEPTION 'El horario % a las % no está disponible.', p_FechaHorario, p_HoraHorario;
    END IF;

    SELECT horodon.CodHorario
    INTO V_codHorario
    FROM Personal.HorarioOdontologo horodon
    WHERE horodon.FechaHorario = p_FechaHorario AND horodon.HoraHorario = p_HoraHorario;


    INSERT INTO Clinica.Cita
        (
        EstadoCita,
        Observaciones,
        Duracion,
        CodHorario,
        numeroidentificadorpaciente
        )
    VALUES
        (
            'Pendiente',
            p_observacion,
            p_duracion,
            V_codHorario,
            p_numeroDocumentoPaciente
        );
END;
$$;

    --Prueba del procedimiento anterior
        CALL Clinica.agendarCita
        (
            '2025-05-20',        
            '08:00:00',          
            'Paciente presenta dolor persistente.', 
            '30 minutos',        
            107             
        );


-- Inserta una fecha inicio a una fecha fin a una hora determinada sobre la disponibilidad de un odontologo
CREATE OR REPLACE PROCEDURE Personal.GenerarHorariosLaborales
(
    p_FechaInicio DATE,
    p_FechaFin DATE,
    p_HoraHorario TIME,
    p_codOdontologo INT
)
LANGUAGE plpgsql AS $$
DECLARE
    FechaActual DATE;
BEGIN
    FechaActual := p_FechaInicio;
WHILE FechaActual <= p_FechaFin LOOP
    IF EXTRACT(DOW FROM FechaActual) BETWEEN 1 AND 5 THEN
        IF NOT EXISTS (
            SELECT 1
            FROM Personal.HorarioOdontologo hrodon
            WHERE hrodon.fechahorario = FechaActual
            AND hrodon.horahorario = p_HoraHorario
            AND hrodon.cododontologo = p_codOdontologo
        ) THEN
            INSERT INTO Personal.HorarioOdontologo
            (
                FechaHorario,
                HoraHorario,
                EstadoHorario,
                CodOdontologo
            )
            VALUES
            (
                FechaActual,
                p_HoraHorario,
                'Disponible',
                p_codOdontologo
            );
        END IF;
    END IF;
    FechaActual := FechaActual + INTERVAL '1 day';
END LOOP;
END;
$$;

    -- Prueba del procedimiento anterior
        CALL Personal.GenerarHorariosLaborales
        (
            '2025-05-18',   
            '2025-06-10',    
            '08:00:00',     
            1             
        );

    --Procedimiento para actualizar la informacion personal de un paciente
    CREATE OR REPLACE PROCEDURE Pacientes.ActualizarInformacionPaciente 
    (
        p_numdocumentopaciente INT,
        p_NombreUnoPaciente TEXT,
        p_NombreDosPaciente TEXT,
        p_ApellidoUnoPaciente TEXT,
        p_ApellidoDosPaciente TEXT,
        p_AlturaPaciente NUMERIC(3,2),
        p_numerotelefonopa BIGINT,
        p_pesopaciente INT
    )
    LANGUAGE plpgsql AS $$

    BEGIN

        IF p_numdocumentopaciente IS NULL THEN
            RAISE EXCEPTION 'El número de documento no puede ser nulo.';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Pacientes.Paciente p WHERE p.NumDocumentoPaciente = p_numdocumentopaciente) THEN
            RAISE EXCEPTION 'Paciente con documento % no existe.', p_numdocumentopaciente;
        END IF;

        UPDATE Pacientes.Paciente 
        SET 
            NombreUnoPaciente = p_NombreUnoPaciente,
            NombreDosPaciente = COALESCE(p_NombreDosPaciente, '(Sin segundo nombre)'),
            ApellidoUnoPaciente = p_ApellidoUnoPaciente,
            ApellidoDosPaciente = p_ApellidoDosPaciente,
            AlturaPaciente = p_AlturaPaciente
        WHERE NumDocumentoPaciente = p_numdocumentopaciente;

        UPDATE Pacientes.NumeroTelefonoPaciente
        SET NumeroTelefonoPa = p_numerotelefonopa
        WHERE NumeroIdentificacionPaciente = p_numdocumentopaciente;

        UPDATE Pacientes.PesoPaciente 
        SET PesoPaciente = p_pesopaciente
        WHERE NumeroIdentificacionPaciente = p_numdocumentopaciente;
    END;
    $$;

    --Prueba del procedimiento anterior
    CALL Pacientes.ActualizarInformacionPaciente(
        107,
        'Luis',
        NULL,
        'Martinez',
        'Rojas',
        1.78,
        3214567891,
        68
    );


    --Procedimiento para actualizar la informacion personal de un odontologo
        CREATE OR REPLACE PROCEDURE Personal.ActualizarInformacionOdontologo 
    (
        p_numdocumentoodontologo INT,
        p_NombreUnoOdontologo TEXT,
        p_NombreDosOdontologo TEXT,
        p_ApellidoUnoOdontologo TEXT,
        p_ApellidoDosOdontologo TEXT,
        p_AniosExperiencia INT,
        p_Especialidad TEXT,
        p_numerotelefonood BIGINT
    )
    LANGUAGE plpgsql AS $$

    BEGIN

        IF p_numdocumentoodontologo IS NULL THEN
            RAISE EXCEPTION 'El número de documento no puede ser nulo.';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Personal.InformacionPersonalOdontologo po WHERE po.numdocumentoodontolo = p_numdocumentoodontologo) THEN
            RAISE EXCEPTION 'Paciente con documento % no existe.', p_numdocumentoodontologo;
        END IF;

        UPDATE Personal.Odontologo 
        SET 
            AniosExperiencia = p_AniosExperiencia,
            Especialidad = p_Especialidad
        WHERE NumDocumentoOdontolo = p_numdocumentoodontologo;

        UPDATE Personal.Numerotelefonoempleado
        SET numerotelefonood = p_numerotelefonood
        WHERE numeroidentificacionodontologo = p_numdocumentoodontologo;

        UPDATE Personal.InformacionPersonalOdontologo
        SET 
            NombreUnoOdontologo = p_NombreUnoOdontologo,
            NombreDosOdontologo = COALESCE(p_NombreDosOdontologo, '(Sin segundo nombre)'),
            ApellidoUnoOdontologo = p_ApellidoUnoOdontologo,
            ApellidoDosOdontologo = p_ApellidoDosOdontologo
        WHERE NumDocumentoOdontolo = p_numdocumentoodontologo; 
    END;
    $$;

    --Prueba del procedimiento anterior
    CALL Personal.ActualizarInformacionOdontologo(
    101,
    'Carlos',
    'Esteban',
    'Pérez',
    'Rodríguez',
    8,
    'Ortodoncia',
    3219876543
    );

    --Funcion para traer el id de un diente junto con su historial clinico
    CREATE OR REPLACE FUNCTION Clinica.obtenerdientehistorial(
        p_numdocumentopaciente INT
    )
    RETURNS TABLE (
        id_diente INT, 
        CodHistorial INT
    ) LANGUAGE plpgsql AS $$
    BEGIN
        IF p_numdocumentopaciente IS NULL THEN
            RAISE EXCEPTION 'El número de documento no puede ser nulo.';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Pacientes.Paciente p WHERE p.NumDocumentoPaciente = p_numdocumentopaciente) THEN
            RAISE EXCEPTION 'El paciente con número de documento % no existe.', p_numdocumentopaciente;
        END IF;

        RETURN QUERY
        SELECT 
            hcd.pfk_IdDiente,
            hcd.pfk_CodHistorial
        FROM Pacientes.paciente p
            INNER JOIN Clinica.HistorialClinico hc ON hc.CodHistorial = p.CodHistorial
            INNER JOIN Clinica.HistorialClinicoDiente hcd ON hc.CodHistorial = hcd.PFK_CodHistorial
            INNER JOIN Clinica.Diente d ON hcd.PFK_idDiente = d.IdDiente
        WHERE p.NumDocumentoPaciente = p_numdocumentopaciente;
    END;
    $$;

    --procedimiento para actualizar el historial clinico de un paciente
        CREATE OR REPLACE PROCEDURE Clinica.ActualizarHistorialClinicoCita
        (
            p_numdocumentopaciente INT,
            p_diagnostico TEXT,
            p_idestadoTratamiento INT,
            p_idtratamientos INT[],
            p_codcita INT,
            p_cantidadarecursosusados INT[],
            p_descripcionrecursos TEXT[],
            p_iddiente INT[],
            p_idestadoDiente INT[],
            p_resultadotratamiento TEXT[],
            p_fecharegistro DATE DEFAULT CURRENT_DATE
        )
        LANGUAGE plpgsql AS $$
        DECLARE
            v_codhistorial INT;
            v_valorinicial INT;
        BEGIN
            SELECT p.CodHistorial
            INTO v_codhistorial
            FROM Pacientes.paciente p
            WHERE p.NumDocumentoPaciente = p_numdocumentopaciente;

            IF v_codhistorial IS NULL THEN
                RAISE EXCEPTION 'No se encontro historial clinico para el paciente con documento %.', p_numdocumentopaciente;
            END IF;

            UPDATE Clinica.HistorialClinico
            SET
                DiagnosticoHistorialClinico = p_diagnostico,
                IdEstadoTratamiento = p_idestadoTratamiento
            WHERE CodHistorial = v_codhistorial;

            FOR v_valorinicial IN array_lower(p_idtratamientos, 1)..array_upper(p_idtratamientos, 1) LOOP
                IF NOT EXISTS (
                    SELECT 1
                    FROM Tratamientos.Tratamiento t
                    WHERE t.idtratamiento = p_idtratamientos[v_valorinicial]
                ) THEN
                    RAISE EXCEPTION 'El tratamiento con ID % no existe.', p_idtratamientos[v_valorinicial];
                END IF;

                IF NOT EXISTS (
                    SELECT 1
                    FROM Clinica.Diente d
                    WHERE d.iddiente = p_iddiente[v_valorinicial]
                ) THEN
                    RAISE EXCEPTION 'El diente con ID % no existe.', p_iddiente[v_valorinicial];
                END IF;

                IF NOT EXISTS (
                    SELECT 1
                    FROM Clinica.EstadoDienteTabla ed
                    WHERE ed.idEstadoDiente = p_idestadoDiente[v_valorinicial]
                ) THEN
                    RAISE EXCEPTION 'El estado de diente % no existe.', p_idestadoDiente[v_valorinicial];
                END IF;

                IF NOT EXISTS (
                    SELECT 1
                    FROM Clinica.Cita
                    WHERE CodCita = p_codcita
                ) THEN
                    RAISE EXCEPTION 'La cita con código % no existe.', p_codcita;
                END IF;

                UPDATE Clinica.CitaTratamiento
                SET 
                    pfk_codcita = p_codcita,
                    pfk_idtratamiento = p_idtratamientos[v_valorinicial],
                    CantidadRecursosUsados = p_cantidadarecursosusados[v_valorinicial],
                    DescripcionRecursosUsados = p_descripcionrecursos[v_valorinicial],
                    EstadoTratamiento = 'Activo'
                WHERE PFK_CodCita = p_codcita
                AND pfk_IdTratamiento = p_idtratamientos[v_valorinicial];

                IF NOT FOUND THEN
                    INSERT INTO Clinica.CitaTratamiento
                    (
                        PFK_CodCita,
                        PFK_IdTratamiento,
                        CantidadRecursosUsados,
                        DescripcionRecursosUsados,
                        EstadoTratamiento
                    ) VALUES
                    (
                        p_codcita,
                        p_idtratamientos[v_valorinicial],
                        p_cantidadarecursosusados[v_valorinicial],
                        p_descripcionrecursos[v_valorinicial],
                        'Activo'
                    );
                END IF;

                UPDATE Clinica.HistorialClinicoDiente
                SET
                    FechaRegistro = p_fecharegistro,
                    ResultadoTratamiento = p_resultadotratamiento[v_valorinicial],
                    EstadoHistorialClinicoDiente = 'Activo'
                    IdEstadoDiente = p_idestadoDiente[v_valorinicial],
                WHERE
                    PFK_CodHistorial = v_codhistorial
                    AND PFK_IdDiente = p_iddiente[v_valorinicial];

                IF NOT FOUND THEN
                    INSERT INTO Clinica.HistorialClinicoDiente
                    (
                        PFK_IdDiente,
                        PFK_CodHistorial,
                        IdEstadoDiente,
                        FechaRegistro,
                        ResultadoTratamiento,
                        estadohistorialclinicodiente
                    ) VALUES
                    (
                        p_iddiente[v_valorinicial],
                        v_codhistorial,
                        p_idestadoDiente[v_valorinicial],
                        p_fecharegistro,
                        p_resultadotratamiento[v_valorinicial],
                        'Activo'
                    );
                END IF;
            END LOOP;
        END;
        $$;


    --Prueba del procedimiento anterior
    CALL Clinica.ActualizarHistorialClinicoCita(
        107,                           
        'Paciente presenta caries aguda.', 
        2,                                 
        ARRAY[1, 2],                        
        6,                            
        ARRAY[2, 1],                  
        ARRAY['Anestesia, Fresado', 'Sellador'], 
        ARRAY[1, 2],                    
        ARRAY[1, 7],      
        ARRAY['Exito total', 'Seguimiento requerido']
    );

    --Procedimiento para insertar una nueva factura
    CREATE OR REPLACE PROCEDURE Facturacion.AgregarFactura(p_codcita INT, p_MetodoPago INT, p_numerodocumentopaciente INT)
    LANGUAGE plpgsql AS $$

    DECLARE 
        v_tipoafiliacion INT;
    BEGIN 
        IF p_codcita IS NULL THEN
            RAISE EXCEPTION 'El código de la cita no puede ser nulo.';
        END IF;

        IF p_numerodocumentopaciente IS NULL THEN
            RAISE EXCEPTION 'El número de documento del paciente no puede ser nulo.';
        END IF;

        IF p_MetodoPago IS NULL THEN
            RAISE EXCEPTION 'El método de pago no puede ser nulo.';
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Pacientes.Paciente p WHERE p.NumDocumentoPaciente = p_numerodocumentopaciente) THEN
            RAISE EXCEPTION 'El paciente con número de documento % no existe.', p_numerodocumentopaciente;
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Clinica.Cita c WHERE c.CodCita = p_codcita) THEN
            RAISE EXCEPTION 'La cita con código % no existe.', p_codcita;
        END IF;

        IF NOT EXISTS (SELECT 1 FROM Facturacion.MetodoPagoTabla m WHERE m.IdMetodoPago = p_MetodoPago) THEN
            RAISE EXCEPTION 'El método de pago con ID % no existe.', p_MetodoPago;
        END IF;

        SELECT 
            CASE 
                WHEN af.TipoAfiliacion = 'Particular' THEN 3
                WHEN af.TipoAfiliacion = 'Subsidiado' THEN 1
                WHEN af.TipoAfiliacion = 'Contributivo' THEN 2
                ELSE 0.00
            END AS IdDescuento
            INTO v_tipoafiliacion
        FROM Pacientes.paciente pac
        INNER JOIN Pacientes.Afiliacion af ON pac.CodAfiliacion = af.CodAfiliacion
        WHERE pac.NumDocumentoPaciente = p_numerodocumentopaciente;
        
        INSERT INTO Facturacion.Facturacion
        (
            CodCita,
            IdMetodoPago,
            IdDescuento,
            FechaFacturacion,
            EstadoPago
        ) VALUES
        (
            p_codcita,
            p_MetodoPago,
            v_tipoafiliacion,
            CURRENT_DATE,
            'Pendiente'
        );

        END;
    $$;

    --Prueba del procedimiento anterior
    CALL Facturacion.AgregarFactura(6, 1, 107);


    --Procedimiento para insertar un nuevo tratamiento
    CREATE OR REPLACE PROCEDURE Tratamientos.AgregarTratamiento(
        p_NombreTratamiento TEXT,
        p_DescripcionTratamiento TEXT,
        p_PrecioTratamiento BIGINT,
        p_idcategoriatratamiento INT
    )
    LANGUAGE plpgsql AS $$
    BEGIN

        IF p_NombreTratamiento IS NULL OR LENGTH(TRIM(p_NombreTratamiento)) = 0 THEN
            RAISE EXCEPTION 'El nombre del tratamiento no puede estar vacío.';
        END IF;

        IF p_DescripcionTratamiento IS NULL OR LENGTH(TRIM(p_DescripcionTratamiento)) = 0 THEN
            RAISE EXCEPTION 'La descripción del tratamiento no puede estar vacía.';
        END IF;

        IF p_PrecioTratamiento IS NULL OR p_PrecioTratamiento <= 0 THEN
            RAISE EXCEPTION 'El precio del tratamiento debe ser mayor que cero.';
        END IF;

        IF p_idcategoriatratamiento IS NULL THEN
            RAISE EXCEPTION 'El ID de categoría del tratamiento no puede ser nulo.';
        END IF;


        IF NOT EXISTS (SELECT 1 FROM Tratamientos.Tratamiento WHERE NombreTratamiento = p_NombreTratamiento) THEN
            INSERT INTO Tratamientos.Tratamiento
            (
                NombreTratamiento,
                DescripcionTratamiento,
                CostoTratamiento,
                estadoTratamiento,
                IdCategoriaTratamiento
            ) VALUES
            (
                p_NombreTratamiento,
                p_DescripcionTratamiento,
                p_PrecioTratamiento,
                'Activo',
                p_idcategoriatratamiento
            );
        ELSE
            RAISE EXCEPTION 'El tratamiento % ya existe en la base de datos.', p_NombreTratamiento;
        END IF;
    END;
    $$;

    --Prueba del procedimiento anterior
    CALL Tratamientos.AgregarTratamiento(
    'Prueba de Tratamiento',
    'Descripción del tratamiento de prueba',
    1,
    7
    );

    --Procedimiento para actualizar el estado de una factura
    CREATE OR REPLACE PROCEDURE Facturacion.ActualizarEstadoFactura(
        p_codcita INT,
        p_estado estadopagoppc
    )
    LANGUAGE plpgsql AS $$
    BEGIN

        IF p_codcita IS NULL THEN
            RAISE EXCEPTION 'El código de la cita no puede ser nulo.';
        END IF;

        IF NOT EXISTS (
            SELECT 1 FROM Facturacion.Facturacion
            WHERE codcita = p_codcita
        ) THEN
            RAISE EXCEPTION 'No existe una factura con el código de cita %.', p_codcita;
        END IF;

        UPDATE Facturacion.Facturacion
        SET estadopago = p_estado
        WHERE codcita = p_codcita;
    END;
    $$;

    --Prueba del procedimiento anterior
    CALL Facturacion.ActualizarEstadoFactura(6, 'Pagado');

    CREATE OR REPLACE PROCEDURE Clinica.ActualizarEstadoAsistenciaCita (
        p_codcita INT,
        p_estado estadocitacpc
    )  LANGUAGE plpgsql AS $$
    BEGIN
        IF p_codcita IS NULL THEN
        RAISE EXCEPTION 'El código de la cita no puede ser nulo.';
        END IF;
        IF NOT EXISTS (
            SELECT 1 FROM Clinica.Cita
            WHERE codcita = p_codcita
        ) THEN
            RAISE EXCEPTION 'No existe una cita con el código de cita %.', p_codcita;
        END IF;

        UPDATE Clinica.Cita
        SET estadocita = p_estado
        WHERE codcita = p_codcita;
    END;
    $$;

    CALL Clinica.ActualizarEstadoAsistenciaCita(8, 'Confirmada');



    CREATE OR REPLACE FUNCTION seguridad.iniciarSesion(
        pemail VARCHAR,
        pcontrasena VARCHAR
    )
    RETURNS TABLE (
        idUsuario INT,
        Emailusuario TEXT,
        cododontologo INT,
        numdocumentopaciente INT,
        numdocumentoodontolo INT,
        idRol INT,
        estadoUsuario estadoactivoInactivo
    ) AS $$
    BEGIN
        RETURN QUERY
        SELECT 
            u.idUsuario,
            u.Emailusuario::TEXT,
            CASE WHEN u.idRol = 1 AND o.especialidad='Jefe' THEN o.codOdontologo
            WHEN u.idRol = 2 THEN o.codOdontologo ELSE NULL END, -- odontólogo
            CASE WHEN u.idRol = 3 THEN p.numDocumentoPaciente ELSE NULL END, -- paciente
            CASE WHEN u.idRol = 2 THEN o.numdocumentoodontolo ELSE NULL END,
            u.idRol,
            u.estadoUsuario
        FROM seguridad.usuario u
        LEFT JOIN Personal.Odontologo o ON o.idUsuario = u.idUsuario
        LEFT JOIN Pacientes.Paciente p ON p.idUsuario = u.idUsuario 
        WHERE u.Emailusuario = pemail
        AND u.Contraseñausuario = pcontrasena
        AND u.estadoUsuario = 'Activo';
    END;
    $$ LANGUAGE plpgsql;


    --Prueba de la funcion anterior
    SELECT * FROM seguridad.iniciarSesion('paciente1@correo.com', 'pac123');

    --Funcion para prevenir el ingreso de un correo electronico duplicado
    CREATE OR REPLACE FUNCTION prevenirEmailDuplicado()
    RETURNS TRIGGER AS $$
    BEGIN
        IF EXISTS (
            SELECT 1 FROM Seguridad.usuario
            WHERE emailusuario = NEW.emailusuario AND idUsuario != NEW.idUsuario
        ) THEN
            RAISE EXCEPTION 'El correo % ya está registrado en otro usuario', NEW.emailusuario;
        END IF;
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    --Trigger para prevenir el ingreso de un correo electronico duplicado
    CREATE TRIGGER triggerPrevenirEmailDuplicado
    BEFORE INSERT OR UPDATE ON Seguridad.usuario
    FOR EACH ROW EXECUTE FUNCTION prevenirEmailDuplicado();


    --Funcion para crear un nuevo usuario
    CREATE OR REPLACE FUNCTION Seguridad.crearUsuario(
        p_contraseñaUsuario VARCHAR(50),
        p_emailUsuario VARCHAR(100),
        p_idRol INT
    ) RETURNS INT AS $$
    DECLARE
        v_idUsuario INT;
    BEGIN
        INSERT INTO Seguridad.usuario (
            contraseñaUsuario,
            emailUsuario,
            idRol,
            estadoUsuario
        ) VALUES (
            p_contraseñaUsuario,
            p_emailUsuario,
            p_idRol,
            'Activo'  
        ) RETURNING idUsuario INTO v_idUsuario;

        RAISE NOTICE 'Usuario creado exitosamente con ID %', v_idUsuario;

        RETURN v_idUsuario;
    END;
    $$ LANGUAGE plpgsql;


    --Prueba del procedimiento anterior
    SELECT Seguridad.crearUsuario('miclave123', 'nuevo@correo.com', 3) ;



    --procedimiento para editar un usuario
    CREATE OR REPLACE PROCEDURE Seguridad.editarUsuario(
        pidUsuario INT,
        pnuevaContrasena VARCHAR(50)
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
            
        IF NOT EXISTS (
            SELECT 1 
            FROM Seguridad.usuario 
            WHERE idUsuario = pidUsuario
        ) THEN
            RAISE EXCEPTION 'El usuario con ID % no existe', pidUsuario;
        END IF;

        UPDATE seguridad.usuario
        SET contraseñaUsuario = pnuevaContrasena
        WHERE idUsuario = pidUsuario;

        RAISE NOTICE 'Contraseña del usuario con ID % editada exitosamente', pidUsuario;
    END;
    $$;

    --Prueba del procedimiento anterior
    CALL seguridad.editarUsuario(13, 'Hola123');

    --Prodecimiento para crear un paciente
    CREATE OR REPLACE PROCEDURE Pacientes.crearpaciente(
        p_numeroDocumentoPaciente INT,
        p_NombreUnoPaciente TEXT,
        p_NombreDosPaciente TEXT,
        p_ApellidounoPaciente TEXT,
        p_ApellidodosPaciente TEXT,
        p_fechaNacimientoPaciente DATE,
        p_pesopaciente int,
        p_alturapaciente NUMERIC(3,2),
        p_numeroTelefonoPaciente BIGINT,
        tipoafiliacion INT,
        p_contrasenaUsuario VARCHAR(50),
        p_emailUsuario VARCHAR(100)
    )
    LANGUAGE plpgsql AS $$
    DECLARE 
        v_codhistorial INT;
        v_idUsuario INT;

    BEGIN
        IF EXISTS (
            SELECT 1 FROM Pacientes.Paciente 
            WHERE NumDocumentoPaciente = p_numeroDocumentoPaciente
        ) THEN
            RAISE EXCEPTION 'El paciente con documento % ya existe.', p_numeroDocumentoPaciente;
        END IF;

    INSERT INTO Clinica.HistorialClinico(
        diagnosticohistorialclinico,
        EstadoHistorialClinico,
        IdEstadoTratamiento
    ) VALUES (
        'Sin diagnosticar',
        'Activo',
        2
    ) RETURNING CodHistorial INTO v_codhistorial;

    v_idUsuario := Seguridad.crearUsuario(
        p_contrasenaUsuario,
        p_emailUsuario,
        3
    );

    INSERT INTO Pacientes.Paciente (
        NumDocumentoPaciente,
        NombreUnoPaciente,
        NombreDosPaciente,
        ApellidoUnoPaciente,
        ApellidoDosPaciente,
        Fechanacimiento,
        AlturaPaciente,
        EstadoPaciente,
        CodAfiliacion,
        CodHistorial,
        idUsuario
    ) VALUES (
        p_numeroDocumentoPaciente,
        p_NombreUnoPaciente,
        p_NombreDosPaciente,
        p_ApellidounoPaciente,
        p_ApellidodosPaciente,
        p_fechaNacimientoPaciente,
        p_alturapaciente,
        'Activo',
        tipoafiliacion,
        v_codhistorial,
        v_idUsuario
    );

    INSERT INTO Pacientes.pesopaciente (
        PesoPaciente,
        estadopeso,
        NumeroIdentificacionPaciente
    ) VALUES (
        p_pesopaciente,
        'Activo',
        p_numeroDocumentoPaciente
    );

    INSERT INTO Pacientes.numerotelefonopaciente (
        NumeroTelefonoPa,
        EstadoNumeroTelPaciente,
        NumeroIdentificacionPaciente
    ) VALUES (
        p_numeroTelefonoPaciente,
        'Activo',
        p_numeroDocumentoPaciente
    );
    END;
    $$;

    --Prueba del procedimiento anterior
    CALL Pacientes.crearpaciente(
    '1234567890',              
    'Carlos',                  
    'Andrés',                  
    'Pérez',                   
    'Lopez',                   
    '1990-05-10',              
    72,                        
    1.75,                      
    3216549870,                
    1,                         
    'claveSegura123',          
    'carlos.perez@example.com'
);

CREATE OR REPLACE FUNCTION Personal.CitasAsignadas(
    p_codOdontologo INT
)
RETURNS TABLE (
    codcita INT,
    fechahorario DATE,
    horahorario TIME,
    estadoCita estadocitacpc,
    observaciones TEXT,
    numeroidentificadorpaciente INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.codcita,
        h.fechahorario,
        h.horahorario,
        c.EstadoCita,
        c.Observaciones::TEXT,
        c.numeroidentificadorpaciente
    FROM Clinica.Cita c
    INNER JOIN Personal.HorarioOdontologo h ON c.CodHorario = h.CodHorario
    WHERE h.CodOdontologo = p_codOdontologo
    ORDER BY fechahorario DESC;
END;    
$$ LANGUAGE plpgsql;


