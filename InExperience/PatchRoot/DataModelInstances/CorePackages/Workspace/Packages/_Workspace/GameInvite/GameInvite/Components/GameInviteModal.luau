local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local gameInvite = script:FindFirstAncestor("GameInvite")
local components = gameInvite.Components
local context = gameInvite.Context
local actions = gameInvite.State.Actions
local parent = gameInvite.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local reactRobloxModule = require(parent.ReactRoblox)
local promiseModule = require(parent.Promise)
local getGameNameAndDescription = require(parent.GameDetailRodux).GetGameNameAndDescription
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local _ = require(gameInvite.gameInviteModalType)
local gameInviteModalManagerModule = require(gameInvite.GameInviteModalManager)
local gameInviteModalLayoutProviderModule = require(context.GameInviteModalLayoutProvider)
local gameInviteModalWindowModule = require(components.GameInviteModalWindow)
local gameInviteContentWrapperModule = require(components.GameInviteContentWrapper)
local gameInviteDependenciesModule = require(gameInvite.GameInviteDependencies)
local gameInviteConstantsModule = require(gameInvite.GameInviteConstants)
local resetUserInviteStatusModule = require(actions.ResetUserInviteStatus)
local ixpUtilsModule = require(parent.IxpUtils)
local vrCompatibilityModule = require(parent.VrCompatibility)
local VRReadyWrapper = vrCompatibilityModule.VRReadyWrapper
local VRConstants = vrCompatibilityModule.VRConstants
local VRPanelWidthIXP = vrCompatibilityModule.VRPanelWidthIXP
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local networkImpl = gameInviteDependenciesModule.networkImpl
game:DefineFastFlag("LuaEnableGameInviteModal2023V5", false)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseSignalsForGameInvitesStatus = sharedFlagsModule.FFlagUseSignalsForGameInvitesStatus
local var1 = if fFlagUseSignalsForGameInvitesStatus then require(parent.NotificationsCommon).GetGameInvitesStatusStore else nil
local getFFlagEnableGameInviteModalVRSupport = sharedFlagsModule.GetFFlagEnableGameInviteModalVRSupport
local getFFlagVRPanelWidthIXPEnabled = sharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagLuaAppForceVrAppPanelWidthRollout = sharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local fFlagEnableInExperienceUIPCVRFix = sharedFlagsModule.FFlagEnableInExperienceUIPCVRFix
local responsiveModule = nil
local UIManager = nil
local panelType = nil
local var2 = nil

if isInExperienceUIVREnabled then
	responsiveModule = require(parent.Responsive)
	var2 = if fFlagEnableInExperienceUIPCVRFix then require(parent.Foundation).Hooks.useStyleSheet else nil
	local vrSpatialUiModule = require(parent.VrSpatialUi)
	UIManager = vrSpatialUiModule.UIManager
	panelType = vrSpatialUiModule.Constants.PanelType
end
local t = {
	[focusNavigationEventNameEnum.NavigateBack] = {
		handler = inputHandlersModule.onRelease(function(p1)
			-- upvalues: gameInviteModalManagerModule (ref)
			gameInviteModalManagerModule:closeModal()
			p1:cancel()
		end)
	}
}

return function(p1)
	-- upvalues: fFlagLuaAppForceVrAppPanelWidthRollout (ref), getFFlagVRPanelWidthIXPEnabled (ref), ixpUtilsModule (ref), VRPanelWidthIXP (ref), reactModule (ref), runService (ref), gameInviteConstantsModule (ref), useDispatch (ref), isInExperienceUIVREnabled (ref), responsiveModule (write), fFlagEnableInExperienceUIPCVRFix (ref), var2 (write), fFlagUseSignalsForGameInvitesStatus (ref), var1 (ref), resetUserInviteStatusModule (ref), gameInviteModalManagerModule (ref), guiService (ref), promiseModule (ref), robloxReplicatedStorageService (ref), getGameNameAndDescription (ref), networkImpl (ref), gameInviteModalWindowModule (ref), gameInviteContentWrapperModule (ref), getFFlagEnableGameInviteModalVRSupport (ref), VRReadyWrapper (ref), VRConstants (ref), gameInviteModalLayoutProviderModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), UIManager (write), panelType (write), reactRobloxModule (ref)
	if not game:GetFastFlag("LuaEnableGameInviteModal2023V5") then
		return nil
	end
	local var3 = if fFlagLuaAppForceVrAppPanelWidthRollout or not getFFlagVRPanelWidthIXPEnabled() then nil else ixpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	local var4 = if fFlagLuaAppForceVrAppPanelWidthRollout or not getFFlagVRPanelWidthIXPEnabled() then nil else ixpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelCurvature)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState({})
	local var11, var12 = reactModule.useState({})
	local var13, var14 = reactModule.useState("")
	local var15 = not runService:IsStudio()
	local var16 = p1.renderLocation == gameInviteConstantsModule.RenderLocation.CoreScripts
	local var17 = p1.renderLocation == gameInviteConstantsModule.RenderLocation.UniversalApp
	local var18 = useDispatch()
	local var19 = nil
	local var20 = nil
	
	if isInExperienceUIVREnabled then
		var19 = responsiveModule.useIsSpatial()
		var20 = if fFlagEnableInExperienceUIPCVRFix then var2() else nil
	end
	local var21 = function(p2, p3, p4)
		-- upvalues: var6 (ref), var8 (ref), var10 (ref), fFlagUseSignalsForGameInvitesStatus (copy), var17 (ref), var1 (copy), var18 (ref), resetUserInviteStatusModule (copy)
		var6(p2)
		var8(p3 or false)
		
		if p4 then
			var10(p4)
		end
		if fFlagUseSignalsForGameInvitesStatus then
			if var17 and not p2 then
				var1(false).reset()
				
				return
			end
		elseif var17 and not p2 and var18 then
			var18(resetUserInviteStatusModule())
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: gameInviteModalManagerModule (copy), var21 (ref)
		local eventConnection = gameInviteModalManagerModule.ToggleGameInviteModalEvent.Event:Connect(var21)
		
		return function()
			-- upvalues: eventConnection (ref)
			eventConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), guiService (copy), var5 (ref), gameInviteModalManagerModule (copy)
		if var16 then
			local menuOpenedConnection = guiService.MenuOpened:Connect(function()
				-- upvalues: var5 (copy), gameInviteModalManagerModule (copy)
				if var5 then
					gameInviteModalManagerModule:closeModal()
				end
			end)
			
			return function()
				-- upvalues: menuOpenedConnection (ref)
				menuOpenedConnection:Disconnect()
			end
		end
		return function() end
	end, { var5, var16 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var5 (ref), var16 (ref), var13 (ref), promiseModule (copy), robloxReplicatedStorageService (copy), var14 (ref), getGameNameAndDescription (copy), var11 (ref), networkImpl (copy), var12 (ref)
		if var15 and var5 and var16 then
			if var13 == "" then
				promiseModule.try(function()
					-- upvalues: robloxReplicatedStorageService (copy)
					return robloxReplicatedStorageService:WaitForChild("GetServerType", 2):InvokeServer()
				end):andThen(function(p2)
					-- upvalues: var14 (copy)
					var14(p2)
				end)
			end
			if getGameNameAndDescription and not var11.Created then
				getGameNameAndDescription(networkImpl, game.GameId):andThen(function(p2)
					-- upvalues: var12 (copy)
					var12(p2)
				end)
			end
		end
	end, { var5 })
	
	if not var5 then
		return nil
	end
	local var22 = reactModule.createElement(gameInviteModalWindowModule, {}, {
		GameInviteModalContentWrapper = reactModule.createElement(gameInviteContentWrapperModule, {
			options = var9,
			serverType = var13,
			gameDetails = var11,
			isLoading = var7,
			isCoreScript = var16,
			disableSelectionParentManagement = var17,
			hideCloseButton = var9.hideCloseButton
		})
	})
	
	return if getFFlagEnableGameInviteModalVRSupport() and var17 then reactModule.createElement(VRReadyWrapper, {
		component = "ScreenGui",
		props = {
			IgnoreGuiInset = true,
			DisplayOrder = p1.displayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Name = gameInviteConstantsModule.ParentComponentName
		},
		vrProps = {
			panelName = "GameInviteMenu",
			partSize = if fFlagLuaAppForceVrAppPanelWidthRollout or not var3 then VRConstants.MainScreenSize else Vector2.new(VRConstants.MainScreenSize.X * var3, VRConstants.MainScreenSize.Y),
			offset = if fFlagLuaAppForceVrAppPanelWidthRollout or getFFlagVRPanelWidthIXPEnabled() and var4 == 0 then CFrame.new(VRConstants.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.14159265359, 0) else CFrame.lookAt(VRConstants.MainScreenPosition, VRConstants.DefaultCameraPosition),
			virtualScreenSize = if fFlagLuaAppForceVrAppPanelWidthRollout or not var3 then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * var3, VRConstants.MainScreenResolution.Y),
			curvature = if fFlagLuaAppForceVrAppPanelWidthRollout or not var4 then VRConstants.MainScreenCurvature else var4
		}
	}, {
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, { isCoreScript = var16 }, {
			ModalWindowContainer = if var17 then reactModule.createElement(focusNavigableSurfaceWrapper, {
				isAutoFocusRoot = true,
				isIsolated = true,
				isFocusable = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = t
			}, { ModalWindowContainer = var22 }) else var22
		})
	}) elseif isInExperienceUIVREnabled and var19 then reactRobloxModule.createPortal({
		FoundationStyleLink = if fFlagEnableInExperienceUIPCVRFix then reactModule.createElement("StyleLink", { StyleSheet = var20 }) else nil,
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, {
			isCoreScript = var16,
			screenSizeOverride = if fFlagEnableInExperienceUIPCVRFix then if fFlagEnableInExperienceUIPCVRFix then UIManager.getInstance():getPanelSizeInPixel(panelType.MoreMenu) else nil else nil
		}, {
			ModalWindowContainer = reactModule.createElement(gameInviteModalWindowModule, {}, {
				GameInviteModalContentWrapper = reactModule.createElement(gameInviteContentWrapperModule, {
					options = var9,
					serverType = var13,
					gameDetails = var11,
					isLoading = var7,
					isCoreScript = var16
				})
			})
		})
	}, UIManager.getInstance():getPanelObject(panelType.MoreMenu)) else reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = p1.displayOrder,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Name = gameInviteConstantsModule.ParentComponentName
	}, {
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, { isCoreScript = var16 }, {
			ModalWindowContainer = if var17 then reactModule.createElement(focusNavigableSurfaceWrapper, {
				isAutoFocusRoot = true,
				isFocusable = true,
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = t
			}, { ModalWindowContainer = var22 }) else var22
		})
	})
end