# README

App has 4 models: Customer, Restaurant, Table, Reservation

To book a table first you have to create Restaurant

```
restaurant = Restaurant.create(name:"Dominos", :opens_at => "9:00", :closes_at => "19:00")
```

Than you have to add tables to restaurant

```
(0..9).each do |i|
  restaurant.tables.create
end
```

Also you have to create Customer to be able to book a table

```
c = Customer.create
```

Finally to book a table create Reservation
Grab table:  

```
t = Table.first
```

```
reservation = Reservation.create(:customer => c, :table_id => t.id, :starts_at => Time.now.beginning_of_hour + 1.hour, :ends_at => Time.now.beginning_of_hour + 2.hours)
```
