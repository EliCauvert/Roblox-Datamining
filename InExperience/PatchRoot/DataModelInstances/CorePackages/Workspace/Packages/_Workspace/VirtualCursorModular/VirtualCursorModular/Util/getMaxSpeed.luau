local guiService = game:GetService("GuiService")
local propertiesModule = require(script.Parent.Parent.Properties)

return function() --[[ line: 8 | named "getMaxSpeed" ]]
	-- upvalues: guiService (ref), propertiesModule (ref)
	return guiService:GetScreenResolution().Magnitude * propertiesModule.MaxSpeedRelative
end