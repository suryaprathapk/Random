With Default_cost_table as (
  Select
    c1.project, min(c1.cost) as default_cost
  from
    cost_table c1
  where
    cost is not Null
    GROUP BY c1.project
)
Select
  c.project,
  c.quarter,
  nvl(c.cost, df.default_cost),
  attr.*
From
  cost_table c
  left join attr_table attr on (c.project = attr.project)
  join default_cost_table df on (c.project = df.project)
Order by
  c.project