local PlaceholderTypeModule = require(script.Parent.Parent.Enums.PlaceholderType)

return function(p1): boolean
	-- upvalues: PlaceholderTypeModule (copy)
	return if PlaceholderTypeModule[p1] then true else false
end