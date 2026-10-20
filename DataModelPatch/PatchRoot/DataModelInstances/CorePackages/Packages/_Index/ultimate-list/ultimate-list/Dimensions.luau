local DimensionsModule = {
	getter = function(Callback)
		return { type = "getter", callback = Callback }
	end,
	consistentSize = function(Size)
		return { type = "consistentSize", size = Size }
	end,
	consistentUDim2 = function(Udim2)
		return { type = "consistentUDim2", udim2 = Udim2 }
	end
}

function DimensionsModule.withSpacing(Inner, Spacing)
	-- upvalues: DimensionsModule (copy)
	assert(Inner.type ~= "getter", "withSpacing does not support getter. Instead, include your padding as part of your returned position.")
	
	return if Inner.type == "spaced" then DimensionsModule.withSpacing(Inner.inner, Spacing) else { type = "spaced", spacing = Spacing, inner = Inner }
end

return DimensionsModule