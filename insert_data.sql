insert into users (id, first_name, last_name, email) 
values (1, 'Illia', 'Prykhodko', 'iprykhodko@kse.org.ua'),
	(2, 'Kostian', 'Matros', 'kmatros@murzilka.com'),
	(3, 'Andrew', 'Klykavka', 'bigtennis@boss.org.us'),
	(4, 'Yana', 'Zist', 'yzist@outlook.com'),
	(5, 'Dmitry', 'Lupashko', 'bigboy@gmail.com'),
	(6, 'Matviy', 'Waterlover', 'mwaterlover@gmail.com'),
	(7, 'Bogdan', 'Headgiver', 'bheadgiver@gmail.com');

insert into orders (id, price, product_name, category_id, user_id)
values (1, 2000, 'Laptop', 3, 3),
	(2, 3000, 'Baby stroller', 7, 2),
	(3, 5000, 'Chairs set x16', 1, 1),
	(4, 199, 'Gold pizza', 4, 7),
	(5, 499, 'Headphones', 3, 5),
	(6, 845, 'Engine oil', 6, 2),
	(7, 7800, 'Kitchen', 1, 4),
	(8, 3600, 'Basketball stand', 5, 1),
	(9, 5199, 'Swimming pool', 1, 6),
	(10, 450, 'Sweater', 2, 6),
	(11, 1000, '3 T-shirts pack', 2, 3),
	(12, 12000, 'Car', 6, 5),
	(13, 500, 'Basketball jersey', 5, 4),
	(14, 300, 'Unlimited KFC food ticket', 4, 2),
	(15, 6600, 'Basement', 7, 1);

insert into discounts (id, name, bonus)
values (1, 'newbie', 0.3),
	(2, 'standard', 0.2),
	(3, 'prime', 0.3),
	(4, 'VIP', 0.5);
	
insert into users_bonuses (user_id, bonus_id, bonus_count)
values (2, 3, 1),
	(1, 4, 2),
	(1, 3, 1),
	(6, 1, 1),
	(7, 1, 1),
	(3, 2, 4),
	(4, 3, 1);

insert into categories (id, name)
values (1, 'Home & Living'),
	(2, 'Personal Goods'),
	(3, 'Electronics'),
	(4, 'Food & Grocery'),
	(5, 'Entertainment'),
	(6, 'Automotive'),
	(7, 'Kids');

insert into new_categories (id, name)
values (8, 'Materials');

insert into new_categories_2 (id, name)
values 	(9, 'Medicine');
