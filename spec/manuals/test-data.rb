a = Account.new
a.id= 1,
a.name= "Conta de teste",
a.phone= "55 11 3224-4000",
a.active= true,
a.created_at= "2022-02-27T00=51=48.584Z",
a.updated_at= "2022-02-27T00=51=48.584Z"
a.save

u = User.new
u.id = 1,
u.uuid= "ce3f3c01-1069-4c96-a474-2e6d570871e4",
u.first_name= "André",
u.last_name= "Terceiro",
u.email= "andre@terceiro.com.br",
u.phone= "11 98289-9112",
u.confirmed_at= "-4712-01-01T00=00=00.000Z",
u.account_id= 1,
u.created_at= "-4712-01-01T00=00=00.000Z",
u.updated_at= "-4712-01-01T00=00=00.000Z"
u.save
