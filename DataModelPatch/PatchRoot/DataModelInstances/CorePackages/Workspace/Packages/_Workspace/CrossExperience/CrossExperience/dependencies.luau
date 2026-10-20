local Parent = script:FindFirstAncestor("CrossExperience").Parent

return {
	Promise = require(Parent.Promise),
	Rodux = require(Parent.Rodux),
	t = require(Parent.t),
	Cryo = require(Parent.Cryo),
	Lumberyak = require(Parent.Lumberyak),
	SharedFlags = require(Parent.SharedFlags)
}