local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Workspace1 = game:GetService("Workspace")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local MainScreenResolution = VrCompatibilityModule.VRConstants.MainScreenResolution
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local VrEnvironmentScene = require(CorePackages.Workspace.Packages.VrSpatialUi).VrEnvironmentScene
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GetScreenBottomInsetModule = require(Modules.LuaApp.getScreenBottomInset)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local SetScreenSizeModule = require(Modules.LuaApp.Actions.SetScreenSize)
local SetDeviceOrientationModule = require(Modules.LuaApp.Actions.SetDeviceOrientation)
local SetFormFactorFunction = require(CorePackages.Workspace.Packages.FormFactor).Actions.SetFormFactor
local SetStatusBarHeightModule = require(Modules.LuaApp.Actions.SetStatusBarHeight)
local SetGlobalGuiInsetModule = require(Modules.LuaApp.Actions.SetGlobalGuiInset)
local SetGlobalContextMenuInsetModule = require(Modules.LuaApp.Actions.SetGlobalContextMenuInset)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppRunService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppRunService
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local GetVirtualResolutionScaleFunction = ResponsiveModule.getVirtualResolutionScale
local HardwareSafeAreaInsets = ResponsiveModule.HardwareSafeAreaInsets
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local GetFFlagSetOrientationWhenRequestedModule = require(Modules.LuaApp.Flags.GetFFlagSetOrientationWhenRequested)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local GetFFlagApplyResolutionScaleFunction = SharedFlagsModule.GetFFlagApplyResolutionScale
local GetFFlagLuaAppEnableTopBannerFunction = SharedFlagsModule.GetFFlagLuaAppEnableTopBanner
local GetFFlagLuaAppFixStudioNotchSupportModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local FFlagLuaAppFixStudioNotchSupportModule = SharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and GetFFlagLuaAppFixStudioNotchSupportModule()
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local FFlagEnableCoreContentTheme = SharedFlagsModule.FFlagEnableCoreContentTheme
local FFlagEnableCoreContentThemeVRScene = SharedFlagsModule.FFlagEnableCoreContentThemeVRScene
local FFlagUseSignalsForGlobalContextMenuInset = SharedFlagsModule.FFlagUseSignalsForGlobalContextMenuInset
local GetGlobalContextMenuInsetStoreModule = if FFlagUseSignalsForGlobalContextMenuInset then require(Modules.LuaApp.GlobalContextMenuInset.Stores.GetGlobalContextMenuInsetStore) else nil
local ViewportManager = RoactModule.Component:extend("ViewportManager")

function ViewportManager.init(p1)
	-- upvalues: DeviceOrientationMode (copy), GetFFlagSetOrientationWhenRequestedModule (copy), FormFactor (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy), HardwareSafeAreaInsets (copy), Workspace1 (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), MainScreenResolution (copy), GetFFlagApplyResolutionScaleFunction (copy), GetVirtualResolutionScaleFunction (copy), FFlagLuaAppFixStudioNotchSupportModule (copy), UserInputService (copy), GetScreenBottomInsetModule (copy), GetFFlagLuaAppEnableTopBannerFunction (copy), AppNavBarModule (copy), DisplayModule (copy)
	function p1.updateDeviceOrientation(Vector)
		-- upvalues: DeviceOrientationMode (upval), GetFFlagSetOrientationWhenRequestedModule (upval), p1 (copy)
		local Landscape = Vector.x > Vector.y and DeviceOrientationMode.Landscape or DeviceOrientationMode.Portrait
		
		if GetFFlagSetOrientationWhenRequestedModule() or p1.props.deviceOrientation ~= Landscape then
			p1.props.setDeviceOrientation(Landscape)
		end
	end
	
	function p1.updateDeviceFormFactor(Vector)
		-- upvalues: p1 (copy), FormFactor (upval)
		local WIDE = FormFactor.WIDE
		
		if p1.props.useWidthBasedRule then
			if Vector.X < 600 then
				WIDE = FormFactor.COMPACT
			end
		elseif Vector.X < Vector.Y then
			WIDE = FormFactor.COMPACT
		end
		p1.props.setFormFactor(WIDE)
	end
	
	function p1.updateViewport()
		-- upvalues: GetFFlagLuaAppFixStudioNotchSupportModule (upval), HardwareSafeAreaInsets (upval), Workspace1 (upval), p1 (copy), FFlagLuaAppForceVrAppPanelWidthRollout (upval), MainScreenResolution (upval), GetFFlagApplyResolutionScaleFunction (upval), GetVirtualResolutionScaleFunction (upval)
		local MainScreenResolution1 = if p1.props.use3DPanels then if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelWidthMultiplier then MainScreenResolution else Vector2.new(MainScreenResolution.X * p1.props.vrPanelWidthMultiplier, MainScreenResolution.Y) elseif GetFFlagLuaAppFixStudioNotchSupportModule() then HardwareSafeAreaInsets.fullscreenGui().AbsoluteSize else Workspace1.CurrentCamera.ViewportSize
		
		if GetFFlagApplyResolutionScaleFunction() then
			local VirtualResolutionScale = GetVirtualResolutionScaleFunction()
			local _Vector2 = Vector2.new(MainScreenResolution1.X / VirtualResolutionScale, MainScreenResolution1.Y / VirtualResolutionScale)
			p1.props.setScreenSize(_Vector2)
			p1.updateDeviceOrientation(_Vector2)
			p1.updateDeviceFormFactor(_Vector2)
			
			return
		elseif MainScreenResolution1.X > 1 and MainScreenResolution1.Y > 1 then
			p1.props.setScreenSize(MainScreenResolution1)
			p1.updateDeviceOrientation(MainScreenResolution1)
			p1.updateDeviceFormFactor(MainScreenResolution1)
		end
	end
	
	function p1.pointCameraTo3DPanels()
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			CurrentCamera.CFrame = CFrame.new(0, 5, 0)
		end
	end
	
	function p1.updateStatusBarHeight()
		-- upvalues: FFlagLuaAppFixStudioNotchSupportModule (upval), p1 (copy), UserInputService (upval)
		if FFlagLuaAppFixStudioNotchSupportModule then
			p1.props.setStatusBarHeight(0)
			
			return
		else
			p1.props.setStatusBarHeight(UserInputService.StatusBarSize.Y)
		end
	end
	
	function p1.updateGlobalGuiInset()
		-- upvalues: p1 (copy), GetScreenBottomInsetModule (upval), UserInputService (upval), GetFFlagLuaAppEnableTopBannerFunction (upval), AppNavBarModule (upval), DisplayModule (upval)
		local BottomBarVisible = p1.props.bottomBarVisible
		local AppTopBannerContentHeight = p1.props.appTopBannerContentHeight
		local AppTopBannerVisible = p1.props.appTopBannerVisible
		local ScreenBottomInsetModule = GetScreenBottomInsetModule()
		local NewNavBarSize = 0
		local X = UserInputService.RightBarSize.X
		local AppTopBannerContentHeight1 = if GetFFlagLuaAppEnableTopBannerFunction() and AppTopBannerVisible then AppTopBannerContentHeight else 0
		
		if BottomBarVisible and not p1.props.use3DPanels and p1.props.navBarPlacement == AppNavBarModule.Placement.Left then
			NewNavBarSize += p1.props.navBarSize
		end
		DisplayModule.GetDisplayStore().setGuiInset({
			left = NewNavBarSize,
			top = AppTopBannerContentHeight1,
			right = X,
			bottom = ScreenBottomInsetModule
		})
		p1.props.setGlobalContextMenuInset(0, 0, X, ScreenBottomInsetModule)
		p1.props.setGlobalGuiInset(NewNavBarSize, AppTopBannerContentHeight1, X, ScreenBottomInsetModule)
	end
	
	if GetFFlagLuaAppFixStudioNotchSupportModule() then
		p1.viewportSizeChangedConnnection = HardwareSafeAreaInsets.fullscreenGui():GetPropertyChangedSignal("AbsoluteSize"):Connect(p1.updateViewport)
	else
		p1.viewportSizeChangedConnnection = Workspace1.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(p1.updateViewport)
	end
	p1.updateViewport()
end

function ViewportManager.render(p1)
	-- upvalues: RoactModule (copy), ExternalEventConnectionModule (copy), UserInputService (copy)
	local GuiService = p1.props.guiService
	
	return RoactModule.createElement("Folder", {}, {
		statusBarSizeListener = RoactModule.createElement(ExternalEventConnectionModule, {
			event = UserInputService:GetPropertyChangedSignal("StatusBarSize"),
			callback = p1.updateStatusBarHeight
		}),
		bottomBarSizeListener = not _G.__TESTEZ_RUNNING_TEST__ and RoactModule.createElement(ExternalEventConnectionModule, {
			event = UserInputService:GetPropertyChangedSignal("BottomBarSize"),
			callback = p1.updateGlobalGuiInset
		}),
		rightBarSizeListener = not _G.__TESTEZ_RUNNING_TEST__ and RoactModule.createElement(ExternalEventConnectionModule, {
			event = UserInputService:GetPropertyChangedSignal("RightBarSize"),
			callback = p1.updateGlobalGuiInset
		}),
		safeZoneOffsetsListener = not _G.__TESTEZ_RUNNING_TEST__ and RoactModule.createElement(ExternalEventConnectionModule, {
			event = GuiService.SafeZoneOffsetsChanged,
			callback = p1.updateGlobalGuiInset
		})
	})
end

function ViewportManager.didMount(p1)
	-- upvalues: UserInputService (copy), FFlagEnableCoreContentTheme (copy), FFlagEnableCoreContentThemeVRScene (copy), VrEnvironmentScene (copy)
	UserInputService.LegacyInputEventsEnabled = false
	p1.updateStatusBarHeight()
	p1.updateGlobalGuiInset()
	
	if p1.props.use3DPanels then
		p1.pointCameraTo3DPanels()
		
		if FFlagEnableCoreContentTheme and FFlagEnableCoreContentThemeVRScene then
			VrEnvironmentScene.initialize()
		end
	end
end

function ViewportManager.willUnmount(p1)
	-- upvalues: FFlagEnableCoreContentTheme (copy), FFlagEnableCoreContentThemeVRScene (copy), VrEnvironmentScene (copy)
	if p1.viewportSizeChangedConnnection then
		p1.viewportSizeChangedConnnection:Disconnect()
		p1.viewportSizeChangedConnnection = nil
	end
	if FFlagEnableCoreContentTheme and FFlagEnableCoreContentThemeVRScene then
		VrEnvironmentScene.deinitialize()
	end
end

function ViewportManager.didUpdate(p1, p2)
	-- upvalues: GetFFlagLuaAppEnableTopBannerFunction (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy), FFlagEnableCoreContentTheme (copy), FFlagEnableCoreContentThemeVRScene (copy), VrEnvironmentScene (copy)
	if p1.props.use3DPanels and (p2.vrPanelWidthMultiplier ~= p1.props.vrPanelWidthMultiplier or p2.use3DPanels ~= p1.props.use3DPanels) then
		p1.updateViewport()
	end
	if p1.props.bottomBarVisible ~= p2.bottomBarVisible then
		p1.updateGlobalGuiInset()
	end
	if GetFFlagLuaAppEnableTopBannerFunction() and (p1.props.appTopBannerVisible ~= p2.appTopBannerVisible or p1.props.appTopBannerContentHeight ~= p2.appTopBannerContentHeight) then
		p1.updateGlobalGuiInset()
	end
	if p1.props.use3DPanels ~= p2.use3DPanels or p1.props.navBarPlacement ~= p2.navBarPlacement or p1.props.navBarSize ~= p2.navBarSize then
		p1.updateGlobalGuiInset()
	end
	if not GetFFlagLuaAppFixStudioNotchSupportModule() then
		local GlobalGuiInset = p1.props.globalGuiInset
		
		if GlobalGuiInset ~= p2.globalGuiInset then
			p1.props.guiService:SetGlobalGuiInset(GlobalGuiInset.left, GlobalGuiInset.top, GlobalGuiInset.right, GlobalGuiInset.bottom)
		end
	end
	local HasScreenGuiBlur = p1.props.hasScreenGuiBlur
	
	if HasScreenGuiBlur ~= p2.hasScreenGuiBlur then
		p1.props.runService:SetRobloxGuiFocused(HasScreenGuiBlur)
	end
	if p1.props.use3DPanels and not p2.use3DPanels then
		p1.pointCameraTo3DPanels()
		
		if FFlagEnableCoreContentTheme and FFlagEnableCoreContentThemeVRScene then
			VrEnvironmentScene.initialize()
			
			return
		end
	elseif FFlagEnableCoreContentTheme and FFlagEnableCoreContentThemeVRScene and not p1.props.use3DPanels and p2.use3DPanels then
		VrEnvironmentScene.deinitialize()
	end
end

local v1 = RoactServices.connect({ guiService = AppGuiService, runService = AppRunService })((RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagUseSignalsForGlobalContextMenuInset (copy), GetFFlagLuaAppEnableTopBannerFunction (copy)
	return {
		statusBarHeight = p1.TopBar.statusBarHeight,
		deviceOrientation = p1.DeviceOrientation,
		globalGuiInset = p1.GlobalGuiInset,
		globalContextMenuInset = if FFlagUseSignalsForGlobalContextMenuInset then nil else p1.GlobalContextMenuInset,
		bottomBarVisible = p1.TabBarVisible,
		hasScreenGuiBlur = p1.ScreenGuiBlur.hasBlur,
		appTopBannerContentHeight = if GetFFlagLuaAppEnableTopBannerFunction() then p1.AppTopBanner.appTopBannerContentHeight else 0,
		appTopBannerVisible = if GetFFlagLuaAppEnableTopBannerFunction() then p1.AppTopBanner.expanded and not p1.AppTopBanner.isDisabled else false
	}
end, function(Callback)
	-- upvalues: SetScreenSizeModule (copy), SetDeviceOrientationModule (copy), SetFormFactorFunction (copy), SetStatusBarHeightModule (copy), SetGlobalGuiInsetModule (copy), FFlagUseSignalsForGlobalContextMenuInset (copy), GetGlobalContextMenuInsetStoreModule (copy), SetGlobalContextMenuInsetModule (copy)
	return {
		setScreenSize = function(p1)
			-- upvalues: Callback (copy), SetScreenSizeModule (upval)
			Callback(SetScreenSizeModule(p1))
		end,
		setDeviceOrientation = function(p1)
			-- upvalues: Callback (copy), SetDeviceOrientationModule (upval)
			Callback(SetDeviceOrientationModule(p1))
		end,
		setFormFactor = function(p1)
			-- upvalues: Callback (copy), SetFormFactorFunction (upval)
			Callback(SetFormFactorFunction(p1))
		end,
		setStatusBarHeight = function(p1)
			-- upvalues: Callback (copy), SetStatusBarHeightModule (upval)
			Callback(SetStatusBarHeightModule(p1))
		end,
		setGlobalGuiInset = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), SetGlobalGuiInsetModule (upval)
			return Callback(SetGlobalGuiInsetModule(p1, p2, p3, p4))
		end,
		setGlobalContextMenuInset = function(p1, p2, p3, p4)
			-- upvalues: FFlagUseSignalsForGlobalContextMenuInset (upval), GetGlobalContextMenuInsetStoreModule (upval), Callback (copy), SetGlobalContextMenuInsetModule (upval)
			return if FFlagUseSignalsForGlobalContextMenuInset then GetGlobalContextMenuInsetStoreModule(false).setGlobalContextMenuInset(p1, p2, p3, p4) else Callback(SetGlobalContextMenuInsetModule(p1, p2, p3, p4))
		end
	}
end)(ViewportManager)))

if not FFlagLuaAppForceVrAppPanelWidthRollout and GetFFlagVRPanelWidthIXPEnabledFunction() then
	v1 = IxpUtilsModule.connectTestVariables({
		vrPanelWidthMultiplier = VRPanelWidthIXP.VrAppPanelWidthMultiplier,
		vrPanelCurvature = VRPanelWidthIXP.VrAppPanelCurvature
	})(v1)
end
local v2 = RoactAppPolicy.connect(function(p1, _)
	return { useWidthBasedRule = p1.getUseWidthBasedFormFactorRule() }
end)(v1)

return function(p1)
	-- upvalues: UseIsSpatialFunction (copy), UseNavBarPlacementFunction (copy), UseNavBarSizeFunction (copy), CryoModule (copy), RoactModule (copy), v2 (ref)
	return RoactModule.createElement(v2, (CryoModule.Dictionary.join(p1, {
		use3DPanels = UseIsSpatialFunction(),
		navBarPlacement = UseNavBarPlacementFunction(),
		navBarSize = UseNavBarSizeFunction()
	})))
end