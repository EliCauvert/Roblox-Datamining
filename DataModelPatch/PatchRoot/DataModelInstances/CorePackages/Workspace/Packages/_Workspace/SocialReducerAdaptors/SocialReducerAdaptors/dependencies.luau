local Parent = script.Parent.Parent

return {
	Players = game:GetService("Players"),
	llama = require(Parent.LuaSocialLibrariesDeps).llama,
	Rodux = require(Parent.Rodux)
}