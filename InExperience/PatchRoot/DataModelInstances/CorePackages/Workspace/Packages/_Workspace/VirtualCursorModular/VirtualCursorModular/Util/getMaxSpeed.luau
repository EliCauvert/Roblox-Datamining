local guiService = game:GetService("GuiService")
local propertiesModule = require(script.Parent.Parent.Properties)

return function()
	-- upvalues: guiService (ref), propertiesModule (ref)
	return guiService:GetScreenResolution().Magnitude * propertiesModule.MaxSpeedRelative
end