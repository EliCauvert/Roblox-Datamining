local Parent = script.Parent
local Parent1 = Parent.Parent

return {
	t = require(Parent1.t),
	LinkedList = require(Parent.LinkedList),
	Promise = require(Parent1.Promise)
}