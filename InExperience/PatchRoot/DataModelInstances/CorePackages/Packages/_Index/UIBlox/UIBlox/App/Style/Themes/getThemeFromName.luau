local parent = script.Parent
local parent_1 = parent.Parent
local constantsModule = require(parent_1.Constants)
local validateThemeModule = require(parent_1.Validator.validateTheme)
local t = {
	[constantsModule.ThemeName.Dark:lower()] = require(parent.DarkTheme),
	[constantsModule.ThemeName.Light:lower()] = require(parent.LightTheme)
}

return function(p0)
	-- upvalues: t (ref), constantsModule (ref), validateThemeModule (ref)
	local var3 = if not (p0 == nil or #p0 <= 0) then t[p0:lower()] else nil
	
	if var3 == nil then
		var3 = t[constantsModule.DefaultThemeName:lower()]
	end
	assert(validateThemeModule(var3))
	
	return var3
end