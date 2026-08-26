local t = {
	getter = function(p1)
		return { type = "getter", callback = p1 }
	end,
	consistentSize = function(p1)
		return { type = "consistentSize", size = p1 }
	end,
	consistentUDim2 = function(p1)
		return { type = "consistentUDim2", udim2 = p1 }
	end
}

function t.withSpacing(p1, p2)
	-- upvalues: t (ref)
	assert(p1.type ~= "getter", "withSpacing does not support getter. Instead, include your padding as part of your returned position.")
	
	return if p1.type == "spaced" then t.withSpacing(p1.inner, p2) else { type = "spaced", spacing = p2, inner = p1 }
end

return t