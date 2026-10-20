local GuiService = game:GetService("GuiService")
local PropertiesModule = require(script.Parent.Parent.Properties)

return function()
	-- upvalues: GuiService (copy), PropertiesModule (copy)
	return GuiService:GetScreenResolution().Magnitude * PropertiesModule.MaxSpeedRelative
end