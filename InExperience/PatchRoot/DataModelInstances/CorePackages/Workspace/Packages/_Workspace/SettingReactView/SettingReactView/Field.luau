local parent = script.Parent
local parent_1 = parent.Parent
local settingEnum = require(parent_1.SettingsService).SettingEnum
local reactModule = require(parent_1.React)
local fields = parent.Fields
local toggleModule = require(fields.Toggle)
local textButtonModule = require(fields.TextButton)

return function(p1)
	-- upvalues: settingEnum (ref), reactModule (ref), toggleModule (ref), textButtonModule (ref)
	local t = {}
	
	if p1.field_type == settingEnum.Toggle then
		t = reactModule.createElement(toggleModule, p1)
		
		return t
	elseif p1.field_type == settingEnum.TextButton then
		t = reactModule.createElement(textButtonModule, p1)
	end
	return t
end