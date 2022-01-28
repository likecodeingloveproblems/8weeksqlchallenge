select members.customer_id, sum(menu.price)
from dannys_diner.members
join dannys_diner.sales
on dannys_diner.sales.customer_id = dannys_diner.members.customer_id
join dannys_diner.menu
on dannys_diner.menu.product_id = dannys_diner.sales.product_id
group by members.customer_id;