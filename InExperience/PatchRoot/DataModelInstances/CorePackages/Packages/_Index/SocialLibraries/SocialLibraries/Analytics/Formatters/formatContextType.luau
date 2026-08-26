local contextTypes = require(script.Parent.Parent.Parent.Analytics.Enums).ContextTypes

return function(p1)
	-- upvalues: contextTypes (ref)
	return if p1 == nil then nil else contextTypes[p1.rawValue()].rawValue()
end