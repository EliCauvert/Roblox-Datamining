local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AppTopBanner = require(CorePackages.Workspace.Packages.AppTopBanner).AppTopBanner
local AppTopBannerType = require(CorePackages.Workspace.Packages.AppTopBanner).Enums.AppTopBannerType
local DisableAppTopBannerFunction = require(CorePackages.Workspace.Packages.AppTopBanner).Actions.DisableAppTopBanner
local Modules = CoreGui.RobloxGui.Modules
local UsePageNavigationOptionsModule = require(Modules.LuaApp.Hooks.usePageNavigationOptions)
local GetFFlagLuaAppFixStudioNotchSupportModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local ContentMaps = {
	[AppTopBannerType.None] = nil,
	[AppTopBannerType.ActiveSquad] = require(CorePackages.Workspace.Packages.Squads.SquadTopBanner)
}

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), UsePageNavigationOptionsModule (copy), ReactModule (copy), DisableAppTopBannerFunction (copy), ReactRobloxModule (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy), AppTopBanner (copy), ContentMaps (copy), CoreGui (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.TopBar.statusBarHeight
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.GlobalGuiInset
	end)
	local UsePageNavigationOptionsModuleResult = UsePageNavigationOptionsModule()
	ReactModule.useEffect(function()
		-- upvalues: UsePageNavigationOptionsModuleResult (copy), UseDispatchResult (copy), DisableAppTopBannerFunction (upval)
		local IsDisableAppTopBanner: boolean = if UsePageNavigationOptionsModuleResult then UsePageNavigationOptionsModuleResult.disableAppTopBanner == true else false
		UseDispatchResult(DisableAppTopBannerFunction((if UsePageNavigationOptionsModuleResult and UsePageNavigationOptionsModuleResult.rootPageOptions then UsePageNavigationOptionsModuleResult.rootPageOptions.disableAppTopBanner == true else false) or IsDisableAppTopBanner))
	end, { UsePageNavigationOptionsModuleResult })
	
	return ReactRobloxModule.createPortal({
		AppTopBannerScreen = ReactModule.createElement("ScreenGui", {
			Enabled = true,
			DisplayOrder = p1.displayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = if GetFFlagLuaAppFixStudioNotchSupportModule() then Enum.ScreenInsets.None else nil
		}, {
			AppTopBannerContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, if GetFFlagLuaAppFixStudioNotchSupportModule() then -UseSelectorResult1.left else 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, if GetFFlagLuaAppFixStudioNotchSupportModule() then UseSelectorResult1.left else 0, 0, if GetFFlagLuaAppFixStudioNotchSupportModule() then 0 else -UseSelectorResult1.top)
			}, {
				AppTopBanner = ReactModule.createElement(AppTopBanner, {
					contentMaps = ContentMaps,
					deviceStatusBarHeight = UseSelectorResult
				})
			})
		})
	}, CoreGui)
end)