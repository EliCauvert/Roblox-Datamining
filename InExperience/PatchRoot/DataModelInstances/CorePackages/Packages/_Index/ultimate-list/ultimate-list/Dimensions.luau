local DimensionsModule = {
	getter = function(Callback) --[[ Line: 27 ]]
		return { type = "getter", callback = Callback }
	end,
	consistentSize = function(Size) --[[ Line: 34 ]]
		return { type = "consistentSize", size = Size }
	end,
	consistentUDim2 = function(Udim2) --[[ Line: 41 ]]
		return { type = "consistentUDim2", udim2 = Udim2 }
	end
}

function DimensionsModule.withSpacing(Inner, Spacing) --[[ Line: 48 ]]
	-- upvalues: DimensionsModule (copy)
	assert(Inner.type ~= "getter", "withSpacing does not support getter. Instead, include your padding as part of your returned position.")
	
	return if Inner.type == "spaced" then DimensionsModule.withSpacing(Inner.inner, Spacing) else { type = "spaced", spacing = Spacing, inner = Inner }
end

return DimensionsModule