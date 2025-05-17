### SQL_assignment_1
#Tables information
In this assignment it creates 7 tables:
1. users contatins:
   id, first_name, last_name, email;
   
2. orders contains:
   id, price, product_name, category_id (id from TABLE categories), order_id, user_id (id from TABLE users);

3. discounts contains:
   id, name, bonus (from 0 to 1);

4. users_bonuses contains:
   user_id (id from TABLE users), bonus_id (id from TABLE discounts), bonus_count (from 0 or NULL);

5-7. categories, new_categories, new_categories_2 each contains:
   id, name;

#Execution
1. Creating three CTE (common table expressions)
   united_categories:
      UNION and UNION ALL categories in one big

   ranked_discounts:
     *using united_categories
     JOIN all 5 tables and creates ranking which of discounts has more priority ('VIP' > 'premium' > 'standard')

   most_spendings_category:
     *using united_categories  
     SELECT users.id and on which category user spended more funds

2. For each unique user shows only first 5 users that spends over 1000 in total:
     their id,
     their name,
     the total amount of costs from all orders,
     category of products in which they spend the most,
     their available discount bonus.
   *sorting all by descending total spendings
  
