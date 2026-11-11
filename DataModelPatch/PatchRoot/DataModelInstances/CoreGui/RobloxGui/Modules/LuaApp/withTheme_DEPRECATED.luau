local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local ThemeContextDEPRECATEDModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ThemeContext_DEPRECATED)

return function(p1)
	-- upvalues: RoactModule (copy), ThemeContextDEPRECATEDModule (copy), CryoModule (copy)
	return function(p2)
		-- upvalues: RoactModule (upval), ThemeContextDEPRECATEDModule (upval), p1 (copy), CryoModule (upval)
		return RoactModule.createElement(ThemeContextDEPRECATEDModule.Consumer, {
			render = function(AppTheme)
				-- upvalues: RoactModule (upval), p1 (upval), CryoModule (upval), p2 (copy)
				return RoactModule.createElement(p1, CryoModule.Dictionary.join(p2, { appTheme = AppTheme }))
			end
		})
	end
end