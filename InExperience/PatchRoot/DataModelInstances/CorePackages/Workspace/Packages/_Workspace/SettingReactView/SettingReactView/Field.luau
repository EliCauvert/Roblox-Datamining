local Parent = script.Parent
local Parent1 = Parent.Parent
local SettingEnum = require(Parent1.SettingsService).SettingEnum
local ReactModule = require(Parent1.React)
local Fields = Parent.Fields
local ToggleModule = require(Fields.Toggle)
local TextButtonModule = require(Fields.TextButton)

return function(p1) --[[ Line: 19 ]]
	-- upvalues: SettingEnum (copy), ReactModule (copy), ToggleModule (copy), TextButtonModule (copy)
	local Element = {}
	
	if p1.field_type == SettingEnum.Toggle then
		Element = ReactModule.createElement(ToggleModule, p1)
		
		return Element
	end
	if p1.field_type == SettingEnum.TextButton then
		Element = ReactModule.createElement(TextButtonModule, p1)
	end
	return Element
end