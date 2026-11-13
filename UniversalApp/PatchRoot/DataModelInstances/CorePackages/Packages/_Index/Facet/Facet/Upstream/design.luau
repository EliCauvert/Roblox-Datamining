local LibraryModule = require("@self/library")
local _ = require("@self/types")

return {
	library = LibraryModule.create,
	controls = LibraryModule.controls,
	seeds = LibraryModule.seeds,
	motion = require("@self/motion").motion
}