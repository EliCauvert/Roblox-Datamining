local t = {
	getter = function(p0)
		return { type = "getter", callback = p0 }
	end,
	consistentSize = function(p1)
		return { type = "consistentSize", size = p1 }
	end,
	consistentUDim2 = function(p2)
		return { type = "consistentUDim2", udim2 = p2 }
	end
}

function t.withSpacing(p3, p4)
	-- upvalues: t (ref)
	assert(p3.type ~= "getter", "withSpacing does not support getter. Instead, include your padding as part of your returned position.")
	
	return if p3.type == "spaced" then t.withSpacing(p3.inner, p4) else { type = "spaced", spacing = p4, inner = p3 }
end

return t