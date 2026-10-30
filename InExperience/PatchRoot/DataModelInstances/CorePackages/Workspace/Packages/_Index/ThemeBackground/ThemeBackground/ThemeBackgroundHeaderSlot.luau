local Parent = script.Parent
local ReactModule = require(Parent.Parent.React)
local ThemeBackgroundSliceModule = require(Parent.ThemeBackgroundSlice)
local UseThemeBackgroundModule = require(Parent.useThemeBackground)

return function()
	-- upvalues: UseThemeBackgroundModule (copy), ReactModule (copy), ThemeBackgroundSliceModule (copy)
	local UseThemeBackgroundModuleResult = UseThemeBackgroundModule()
	
	return if UseThemeBackgroundModuleResult then ReactModule.createElement(ThemeBackgroundSliceModule, {
		image = UseThemeBackgroundModuleResult.image,
		baseColor = UseThemeBackgroundModuleResult.baseColor
	}) else nil
end