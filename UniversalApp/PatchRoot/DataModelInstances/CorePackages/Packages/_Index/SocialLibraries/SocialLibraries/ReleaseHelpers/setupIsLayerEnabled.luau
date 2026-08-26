local getDeepValueModule = require(script.Parent.Parent.Dictionary.getDeepValue)

return function(p1)
	-- upvalues: getDeepValueModule (ref)
	return function(p2)
		-- upvalues: getDeepValueModule (copy), p1 (ref)
		return getDeepValueModule((p2 or {})[p1.layerName] or {}, p1.variantName) or false
	end
end