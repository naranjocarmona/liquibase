-- Borrar datos
delete from ganan;
delete from trofeos;
delete from videojuegos;
delete from categoria;
delete from suscripcion;
delete from wallpapers;
delete from peliculas;
delete from se_almacena;
delete from biblioteca;
delete from compra_p;
delete from productos;
delete from usuario;

-- Recrear secuencias
drop sequence seq_usuario;
drop sequence seq_producto;
drop sequence seq_biblioteca;
drop sequence seq_categoria;
drop sequence seq_trofeos;
drop sequence seq_suscripcion;

create sequence seq_usuario start with 1 increment by 1 nocycle;
create sequence seq_producto start with 1 increment by 1 nocycle;
create sequence seq_biblioteca start with 1 increment by 1 nocycle;
create sequence seq_categoria start with 1 increment by 1 nocycle;
create sequence seq_trofeos start with 1 increment by 1 nocycle;
create sequence seq_suscripcion start with 1 increment by 1 nocycle;
