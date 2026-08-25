local guiService = game:GetService("GuiService")

return function()
	-- upvalues: guiService (ref)
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	
	return {
		top = guiInset.Y,
		left = guiInset.X,
		bottom = guiInset_1.Y,
		right = guiInset_1.X
	}
end