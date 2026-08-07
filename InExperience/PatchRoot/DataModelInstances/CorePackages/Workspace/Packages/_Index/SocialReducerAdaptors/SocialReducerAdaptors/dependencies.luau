local parent = script.Parent.Parent

return {
	Players = game:GetService("Players"),
	llama = require(parent.LuaSocialLibrariesDeps).llama,
	Rodux = require(parent.Rodux)
}