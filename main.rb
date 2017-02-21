require_relative 'cuve'
require_relative 'employee'

employees = 4.times.map { Employee.new }

cuve1 = Cuve.new('First', 60)
cuve1.add_vine(40, employees.first(2))
cuve1.remove_vine(20, employees.first(3))

cuve2 = Cuve.new('Second', 50)
cuve2.add_vine(10, employees.first(2))


cuve1.transfer(cuve2, 10, employees)


p cuve1

p cuve2