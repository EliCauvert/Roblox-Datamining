local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")

return function(Callback: () -> ()) --[[ Line: 10 | Named "leaveExperience" ]]
	-- upvalues: GuiService (copy), RunService (copy)
	GuiService.SelectedCoreObject = nil
	RunService.RenderStepped:Wait()
	RunService.RenderStepped:Wait()
	
	if Callback then
		Callback()
	end
	game:Shutdown()
end