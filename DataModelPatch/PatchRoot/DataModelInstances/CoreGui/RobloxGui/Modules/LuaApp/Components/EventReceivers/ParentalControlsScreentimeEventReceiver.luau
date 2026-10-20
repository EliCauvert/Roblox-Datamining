local CoreGui = game:GetService("CoreGui")
local Modules = CoreGui.RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceRegistry = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry
local UseRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useRegisterFocusNavigableSurface
local UseDeRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useDeRegisterFocusNavigableSurface
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ScreentimeRestrictionModalModule = require(Modules.LuaApp.Components.Screentime.ScreentimeRestrictionModal)
local RestrictionSourceModule = require(Modules.LuaApp.Models.UserModerationApi.RestrictionSource)
local ParentalControlsScreentimeEventReceiver = require(CorePackages.Packages.Roact).PureComponent:extend("ParentalControlsScreentimeEventReceiver")

function ParentalControlsScreentimeEventReceiver.render(p1)
	-- upvalues: CryoModule (copy), RestrictionSourceModule (copy), ReactRobloxModule (copy), ReactModule (copy), ScreentimeRestrictionModalModule (copy), CoreGui (copy)
	local UnionResult = CryoModule.Dictionary.union(p1.props.globalGuiInset, { top = p1.props.statusBarHeight })
	
	return if p1.props.restrictionDetail and p1.props.restrictionDetail.source == RestrictionSourceModule.Screentime then ReactRobloxModule.createPortal({
		ModerationOverlayWrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			ref = p1.props.forwardRef
		}, {
			ModerationOverlay = ReactModule.createElement(ScreentimeRestrictionModalModule, {
				screenSize = p1.props.screenSize,
				globalGuiInset = UnionResult
			})
		})
	}, CoreGui) else nil
end

local v1 = RoactServices.connect({
	networking = RoactNetworkingModule,
	guiService = AppGuiService
})((RoactRoduxModule.connect(function(p1, _)
	return {
		screenSize = p1.ScreenSize,
		restrictionDetail = p1.UserAccess and p1.UserAccess.restrictionDetail or nil,
		globalGuiInset = p1.GlobalGuiInset,
		statusBarHeight = p1.TopBar.statusBarHeight
	}
end)(ParentalControlsScreentimeEventReceiver)))
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function selectIsFocusable(p1): boolean
	-- upvalues: RestrictionSourceModule (copy)
	return p1.UserAccess and (p1.UserAccess.restrictionDetail and p1.UserAccess.restrictionDetail.source == RestrictionSourceModule.Screentime)
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), selectIsFocusable (copy), ReactModule (copy), UseRegisterFocusNavigableSurfaceFunction (copy), UseDeRegisterFocusNavigableSurfaceFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy), v1 (ref), CryoModule (copy)
	local UseSelectorResult = UseSelectorFunction(selectIsFocusable)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRegisterFocusNavigableSurfaceResult = UseRegisterFocusNavigableSurfaceFunction()
	local UseDeRegisterFocusNavigableSurfaceResult = UseDeRegisterFocusNavigableSurfaceFunction()
	local UseSelectorResult1 = UseStateResult and UseSelectorResult
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult1 (copy), UseRegisterFocusNavigableSurfaceResult (copy), FocusNavigableSurfaceIdentifierEnum (upval), UseStateResult (copy), UseDeRegisterFocusNavigableSurfaceResult (copy)
		if UseSelectorResult1 then
			UseRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.ModerationOverlay, UseStateResult)
		end
		return function()
			-- upvalues: UseDeRegisterFocusNavigableSurfaceResult (upval), FocusNavigableSurfaceIdentifierEnum (upval), UseStateResult (upval)
			UseDeRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.ModerationOverlay, UseStateResult)
		end
	end, {
		UseSelectorResult1,
		UseStateResult,
		UseRegisterFocusNavigableSurfaceResult,
		UseDeRegisterFocusNavigableSurfaceResult
	})
	
	return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		forwardRef = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, ReactModule.useCallback(function(p2)
			p2:cancel()
		end, {}), nil, (ReactFocusNavigationModule.useEventMap(config, UseStateResult2)))
	}))
end