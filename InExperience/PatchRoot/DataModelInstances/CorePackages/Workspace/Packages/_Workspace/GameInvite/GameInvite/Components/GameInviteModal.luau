local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local GameInvite = script:FindFirstAncestor("GameInvite")
local Components = GameInvite.Components
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local PromiseModule = require(Parent.Promise)
local GetGameNameAndDescriptionFunction = require(Parent.GameDetailRodux).GetGameNameAndDescription
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local _ = require(GameInvite.gameInviteModalType)
local GameInviteModalManagerModule = require(GameInvite.GameInviteModalManager)
local GameInviteModalLayoutProviderModule = require(GameInvite.Context.GameInviteModalLayoutProvider)
local GameInviteModalWindowModule = require(Components.GameInviteModalWindow)
local GameInviteContentWrapperModule = require(Components.GameInviteContentWrapper)
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local ResetUserInviteStatusModule = require(GameInvite.State.Actions.ResetUserInviteStatus)
local IxpUtilsModule = require(Parent.IxpUtils)
local VrCompatibilityModule = require(Parent.VrCompatibility)
local VRReadyWrapper = VrCompatibilityModule.VRReadyWrapper
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NetworkImpl = require(GameInvite.GameInviteDependencies).networkImpl
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseSignalsForGameInvitesStatus = SharedFlagsModule.FFlagUseSignalsForGameInvitesStatus
local GetGameInvitesStatusStore = if FFlagUseSignalsForGameInvitesStatus then require(Parent.NotificationsCommon).GetGameInvitesStatusStore else nil
local GetFFlagEnableGameInviteModalVRSupportFunction = SharedFlagsModule.GetFFlagEnableGameInviteModalVRSupport
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local FFlagEnableInExperienceUIPCVRFix = SharedFlagsModule.FFlagEnableInExperienceUIPCVRFix
local ResponsiveModule = nil
local UIManager = nil
local PanelType = nil
local Callback = nil

if IsInExperienceUIVREnabled then
	ResponsiveModule = require(Parent.Responsive)
	Callback = if FFlagEnableInExperienceUIPCVRFix then require(Parent.Foundation).Hooks.useStyleSheet else nil
	local VrSpatialUiModule = require(Parent.VrSpatialUi)
	UIManager = VrSpatialUiModule.UIManager
	PanelType = VrSpatialUiModule.Constants.PanelType
end
local CustomEventHandlers = {
	[FocusNavigationEventNameEnum.NavigateBack] = {
		handler = InputHandlersModule.onRelease(function(p1)
			-- upvalues: GameInviteModalManagerModule (copy)
			GameInviteModalManagerModule:closeModal()
			p1:cancel()
		end)
	}
}

return function(p1)
	-- upvalues: FFlagLuaAppForceVrAppPanelWidthRollout (copy), GetFFlagVRPanelWidthIXPEnabledFunction (copy), IxpUtilsModule (copy), VRPanelWidthIXP (copy), ReactModule (copy), RunService (copy), GameInviteConstantsModule (copy), UseDispatchFunction (copy), IsInExperienceUIVREnabled (copy), ResponsiveModule (ref), FFlagEnableInExperienceUIPCVRFix (copy), Callback (ref), FFlagUseSignalsForGameInvitesStatus (copy), GetGameInvitesStatusStore (copy), ResetUserInviteStatusModule (copy), GameInviteModalManagerModule (copy), GuiService (copy), PromiseModule (copy), RobloxReplicatedStorage (copy), GetGameNameAndDescriptionFunction (copy), NetworkImpl (copy), GameInviteModalWindowModule (copy), GameInviteContentWrapperModule (copy), GetFFlagEnableGameInviteModalVRSupportFunction (copy), VRReadyWrapper (copy), VRConstants (copy), GameInviteModalLayoutProviderModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), CustomEventHandlers (copy), UIManager (ref), PanelType (ref), ReactRobloxModule (copy)
	local UseTestVariablesResult = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	local UseTestVariablesResult1 = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelCurvature)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState({})
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState("")
	local Inverted = not RunService:IsStudio()
	local IsRenderLocationMatch = p1.renderLocation == GameInviteConstantsModule.RenderLocation.CoreScripts
	local IsRenderLocationMatch1 = p1.renderLocation == GameInviteConstantsModule.RenderLocation.UniversalApp
	local UseDispatchResult = UseDispatchFunction()
	local UseIsSpatialResult = nil
	local StyleSheet = nil
	
	if IsInExperienceUIVREnabled then
		UseIsSpatialResult = ResponsiveModule.useIsSpatial()
		StyleSheet = if FFlagEnableInExperienceUIPCVRFix then Callback() else nil
	end
	local function Callback1(p2, p3, p4)
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), FFlagUseSignalsForGameInvitesStatus (upval), IsRenderLocationMatch1 (copy), GetGameInvitesStatusStore (upval), UseDispatchResult (copy), ResetUserInviteStatusModule (upval)
		UseStateResult2(p2)
		UseStateResult2_1(p3 or false)
		
		if p4 then
			UseStateResult2_2(p4)
		end
		if FFlagUseSignalsForGameInvitesStatus then
			if IsRenderLocationMatch1 and not p2 then
				GetGameInvitesStatusStore(false).reset()
				
				return
			end
		elseif IsRenderLocationMatch1 and not p2 and UseDispatchResult then
			UseDispatchResult(ResetUserInviteStatusModule())
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: GameInviteModalManagerModule (upval), Callback1 (copy)
		local EventConnection = GameInviteModalManagerModule.ToggleGameInviteModalEvent.Event:Connect(Callback1)
		
		return function()
			-- upvalues: EventConnection (copy)
			EventConnection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsRenderLocationMatch (copy), GuiService (upval), UseStateResult (copy), GameInviteModalManagerModule (upval)
		if IsRenderLocationMatch then
			local MenuOpenedConnection = GuiService.MenuOpened:Connect(function()
				-- upvalues: UseStateResult (upval), GameInviteModalManagerModule (upval)
				if UseStateResult then
					GameInviteModalManagerModule:closeModal()
				end
			end)
			
			return function()
				-- upvalues: MenuOpenedConnection (copy)
				MenuOpenedConnection:Disconnect()
			end
		else
			return function() end
		end
	end, { UseStateResult, IsRenderLocationMatch })
	ReactModule.useEffect(function()
		-- upvalues: Inverted (copy), UseStateResult (copy), IsRenderLocationMatch (copy), UseStateResult5 (copy), PromiseModule (upval), RobloxReplicatedStorage (upval), UseStateResult2_4 (copy), GetGameNameAndDescriptionFunction (upval), UseStateResult4 (copy), NetworkImpl (upval), UseStateResult2_3 (copy)
		if Inverted and UseStateResult and IsRenderLocationMatch then
			if UseStateResult5 == "" then
				PromiseModule.try(function()
					-- upvalues: RobloxReplicatedStorage (upval)
					return RobloxReplicatedStorage:WaitForChild("GetServerType", 2):InvokeServer()
				end):andThen(function(Result)
					-- upvalues: UseStateResult2_4 (upval)
					UseStateResult2_4(Result)
				end)
			end
			if GetGameNameAndDescriptionFunction and not UseStateResult4.Created then
				GetGameNameAndDescriptionFunction(NetworkImpl, game.GameId):andThen(function(Result)
					-- upvalues: UseStateResult2_3 (upval)
					UseStateResult2_3(Result)
				end)
			end
		end
	end, { UseStateResult })
	
	if not UseStateResult then
		return nil
	end
	local Element = ReactModule.createElement(GameInviteModalWindowModule, {}, {
		GameInviteModalContentWrapper = ReactModule.createElement(GameInviteContentWrapperModule, {
			options = UseStateResult3,
			serverType = UseStateResult5,
			gameDetails = UseStateResult4,
			isLoading = UseStateResult1,
			isCoreScript = IsRenderLocationMatch,
			disableSelectionParentManagement = IsRenderLocationMatch1,
			hideCloseButton = UseStateResult3.hideCloseButton
		})
	})
	
	if GetFFlagEnableGameInviteModalVRSupportFunction() and IsRenderLocationMatch1 then
		return ReactModule.createElement(VRReadyWrapper, {
			component = "ScreenGui",
			props = {
				IgnoreGuiInset = true,
				DisplayOrder = p1.displayOrder,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				Name = GameInviteConstantsModule.ParentComponentName
			},
			vrProps = {
				panelName = "GameInviteMenu",
				partSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not UseTestVariablesResult then VRConstants.MainScreenSize else Vector2.new(VRConstants.MainScreenSize.X * UseTestVariablesResult, VRConstants.MainScreenSize.Y),
				offset = if FFlagLuaAppForceVrAppPanelWidthRollout or GetFFlagVRPanelWidthIXPEnabledFunction() and UseTestVariablesResult1 == 0 then CFrame.new(VRConstants.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(VRConstants.MainScreenPosition, VRConstants.DefaultCameraPosition),
				virtualScreenSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not UseTestVariablesResult then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * UseTestVariablesResult, VRConstants.MainScreenResolution.Y),
				curvature = if FFlagLuaAppForceVrAppPanelWidthRollout or not UseTestVariablesResult1 then VRConstants.MainScreenCurvature else UseTestVariablesResult1
			}
		}, {
			GameInviteModalLayoutProvider = ReactModule.createElement(GameInviteModalLayoutProviderModule, { isCoreScript = IsRenderLocationMatch }, {
				ModalWindowContainer = if IsRenderLocationMatch1 then ReactModule.createElement(FocusNavigableSurfaceWrapper, {
					isAutoFocusRoot = true,
					isIsolated = true,
					isFocusable = true,
					surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
					customEventHandlers = CustomEventHandlers
				}, { ModalWindowContainer = Element }) else Element
			})
		})
	elseif IsInExperienceUIVREnabled and UseIsSpatialResult then
		local PanelSizeInPixel = if FFlagEnableInExperienceUIPCVRFix then UIManager.getInstance():getPanelSizeInPixel(PanelType.MoreMenu) else nil
		
		return ReactRobloxModule.createPortal({
			FoundationStyleLink = if FFlagEnableInExperienceUIPCVRFix then ReactModule.createElement("StyleLink", { StyleSheet = StyleSheet }) else nil,
			GameInviteModalLayoutProvider = ReactModule.createElement(GameInviteModalLayoutProviderModule, {
				isCoreScript = IsRenderLocationMatch,
				screenSizeOverride = if FFlagEnableInExperienceUIPCVRFix then PanelSizeInPixel else nil
			}, {
				ModalWindowContainer = ReactModule.createElement(GameInviteModalWindowModule, {}, {
					GameInviteModalContentWrapper = ReactModule.createElement(GameInviteContentWrapperModule, {
						options = UseStateResult3,
						serverType = UseStateResult5,
						gameDetails = UseStateResult4,
						isLoading = UseStateResult1,
						isCoreScript = IsRenderLocationMatch
					})
				})
			})
		}, (UIManager.getInstance():getPanelObject(PanelType.MoreMenu)))
	else
		return ReactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			DisplayOrder = p1.displayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Name = GameInviteConstantsModule.ParentComponentName
		}, {
			GameInviteModalLayoutProvider = ReactModule.createElement(GameInviteModalLayoutProviderModule, { isCoreScript = IsRenderLocationMatch }, {
				ModalWindowContainer = if IsRenderLocationMatch1 then ReactModule.createElement(FocusNavigableSurfaceWrapper, {
					isAutoFocusRoot = true,
					isFocusable = true,
					isIsolated = true,
					surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
					customEventHandlers = CustomEventHandlers
				}, { ModalWindowContainer = Element }) else Element
			})
		})
	end
end