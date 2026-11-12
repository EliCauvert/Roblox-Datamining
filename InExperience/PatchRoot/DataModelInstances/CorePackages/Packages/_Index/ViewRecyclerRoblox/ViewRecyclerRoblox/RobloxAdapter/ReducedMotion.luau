local GuiService = game:GetService("GuiService")

return {
	isEnabled = function()
		-- upvalues: GuiService (copy)
		return GuiService.ReducedMotionEnabled
	end
}