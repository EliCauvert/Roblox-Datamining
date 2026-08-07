local parent = script.Parent
local parent_1 = parent.Parent

return {
	t = require(parent_1.t),
	LinkedList = require(parent.LinkedList),
	Promise = require(parent_1.Promise)
}