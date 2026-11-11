local ContextTypes = require(script.Parent.Parent.Parent.Analytics.Enums).ContextTypes

return function(p1)
	-- upvalues: ContextTypes (copy)
	return if p1 == nil then nil else ContextTypes[p1.rawValue()].rawValue()
end