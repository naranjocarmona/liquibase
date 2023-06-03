
-- TABLA usuario
CREATE TABLE usuario (
    codigo_usuario NUMBER,
    nick VARCHAR2(50) CONSTRAINT nick_no_nulo NOT NULL,
    email VARCHAR2(100) CONSTRAINT email_no_nulo NOT NULL,
    fecha_nacimiento DATE,
    CONSTRAINT pk_usuario PRIMARY KEY (codigo_usuario),
    CONSTRAINT nick_unico UNIQUE (nick),
    CONSTRAINT email_valido CHECK (email LIKE '%@%.%' AND email NOT LIKE '@%' AND email NOT LIKE '%@%@%'),
    CONSTRAINT email_unico UNIQUE (email),
    CONSTRAINT fecha_valida CHECK(to_char(fecha_nacimiento, 'YYYY') <= '2004')
);

create table productos (
    codigo_producto number,
    nombre varchar2(30) constraint nombre_no_nulo not null,
    precio number(5,2),
    constraint pk_producto primary key (codigo_producto),
    constraint precio_valido check (precio > 0)
);

create table compra_p (
    codigo_usuario number,
    codigo_producto number,
    fecha_compra date default sysdate,
    constraint pk_compra_p primary key (codigo_usuario,codigo_producto,fecha_compra),
    constraint fk_compra_usuario foreign key (codigo_usuario) references usuario (codigo_usuario) on delete cascade,
    constraint fk_compra_producto foreign key (codigo_producto) references productos(codigo_producto) on delete cascade
);

create table biblioteca (
    codigo_biblioteca number,
    codigo_usuario number,
    constraint pk_biblioteca primary key (codigo_biblioteca),
    constraint fk_biblioteca_usuario foreign key (codigo_usuario) references usuario(codigo_usuario) on delete cascade
);

create table se_almacena (
    codigo_biblioteca number,
    codigo_producto number,
    fecha_producto_agregado date default sysdate,
    constraint pk_se_almacena primary key (codigo_biblioteca,codigo_producto,fecha_producto_agregado),
    constraint fk_almacena_biblioteca foreign key (codigo_biblioteca) references biblioteca(codigo_biblioteca) on delete cascade,
    constraint fk_almacena_producto foreign key (codigo_producto) references productos(codigo_producto) on delete cascade
);

create table peliculas (
    codigo_producto number,
    director varchar2(30) constraint director_no_nulo not null,
    genero varchar2(20) constraint genero_no_nulo not null,
    constraint pk_pelicula primary key (codigo_producto),
    constraint fk_peliculas_producto foreign key (codigo_producto) references productos(codigo_producto) on delete cascade
);
    
create table wallpapers (
    codigo_producto number,
    ancho number,
    alto number,
    constraint pk_wallpaper primary key (codigo_producto),
    constraint fk_wallpaper_producto foreign key (codigo_producto) references productos(codigo_producto) on delete cascade,
    constraint ancho_valido check(ancho >= 400),
    constraint alto_valido check(alto>=300)
);

create table suscripcion (
    codigo_suscripcion number,
    codigo_usuario number,
    tipo varchar2(30) constraint tipo_no_nulo not null,
    constraint pk_suscripcion primary key (codigo_suscripcion),
    constraint fk_suscripcion_usuario foreign key (codigo_usuario) references usuario(codigo_usuario) on delete cascade
);

create table categoria (
    codigo_categoria number,
    tipo varchar2(30) constraint tipoc_no_nulo NOT NULL,
    constraint pk_categoria primary key (codigo_categoria)
);

create table videojuegos (
    codigo_producto number,
    empresa varchar2(40) constraint empresa_no_nula not null,
    edad_minima number,
    codigo_categoria number,
    constraint pk_videojuego primary key (codigo_producto),
    constraint fk_videojuego_producto foreign key (codigo_producto) references productos(codigo_producto) on delete cascade,
    constraint fk_videojuego_categoria foreign key (codigo_categoria) references categoria(codigo_categoria) on delete cascade,
    constraint edad_valida check (edad_minima >0)
);

create table trofeos (
    codigo_trofeo number,
    codigo_videojuego number,
    tipo varchar2(40) constraint tipot_no_nulo not null,
    constraint pk_trofeo primary key (codigo_trofeo),
    constraint fk_trofeo_videojuego foreign key (codigo_videojuego) references videojuegos(codigo_producto) on delete cascade
);

create table ganan (
    codigo_trofeo number,
    codigo_usuario number,
    fecha date default sysdate,
    constraint pk_ganan primary key (codigo_trofeo, codigo_usuario),
    constraint fk_ganan_trofeo foreign key (codigo_trofeo) references trofeos (codigo_trofeo) on delete cascade,
    constraint fk_ganan_usuario foreign key (codigo_usuario) references usuario(codigo_usuario) on delete cascade
);

