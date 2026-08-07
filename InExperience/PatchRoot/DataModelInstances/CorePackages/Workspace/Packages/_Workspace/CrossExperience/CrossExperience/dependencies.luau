local parent = script:FindFirstAncestor("CrossExperience").Parent

return {
	Promise = require(parent.Promise),
	Rodux = require(parent.Rodux),
	t = require(parent.t),
	Cryo = require(parent.Cryo),
	Lumberyak = require(parent.Lumberyak),
	SharedFlags = require(parent.SharedFlags)
}