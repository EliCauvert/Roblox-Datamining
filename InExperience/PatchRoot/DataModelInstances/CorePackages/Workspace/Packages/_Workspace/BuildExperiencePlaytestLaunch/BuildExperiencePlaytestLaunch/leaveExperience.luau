local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")

return function(p1)
	-- upvalues: guiService (ref), runService (ref)
	guiService.SelectedCoreObject = nil
	runService.RenderStepped:Wait()
	runService.RenderStepped:Wait()
	
	if p1 then
		p1()
	end
	game:Shutdown()
end