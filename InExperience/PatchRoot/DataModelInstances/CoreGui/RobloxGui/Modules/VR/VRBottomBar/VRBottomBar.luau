local constants_1, panelType, registerRoactPanel, UIManager
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = game:GetService("TelemetryService")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local starterGuiService = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local otterModule = require(corePackagesService.Packages.Otter)
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local baseMenu = UIBloxModule.App.Menu.BaseMenu
local systemBar = UIBloxModule.App.Navigation.SystemBar
local placement = UIBloxModule.App.Navigation.Enum.Placement
local panel3D = UIBloxModule.Core.VR.Panel3D
local constants = UIBloxModule.Core.VR.Constants
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local images = UIBloxModule.App.ImageSet.Images
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local VRUtil = require(corePackagesService.Workspace.Packages.VrCommon).VRUtil
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local fFlagEnableUIManagerPackgify = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify
local getFFlagEnableVrVoiceParity = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity
local getFFlagEnableVrVoiceConnectDisconnect = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceConnectDisconnect
local enableJoinVoiceVrTelemetry = game:DefineFastFlag("EnableJoinVoiceVrTelemetry", false)
local _ = nil
local _ = nil
local _ = nil
local _ = nil

if fFlagEnableUIManagerPackgify then
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	constants_1 = vrSpatialUiModule.Constants
	panelType = constants_1.PanelType
	registerRoactPanel = vrSpatialUiModule.registerRoactPanel
	UIManager = vrSpatialUiModule.UIManager
else
	local UIManager_1 = robloxGui:WaitForChild("Modules"):WaitForChild("UIManager")
	panelType = require(UIManager_1.Constants).PanelType
	registerRoactPanel = require(UIManager_1.registerRoactPanel)
	UIManager = require(UIManager_1.UIManager)
	constants_1 = require(UIManager_1.Constants)
end
local inGameMenuConstantsModule = require(robloxGui.Modules.InGameMenuConstants)
local gameSettings = UserSettings().GameSettings
local inGameMenuInitModule = require(robloxGui.Modules.InGameMenuInit)
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local topBarApp = roactModule.PureComponent:extend("TopBarApp")
local VRBarSeparatorModule = require(script.Parent.VRBarSeparator)
local VRBarVoiceIconModule = require(script.Parent.VRBarVoiceIcon)
local VRBottomBarAnalyticsModule = require(script.Parent.VRBottomBarAnalytics)
local VRBottomBarTypeModule = require(script.Parent.VRBottomBarType)
local emotesMenuMasterModule = require(robloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var29 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var30 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.Backpack) else require(robloxGui.Modules.BackpackScript)
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local starterPlayerService = game:GetService("StarterPlayer")
local enableVRBottomBarWorksBehindObjectsEngineFeature = game:GetEngineFeature("EnableVRBottomBarWorksBehindObjects")
local fFlagVRBottomBarDebugPositionConfigModule = require(robloxGui.Modules.Flags.FFlagVRBottomBarDebugPositionConfig)
local fIntVRBottomBarPositionOffsetVerticalNumberModule = require(robloxGui.Modules.Flags.FIntVRBottomBarPositionOffsetVerticalNumber)
local fIntVRBottomBarPositionOffsetDepthNumberModule = require(robloxGui.Modules.Flags.FIntVRBottomBarPositionOffsetDepthNumber)
local isSpatialRobloxGuiEnabledModule = require(robloxGui.Modules.VR.IsSpatialRobloxGuiEnabled)
local splashScreenManager = require(corePackagesService.Workspace.Packages.SplashScreenManager).SplashScreenManager
local var38 = (require(robloxGui.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01
local fixVRBottomBarAnalytics = game:DefineFastFlag("FixVRBottomBarAnalytics", false)

local function _(p0) --[[ line: 105 | named "safeRequire" ]]
	local ok, status = pcall(require, p0)
	
	if ok then
		return status
	end
	warn("Failure to Start CoreScript module " .. p0.Name .. ".\n" .. status)
end

local t = {
	Y = fIntVRBottomBarPositionOffsetVerticalNumberModule / 100,
	Z = fIntVRBottomBarPositionOffsetDepthNumberModule / 100
}
local _ = 0.2 + t.Z / 10
local t_1 = {
	Default = { dampingRatio = 1, frequency = 4.5 },
	Slower = { dampingRatio = 1, frequency = 0.66 }
}
local t_2 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_menu.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_menu.png",
	onActivated = function() --[[ line: 140 ]]
		-- upvalues: VRHub (ref), inGameMenuInitModule (ref), inGameMenuConstantsModule (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		VRHub:SetShowTopBar(true)
		
		if inGameMenuInitModule.getOpen() then
			inGameMenuInitModule.closeInGameMenu()
		else
			inGameMenuInitModule.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
			VRHub:SetShowMoreMenu(false)
		end
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.MainMenu,
				isToggleOn = inGameMenuInitModule.getOpen(),
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-MainMenu")
	end
}
local t_3 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_maximize.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_minimize.png",
	onActivated = function() --[[ line: 164 ]]
		-- upvalues: VRHub (ref), inGameMenuInitModule (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		if VRHub.ShowTopBar then
			VRHub:SetShowTopBar(false)
			inGameMenuInitModule.closeInGameMenu()
		else
			VRHub:SetShowTopBar(false)
			VRHub:SetShowTopBar(true)
		end
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.ToggleGui,
				isToggleOn = VRHub.ShowTopBar,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-ToggleGui")
	end
}
local t_4 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	onActivated = function() --[[ line: 189 ]]
		-- upvalues: fFlagEnableNewBackpack (ref), VRHub (ref), var29 (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), var30 (ref), rbxAnalyticsService (ref)
		if fFlagEnableNewBackpack then
			if VRHub.ShowTopBar then
				var29.toggleVisibility(var29.FeatureName.Backpack)
			else
				VRHub:SetShowTopBar(true)
				var29.setVisibility(var29.FeatureName.Backpack, true)
			end
			if fixVRBottomBarAnalytics then
				VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
					integrationId = VRBottomBarTypeModule.ButtomName.Inventory,
					isToggleOn = var29.getVisibility(var29.FeatureName.Backpack),
					source = VRBottomBarTypeModule.Source.MoreSubMenu
				})
			end
		elseif VRHub.ShowTopBar then
			var30.OpenClose()
		else
			VRHub:SetShowTopBar(true)
			
			if not var30.IsOpen then
				var30.OpenClose()
			end
		end
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Inventory,
				isToggleOn = var30.IsOpen,
				source = VRBottomBarTypeModule.Source.MoreSubMenu
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-Backpack")
	end
}
local t_5 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	onActivated = function() --[[ line: 229 ]]
		-- upvalues: VRHub (ref), playerListManagerModule (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		if VRHub.ShowTopBar then
			playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
		else
			VRHub:SetShowTopBar(true)
			
			if not playerListManagerModule:GetSetVisible() then
				playerListManagerModule:SetVisibility(true)
			end
		end
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Leaderboard,
				isToggleOn = playerListManagerModule:GetSetVisible(),
				source = VRBottomBarTypeModule.Source.MoreSubMenu
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-PlayerList")
	end
}
local t_6 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	onActivated = function() --[[ line: 255 ]]
		-- upvalues: VRHub (ref), emotesMenuMasterModule (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		if not VRHub.ShowTopBar then
			VRHub:SetShowTopBar(true)
			
			if not emotesMenuMasterModule:isOpen() then
				emotesMenuMasterModule:open()
			end
		elseif emotesMenuMasterModule:isOpen() then
			emotesMenuMasterModule:close()
		else
			emotesMenuMasterModule:open()
		end
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Emotes,
				isToggleOn = emotesMenuMasterModule:isOpen(),
				source = VRBottomBarTypeModule.Source.MoreSubMenu
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-Emotes")
	end
}
local t_7 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_chat.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_chat.png",
	onActivated = function() --[[ line: 285 ]]
		-- upvalues: VRHub (ref), chatSelectorModule (ref), gameSettings (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		if VRHub.ShowTopBar then
			chatSelectorModule:ToggleVisibility()
			gameSettings.ChatVisible = chatSelectorModule:GetVisibility()
		else
			VRHub:SetShowTopBar(true)
			
			if not chatSelectorModule:GetVisibility() then
				chatSelectorModule:ToggleVisibility()
				gameSettings.ChatVisible = chatSelectorModule:GetVisibility()
			end
		end
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Chat,
				isToggleOn = gameSettings.ChatVisible,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-Chat")
	end
}
local t_8 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_on.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_on.png",
	onActivated = function() --[[ line: 313 ]]
		-- upvalues: VRHub (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		VRHub:ToggleSafetyBubble()
		
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Safety,
				isToggleOn = VRHub.SafetyBubble.enabled,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-Safety")
	end
}
local t_9 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_off.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_off.png",
	onActivated = function() --[[ line: 331 ]]
		-- upvalues: VRHub (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		VRHub:ToggleSafetyBubble()
		
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Safety,
				isToggleOn = VRHub.SafetyBubble.enabled,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-Safety")
	end
}
local t_10 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_leave.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_leave.png",
	onActivated = function() --[[ line: 349 ]]
		-- upvalues: VRHub (ref), inGameMenuInitModule (ref), inGameMenuConstantsModule (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		VRHub:SetShowTopBar(true)
		VRHub:SetShowMoreMenu(false)
		
		if inGameMenuInitModule then
			if not inGameMenuInitModule.getOpen() then
				inGameMenuInitModule.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
			end
			inGameMenuInitModule.openGameLeavePage()
		end
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Leave,
				isToggleOn = inGameMenuInitModule.getOpen(),
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-LeaveGame")
	end
}
local t_11 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png",
	onActivated = t_10.onActivated
}
local t_12 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_more.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_more.png",
	onActivated = function() --[[ line: 381 ]]
		-- upvalues: VRHub (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref)
		VRHub:SetShowTopBar(true)
		VRHub:SetShowMoreMenu(not VRHub.ShowMoreMenu)
		
		if fixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.MoreSubMenu,
				isToggleOn = VRHub.ShowMoreMenu,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-More")
	end
}
local t_13 = {
	iconComponent = VRBarSeparatorModule,
	itemSize = UDim2.new(0, 28, 0, 44)
}
local t_14 = {
	icon = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Emotes"),
	onActivated = function() --[[ line: 405 ]]
		-- upvalues: t_6 (ref), rbxAnalyticsService (ref)
		t_6.onActivated()
		rbxAnalyticsService:ReportCounter("VR-BottomBar-MoreMenu-Emotes")
	end
}
local t_15 = {
	icon = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Leaderboard"),
	onActivated = function() --[[ line: 414 ]]
		-- upvalues: t_5 (ref), rbxAnalyticsService (ref)
		t_5.onActivated()
		rbxAnalyticsService:ReportCounter("VR-BottomBar-MoreMenu-PlayerList")
	end
}
local t_16 = {
	icon = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Inventory"),
	onActivated = function() --[[ line: 423 ]]
		-- upvalues: t_4 (ref), rbxAnalyticsService (ref)
		t_4.onActivated()
		rbxAnalyticsService:ReportCounter("VR-BottomBar-MoreMenu-Backpack")
	end
}
local t_17 = {
	text = "Join Voice",
	iconOn = images["icons/controls/publicAudioJoin"],
	iconOff = images["icons/controls/publicAudioJoin"],
	onActivated = function() --[[ line: 433 ]]
		-- upvalues: default (ref), constantsModule (ref), enableJoinVoiceVrTelemetry (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref)
		default.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		default:JoinVoice()
		
		if enableJoinVoiceVrTelemetry then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.JoinVoice,
				isToggleOn = default:ShouldShowJoinVoice(),
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
	end
}

local _ = function(value) --[[ line: 448 | named "roundOffset" ]]
	return if value >= 0 then math.floor(value * 10 + 0.5) / 10 else math.ceil(value * 10 - 0.5) / 10
end

function topBarApp.init(p1) --[[ line: 453 ]]
	-- upvalues: t (ref), var38 (ref), VRService (ref), robloxGui (ref), roactModule (ref), splashScreenManager (ref), reactModule (ref), VRBarVoiceIconModule (ref), cryoModule (ref), playersService (ref), fixVRBottomBarAnalytics (ref), VRBottomBarAnalyticsModule (ref), VRBottomBarTypeModule (ref), rbxAnalyticsService (ref), t_2 (ref), t_13 (ref), t_3 (ref), t_10 (ref), isSpatialRobloxGuiEnabledModule (ref), VRHub (ref), VRUtil (ref), otterModule (ref), t_1 (ref), fFlagVRBottomBarDebugPositionConfigModule (ref)
	local var59
	local t_4 = {
		moreMenuOpen = false,
		vrMenuOpen = true,
		lookAway = false,
		yOffset = t.Y * var38,
		zOffset = t.Z * var38
	}
	
	if VRService.VREnabled then
		local userGui = robloxGui.Modules.VR.UserGui
		local ok, status = pcall(require, userGui)
		
		if ok then
			var59 = status
		else
			warn("Failure to Start CoreScript module " .. userGui.Name .. ".\n" .. status)
			var59 = nil
		end
		var59 = var59 or roactModule.None
	end
	t_4.userGui = var59
	t_4.hidden = not splashScreenManager.isFPSAtTarget()
	p1:setState(t_4)
	p1.backpackHasItems = false
	p1.emotesLoaded = false
	
	function p1.onTargetFPSSTateChange(p2) --[[ line: 467 ]]
		-- upvalues: p1 (ref)
		p1:setState({ hidden = not p2 })
	end
	
	splashScreenManager.addStatusChangeListener(p1.onTargetFPSSTateChange)
	
	function p1.getVoiceIcon() --[[ line: 472 ]]
		-- upvalues: reactModule (copy), VRBarVoiceIconModule (copy), cryoModule (copy), playersService (copy), p1 (ref), fixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), rbxAnalyticsService (copy)
		return {
			iconImageComponent = function(p3) --[[ line: 474 ]]
				-- upvalues: reactModule (copy), VRBarVoiceIconModule (copy), cryoModule (copy), playersService (copy)
				return reactModule.createElement(VRBarVoiceIconModule, cryoModule.Dictionary.join(p3, {
					iconStyle = "MicLight",
					userId = tostring(playersService.LocalPlayer.UserId)
				}))
			end,
			onActivated = function() --[[ line: 483 ]]
				-- upvalues: p1 (copy), fixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), rbxAnalyticsService (copy)
				if p1.props.voiceState == Enum.VoiceChatState.Failed then
					p1.props.voiceChatServiceManager:RejoinPreviousChannel()
				else
					p1.props.voiceChatServiceManager:ToggleMic("VRBottomBar")
				end
				if fixVRBottomBarAnalytics then
					VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
						integrationId = VRBottomBarTypeModule.ButtomName.Voice,
						isToggleOn = p1.props.voiceState == Enum.VoiceChatState.Joined,
						source = VRBottomBarTypeModule.Source.VRBottomBar
					})
				end
				rbxAnalyticsService:ReportCounter("VR-BottomBar-Voice")
			end
		}
	end
	
	function p1.getDebugYOffsetUp() --[[ line: 508 ]]
		-- upvalues: p1 (ref)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_up.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_up.png",
			onActivated = function() --[[ line: 512 ]]
				-- upvalues: p1 (copy)
				p1:setState({ yOffset = p1.state.yOffset + 0.1 })
			end
		}
	end
	
	function p1.getDebugYOffsetDown() --[[ line: 521 ]]
		-- upvalues: p1 (ref)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_down.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_down.png",
			onActivated = function() --[[ line: 525 ]]
				-- upvalues: p1 (copy)
				p1:setState({ yOffset = p1.state.yOffset - 0.1 })
			end
		}
	end
	
	function p1.getDebugZOffsetUp() --[[ line: 534 ]]
		-- upvalues: p1 (ref)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_left.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_left.png",
			onActivated = function() --[[ line: 538 ]]
				-- upvalues: p1 (copy)
				p1:setState({ zOffset = p1.state.zOffset + 0.1 })
			end
		}
	end
	
	function p1.getDebugZOffsetDown() --[[ line: 547 ]]
		-- upvalues: p1 (ref)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_right.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_right.png",
			onActivated = function() --[[ line: 551 ]]
				-- upvalues: p1 (copy)
				p1:setState({ zOffset = p1.state.zOffset - 0.1 })
			end
		}
	end
	
	function p1.getDebugTextLabel() --[[ line: 560 ]]
		-- upvalues: p1 (ref), roactModule (copy)
		return {
			iconComponent = function(p4) --[[ line: 562 ]]
				-- upvalues: p1 (copy), roactModule (copy)
				local yOffset = p1.state.yOffset
				local zOffset = p1.state.zOffset
				
				return roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "Y " .. (if yOffset >= 0 then math.floor(yOffset * 10 + 0.5) / 10 else math.ceil(yOffset * 10 - 0.5) / 10) .. ", Z " .. (if zOffset >= 0 then math.floor(zOffset * 10 + 0.5) / 10 else math.ceil(zOffset * 10 - 0.5) / 10),
					TextColor3 = Color3.new(1, 1, 1),
					TextWrapped = true,
					TextScaled = true,
					Size = UDim2.fromScale(1, 1),
					[roactModule.Children] = p4[roactModule.Children]
				})
			end,
			itemSize = UDim2.new(0, 44, 0, 44)
		}
	end
	
	p1:setState({
		itemList = {
			t_2,
			t_13,
			t_3,
			t_13,
			t_10
		},
		moreItemList = {}
	})
	
	function p1.onShowTopBarChanged() --[[ line: 585 ]]
		-- upvalues: isSpatialRobloxGuiEnabledModule (copy), VRHub (copy), p1 (ref)
		if isSpatialRobloxGuiEnabledModule then return end
		if not VRHub.ShowTopBar then
			VRHub:SetShowMoreMenu(false)
		end
		p1:setState({ vrMenuOpen = VRHub.ShowTopBar })
	end
	
	function p1.onShowMoreMenuChanged() --[[ line: 597 ]]
		-- upvalues: p1 (ref), VRHub (copy)
		p1:setState({ moreMenuOpen = VRHub.ShowMoreMenu })
	end
	
	function p1.updateItemListState() --[[ line: 603 ]]
		-- upvalues: p1 (ref)
		local var62, var63 = p1:updateItems()
		p1:setState({ itemList = var62, moreItemList = var63 })
	end
	
	function p1.onBackpackItemAdded() --[[ line: 611 ]]
		-- upvalues: p1 (ref)
		if not p1.backpackHasItems then
			p1.backpackHasItems = true
			p1.updateItemListState()
		end
	end
	
	function p1.onBackpackEmpty() --[[ line: 618 ]]
		-- upvalues: p1 (ref)
		if p1.backpackHasItems then
			p1.backpackHasItems = false
			p1.updateItemListState()
		end
	end
	
	function p1.onEmotesLoaded(p5) --[[ line: 625 ]]
		-- upvalues: p1 (ref)
		if p5 ~= p1.emotesLoaded then
			p1.emotesLoaded = p5
			p1.updateItemListState()
		end
	end
	
	function p1.onVREnabledChanged() --[[ line: 632 ]]
		-- upvalues: p1 (ref), VRService (copy), robloxGui (copy), roactModule (copy)
		local var65
		local t = {}
		
		if VRService.VREnabled then
			local userGui = robloxGui.Modules.VR.UserGui
			local ok, status = pcall(require, userGui)
			
			if ok then
				var65 = status
			else
				warn("Failure to Start CoreScript module " .. userGui.Name .. ".\n" .. status)
				var65 = nil
			end
			var65 = var65 or roactModule.None
		end
		t.userGui = var65
		p1:setState(t)
	end
	
	function p1.onRenderStepped() --[[ line: 638 ]]
		-- upvalues: VRUtil (copy), p1 (ref)
		local var66 = VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).LookVector.Y > -0.2
		
		if p1.state.lookAway ~= var66 then
			p1:setState({ lookAway = var66 })
		end
	end
	
	local var60, var61 = roactModule.createBinding(0)
	p1.fadeTransparency = var60
	p1.setFadeTransparency = var61
	p1.fadeTransparencyMotor = otterModule.createSingleMotor(p1.fadeTransparency:getValue())
	p1.fadeTransparencyMotor:onStep(p1.setFadeTransparency)
	p1.fadeTransparencyMotor:setGoal(otterModule.spring(0, t_1.Default))
	
	function p1.getAlignedPanelPart() --[[ line: 653 ]]
		-- upvalues: p1 (ref)
		local var67 = if p1.state.userGui then p1.state.userGui:getPanel() else nil
		local var68 = var67 and var67:GetPart()
		local var69 = var68
		
		if var69 and not var67:IsPositionLockedType() then
			var69 = var67:IsUIManagerManagedType() and (var67:IsVisible() or var67.alwaysUpdatePosition)
		end
		if var69 then
			return var68
		end
	end
	
	function p1.bottomBarPanelOffsetCallback(p6) --[[ line: 664 ]]
		-- upvalues: p1 (ref), VRUtil (copy)
		local finalPosition = p6.finalPosition
		local cameraHeadScale = p6.cameraHeadScale
		local alignedPanelPart = p1.getAlignedPanelPart()
		
		if alignedPanelPart then
			local var71 = alignedPanelPart.CFrame:ToWorldSpace(CFrame.new(0, 0, p1.state.zOffset * cameraHeadScale - alignedPanelPart.Size.Z * 0.5))
			finalPosition = Vector3.new(var71.Position.X, VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position.Y + p1.state.yOffset * cameraHeadScale, var71.Position.Z)
		end
		return finalPosition
	end
	
	function p1.moreMenuPanelOffsetCallback(p7) --[[ line: 687 ]]
		-- upvalues: p1 (ref), VRUtil (copy), var38 (copy), fFlagVRBottomBarDebugPositionConfigModule (copy)
		local finalPosition = p7.finalPosition
		local cameraHeadScale = p7.cameraHeadScale
		local alignedPanelPart = p1.getAlignedPanelPart()
		
		if alignedPanelPart then
			local var73 = (0.2 + p1.state.zOffset / 10) * var38
			finalPosition = (CFrame.new(CFrame.new(p1.bottomBarPanelOffsetCallback(p7), VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position):ToWorldSpace(CFrame.new(-(if fFlagVRBottomBarDebugPositionConfigModule then (#p1.state.itemList - 3) / 2 * var73 else (#p1.state.itemList - 2.5) / 2 * var73) * cameraHeadScale, var73 / 2 * cameraHeadScale, -0.025)).Position) * alignedPanelPart.CFrame.Rotation):ToWorldSpace(CFrame.new(0, #p1.state.moreItemList * var73 / 2 * cameraHeadScale, 0.025)).Position
		end
		return finalPosition
	end
	
	function p1.moreMenuPanelTiltCallback(p8) --[[ line: 716 ]]
		-- upvalues: p1 (ref)
		local panelCFrame = p8.panelCFrame
		local alignedPanelPart = p1.getAlignedPanelPart()
		
		if alignedPanelPart then
			panelCFrame = CFrame.new(panelCFrame.Position) * alignedPanelPart.CFrame.Rotation
		end
		return panelCFrame
	end
end

function topBarApp.didMount(p9) --[[ line: 727 ]]
	-- upvalues: emotesMenuMasterModule (ref), var30 (ref)
	p9.emotesLoaded = emotesMenuMasterModule:isEmotesLoaded()
	p9.backpackHasItems = var30.IsInventoryEmpty()
	p9.updateItemListState()
end

function topBarApp.updateItems(p10) --[[ line: 734 ]]
	-- upvalues: starterGuiService (ref), isSpatialRobloxGuiEnabledModule (ref), t_2 (ref), t_13 (ref), fFlagVRBottomBarDebugPositionConfigModule (ref), t_3 (ref), starterPlayerService (ref), t_7 (ref), getFFlagEnableVrVoiceConnectDisconnect (ref), default (ref), t_17 (ref), getFFlagEnableVrVoiceParity (ref), VRHub (ref), t_8 (ref), t_9 (ref), t_11 (ref), t_10 (ref), t_14 (ref), t_15 (ref), t_16 (ref), t_12 (ref)
	local backpackCoreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
	local emotesMenuCoreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu)
	local chatCoreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Chat)
	local playerListCoreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	local var79 = if isSpatialRobloxGuiEnabledModule then if fFlagVRBottomBarDebugPositionConfigModule then {
		p10.getDebugYOffsetUp(), p10.getDebugYOffsetDown(), p10.getDebugZOffsetUp(),
		p10.getDebugZOffsetDown(), p10.getDebugTextLabel(), t_13, t_2, t_13
	} else { t_2, t_13 } elseif fFlagVRBottomBarDebugPositionConfigModule then {
		p10.getDebugYOffsetUp(), p10.getDebugYOffsetDown(), p10.getDebugZOffsetUp(),
		p10.getDebugZOffsetDown(), p10.getDebugTextLabel(), t_13, t_2, t_13, t_3
	} else { t_2, t_13, t_3 }
	local var80 = emotesMenuCoreGuiEnabled
	
	if var80 then
		var80 = not (starterPlayerService.UserEmotesEnabled and p10.emotesLoaded == false)
	end
	local backpackHasItems = backpackCoreGuiEnabled and p10.backpackHasItems
	
	if chatCoreGuiEnabled then
		table.insert(var79, t_7)
	end
	if getFFlagEnableVrVoiceConnectDisconnect() and default:ShouldShowJoinVoiceOnDisconnect() then
		table.insert(var79, t_17)
	elseif getFFlagEnableVrVoiceParity() and default:ShouldShowJoinVoice() then
		table.insert(var79, t_17)
	end
	if p10.props.voiceEnabled then
		table.insert(var79, p10.getVoiceIcon())
	end
	table.insert(var79, t_13)
	
	if VRHub.SafetyBubble and VRHub.SafetyBubble.enabled then
		table.insert(var79, t_8)
	else
		table.insert(var79, t_9)
	end
	if VRHub.ShowHighlightedLeaveGameIcon then
		table.insert(var79, t_11)
	else
		table.insert(var79, t_10)
	end
	local t = {}
	
	if var80 then
		table.insert(t, t_14)
	end
	if playerListCoreGuiEnabled then
		table.insert(t, t_15)
	end
	if backpackHasItems then
		table.insert(t, t_16)
	end
	if #t > 0 then
		table.insert(var79, t_12)
	end
	return var79, t
end

function topBarApp.renderWithStyle(p11, p12) --[[ line: 824 ]]
	-- upvalues: var38 (ref), fFlagVRBottomBarDebugPositionConfigModule (ref), roactModule (ref), panel3D (ref), isSpatialRobloxGuiEnabledModule (ref), constants_1 (write), constants (ref), enableVRBottomBarWorksBehindObjectsEngineFeature (ref), guiService (ref), registerRoactPanel (write), panelType (write), UIManager (write), systemBar (ref), placement (ref), baseMenu (ref), imageSetLabel (ref), externalEventConnection (ref), VRHub (ref), starterGuiService (ref), var30 (ref), emotesMenuMasterModule (ref), runService (ref), VRService (ref)
	local var83 = (0.2 + p11.state.zOffset / 10) * var38
	local itemList = p11.state.itemList
	local moreItemList = p11.state.moreItemList
	local var84 = if fFlagVRBottomBarDebugPositionConfigModule then 7 else 1
	
	if not p11.state.vrMenuOpen then
		var84 = if fFlagVRBottomBarDebugPositionConfigModule then 9 else 3
	elseif p11.state.moreMenuOpen and #moreItemList > 0 then
		var84 = #itemList
	end
	return roactModule.createFragment({
		BottomBarPanel3D = roactModule.createElement(panel3D, {
			panelName = "BottomBar",
			lerp = true,
			tilt = 0,
			faceCamera = true,
			curvature = 0,
			zOffset = 1,
			partSize = if isSpatialRobloxGuiEnabledModule then Vector2.new((#itemList - 1) * constants_1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, constants_1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale) else Vector2.new((#itemList - 1) * var83, var83),
			virtualScreenSize = Vector2.new((#itemList - 1) * 50, 50),
			offset = p11.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0),
			offsetCallback = p11.bottomBarPanelOffsetCallback,
			anchoring = if isSpatialRobloxGuiEnabledModule then constants.AnchoringTypes.PanelManaged else constants.AnchoringTypes.Head,
			alwaysOnTop = if enableVRBottomBarWorksBehindObjectsEngineFeature then true else nil,
			parent = if enableVRBottomBarWorksBehindObjectsEngineFeature then guiService.CoreGuiFolder else nil,
			connectPanelManagerFunction = if isSpatialRobloxGuiEnabledModule then function(p13) --[[ line: 861 ]]
				-- upvalues: registerRoactPanel (copy), panelType (copy), UIManager (copy)
				if p13 then
					registerRoactPanel(p13, panelType.BottomBar)
					
					return
				end
				UIManager.getInstance():removeRoactPanel(panelType.BottomBar)
			end else nil
		}, {
			CanvasGroup = roactModule.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				GroupTransparency = p11.fadeTransparency,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				SystemBar = roactModule.createElement(systemBar, {
					layoutOrder = 1,
					roundCorners = true,
					buttonStroke = true,
					bgTransparency = 0,
					itemList = itemList,
					selection = var84,
					placement = placement.Bottom,
					hidden = p11.state.hidden,
					onSafeAreaChanged = function() --[[ line: 881 ]] end,
					size = UDim2.new(1, 0, 1, 0),
					position = UDim2.new(),
					sortOrder = Enum.SortOrder.LayoutOrder
				})
			})
		}),
		MoreMenuPanel3D = p11.state.moreMenuOpen and roactModule.createElement(panel3D, {
			panelName = "MoreMenu",
			lerp = true,
			tilt = 0,
			faceCamera = true,
			zOffset = 2,
			partSize = if isSpatialRobloxGuiEnabledModule then Vector2.new(5 * constants_1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, #moreItemList * constants_1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale) else Vector2.new(5 * var83, #moreItemList * var83),
			virtualScreenSize = Vector2.new(250, #moreItemList * 56 + 8),
			offset = p11.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0),
			offsetCallback = p11.moreMenuPanelOffsetCallback,
			tiltCallback = p11.moreMenuPanelTiltCallback,
			anchoring = if isSpatialRobloxGuiEnabledModule then constants.AnchoringTypes.PanelManaged else constants.AnchoringTypes.Head,
			alwaysOnTop = if enableVRBottomBarWorksBehindObjectsEngineFeature then true else nil,
			parent = if enableVRBottomBarWorksBehindObjectsEngineFeature then guiService.CoreGuiFolder else nil,
			connectPanelManagerFunction = if isSpatialRobloxGuiEnabledModule then function(p14) --[[ line: 913 ]]
				-- upvalues: registerRoactPanel (copy), panelType (copy), UIManager (copy)
				if p14 then
					registerRoactPanel(p14, panelType.MoreMenu)
					
					return
				end
				UIManager.getInstance():removeRoactPanel(panelType.MoreMenu)
			end else nil
		}, {
			Content = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				MoreMenu = roactModule.createElement(baseMenu, {
					anchorPoint = Vector2.new(0.5, 1),
					buttonProps = moreItemList,
					position = UDim2.new(0.5, 0, 1, -8),
					background = p12.Theme.BackgroundContrast
				}),
				Caret = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/MenuBar/dropdown-arrow.png",
					AnchorPoint = Vector2.new(0.5, 1),
					ImageColor3 = Color3.fromRGB(25, 27, 29),
					Position = UDim2.new(0.5, 0, 1, 0),
					Size = UDim2.new(0, 24, 0, 10)
				})
			})
		}),
		ShowHighlightedLeaveGameIconToggled = roactModule.createElement(externalEventConnection, {
			event = VRHub.ShowHighlightedLeaveGameIconToggled.Event,
			callback = p11.updateItemListState
		}),
		ShowTopBarChanged = roactModule.createElement(externalEventConnection, {
			event = VRHub.ShowTopBarChanged.Event,
			callback = p11.onShowTopBarChanged
		}),
		ShowMoreMenuChanged = roactModule.createElement(externalEventConnection, {
			event = VRHub.ShowMoreMenuChanged.Event,
			callback = p11.onShowMoreMenuChanged
		}),
		CoreGuiChanged = roactModule.createElement(externalEventConnection, {
			event = starterGuiService.CoreGuiChangedSignal,
			callback = p11.updateItemListState
		}),
		SafetyBubbleToggled = VRHub.SafetyBubble and roactModule.createElement(externalEventConnection, {
			event = VRHub.SafetyBubble.Toggled.Event,
			callback = p11.updateItemListState
		}),
		BackpackItemAdded = roactModule.createElement(externalEventConnection, {
			event = var30.BackpackItemAdded.Event,
			callback = p11.onBackpackItemAdded
		}),
		BackpackEmpty = roactModule.createElement(externalEventConnection, {
			event = var30.BackpackEmpty.Event,
			callback = p11.onBackpackEmpty
		}),
		EmotesLoaded = roactModule.createElement(externalEventConnection, {
			event = emotesMenuMasterModule.EmotesLoaded.Event,
			callback = p11.onEmotesLoaded
		}),
		RenderStepped = roactModule.createElement(externalEventConnection, {
			event = runService.RenderStepped,
			callback = p11.onRenderStepped
		}),
		VREnabled = roactModule.createElement(externalEventConnection, {
			event = VRService:GetPropertyChangedSignal("VREnabled"),
			callback = p11.onVREnabledChanged
		})
	})
end

function topBarApp.render(p15) --[[ line: 987 ]]
	-- upvalues: withStyle (ref)
	return withStyle(function(p16) --[[ line: 988 ]]
		-- upvalues: p15 (ref)
		return p15:renderWithStyle(p16)
	end)
end

function topBarApp.didUpdate(p17, p18, p19) --[[ line: 993 ]]
	-- upvalues: otterModule (ref), t_1 (ref), VRHub (ref)
	if p19.lookAway ~= p17.state.lookAway or p19.vrMenuOpen ~= p17.state.vrMenuOpen then
		if not p17.state.vrMenuOpen and p17.state.lookAway then
			p17.fadeTransparencyMotor:setGoal(otterModule.spring(1, t_1.Slower))
		else
			p17.fadeTransparencyMotor:setGoal(otterModule.spring(0, t_1.Default))
		end
	end
	if p17.state.moreMenuOpen and #p17.state.moreItemList == 0 then
		VRHub:SetShowMoreMenu(false)
	end
	if p18.voiceEnabled ~= p17.props.voiceEnabled then
		p17.updateItemListState()
		
		return
	elseif p19.yOffset ~= p17.state.yOffset or p19.zOffset ~= p17.state.zOffset then
		p17.updateItemListState()
	end
end

function topBarApp.willUnmount(p20) --[[ line: 1015 ]]
	p20.fadeTransparencyMotor:stop()
end

return roactRoduxModule.UNSTABLE_connect2(nil, nil)(topBarApp)