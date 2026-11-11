local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local LuaApp = Modules.LuaApp
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRReadyWrapper = VrCompatibilityModule.VRReadyWrapper
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local FitChildrenModule = require(LuaApp.FitChildren)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local FramePopOutModule = require(LuaApp.Components.FramePopOut)
local FramePopupModule = require(LuaApp.Components.FramePopup)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FlyoutScrollAwayControl = if FFlagEnableFlyoutSidePanelModule then require(CorePackages.Workspace.Packages.FlyoutSidePanel).FlyoutScrollAwayControl else nil
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local FFlagUseSignalsForGlobalContextMenuInset = SharedFlagsModule.FFlagUseSignalsForGlobalContextMenuInset
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetGlobalContextMenuInsetStoreModule = if FFlagUseSignalsForGlobalContextMenuInset then require(Modules.LuaApp.GlobalContextMenuInset.Stores.GetGlobalContextMenuInsetStore) else nil
local ContextualListMenu = RoactModule.PureComponent:extend("ContextualListMenu")
ContextualListMenu.defaultProps = {
	menuWidth = ConstantsModule.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH
}

function ContextualListMenu.init(p1)
	-- upvalues: FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	p1.focusEventHandlers = {
		[FocusNavigationEventNameEnum.NavigateBack] = {
			handler = InputHandlersModule.onRelease(function(p2)
				-- upvalues: p1 (copy)
				local CallbackCancelFunction: () -> () = p1.props.callbackCancel
				
				if CallbackCancelFunction ~= nil then
					CallbackCancelFunction()
					p2:cancel()
				end
			end)
		}
	}
end

function ContextualListMenu.render(p1)
	-- upvalues: RoactModule (copy), FormFactor (copy), FitChildrenModule (copy), FramePopOutModule (copy), FramePopupModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), GetSafeAreaSizeFunction (copy), WithStyleFunction (copy), CoreGui (copy), VRReadyWrapper (copy), ConstantsModule (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), VRConstants (copy), GetFFlagVRPanelWidthIXPEnabledFunction (copy)
	local Prop = p1.props[RoactModule.Children] or {}
	local CallbackCancel = p1.props.callbackCancel
	local ScreenSize = p1.props.screenSize
	local GlobalContextMenuInset = p1.props.globalContextMenuInset
	local MenuWidth = p1.props.menuWidth
	local ScreenShape = p1.props.screenShape
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	
	if ScreenSize.X <= 0 or ScreenSize.Y <= 0 then
		return nil
	else
		Prop.Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		local Element = RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			fitAxis = FitChildrenModule.FitAxis.Height,
			Size = UDim2.new(1, 0, 0, 0)
		}, Prop)
		local Element1 = nil
		Element1 = RoactModule.createElement(FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			customEventHandlers = p1.focusEventHandlers
		}, {
			MenuContents = if IsFormFactorMatch then RoactModule.createElement(FramePopOutModule, {
				itemWidth = MenuWidth,
				onCancel = CallbackCancel,
				parentShape = ScreenShape
			}, { Content = Element }) else RoactModule.createElement(FramePopupModule, { onCancel = CallbackCancel }, { Content = Element })
		})
		local SafeAreaSize = GetSafeAreaSizeFunction(ScreenSize, GlobalContextMenuInset)
		
		return WithStyleFunction(function(p2)
			-- upvalues: RoactModule (upval), CoreGui (upval), VRReadyWrapper (upval), ConstantsModule (upval), FFlagLuaAppForceVrAppPanelWidthRollout (upval), p1 (copy), VRConstants (upval), GetFFlagVRPanelWidthIXPEnabledFunction (upval), GlobalContextMenuInset (copy), ScreenSize (copy), SafeAreaSize (copy), Element1 (ref)
			return RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
				PortalUI = RoactModule.createElement(VRReadyWrapper, {
					component = "ScreenGui",
					props = {
						ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
						DisplayOrder = ConstantsModule.DisplayOrder.ContextualListMenu
					},
					vrProps = {
						panelName = "ContextualListMenu",
						partSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelWidthMultiplier then VRConstants.MainScreenSize else Vector2.new(VRConstants.MainScreenSize.X * p1.props.vrPanelWidthMultiplier, VRConstants.MainScreenSize.Y),
						offset = if FFlagLuaAppForceVrAppPanelWidthRollout or GetFFlagVRPanelWidthIXPEnabledFunction() and p1.props.vrPanelCurvature == 0 then CFrame.new(VRConstants.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(VRConstants.MainScreenPosition, VRConstants.DefaultCameraPosition),
						virtualScreenSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelWidthMultiplier then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * p1.props.vrPanelWidthMultiplier, VRConstants.MainScreenResolution.Y),
						curvature = if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelCurvature then VRConstants.MainScreenCurvature else p1.props.vrPanelCurvature
					}
				}, {
					Content = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Active = true,
						Position = UDim2.new(0, -GlobalContextMenuInset.left, 0, -GlobalContextMenuInset.top),
						Size = UDim2.new(0, ScreenSize.X, 0, ScreenSize.Y),
						BackgroundColor3 = p2.Theme.Overlay.Color,
						BackgroundTransparency = p2.Theme.Overlay.Transparency
					}, {
						SafeAreaFrame = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ClipsDescendants = true,
							Position = UDim2.new(0, GlobalContextMenuInset.left, 0, GlobalContextMenuInset.top),
							Size = SafeAreaSize
						}, { Content = Element1 })
					})
				})
			})
		end)
	end
end

if FFlagEnableFlyoutSidePanelModule then
	function ContextualListMenu:didMount()
		-- upvalues: FlyoutScrollAwayControl (copy)
		FlyoutScrollAwayControl.setContextualMenuVisible(true)
	end
	
	function ContextualListMenu:willUnmount()
		-- upvalues: FlyoutScrollAwayControl (copy)
		FlyoutScrollAwayControl.setContextualMenuVisible(false)
	end
end
local v1 = if FFlagUseSignalsForGlobalContextMenuInset then function(p1)
	-- upvalues: UseSignalState (copy), GetGlobalContextMenuInsetStoreModule (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		globalContextMenuInset = UseSignalState(GetGlobalContextMenuInsetStoreModule(false).getGlobalContextMenuInset)
	}))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagUseSignalsForGlobalContextMenuInset (copy)
	return {
		formFactor = p1.FormFactor,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset,
		globalContextMenuInset = if FFlagUseSignalsForGlobalContextMenuInset then nil else p1.GlobalContextMenuInset
	}
end)(ContextualListMenu)

if not FFlagLuaAppForceVrAppPanelWidthRollout and GetFFlagVRPanelWidthIXPEnabledFunction() then
	v1 = IxpUtilsModule.connectTestVariables({
		vrPanelWidthMultiplier = VRPanelWidthIXP.VrAppPanelWidthMultiplier,
		vrPanelCurvature = VRPanelWidthIXP.VrAppPanelCurvature
	})(v1)
end
return v1