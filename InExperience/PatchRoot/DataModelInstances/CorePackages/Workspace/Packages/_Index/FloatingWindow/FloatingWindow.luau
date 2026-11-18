local _ = require(script.Types)

return {
	Behaviors = require(script.Behaviors),
	Corner = require(script.Corner),
	Edge = require(script.Edge),
	PlacementKind = require(script.PlacementKind),
	Window = require(script.Window),
	["jest.config"] = script["jest.config"]
}