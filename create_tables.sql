create database A01;

create table users (
	id BIGINT not null primary key,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	email VARCHAR(50) not null
)

create table orders (
	id BIGINT not null primary key,
	price BIGINT not null,
	order_date TIMESTAMP default now(),
	user_id BIGINT not null,
	
	constraint user_id_fk foreign key (user_id) references users (id)
)

alter table orders
add column product_name VARCHAR(50) after price,
add column category_id BIGINT after product_name,
add constraint category_id_fk foreign key (category_id) references categories (id);

create table discounts (
	id BIGINT not null primary key,
	name VARCHAR(50) not null,
	bonus FLOAT not null
);

alter table discounts
add constraint check_bonus_range check (bonus >=0 and bonus <= 1);

create table users_bonuses (
	user_id BIGINT not null,
	bonus_id BIGINT not null,
	bonus_count BIGINT,
	
	constraint user_id_ub_fk foreign key (user_id) references users (id),
	constraint bonus_id_fk foreign key (bonus_id) references discounts (id),
	constraint check_bonus_count_range check (bonus_count >= 0 or bonus_count <=> NULL)
);

create table categories (
	id BIGINT primary key not null,
	name VARCHAR(50) not null
);

create table new_categories (
	id BIGINT primary key not null,
	name VARCHAR(50) not null
);

create table new_categories_2 (
	id BIGINT primary key not null,
	name VARCHAR(50) not null
);