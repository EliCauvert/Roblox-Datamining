local widgetPaddingSizing = game:DefineFastInt("WidgetPaddingSizing", 32)

return function(p1)
	-- upvalues: widgetPaddingSizing (ref)
	local XXLarge = p1.Padding.XXLarge
	
	return ({
		[32] = XXLarge,
		[24] = p1.Padding.XXLarge,
		[20] = p1.Padding.XLarge,
		[16] = p1.Padding.Large
	})[widgetPaddingSizing] or XXLarge
end