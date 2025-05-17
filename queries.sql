use a01;

select * from users;

select * from orders;

select * from discounts;

select * from users_bonuses;

select * from categories;

select * from new_categories;

with united_categories as (
	select * from categories
	union
	select * from new_categories
	union all 
	select * from new_categories_2
),
ranked_discounts as (
	select u.id, u.first_name, 
		o.price, o.product_name, 
		uc.name as category_name, 
		d.name as discount_name, d.id as discount_id, 
		row_number() over (partition by u.id, o.id order by d.id desc) as ranking_discounts
	from users u
	left join orders o on u.id = o.user_id
	left join united_categories uc on o.category_id = uc.id
	left join users_bonuses ub on u.id = ub.user_id
	left join discounts d on ub.bonus_id = d.id
),
most_spendings_category as (
	select 
		u.id, 
		uc.name as category_name,
		row_number() over (partition by u.id order by sum(o.price) desc) as ranking_categories
	from users u
	left join orders o on o.user_id = u.id
	left join united_categories uc on o.category_id = uc.id
	group by id, category_name
)
select rd.id, rd.first_name, 
	sum(rd.price) as total_spendings, 
	count(rd.product_name) as products_count,
	msc.category_name as most_spend_category,
	rd.discount_name
from ranked_discounts rd
left join most_spendings_category msc
on rd.id = msc.id and msc.ranking_categories = 1
where ranking_discounts = 1
group by rd.id, rd.first_name, rd.discount_name, msc.category_name
having sum(rd.price) > 1000
order by total_spendings desc
limit 5;



with most_spendings_category as (
	select 
		u.id, 
		c.name as category_name,
		row_number() over (partition by u.id order by sum(o.price) desc) as ranking
	from users u
	left join orders o on o.user_id = u.id
	left join categories c on o.category_id = c.id
	group by id, category_name
)
select id, category_name
from most_spendings_category
where ranking = 1
order by id;


