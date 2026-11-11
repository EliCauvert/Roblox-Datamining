local Parent = script.Parent
local Parent1 = Parent.Parent
local ConstantsModule = require(Parent1.Constants)
local ValidateThemeModule = require(Parent1.Validator.validateTheme)
local config = {
	[ConstantsModule.ThemeName.Dark:lower()] = require(Parent.DarkTheme),
	[ConstantsModule.ThemeName.Light:lower()] = require(Parent.LightTheme)
}

return function(Text: string)
	-- upvalues: config (copy), ConstantsModule (copy), ValidateThemeModule (copy)
	local Entry = if Text ~= nil and #Text > 0 then config[Text:lower()] else nil
	
	if Entry == nil then
		Entry = config[ConstantsModule.DefaultThemeName:lower()]
	end
	assert(ValidateThemeModule(Entry))
	
	return Entry
end