local GuiService = game:GetService("GuiService")
local PropertiesModule = require(script.Parent.Parent.Properties)

return function() --[[ Line: 8 | Named "getMaxSpeed" ]]
	-- upvalues: GuiService (copy), PropertiesModule (copy)
	return GuiService:GetScreenResolution().Magnitude * PropertiesModule.MaxSpeedRelative
end