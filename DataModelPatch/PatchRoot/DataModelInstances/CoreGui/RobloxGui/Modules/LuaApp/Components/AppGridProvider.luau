local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local ResponsiveLayoutProvider = require(CorePackages.Packages.UIBlox).Core.Layout.Responsive.ResponsiveLayoutProvider
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local MakeGridSettingsConfigModule = require(Modules.LuaApp.Common.makeGridSettingsConfig)

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseAppPolicyModule (copy), UseSelectorFunction (copy), ReactModule (copy), MakeGridSettingsConfigModule (copy), ResponsiveLayoutProvider (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.useGridPageLayout()
	end)
	
	return ReactModule.createElement(ResponsiveLayoutProvider, {
		width = UseSelectorFunction(function(p2)
			return if p2.ScreenSize then p2.ScreenSize.X else nil
		end),
		config = ReactModule.useMemo(function()
			-- upvalues: UseAppPolicyModuleResult (copy), p1 (copy), MakeGridSettingsConfigModule (upval), UseDesignTokensResult (copy)
			return if UseAppPolicyModuleResult then p1.config or MakeGridSettingsConfigModule(UseDesignTokensResult) else {}
		end, {
			p1.config,
			UseAppPolicyModuleResult,
			UseDesignTokensResult
		})
	}, p1.children)
end