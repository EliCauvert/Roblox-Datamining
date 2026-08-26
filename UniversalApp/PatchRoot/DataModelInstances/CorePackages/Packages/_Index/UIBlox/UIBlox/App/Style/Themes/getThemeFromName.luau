local parent = script.Parent
local parent_1 = parent.Parent
local constantsModule = require(parent_1.Constants)
local validateThemeModule = require(parent_1.Validator.validateTheme)
local t = {
	[constantsModule.ThemeName.Dark:lower()] = require(parent.DarkTheme),
	[constantsModule.ThemeName.Light:lower()] = require(parent.LightTheme)
}

return function(p1)
	-- upvalues: t (ref), constantsModule (ref), validateThemeModule (ref)
	local var1 = if not (p1 == nil or #p1 <= 0) then t[p1:lower()] else nil
	
	if var1 == nil then
		var1 = t[constantsModule.DefaultThemeName:lower()]
	end
	assert(validateThemeModule(var1))
	
	return var1
end