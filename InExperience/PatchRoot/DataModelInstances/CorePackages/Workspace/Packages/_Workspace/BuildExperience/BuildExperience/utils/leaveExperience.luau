local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")

return function(p0)
	-- upvalues: guiService (ref), runService (ref)
	guiService.SelectedCoreObject = nil
	runService.RenderStepped:Wait()
	runService.RenderStepped:Wait()
	
	if p0 then
		p0()
	end
	game:Shutdown()
end