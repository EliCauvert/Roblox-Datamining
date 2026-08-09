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
local getFFlagEnableGameInviteModalVRSupport = sharedFlagsModule.GetFFlagEnableGameInviteModalVRSupport
local getFFlagVRPanelWidthIXPEnabled = sharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagLuaAppForceVrAppPanelWidthRollout = sharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local fFlagEnableInExperienceUIPCVRFix = sharedFlagsModule.FFlagEnableInExperienceUIPCVRFix
local responsiveModule = nil
local UIManager = nil
local panelType = nil
local var21 = nil

if isInExperienceUIVREnabled then
	responsiveModule = require(parent.Responsive)
	var21 = if fFlagEnableInExperienceUIPCVRFix then require(parent.Foundation).Hooks.useStyleSheet else nil
	local vrSpatialUiModule = require(parent.VrSpatialUi)
	UIManager = vrSpatialUiModule.UIManager
	panelType = vrSpatialUiModule.Constants.PanelType
end
local t = {
	[focusNavigationEventNameEnum.NavigateBack] = {
		handler = inputHandlersModule.onRelease(function(p0) --[[ line: 67 ]]
			-- upvalues: gameInviteModalManagerModule (ref)
			gameInviteModalManagerModule:closeModal()
			p0:cancel()
		end)
	}
}

return function(p1) --[[ line: 78 ]]
	-- upvalues: fFlagLuaAppForceVrAppPanelWidthRollout (ref), getFFlagVRPanelWidthIXPEnabled (ref), ixpUtilsModule (ref), VRPanelWidthIXP (ref), reactModule (ref), runService (ref), gameInviteConstantsModule (ref), useDispatch (ref), isInExperienceUIVREnabled (ref), responsiveModule (write), fFlagEnableInExperienceUIPCVRFix (ref), var21 (write), resetUserInviteStatusModule (ref), gameInviteModalManagerModule (ref), guiService (ref), promiseModule (ref), robloxReplicatedStorageService (ref), getGameNameAndDescription (ref), networkImpl (ref), gameInviteModalWindowModule (ref), gameInviteContentWrapperModule (ref), getFFlagEnableGameInviteModalVRSupport (ref), VRReadyWrapper (ref), VRConstants (ref), gameInviteModalLayoutProviderModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), UIManager (write), panelType (write), reactRobloxModule (ref)
	if not game:GetFastFlag("LuaEnableGameInviteModal2023V5") then
		return nil
	end
	local var24 = if fFlagLuaAppForceVrAppPanelWidthRollout or not getFFlagVRPanelWidthIXPEnabled() then nil else ixpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	local var25 = if fFlagLuaAppForceVrAppPanelWidthRollout or not getFFlagVRPanelWidthIXPEnabled() then nil else ixpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelCurvature)
	local var26, var27 = reactModule.useState(false)
	local var28, var29 = reactModule.useState(false)
	local var30, var31 = reactModule.useState({})
	local var32, var33 = reactModule.useState({})
	local var34, var35 = reactModule.useState("")
	local var36 = not runService:IsStudio()
	local var37 = p1.renderLocation == gameInviteConstantsModule.RenderLocation.CoreScripts
	local var38 = p1.renderLocation == gameInviteConstantsModule.RenderLocation.UniversalApp
	local var39 = useDispatch()
	local var40 = nil
	local var41 = nil
	
	if isInExperienceUIVREnabled then
		var40 = responsiveModule.useIsSpatial()
		var41 = if fFlagEnableInExperienceUIPCVRFix then var21() else nil
	end
	local var42 = function(p2, p3, p4) --[[ line: 113 ]]
		-- upvalues: var27 (ref), var29 (ref), var31 (ref), var38 (ref), var39 (ref), resetUserInviteStatusModule (copy)
		var27(p2)
		var29(p3 or false)
		
		if p4 then
			var31(p4)
		end
		if var38 and not p2 and var39 then
			var39(resetUserInviteStatusModule())
		end
	end
	
	reactModule.useEffect(function() --[[ line: 125 ]]
		-- upvalues: gameInviteModalManagerModule (copy), var42 (ref)
		local eventConnection = gameInviteModalManagerModule.ToggleGameInviteModalEvent.Event:Connect(var42)
		
		return function() --[[ line: 127 ]]
			-- upvalues: eventConnection (ref)
			eventConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 133 ]]
		-- upvalues: var37 (ref), guiService (copy), var26 (ref), gameInviteModalManagerModule (copy)
		if var37 then
			local menuOpenedConnection = guiService.MenuOpened:Connect(function() --[[ line: 135 ]]
				-- upvalues: var26 (copy), gameInviteModalManagerModule (copy)
				if var26 then
					gameInviteModalManagerModule:closeModal()
				end
			end)
			
			return function() --[[ line: 140 ]]
				-- upvalues: menuOpenedConnection (ref)
				menuOpenedConnection:Disconnect()
			end
		end
		return function() --[[ line: 144 ]] end
	end, { var26, var37 })
	reactModule.useEffect(function() --[[ line: 149 ]]
		-- upvalues: var36 (ref), var26 (ref), var37 (ref), var34 (ref), promiseModule (copy), robloxReplicatedStorageService (copy), var35 (ref), getGameNameAndDescription (copy), var32 (ref), networkImpl (copy), var33 (ref)
		if var36 and var26 and var37 then
			if var34 == "" then
				promiseModule.try(function() --[[ line: 153 ]]
					-- upvalues: robloxReplicatedStorageService (copy)
					return robloxReplicatedStorageService:WaitForChild("GetServerType", 2):InvokeServer()
				end):andThen(function(p5) --[[ line: 156 ]]
					-- upvalues: var35 (copy)
					var35(p5)
				end)
			end
			if getGameNameAndDescription and not var32.Created then
				getGameNameAndDescription(networkImpl, game.GameId):andThen(function(p6) --[[ line: 162 ]]
					-- upvalues: var33 (copy)
					var33(p6)
				end)
			end
		end
	end, { var26 })
	
	if not var26 then
		return nil
	end
	local var43 = reactModule.createElement(gameInviteModalWindowModule, {}, {
		GameInviteModalContentWrapper = reactModule.createElement(gameInviteContentWrapperModule, {
			options = var30,
			serverType = var34,
			gameDetails = var32,
			isLoading = var28,
			isCoreScript = var37,
			disableSelectionParentManagement = var38,
			hideCloseButton = var30.hideCloseButton
		})
	})
	
	return if getFFlagEnableGameInviteModalVRSupport() and var38 then reactModule.createElement(VRReadyWrapper, {
		component = "ScreenGui",
		props = {
			IgnoreGuiInset = true,
			DisplayOrder = p1.displayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Name = gameInviteConstantsModule.ParentComponentName
		},
		vrProps = {
			panelName = "GameInviteMenu",
			partSize = if fFlagLuaAppForceVrAppPanelWidthRollout or not var24 then VRConstants.MainScreenSize else Vector2.new(VRConstants.MainScreenSize.X * var24, VRConstants.MainScreenSize.Y),
			offset = if fFlagLuaAppForceVrAppPanelWidthRollout or getFFlagVRPanelWidthIXPEnabled() and var25 == 0 then CFrame.new(VRConstants.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.14159265359, 0) else CFrame.lookAt(VRConstants.MainScreenPosition, VRConstants.DefaultCameraPosition),
			virtualScreenSize = if fFlagLuaAppForceVrAppPanelWidthRollout or not var24 then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * var24, VRConstants.MainScreenResolution.Y),
			curvature = if fFlagLuaAppForceVrAppPanelWidthRollout or not var25 then VRConstants.MainScreenCurvature else var25
		}
	}, {
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, { isCoreScript = var37 }, {
			ModalWindowContainer = if var38 then reactModule.createElement(focusNavigableSurfaceWrapper, {
				isAutoFocusRoot = true,
				isIsolated = true,
				isFocusable = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = t
			}, { ModalWindowContainer = var43 }) else var43
		})
	}) elseif isInExperienceUIVREnabled and var40 then reactRobloxModule.createPortal({
		FoundationStyleLink = if fFlagEnableInExperienceUIPCVRFix then reactModule.createElement("StyleLink", { StyleSheet = var41 }) else nil,
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, {
			isCoreScript = var37,
			screenSizeOverride = if fFlagEnableInExperienceUIPCVRFix then if fFlagEnableInExperienceUIPCVRFix then UIManager.getInstance():getPanelSizeInPixel(panelType.MoreMenu) else nil else nil
		}, {
			ModalWindowContainer = reactModule.createElement(gameInviteModalWindowModule, {}, {
				GameInviteModalContentWrapper = reactModule.createElement(gameInviteContentWrapperModule, {
					options = var30,
					serverType = var34,
					gameDetails = var32,
					isLoading = var28,
					isCoreScript = var37
				})
			})
		})
	}, UIManager.getInstance():getPanelObject(panelType.MoreMenu)) else reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = p1.displayOrder,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Name = gameInviteConstantsModule.ParentComponentName
	}, {
		GameInviteModalLayoutProvider = reactModule.createElement(gameInviteModalLayoutProviderModule, { isCoreScript = var37 }, {
			ModalWindowContainer = if var38 then reactModule.createElement(focusNavigableSurfaceWrapper, {
				isAutoFocusRoot = true,
				isFocusable = true,
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = t
			}, { ModalWindowContainer = var43 }) else var43
		})
	})
end