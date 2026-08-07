local contextTypes = require(script.Parent.Parent.Parent.Analytics.Enums).ContextTypes

return function(p0) --[[ line: 6 ]]
	-- upvalues: contextTypes (ref)
	return if p0 == nil then nil else contextTypes[p0.rawValue()].rawValue()
end