return function(Label, p1) --[[ Line: 13 | Named "getMessageTextSize" ]]
	return if Label == nil then nil elseif p1 then Label.SpatialPanelTextSize else Label.TextSize
end