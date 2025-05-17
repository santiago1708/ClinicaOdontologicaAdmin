--Seguridad 

INSERT INTO Seguridad.Rol
    ( NombreRol,EstadoRol)
VALUES
    ('Administrador', 'Activo');
INSERT INTO Seguridad.Rol
    ( NombreRol, EstadoRol)
VALUES
    ('Odontologo', 'Activo');
INSERT INTO Seguridad.Rol
    ( NombreRol, EstadoRol)
VALUES
    ('Paciente', 'Activo');

INSERT INTO Seguridad.Usuario ( EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ( 'admin@clinica.com', 'admin123', 'Activo', 1);

INSERT INTO Seguridad.Usuario ( EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ( 'odontologo1@clinica.com', 'odo123', 'Activo', 2);

INSERT INTO Seguridad.Usuario ( EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ( 'paciente1@correo.com', 'pac123', 'Activo', 3);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('paciente2@correo.com', 'pac234', 'Activo', 3);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('paciente3@correo.com', 'pac345', 'Activo', 3);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('paciente4@correo.com', 'pac456', 'Activo', 3);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('paciente5@correo.com', 'pac567', 'Activo', 3);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('odontologo2@clinica.com', 'odo234', 'Activo', 2);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('odontologo3@clinica.com', 'odo345', 'Activo', 2);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('odontologo4@clinica.com', 'odo456', 'Activo', 2);

INSERT INTO Seguridad.Usuario (EmailUsuario, ContraseñaUsuario, EstadoUsuario, IdRol)
VALUES ('odontologo5@clinica.com', 'odo567', 'Activo', 2);

--Personal

INSERT INTO Personal.InformacionPersonalOdontologo
    ( NumDocumentoOdontolo, NombreUnoOdontologo, NombreDosOdontologo, ApellidoUnoOdontologo, ApellidoDosOdontologo)
VALUES
    ( 101, 'Carlos', 'Andrés', 'Pérez', 'Gómez');
INSERT INTO Personal.InformacionPersonalOdontologo
    ( NumDocumentoOdontolo, NombreUnoOdontologo, NombreDosOdontologo, ApellidoUnoOdontologo, ApellidoDosOdontologo)
VALUES
    ( 102, 'María', NULL, 'Rodríguez', 'López');
INSERT INTO Personal.InformacionPersonalOdontologo
    ( NumDocumentoOdontolo, NombreUnoOdontologo, NombreDosOdontologo, ApellidoUnoOdontologo, ApellidoDosOdontologo)
VALUES
    ( 103, 'Juan', 'Carlos', 'Martínez', 'Ramírez');
INSERT INTO Personal.InformacionPersonalOdontologo
    ( NumDocumentoOdontolo, NombreUnoOdontologo, NombreDosOdontologo, ApellidoUnoOdontologo, ApellidoDosOdontologo)
VALUES
    (104, 'Laura', 'Isabel', 'González', 'Fernández');
INSERT INTO Personal.InformacionPersonalOdontologo
    ( NumDocumentoOdontolo, NombreUnoOdontologo, NombreDosOdontologo, ApellidoUnoOdontologo, ApellidoDosOdontologo)
VALUES
    (105, 'Pedro', NULL, 'Sánchez', 'Torres');


INSERT INTO Personal.Consultorio
    ( EstadoConsultorio, NumeroConsultorio, CapacidadConsultorio)
VALUES
    ( 'Disponible', 101, 2);
INSERT INTO Personal.Consultorio
    ( EstadoConsultorio, NumeroConsultorio, CapacidadConsultorio)
VALUES
    ( 'Ocupado', 102, 1);
INSERT INTO Personal.Consultorio
    ( EstadoConsultorio, NumeroConsultorio, CapacidadConsultorio)
VALUES
    ( 'Disponible', 103, 2);
INSERT INTO Personal.Consultorio
    ( EstadoConsultorio, NumeroConsultorio, CapacidadConsultorio)
VALUES
    ( 'Disponible', 104, 1);
INSERT INTO Personal.Consultorio
    ( EstadoConsultorio, NumeroConsultorio, CapacidadConsultorio)
VALUES
    ( 'Ocupado', 105, 2);

INSERT INTO Personal.Odontologo
    ( AniosExperiencia, FechaContratacion, HoraEntrada, HoraSalida, Especialidad, EstadoOdontologo, IdUsuario, CodConsultorio, NumDocumentoOdontolo)
VALUES
    ( 5, '2020-01-15', '08:00:00', '16:00:00', 'Ortodoncia', 'Activo', 2, 1, 101);
INSERT INTO Personal.Odontologo
    ( AniosExperiencia, FechaContratacion, HoraEntrada, HoraSalida, Especialidad, EstadoOdontologo, IdUsuario, CodConsultorio, NumDocumentoOdontolo)
VALUES
    ( 3, '2021-06-10', '09:00:00', '17:00:00', 'Endodoncia', 'Activo', 2, 2, 102);
INSERT INTO Personal.Odontologo
    ( AniosExperiencia, FechaContratacion, HoraEntrada, HoraSalida, Especialidad, EstadoOdontologo, IdUsuario, CodConsultorio, NumDocumentoOdontolo)
VALUES
    ( 7, '2018-03-20', '10:00:00', '18:00:00', 'Periodoncia', 'Activo', 2, 3, 103);
INSERT INTO Personal.Odontologo
    ( AniosExperiencia, FechaContratacion, HoraEntrada, HoraSalida, Especialidad, EstadoOdontologo, IdUsuario, CodConsultorio, NumDocumentoOdontolo)
VALUES
    ( 2, '2022-09-05', '08:30:00', '16:30:00', 'Cirugía Oral', 'Activo', 2, 4, 104);
INSERT INTO Personal.Odontologo
    ( AniosExperiencia, FechaContratacion, HoraEntrada, HoraSalida, Especialidad, EstadoOdontologo, IdUsuario, CodConsultorio, NumDocumentoOdontolo)
VALUES
    ( 4, '2019-11-12', '09:30:00', '17:30:00', 'Odontopediatría', 'Activo', 2, 5, 105);

INSERT INTO Personal.HorarioOdontologo
    ( Fechahorario, HoraHorario, EstadoHorario, CodOdontologo)
VALUES
    ( '2025-05-10', '08:00:00', 'Disponible', 1);
INSERT INTO Personal.HorarioOdontologo
    ( Fechahorario, HoraHorario, EstadoHorario, CodOdontologo)
VALUES
    ( '2025-05-10', '09:00:00', 'Disponible', 2);
INSERT INTO Personal.HorarioOdontologo
    ( Fechahorario, HoraHorario, EstadoHorario , CodOdontologo)
VALUES
    ( '2025-05-11', '10:00:00', 'Disponible', 3);
INSERT INTO Personal.HorarioOdontologo
    ( Fechahorario, HoraHorario, EstadoHorario , CodOdontologo)
VALUES
    ( '2025-05-11', '11:00:00', 'Disponible', 4);
INSERT INTO Personal.HorarioOdontologo
    ( Fechahorario, HoraHorario, EstadoHorario , CodOdontologo)
VALUES
    ( '2025-05-12', '12:00:00', 'Disponible', 5);

INSERT INTO Personal.NumeroTelefonoEmpleado
    ( NumeroTelefonoOd, EstadoNumeroTelOdontologo, NumeroIdentificacionOdontologo)
VALUES
    ( '3101234567', 'Activo', 101);
INSERT INTO Personal.NumeroTelefonoEmpleado
    ( NumeroTelefonoOd, EstadoNumeroTelOdontologo, NumeroIdentificacionOdontologo)
VALUES
    ('3112345678', 'Activo', 102);
INSERT INTO Personal.NumeroTelefonoEmpleado
    ( NumeroTelefonoOd, EstadoNumeroTelOdontologo, NumeroIdentificacionOdontologo)
VALUES
    ( '3123456789', 'Activo', 103);
INSERT INTO Personal.NumeroTelefonoEmpleado
    ( NumeroTelefonoOd, EstadoNumeroTelOdontologo, NumeroIdentificacionOdontologo)
VALUES
    ( '3134567890', 'Activo', 104);
INSERT INTO Personal.NumeroTelefonoEmpleado
    ( NumeroTelefonoOd, EstadoNumeroTelOdontologo, NumeroIdentificacionOdontologo)
VALUES
    ( '3145678901', 'Activo', 105);


--Pacientes 

INSERT INTO Pacientes.Afiliacion
    ( TipoAfiliacion, PorcentajeCobertura, EstadoAfiliacion)
VALUES
    ( 'Particular', 0.00, 'Activo');
INSERT INTO Pacientes.Afiliacion
    ( TipoAfiliacion, PorcentajeCobertura, EstadoAfiliacion)
VALUES
    ( 'Subsidiado', 100.00, 'Activo');
INSERT INTO Pacientes.Afiliacion
    ( TipoAfiliacion, PorcentajeCobertura, EstadoAfiliacion)
VALUES
    ( 'Contributivo', 50.00, 'Activo');


INSERT INTO Pacientes.Paciente
    ( NumDocumentoPaciente, FechaNacimiento, AlturaPaciente, NombreUnoPaciente, NombreDosPaciente, ApellidoUnoPaciente, ApellidoDosPaciente, EstadoPaciente, CodAfiliacion, CodHistorial, IdUsuario)
VALUES
    ( 106, '1995-06-15', 1.75, 'Carlos', 'Andrés', 'Ramírez', 'López', 'Activo', 1,1, 3);
INSERT INTO Pacientes.Paciente
    ( NumDocumentoPaciente, FechaNacimiento, AlturaPaciente, NombreUnoPaciente, NombreDosPaciente, ApellidoUnoPaciente, ApellidoDosPaciente, EstadoPaciente, CodAfiliacion, CodHistorial,  IdUsuario)
VALUES
    ( 107, '1988-02-10', 1.68, 'María', NULL, 'Fernández', 'García', 'Activo', 2,2, 3);
INSERT INTO Pacientes.Paciente
    ( NumDocumentoPaciente, FechaNacimiento, AlturaPaciente, NombreUnoPaciente, NombreDosPaciente, ApellidoUnoPaciente, ApellidoDosPaciente, EstadoPaciente, CodAfiliacion, CodHistorial, IdUsuario)
VALUES
    ( 108, '2001-11-30', 1.8, 'Luis', 'Eduardo', 'Martínez', 'Sánchez', 'Activo', 1,3, 3);
INSERT INTO Pacientes.Paciente
    ( NumDocumentoPaciente, FechaNacimiento, AlturaPaciente, NombreUnoPaciente, NombreDosPaciente, ApellidoUnoPaciente, ApellidoDosPaciente, EstadoPaciente, CodAfiliacion, CodHistorial, IdUsuario)
VALUES
    ( 109, '1992-08-25', 1.65, 'Andrea', NULL, 'Torres', 'Mendoza', 'Activo', 3,4, 3);
INSERT INTO Pacientes.Paciente
    ( NumDocumentoPaciente, FechaNacimiento, AlturaPaciente, NombreUnoPaciente, NombreDosPaciente, ApellidoUnoPaciente, ApellidoDosPaciente, EstadoPaciente, CodAfiliacion,CodHistorial,  IdUsuario)
VALUES
    ( 110, '1990-04-19', 1.7, 'Javier', 'Alejandro', 'Morales', 'Ruiz', 'Activo', 3,5, 3);


INSERT INTO Pacientes.NumeroTelefonoPaciente
    ( NumeroTelefonoPa, EstadoNumeroTelPaciente, NumeroIdentificacionPaciente)
VALUES
    ( '3219083219', 'Activo', 106);
INSERT INTO Pacientes.NumeroTelefonoPaciente
    ( NumeroTelefonoPa, EstadoNumeroTelPaciente, NumeroIdentificacionPaciente)
VALUES
    ( '3247681289', 'Activo', 107);
INSERT INTO Pacientes.NumeroTelefonoPaciente
    ( NumeroTelefonoPa, EstadoNumeroTelPaciente, NumeroIdentificacionPaciente)
VALUES
    ( '3321876721', 'Activo', 108);
INSERT INTO Pacientes.NumeroTelefonoPaciente
    ( NumeroTelefonoPa, EstadoNumeroTelPaciente, NumeroIdentificacionPaciente)
VALUES
    ( '3202246712', 'Activo', 109);
INSERT INTO Pacientes.NumeroTelefonoPaciente
    ( NumeroTelefonoPa, EstadoNumeroTelPaciente, NumeroIdentificacionPaciente)
VALUES
    ( '3340923823', 'Activo', 110);

INSERT INTO Pacientes.PesoPaciente
    ( PesoPaciente, EstadoPeso, NumeroIdentificacionPaciente)
VALUES
    ( 70.5, 'Activo', 106);
INSERT INTO Pacientes.PesoPaciente
    ( PesoPaciente, EstadoPeso, NumeroIdentificacionPaciente)
VALUES
    ( 60.2, 'Activo', 107);
INSERT INTO Pacientes.PesoPaciente
    ( PesoPaciente, EstadoPeso, NumeroIdentificacionPaciente)
VALUES
    ( 82.3, 'Activo', 108);
INSERT INTO Pacientes.PesoPaciente
    ( PesoPaciente, EstadoPeso, NumeroIdentificacionPaciente)
VALUES
    ( 55.0, 'Activo', 109);
INSERT INTO Pacientes.PesoPaciente
    ( PesoPaciente, EstadoPeso, NumeroIdentificacionPaciente)
VALUES
    ( 90.4, 'Activo', 110);


-- Clinica


INSERT INTO Clinica.EstadoTratamientoTabla
    ( EstadoTratamiento)
VALUES
    ( 'En progreso');
INSERT INTO Clinica.EstadoTratamientoTabla
    ( EstadoTratamiento)
VALUES
    ( 'Finalizado');
INSERT INTO Clinica.EstadoTratamientoTabla
    ( EstadoTratamiento)
VALUES
    ( 'Pendiente');
INSERT INTO Clinica.EstadoTratamientoTabla
    ( EstadoTratamiento)
VALUES
    ( 'Cancelado');
INSERT INTO Clinica.EstadoTratamientoTabla
    ( EstadoTratamiento)
VALUES
    ( 'En espera');

INSERT INTO Clinica.HistorialClinico
    ( DiagnosticoHistorialClinico, EstadoHistorialClinico, IdEstadoTratamiento)
VALUES
    (  'Paciente con dientes oscuros por consumo de café', 'Activo', 1);
INSERT INTO Clinica.HistorialClinico
    (  DiagnosticoHistorialClinico, EstadoHistorialClinico, IdEstadoTratamiento)
VALUES
    (  'Paciente con dientes ausentes en la zona posterior', 'Activo', 2);
INSERT INTO Clinica.HistorialClinico
    (  DiagnosticoHistorialClinico, EstadoHistorialClinico, IdEstadoTratamiento)
VALUES
    (  'Paciente con acumulación de sarro', 'Activo', 3);
INSERT INTO Clinica.HistorialClinico
    (  DiagnosticoHistorialClinico, EstadoHistorialClinico, IdEstadoTratamiento)
VALUES
    (  'Paciente con maloclusión dental', 'Activo', 1);
INSERT INTO Clinica.HistorialClinico
    (  DiagnosticoHistorialClinico, EstadoHistorialClinico, IdEstadoTratamiento)
VALUES
    (  'Paciente con caries en molar superior', 'Activo', 2);

INSERT INTO Clinica.Angulo
    ( CaraCoronaCervical, TercioOclusal, Corona, RaizCervical, TercioLabioLingual,EstadoAngulo)
VALUES
    ( 'Vestibular', 'Mesial', 'Corona Clínica', 'Raíz Mesial', 'Lingual', 'Activo');
INSERT INTO Clinica.Angulo
    ( CaraCoronaCervical, TercioOclusal, Corona, RaizCervical, TercioLabioLingual,EstadoAngulo)
VALUES
    ( 'Palatina', 'Distal', 'Corona Anatómica', 'Raíz Distal', 'Vestibular', 'Activo');
INSERT INTO Clinica.Angulo
    ( CaraCoronaCervical, TercioOclusal, Corona, RaizCervical, TercioLabioLingual,EstadoAngulo)
VALUES
    ( 'Lingual', 'Mesial', 'Corona Clínica', 'Raíz Vestibular', 'Palatina', 'Activo');
INSERT INTO Clinica.Angulo
    ( CaraCoronaCervical, TercioOclusal, Corona, RaizCervical, TercioLabioLingual,EstadoAngulo)
VALUES
    ( 'Mesial', 'Distal', 'Corona Anatómica', 'Raíz Palatina', 'Vestibular', 'Activo');
INSERT INTO Clinica.Angulo
    ( CaraCoronaCervical, TercioOclusal, Corona, RaizCervical, TercioLabioLingual,EstadoAngulo)
VALUES
    ( 'Distal', 'Vestibular', 'Corona Clínica', 'Raíz Mesial', 'Lingual', 'Activo');


INSERT INTO Clinica.Diente
    ( NumeroDiente, Cuadrante, TipoDiente, EstadoDiente, IdAngulo)
VALUES
    ( 11, 1, 'Incisivo  superior derecho', 'Activo', 1);
INSERT INTO Clinica.Diente
    ( NumeroDiente, Cuadrante, TipoDiente, EstadoDiente, IdAngulo)
VALUES
    ( 12, 1, 'Incisivo lateral superior derecho', 'Activo', 2);
INSERT INTO Clinica.Diente
    ( NumeroDiente, Cuadrante, TipoDiente, EstadoDiente, IdAngulo)
VALUES
    ( 21, 2, 'Canino superior derecho', 'Activo', 3);
INSERT INTO Clinica.Diente
    ( NumeroDiente, Cuadrante, TipoDiente, EstadoDiente, IdAngulo)
VALUES
    ( 22, 2, 'Primer premolar superior derecho', 'Activo', 4);
INSERT INTO Clinica.Diente
    ( NumeroDiente, Cuadrante, TipoDiente, EstadoDiente, IdAngulo)
VALUES
    ( 31, 3, 'Segundo premolar superior derecho', 'Activo', 5);


INSERT INTO Clinica.EstadoDienteTabla
    ( EstadoDiente)
VALUES
    ( 'Saludable');
INSERT INTO Clinica.EstadoDienteTabla
    ( EstadoDiente)
VALUES
    ( 'Fracturado');
INSERT INTO Clinica.EstadoDienteTabla
    ( EstadoDiente)
VALUES
    ( 'Dañado');
INSERT INTO Clinica.EstadoDienteTabla
    ( EstadoDiente)
VALUES
    ( 'Ausente');
INSERT INTO Clinica.EstadoDienteTabla
    ( EstadoDiente)
VALUES
    ( 'Impactado');
INSERT INTO Clinica.EstadoDienteTabla
    ( EstadoDiente)
VALUES
    ( 'Desgastado');
INSERT INTO Clinica.EstadoDienteTabla
    ( EstadoDiente)
VALUES
    ( 'Tratado');

INSERT INTO Clinica.Cita
    ( EstadoCita, Observaciones, Duracion, CodHorario, NumeroIdentificadorPaciente)
VALUES
    ( 'Confirmada', 'Revisión de caries', '30 minutos', 1, 106);
INSERT INTO Clinica.Cita
    ( EstadoCita, Observaciones, Duracion,  CodHorario, NumeroIdentificadorPaciente)
VALUES
    ( 'Pendiente', 'Extracción dental', '1 hora', 2, 107);
INSERT INTO Clinica.Cita
    ( EstadoCita, Observaciones, Duracion,  CodHorario, NumeroIdentificadorPaciente)
VALUES
    ( 'Cancelada', 'Endodoncia', '1 hora', 3, 108);
INSERT INTO Clinica.Cita
    ( EstadoCita, Observaciones, Duracion,  CodHorario, NumeroIdentificadorPaciente)
VALUES
    ( 'Confirmada', 'Limpieza dental', '30 minutos', 4, 109);
INSERT INTO Clinica.Cita
    ( EstadoCita, Observaciones, Duracion, CodHorario, NumeroIdentificadorPaciente)
VALUES
    ( 'Pendiente', 'Revisión general', '30 minutos', 5, 110);

INSERT INTO Clinica.HistorialClinicoDiente
    (PFK_idDiente, PFK_CodHistorial, FechaRegistro, ResultadoTratamiento, EstadoHistorialClinicoDiente, IdEstadoDiente)
VALUES
    (1, 1, '2025-05-10', 'Dientes blanqueados correctamente', 'Activo', 1);
INSERT INTO Clinica.HistorialClinicoDiente
    (PFK_idDiente, PFK_CodHistorial, FechaRegistro, ResultadoTratamiento , EstadoHistorialClinicoDiente, IdEstadoDiente)
VALUES
    (2, 2, '2025-05-11', 'Implantes exitosos', 'Activo', 7);
INSERT INTO Clinica.HistorialClinicoDiente
    (PFK_idDiente, PFK_CodHistorial, FechaRegistro, ResultadoTratamiento, EstadoHistorialClinicoDiente, IdEstadoDiente)
VALUES
    (3, 3, '2025-05-12', 'Limpieza completa', 'Activo', 1);
INSERT INTO Clinica.HistorialClinicoDiente
    (PFK_idDiente, PFK_CodHistorial, FechaRegistro, ResultadoTratamiento, EstadoHistorialClinicoDiente, IdEstadoDiente)
VALUES
    (4, 4, '2025-05-13', 'Ortodoncia aplicada', 'Activo', 5);
INSERT INTO Clinica.HistorialClinicoDiente
    (PFK_idDiente, PFK_CodHistorial, FechaRegistro, ResultadoTratamiento, EstadoHistorialClinicoDiente, IdEstadoDiente)
VALUES
    (5, 5, '2025-05-14', 'Carie removida y restaurada', 'Activo', 2);


-- Tratamientos

INSERT INTO Tratamientos.CategoriaTratamientoTabla
    ( CategoriaTratamiento,EstadoCategoriaTratamiento)
VALUES
    ( 'Ortodoncia', 'Activo');
INSERT INTO Tratamientos.CategoriaTratamientoTabla
    ( CategoriaTratamiento,EstadoCategoriaTratamiento)
VALUES
    ( 'Cirugía', 'Activo');
INSERT INTO Tratamientos.CategoriaTratamientoTabla
    ( CategoriaTratamiento,EstadoCategoriaTratamiento)
VALUES
    ( 'Endodoncia', 'Activo');
INSERT INTO Tratamientos.CategoriaTratamientoTabla
    ( CategoriaTratamiento,EstadoCategoriaTratamiento)
VALUES
    ( 'Implantes', 'Activo');
INSERT INTO Tratamientos.CategoriaTratamientoTabla
    ( CategoriaTratamiento,EstadoCategoriaTratamiento)
VALUES
    ( 'Estética dental', 'Activo');
INSERT INTO Tratamientos.CategoriaTratamientoTabla
    ( CategoriaTratamiento,EstadoCategoriaTratamiento)
VALUES
    ( 'Restaurativo', 'Activo');
INSERT INTO Tratamientos.CategoriaTratamientoTabla
    ( CategoriaTratamiento,EstadoCategoriaTratamiento)
VALUES
    ( 'Preventivo', 'Activo');

INSERT INTO Tratamientos.Tratamiento
    ( NombreTratamiento, DescripcionTratamiento, CostoTratamiento, EstadoTratamiento, IdCategoriaTratamiento)
VALUES
    ( 'Blanqueamiento Dental', 'Tratamiento para eliminar manchas de los dientes', 100000, 'Activo', 5);
INSERT INTO Tratamientos.Tratamiento
    ( NombreTratamiento, DescripcionTratamiento, CostoTratamiento, EstadoTratamiento,IdCategoriaTratamiento)
VALUES
    ( 'Implantes Dentales', 'Implantes para dientes ausentes', 500000, 'Activo', 2);
INSERT INTO Tratamientos.Tratamiento
    ( NombreTratamiento, DescripcionTratamiento, CostoTratamiento, EstadoTratamiento,IdCategoriaTratamiento)
VALUES
    ( 'Limpieza Dental', 'Limpieza para eliminar sarro y placa dental', 50000, 'Activo', 7);
INSERT INTO Tratamientos.Tratamiento
    ( NombreTratamiento, DescripcionTratamiento, CostoTratamiento, EstadoTratamiento,IdCategoriaTratamiento)
VALUES
    ( 'Ortodoncia', 'Corrección de la alineación dental', 2000000, 'Activo', 1);
INSERT INTO Tratamientos.Tratamiento
    ( NombreTratamiento, DescripcionTratamiento, CostoTratamiento, EstadoTratamiento,IdCategoriaTratamiento)
VALUES
    ( 'Tratamiento de Caries', 'Tratamiento para eliminar y restaurar caries dentales', 80000, 'Activo', 6);



-- Facturación 

INSERT INTO Facturacion.MetodoPagoTabla
    ( MetodoPago, EstadoMetodoPago)
VALUES
    ( 'Efectivo', 'Activo');
INSERT INTO Facturacion.MetodoPagoTabla
    ( MetodoPago, EstadoMetodoPago)
VALUES
    ( 'Tarjeta de crédito', 'Activo');
INSERT INTO Facturacion.MetodoPagoTabla
    ( MetodoPago, EstadoMetodoPago)
VALUES
    ( 'Transferencia bancaria', 'Activo');

INSERT INTO Facturacion.Descuento
    ( MotivoDescuento, EstadoDescuento)
VALUES
    ( 'Descuento usuario subsidiado al 100%', 'Activo');
INSERT INTO Facturacion.Descuento
    ( MotivoDescuento, EstadoDescuento)
VALUES
    ( 'Descuento usuario contributivo al 50%', 'Activo');
INSERT INTO Facturacion.Descuento
    ( MotivoDescuento, EstadoDescuento)
VALUES
    ( 'Descuento usuario particular al 0%', 'Activo');

INSERT INTO Facturacion.Facturacion
    ( EstadoPago, FechaFacturacion, IdMetodoPago, CodCita, IdDescuento)
VALUES
    ( 'Pagado', '2025-05-10', 1, 1, 3);
INSERT INTO Facturacion.Facturacion
    ( EstadoPago, FechaFacturacion, IdMetodoPago, CodCita, IdDescuento)
VALUES
    ( 'Pendiente', '2025-05-11', 3, 2, 1);
INSERT INTO Facturacion.Facturacion
    ( EstadoPago, FechaFacturacion, IdMetodoPago, CodCita, IdDescuento)
VALUES
    ( 'Cancelado', '2025-05-12', 2, 3, 3);
INSERT INTO Facturacion.Facturacion
    ( EstadoPago, FechaFacturacion, IdMetodoPago, CodCita, IdDescuento)
VALUES
    ( 'Pagado', '2025-05-10', 1, 4, 2);
INSERT INTO Facturacion.Facturacion
    ( EstadoPago, FechaFacturacion, IdMetodoPago, CodCita, IdDescuento)
VALUES
    ( 'Pendiente', '2025-05-11', 1, 5, 2);


INSERT INTO Clinica.CitaTratamiento
    (PFK_Codcita, PFK_IdTratamiento, CantidadRecursosUsados, DescripcionRecursosUsados, EstadoTratamiento)
VALUES
    (1, 1, 1, 'Blanqueador dental', 'Activo');
INSERT INTO Clinica.CitaTratamiento
    (PFK_Codcita, PFK_IdTratamiento, CantidadRecursosUsados, DescripcionRecursosUsados, EstadoTratamiento)
VALUES
    (2, 2, 3, 'Implantes dentales', 'Activo');
INSERT INTO Clinica.CitaTratamiento
    (PFK_Codcita, PFK_IdTratamiento, CantidadRecursosUsados, DescripcionRecursosUsados, EstadoTratamiento)
VALUES
    (3, 3, 1, 'Limpiador de sarro', 'Activo');
INSERT INTO Clinica.CitaTratamiento
    (PFK_Codcita, PFK_IdTratamiento, CantidadRecursosUsados, DescripcionRecursosUsados, EstadoTratamiento)
VALUES
    (4, 4, 2, 'Brackets y alambres', 'Activo');
INSERT INTO Clinica.CitaTratamiento
    (PFK_Codcita, PFK_IdTratamiento, CantidadRecursosUsados, DescripcionRecursosUsados, EstadoTratamiento)
VALUES
    (5, 5, 1, 'Material de restauración dental', 'Activo');

