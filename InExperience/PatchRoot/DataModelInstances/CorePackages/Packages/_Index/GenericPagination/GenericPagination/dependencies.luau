local packages = script:FindFirstAncestor("Packages")

return {
	t = require(packages.t),
	LinkedList = require(script.Parent.LinkedList),
	Promise = require(packages.Promise)
}