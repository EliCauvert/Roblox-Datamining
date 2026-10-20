local CorePackages = game:GetService("CorePackages")
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), DashModule (copy)
	return function(p2)
		-- upvalues: UseDesignTokensFunction (upval), UseUiModeInfoFunction (upval), UiMode (upval), FFlagEnableLeftNavOnConsole (upval), FFlagRenameDeprecatedUIBloxTokens (upval), ReactModule (upval), p1 (copy), DashModule (upval)
		return ReactModule.createElement(p1, DashModule.join(p2, {
			designTokens = UseDesignTokensFunction(function(p3)
				-- upvalues: UseUiModeInfoFunction (upval), UiMode (upval), FFlagEnableLeftNavOnConsole (upval), FFlagRenameDeprecatedUIBloxTokens (upval)
				local NoFFlagEnableLeftNavOnConsole: boolean = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole
				local Size1000 = if NoFFlagEnableLeftNavOnConsole then if FFlagRenameDeprecatedUIBloxTokens then p3.Size.Size_1000 else p3.Global.Space_500 else 0
				local Size1600 = if NoFFlagEnableLeftNavOnConsole then if FFlagRenameDeprecatedUIBloxTokens then p3.Size.Size_1600 else p3.Global.Space_800 else 0
				
				return {
					topPadding = Size1000,
					leftPadding = Size1600,
					bottomPadding = if NoFFlagEnableLeftNavOnConsole then -(Size1000 + (if FFlagRenameDeprecatedUIBloxTokens then p3.Size.Size_1000 else p3.Global.Space_500)) else 0,
					rightPadding = if NoFFlagEnableLeftNavOnConsole then -2 * Size1600 else 0
				}
			end)
		}))
	end
end