local widgetPaddingSizing = game:DefineFastInt("WidgetPaddingSizing", 32)

return function(p0) --[[ line: 24 | named "resolveWidgetListItemBottomPaddingPx" ]]
	-- upvalues: widgetPaddingSizing (ref)
	local XXLarge = p0.Padding.XXLarge
	
	return ({
		[32] = XXLarge,
		[24] = p0.Padding.XXLarge,
		[20] = p0.Padding.XLarge,
		[16] = p0.Padding.Large
	})[widgetPaddingSizing] or XXLarge
end