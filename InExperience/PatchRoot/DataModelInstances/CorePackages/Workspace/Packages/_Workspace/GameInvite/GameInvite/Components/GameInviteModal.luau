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
local var20 = if fFlagUseSignalsForGameInvitesStatus then require(parent.NotificationsCommon).GetGameInvitesStatusStore else nil
local getFFlagEnableGameInviteModalVRSupport = sharedFlagsModule.GetFFlagEnableGameInviteModalVRSupport
local getFFlagVRPanelWidthIXPEnabled = sharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagLuaAppForceVrAppPanelWidthRollout = sharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local fFlagEnableInExperienceUIPCVRFix = sharedFlagsModule.FFlagEnableInExperienceUIPCVRFix
local responsiveModule = nil
local UIManager = nil
local panelType = nil
local var22 = nil

if isInExperienceUIVREnabled then
	responsiveModule = require(parent.Responsive)
	var22 = if fFlagEnableInExperienceUIPCVRFix then require(parent.Foundation).Hooks.useStyleSheet else nil
	local vrSpatialUiModule = require(parent.VrSpatialUi)
	UIManager = vrSpatialUiModule.UIManager
	panelType = vrSpatialUiModule.Constants.PanelType
end
local t = {
	[focusNavigationEventNameEnum.NavigateBack] = {
		handler = inputHandlersModule.onRelease(function(p0) --[[ line: 71 ]]
			-- upvalues: gameInviteModalManagerModule (ref)
			gameInviteModalManagerModule:closeModal()
			p0:cancel()
		end)
	}
}

return function(p1) --[[ line: 82 ]]
	-- upvalues: fFlagLuaAppForceVrAppPanelWidthRollout (ref), getFFlagVRPanelWidthIXPEnabled (ref), ixpUtilsModule (ref), VRPanelWidthIXP (ref), reactModule (ref), runService (ref), gameInviteConstantsModule (ref), useDispatch (ref), isInExperienceUIVREnabled (ref), responsiveModule (write), fFlagEnableInExperienceUIPCVRFix (ref), var22 (write), fFlagUseSignalsForGameInvitesStatus (ref), var20 (ref), resetUserInviteStatusModule (ref), gameInviteModalManagerModule (ref), guiService (ref), promiseModule (ref), robloxReplicatedStorageService (ref), getGameNameAndDescription (ref), networkImpl (ref), gameInviteModalWindowModule (ref), gameInviteContentWrapperModule (ref), getFFlagEnableGameInviteModalVRSupport (ref), VRReadyWrapper (ref), VRConstants (ref), gameInviteModalLayoutProviderModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), UIManager (write), panelType (write), reactRobloxModule (ref)
	if not game:GetFastFlag("LuaEnableGameInviteModal2023V5") then
		return nil
	end
	local var25 = if fFlagLuaAppForceVrAppPanelWidthRollout or not getFFlagVRPanelWidthIXPEnabled() then nil else ixpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	local var26 = if fFlagLuaAppForceVrAppPanelWidthRollout or not getFFlagVRPanelWidthIXPEnabled() then nil else ixpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelCurvature)
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState({})
	local var33, var34 = reactModule.useState({})
	local var35, var36 = reactModule.useState("")
	local var37 = not runService:IsStudio()
	local var38 = p1.renderLocation == gameInviteConstantsModule.RenderLocation.CoreScripts
	local var39 = p1.renderLocation == gameInviteConstantsModule.RenderLocation.UniversalApp
	local var40 = useDispatch()
	local var41 = nil
	local var42 = nil
	
	if isInExperienceUIVREnabled then
		var41 = responsiveModule.useIsSpatial()
		var42 = if fFlagEnableInExperienceUIPCVRFix then var22() else nil
	end
	local var43 = function(p2, p3, p4) --[[ line: 117 ]]
		-- upvalues: var28 (ref), var30 (ref), var32 (ref), fFlagUseSignalsForGameInvitesStatus (copy), var39 (ref), var20 (copy), var40 (ref), resetUserInviteStatusModule (copy)
		var28(p2)
		var30(p3 or false)
		
		if p4 then
			var32(p4)
		end
		if fFlagUseSignalsForGameInvitesStatus then
			if var39 and not p2 then
				var20(false).reset()
				
				return
			end
		elseif var39 and not p2 and var40 then
			var40(resetUserInviteStatusModule())
		end
	end
	
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: gameInviteModalManagerModule (copy), var43 (ref)
		local eventConnection = gameInviteModalManagerModule.ToggleGameInviteModalEvent.Event:Connect(var43)
		
		return function() --[[ line: 136 ]]
			-- upvalues: eventConnection (ref)
			eventConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 142 ]]
		-- upvalues: var38 (ref), guiService (copy), var27 (ref), gameInviteModalManagerModule (copy)
		if var38 then
			local menuOpenedConnection = guiService.MenuOpened:Connect(function() --[[ line: 144 ]]
				-- upvalues: var27 (copy), gameInviteModalManagerModule (copy)
				if var27 then
					gameInviteModalManagerModule:closeModal()
				end
			end)
			
			return function() --[[ line: 149 ]]
				-- upvalues: menuOpenedConnection (ref)
				menuOpenedConnection:Disconnect()
			end
		end
		return function() --[[ line: 153 ]] end
	end, { var27, var38 })
	reactModule.useEffect(function() --[[ line: 158 ]]
		-- upvalues: var37 (ref), var27 (ref), var38 (ref), var35 (ref), promiseModule (copy), robloxReplicatedStorageService (copy), var36 (ref), getGameNameAndDescription (copy), var33 (ref), networkImpl (copy), var34 (ref)
		if var37 and var27 and var38 then
			if var35 == "" then
				promiseModule.try(function() --[[ line: 162 ]]
					-- upvalues: robloxReplicatedStorageService (copy)
					return robloxReplicatedStorageService:WaitForChild("GetServerType", 2):InvokeServer()
				end):andThen(function(p5) --[[ line: 165 ]]
					-- upvalues: var36 (copy)
					var36(p5)
				end)
			end
			if getGameNameAndDescription and not var33.Created then
				getGameNameAndDescription(networkImpl, game.GameId):andThen(function(p6) --[[ line: 171 ]]
					-- upvalues: var34 (copy)
					var34(p6)
				end)
			end
		end
	end, { var27 })
	
	if not var27 then
		return nil
	end
	local var44 = reactModule.createElement(gameInviteModalWindowModule, {}, {
		GameInviteModalContentWrapper = reactModule.createElement(gameInviteContentWrapperModule, {
			options = var31,
			serverType = var35,
			gameDetails = var33,
			isLoading = var29,
			isCoreScript = var38,
			disableSelectionParentManagement = var39,
			hideCloseButton = var31.hideCloseButton
		})
	})
	
	return if getFFlagEnableGameInviteModalVRSupport() and var39 then reactModule.createElement(VRReadyWrapper, {
		component = "ScreenGui",
		props = {
			IgnoreGuiInset = true,
			DisplayOrder = p1.displayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Name = gameInviteConstantsModule.ParentComponentName
		},
		vrProps = {
			panelName = "GameInviteMenu",
			partSize = if fFlagLuaAppForceVrAppPanelWidthRollout or not var25 then VRConstants.MainScreenSize else Vector2.new(VRConstants.MainScreenSize.X * var25, VRConstants.MainScreenSize.Y),
			offset = if fFlagLuaAppForceVrAppPanelWidthRollout or getFFlagVRPanelWidthIXPEnabled() and var26 == 0 then CFrame.new(VRConstants.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.14159265359, 0) else CFrame.lookAt(VRConstants.MainScreenPosition, VRConstants.DefaultCameraPosition),
			virtualScreenSize = if fFlagLuaAppForceVrAppPanelWidthRollout or not var25 then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * var25, VRConstants.MainScreenResolution.Y),
			curvature = if fFlagLuaAppForceVrAppPanelWidthRollout or not var26 then VRConstants.MainScreenCurvature else var26
		}
	}, {
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, { isCoreScript = var38 }, {
			ModalWindowContainer = if var39 then reactModule.createElement(focusNavigableSurfaceWrapper, {
				isAutoFocusRoot = true,
				isIsolated = true,
				isFocusable = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = t
			}, { ModalWindowContainer = var44 }) else var44
		})
	}) elseif isInExperienceUIVREnabled and var41 then reactRobloxModule.createPortal({
		FoundationStyleLink = if fFlagEnableInExperienceUIPCVRFix then reactModule.createElement("StyleLink", { StyleSheet = var42 }) else nil,
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, {
			isCoreScript = var38,
			screenSizeOverride = if fFlagEnableInExperienceUIPCVRFix then if fFlagEnableInExperienceUIPCVRFix then UIManager.getInstance():getPanelSizeInPixel(panelType.MoreMenu) else nil else nil
		}, {
			ModalWindowContainer = reactModule.createElement(gameInviteModalWindowModule, {}, {
				GameInviteModalContentWrapper = reactModule.createElement(gameInviteContentWrapperModule, {
					options = var31,
					serverType = var35,
					gameDetails = var33,
					isLoading = var29,
					isCoreScript = var38
				})
			})
		})
	}, UIManager.getInstance():getPanelObject(panelType.MoreMenu)) else reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = p1.displayOrder,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Name = gameInviteConstantsModule.ParentComponentName
	}, {
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, { isCoreScript = var38 }, {
			ModalWindowContainer = if var39 then reactModule.createElement(focusNavigableSurfaceWrapper, {
				isAutoFocusRoot = true,
				isFocusable = true,
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = t
			}, { ModalWindowContainer = var44 }) else var44
		})
	})
end