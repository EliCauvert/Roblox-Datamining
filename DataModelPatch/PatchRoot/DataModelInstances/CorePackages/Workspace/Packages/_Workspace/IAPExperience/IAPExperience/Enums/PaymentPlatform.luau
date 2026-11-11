local Parent = script.Parent.Parent
local config = {
	None = "None",
	Apple = "Apple",
	Google = "Google",
	Amazon = "Amazon",
	Xbox = "Xbox",
	UWP = "UWP",
	Web = "Web",
	Maquettes = "Maquettes",
	Palisades = "Palisades"
}
local v1 = require(Parent.Parent.enumerate)(script.Name, config)
require(Parent.Utility.addRawValueMethodToEnum)(v1, config)

return v1