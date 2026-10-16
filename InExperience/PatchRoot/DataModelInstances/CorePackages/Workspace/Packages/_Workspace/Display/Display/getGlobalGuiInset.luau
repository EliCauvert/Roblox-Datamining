local GuiService = game:GetService("GuiService")

return function() --[[ Line: 10 | Named "getGlobalGuiInset" ]]
	-- upvalues: GuiService (copy)
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	
	return {
		top = GuiInset.Y,
		left = GuiInset.X,
		bottom = GuiInset2.Y,
		right = GuiInset2.X
	}
end