local GetDeepValueModule = require(script.Parent.Parent.Dictionary.getDeepValue)

return function(p1)
	-- upvalues: GetDeepValueModule (copy)
	return function(p2)
		-- upvalues: GetDeepValueModule (upval), p1 (copy)
		return GetDeepValueModule((p2 or {})[p1.layerName] or {}, p1.variantName) or false
	end
end