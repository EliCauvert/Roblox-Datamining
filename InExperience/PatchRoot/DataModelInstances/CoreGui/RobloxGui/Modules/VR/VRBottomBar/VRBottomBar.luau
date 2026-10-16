local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = game:GetService("TelemetryService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local CryoModule = require(CorePackages.Packages.Cryo)
local OtterModule = require(CorePackages.Packages.Otter)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local SystemBar = UIBloxModule.App.Navigation.SystemBar
local Placement = UIBloxModule.App.Navigation.Enum.Placement
local Panel3D = UIBloxModule.Core.VR.Panel3D
local Constants = UIBloxModule.Core.VR.Constants
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local VRUtil = require(CorePackages.Workspace.Packages.VrCommon).VRUtil
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local GetFFlagEnableVrVoiceParityFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity
local GetFFlagEnableVrVoiceConnectDisconnectFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceConnectDisconnect
local EnableJoinVoiceVrTelemetry = game:DefineFastFlag("EnableJoinVoiceVrTelemetry", false)
local PanelType = nil
local RegisterRoactPanelFunction = nil
local UIManager = nil
local Constants1 = nil

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify then
	local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
	Constants1 = VrSpatialUiModule.Constants
	PanelType = Constants1.PanelType
	RegisterRoactPanelFunction = VrSpatialUiModule.registerRoactPanel
	UIManager = VrSpatialUiModule.UIManager
else
	local UIManager1 = RobloxGui:WaitForChild("Modules"):WaitForChild("UIManager")
	PanelType = require(UIManager1.Constants).PanelType
	RegisterRoactPanelFunction = require(UIManager1.registerRoactPanel)
	UIManager = require(UIManager1.UIManager)
	Constants1 = require(UIManager1.Constants)
end
local InGameMenuConstantsModule = require(RobloxGui.Modules.InGameMenuConstants)
local GameSettings = UserSettings().GameSettings
local InGameMenuInitModule = require(RobloxGui.Modules.InGameMenuInit)
local ChatSelectorModule = require(RobloxGui.Modules.ChatSelector)
local TopBarApp = RoactModule.PureComponent:extend("TopBarApp")
local VRBarVoiceIconModule = require(script.Parent.VRBarVoiceIcon)
local VRBottomBarAnalyticsModule = require(script.Parent.VRBottomBarAnalytics)
local VRBottomBarTypeModule = require(script.Parent.VRBottomBarType)
local EmotesMenuMasterModule = require(RobloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local BackpackModule = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.Backpack) else require(RobloxGui.Modules.BackpackScript)
local PlayerListManagerModule = require(RobloxGui.Modules.PlayerList.PlayerListManager)
local StarterPlayer = game:GetService("StarterPlayer")
local EnableVRBottomBarWorksBehindObjectsEngineFeature = game:GetEngineFeature("EnableVRBottomBarWorksBehindObjects")
local FFlagVRBottomBarDebugPositionConfigModule = require(RobloxGui.Modules.Flags.FFlagVRBottomBarDebugPositionConfig)
local IsSpatialRobloxGuiEnabledModule = require(RobloxGui.Modules.VR.IsSpatialRobloxGuiEnabled)
local SplashScreenManager = require(CorePackages.Workspace.Packages.SplashScreenManager).SplashScreenManager
local v1 = (require(RobloxGui.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01
local FixVRBottomBarAnalytics = game:DefineFastFlag("FixVRBottomBarAnalytics", false)

local function _(p1) --[[ Line: 105 | Named "safeRequire" ]]
	local Success, Result = pcall(require, p1)
	
	if Success then
		return Result
	else
		warn("Failure to Start CoreScript module " .. p1.Name .. ".\n" .. Result)
	end
end

local config = {
	Y = require(RobloxGui.Modules.Flags.FIntVRBottomBarPositionOffsetVerticalNumber) / 100,
	Z = require(RobloxGui.Modules.Flags.FIntVRBottomBarPositionOffsetDepthNumber) / 100
}
local _ = 0.2 + config.Z / 10
local config1 = {
	Default = { dampingRatio = 1, frequency = 4.5 },
	Slower = { dampingRatio = 1, frequency = 0.66 }
}
local config2 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_menu.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_menu.png",
	onActivated = function() --[[ Line: 140 ]]
		-- upvalues: VRHub (copy), InGameMenuInitModule (copy), InGameMenuConstantsModule (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		VRHub:SetShowTopBar(true)
		
		if InGameMenuInitModule.getOpen() then
			InGameMenuInitModule.closeInGameMenu()
		else
			InGameMenuInitModule.openInGameMenu(InGameMenuConstantsModule.MainPagePageKey)
			VRHub:SetShowMoreMenu(false)
		end
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.MainMenu,
				isToggleOn = InGameMenuInitModule.getOpen(),
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-MainMenu")
	end
}
local config3 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_maximize.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_minimize.png",
	onActivated = function() --[[ Line: 164 ]]
		-- upvalues: VRHub (copy), InGameMenuInitModule (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		if VRHub.ShowTopBar then
			VRHub:SetShowTopBar(false)
			InGameMenuInitModule.closeInGameMenu()
		else
			VRHub:SetShowTopBar(false)
			VRHub:SetShowTopBar(true)
		end
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.ToggleGui,
				isToggleOn = VRHub.ShowTopBar,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-ToggleGui")
	end
}
local config4 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	onActivated = function() --[[ Line: 189 ]]
		-- upvalues: FFlagEnableNewBackpack (copy), VRHub (copy), Features (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), BackpackModule (copy), RbxAnalyticsService (copy)
		if FFlagEnableNewBackpack then
			if VRHub.ShowTopBar then
				Features.toggleVisibility(Features.FeatureName.Backpack)
			else
				VRHub:SetShowTopBar(true)
				Features.setVisibility(Features.FeatureName.Backpack, true)
			end
			if FixVRBottomBarAnalytics then
				VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
					integrationId = VRBottomBarTypeModule.ButtomName.Inventory,
					isToggleOn = Features.getVisibility(Features.FeatureName.Backpack),
					source = VRBottomBarTypeModule.Source.MoreSubMenu
				})
			end
		else
			if VRHub.ShowTopBar then
				BackpackModule.OpenClose()
			else
				VRHub:SetShowTopBar(true)
				
				if not BackpackModule.IsOpen then
					BackpackModule.OpenClose()
				end
			end
			if FixVRBottomBarAnalytics then
				VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
					integrationId = VRBottomBarTypeModule.ButtomName.Inventory,
					isToggleOn = BackpackModule.IsOpen,
					source = VRBottomBarTypeModule.Source.MoreSubMenu
				})
			end
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-Backpack")
	end
}
local config5 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	onActivated = function() --[[ Line: 229 ]]
		-- upvalues: VRHub (copy), PlayerListManagerModule (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		if VRHub.ShowTopBar then
			PlayerListManagerModule:SetVisibility(not PlayerListManagerModule:GetSetVisible())
		else
			VRHub:SetShowTopBar(true)
			
			if not PlayerListManagerModule:GetSetVisible() then
				PlayerListManagerModule:SetVisibility(true)
			end
		end
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Leaderboard,
				isToggleOn = PlayerListManagerModule:GetSetVisible(),
				source = VRBottomBarTypeModule.Source.MoreSubMenu
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-PlayerList")
	end
}
local config6 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	onActivated = function() --[[ Line: 255 ]]
		-- upvalues: VRHub (copy), EmotesMenuMasterModule (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		if VRHub.ShowTopBar then
			if EmotesMenuMasterModule:isOpen() then
				EmotesMenuMasterModule:close()
			else
				EmotesMenuMasterModule:open()
			end
		else
			VRHub:SetShowTopBar(true)
			
			if not EmotesMenuMasterModule:isOpen() then
				EmotesMenuMasterModule:open()
			end
		end
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Emotes,
				isToggleOn = EmotesMenuMasterModule:isOpen(),
				source = VRBottomBarTypeModule.Source.MoreSubMenu
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-Emotes")
	end
}
local config7 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_chat.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_chat.png",
	onActivated = function() --[[ Line: 285 ]]
		-- upvalues: VRHub (copy), ChatSelectorModule (copy), GameSettings (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		if VRHub.ShowTopBar then
			ChatSelectorModule:ToggleVisibility()
			GameSettings.ChatVisible = ChatSelectorModule:GetVisibility()
		else
			VRHub:SetShowTopBar(true)
			
			if not ChatSelectorModule:GetVisibility() then
				ChatSelectorModule:ToggleVisibility()
				GameSettings.ChatVisible = ChatSelectorModule:GetVisibility()
			end
		end
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Chat,
				isToggleOn = GameSettings.ChatVisible,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-Chat")
	end
}
local config8 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_on.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_on.png",
	onActivated = function() --[[ Line: 313 ]]
		-- upvalues: VRHub (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		VRHub:ToggleSafetyBubble()
		
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Safety,
				isToggleOn = VRHub.SafetyBubble.enabled,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-Safety")
	end
}
local config9 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_off.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_off.png",
	onActivated = function() --[[ Line: 331 ]]
		-- upvalues: VRHub (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		VRHub:ToggleSafetyBubble()
		
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Safety,
				isToggleOn = VRHub.SafetyBubble.enabled,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-Safety")
	end
}
local config10 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_leave.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_leave.png",
	onActivated = function() --[[ Line: 349 ]]
		-- upvalues: VRHub (copy), InGameMenuInitModule (copy), InGameMenuConstantsModule (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		VRHub:SetShowTopBar(true)
		VRHub:SetShowMoreMenu(false)
		
		if InGameMenuInitModule then
			if not InGameMenuInitModule.getOpen() then
				InGameMenuInitModule.openInGameMenu(InGameMenuConstantsModule.MainPagePageKey)
			end
			InGameMenuInitModule.openGameLeavePage()
		end
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.Leave,
				isToggleOn = InGameMenuInitModule.getOpen(),
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-LeaveGame")
	end
}
local config11 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png",
	onActivated = config10.onActivated
}
local config12 = {
	iconOn = "rbxasset://textures/ui/MenuBar/icon_more.png",
	iconOff = "rbxasset://textures/ui/MenuBar/icon_more.png",
	onActivated = function() --[[ Line: 381 ]]
		-- upvalues: VRHub (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy)
		VRHub:SetShowTopBar(true)
		VRHub:SetShowMoreMenu(not VRHub.ShowMoreMenu)
		
		if FixVRBottomBarAnalytics then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.MoreSubMenu,
				isToggleOn = VRHub.ShowMoreMenu,
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-More")
	end
}
local config13 = {
	iconComponent = require(script.Parent.VRBarSeparator),
	itemSize = UDim2.new(0, 28, 0, 44)
}
local config14 = {
	icon = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	text = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Emotes"),
	onActivated = function() --[[ Line: 405 ]]
		-- upvalues: config6 (copy), RbxAnalyticsService (copy)
		config6.onActivated()
		RbxAnalyticsService:ReportCounter("VR-BottomBar-MoreMenu-Emotes")
	end
}
local config15 = {
	icon = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	text = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Leaderboard"),
	onActivated = function() --[[ Line: 414 ]]
		-- upvalues: config5 (copy), RbxAnalyticsService (copy)
		config5.onActivated()
		RbxAnalyticsService:ReportCounter("VR-BottomBar-MoreMenu-PlayerList")
	end
}
local config16 = {
	icon = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	text = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Inventory"),
	onActivated = function() --[[ Line: 423 ]]
		-- upvalues: config4 (copy), RbxAnalyticsService (copy)
		config4.onActivated()
		RbxAnalyticsService:ReportCounter("VR-BottomBar-MoreMenu-Backpack")
	end
}
local config17 = {
	text = "Join Voice",
	iconOn = Images["icons/controls/publicAudioJoin"],
	iconOff = Images["icons/controls/publicAudioJoin"],
	onActivated = function() --[[ Line: 433 ]]
		-- upvalues: Default (copy), ConstantsModule (copy), EnableJoinVoiceVrTelemetry (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy)
		Default.pendingConnectionSource = ConstantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		Default:JoinVoice()
		
		if EnableJoinVoiceVrTelemetry then
			VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
				integrationId = VRBottomBarTypeModule.ButtomName.JoinVoice,
				isToggleOn = Default:ShouldShowJoinVoice(),
				source = VRBottomBarTypeModule.Source.VRBottomBar
			})
		end
	end
}

local _ = function(p1: number): number --[[ Line: 448 | Named "roundOffset" ]]
	return p1 >= 0 and math.floor(p1 * 10 + 0.5) / 10 or math.ceil(p1 * 10 - 0.5) / 10
end

function TopBarApp.init(p1) --[[ Line: 453 ]]
	-- upvalues: config (copy), v1 (copy), VRService (copy), RobloxGui (copy), RoactModule (copy), SplashScreenManager (copy), ReactModule (copy), VRBarVoiceIconModule (copy), CryoModule (copy), Players (copy), FixVRBottomBarAnalytics (copy), VRBottomBarAnalyticsModule (copy), VRBottomBarTypeModule (copy), RbxAnalyticsService (copy), config2 (copy), config13 (copy), config3 (copy), config10 (copy), IsSpatialRobloxGuiEnabledModule (copy), VRHub (copy), VRUtil (copy), OtterModule (copy), config1 (copy), FFlagVRBottomBarDebugPositionConfigModule (copy)
	local config4 = {
		moreMenuOpen = false,
		vrMenuOpen = true,
		lookAway = false,
		yOffset = config.Y * v1,
		zOffset = config.Z * v1
	}
	local None = nil
	repeat
		if VRService.VREnabled then
			local UserGui = RobloxGui.Modules.VR.UserGui
			local Success, Result = pcall(require, UserGui)
			
			if Success then
				None = Result
			else
				warn("Failure to Start CoreScript module " .. UserGui.Name .. ".\n" .. Result)
				None = nil
			end
			if None then break end
		end
		None = RoactModule.None
	until true
	config4.userGui = None
	config4.hidden = not SplashScreenManager.isFPSAtTarget()
	p1:setState(config4)
	p1.backpackHasItems = false
	p1.emotesLoaded = false
	
	function p1.onTargetFPSSTateChange(p2) --[[ Line: 467 ]]
		-- upvalues: p1 (copy)
		p1:setState({ hidden = not p2 })
	end
	
	SplashScreenManager.addStatusChangeListener(p1.onTargetFPSSTateChange)
	
	function p1.getVoiceIcon() --[[ Line: 472 ]]
		-- upvalues: ReactModule (upval), VRBarVoiceIconModule (upval), CryoModule (upval), Players (upval), p1 (copy), FixVRBottomBarAnalytics (upval), VRBottomBarAnalyticsModule (upval), VRBottomBarTypeModule (upval), RbxAnalyticsService (upval)
		return {
			iconImageComponent = function(p2) --[[ Line: 474 ]]
				-- upvalues: ReactModule (upval), VRBarVoiceIconModule (upval), CryoModule (upval), Players (upval)
				return ReactModule.createElement(VRBarVoiceIconModule, CryoModule.Dictionary.join(p2, {
					iconStyle = "MicLight",
					userId = tostring(Players.LocalPlayer.UserId)
				}))
			end,
			onActivated = function() --[[ Line: 483 ]]
				-- upvalues: p1 (upval), FixVRBottomBarAnalytics (upval), VRBottomBarAnalyticsModule (upval), VRBottomBarTypeModule (upval), RbxAnalyticsService (upval)
				if p1.props.voiceState == Enum.VoiceChatState.Failed then
					p1.props.voiceChatServiceManager:RejoinPreviousChannel()
				else
					p1.props.voiceChatServiceManager:ToggleMic("VRBottomBar")
				end
				if FixVRBottomBarAnalytics then
					VRBottomBarAnalyticsModule.sendEventToTelemetryV2({
						integrationId = VRBottomBarTypeModule.ButtomName.Voice,
						isToggleOn = p1.props.voiceState == Enum.VoiceChatState.Joined,
						source = VRBottomBarTypeModule.Source.VRBottomBar
					})
				end
				RbxAnalyticsService:ReportCounter("VR-BottomBar-Voice")
			end
		}
	end
	
	function p1.getDebugYOffsetUp() --[[ Line: 508 ]]
		-- upvalues: p1 (copy)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_up.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_up.png",
			onActivated = function() --[[ Line: 512 ]]
				-- upvalues: p1 (upval)
				p1:setState({ yOffset = p1.state.yOffset + 0.1 })
			end
		}
	end
	
	function p1.getDebugYOffsetDown() --[[ Line: 521 ]]
		-- upvalues: p1 (copy)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_down.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_down.png",
			onActivated = function() --[[ Line: 525 ]]
				-- upvalues: p1 (upval)
				p1:setState({ yOffset = p1.state.yOffset - 0.1 })
			end
		}
	end
	
	function p1.getDebugZOffsetUp() --[[ Line: 534 ]]
		-- upvalues: p1 (copy)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_left.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_left.png",
			onActivated = function() --[[ Line: 538 ]]
				-- upvalues: p1 (upval)
				p1:setState({ zOffset = p1.state.zOffset + 0.1 })
			end
		}
	end
	
	function p1.getDebugZOffsetDown() --[[ Line: 547 ]]
		-- upvalues: p1 (copy)
		return {
			iconOn = "rbxasset://textures/ui/MenuBar/arrow_right.png",
			iconOff = "rbxasset://textures/ui/MenuBar/arrow_right.png",
			onActivated = function() --[[ Line: 551 ]]
				-- upvalues: p1 (upval)
				p1:setState({ zOffset = p1.state.zOffset - 0.1 })
			end
		}
	end
	
	function p1.getDebugTextLabel() --[[ Line: 560 ]]
		-- upvalues: p1 (copy), RoactModule (upval)
		return {
			iconComponent = function(p2) --[[ Line: 562 ]]
				-- upvalues: p1 (upval), RoactModule (upval)
				local YOffset: number = p1.state.yOffset
				local ZOffset: number = p1.state.zOffset
				
				return RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "Y " .. (YOffset >= 0 and math.floor(YOffset * 10 + 0.5) / 10 or math.ceil(YOffset * 10 - 0.5) / 10) .. ", Z " .. (ZOffset >= 0 and math.floor(ZOffset * 10 + 0.5) / 10 or math.ceil(ZOffset * 10 - 0.5) / 10),
					TextColor3 = Color3.new(1, 1, 1),
					TextWrapped = true,
					TextScaled = true,
					Size = UDim2.fromScale(1, 1),
					[RoactModule.Children] = p2[RoactModule.Children]
				})
			end,
			itemSize = UDim2.new(0, 44, 0, 44)
		}
	end
	
	p1:setState({
		itemList = {
			config2,
			config13,
			config3,
			config13,
			config10
		},
		moreItemList = {}
	})
	
	function p1.onShowTopBarChanged() --[[ Line: 585 ]]
		-- upvalues: IsSpatialRobloxGuiEnabledModule (upval), VRHub (upval), p1 (copy)
		if IsSpatialRobloxGuiEnabledModule then return end
		if not VRHub.ShowTopBar then
			VRHub:SetShowMoreMenu(false)
		end
		p1:setState({ vrMenuOpen = VRHub.ShowTopBar })
	end
	
	function p1.onShowMoreMenuChanged() --[[ Line: 597 ]]
		-- upvalues: p1 (copy), VRHub (upval)
		p1:setState({ moreMenuOpen = VRHub.ShowMoreMenu })
	end
	
	function p1.updateItemListState() --[[ Line: 603 ]]
		-- upvalues: p1 (copy)
		local UpdateItemsResult, UpdateItemsResult2 = p1:updateItems()
		p1:setState({
			itemList = UpdateItemsResult,
			moreItemList = UpdateItemsResult2
		})
	end
	
	function p1.onBackpackItemAdded() --[[ Line: 611 ]]
		-- upvalues: p1 (copy)
		if not p1.backpackHasItems then
			p1.backpackHasItems = true
			p1.updateItemListState()
		end
	end
	
	function p1.onBackpackEmpty() --[[ Line: 618 ]]
		-- upvalues: p1 (copy)
		if p1.backpackHasItems then
			p1.backpackHasItems = false
			p1.updateItemListState()
		end
	end
	
	function p1.onEmotesLoaded(EmotesLoaded) --[[ Line: 625 ]]
		-- upvalues: p1 (copy)
		if EmotesLoaded ~= p1.emotesLoaded then
			p1.emotesLoaded = EmotesLoaded
			p1.updateItemListState()
		end
	end
	
	function p1.onVREnabledChanged() --[[ Line: 632 ]]
		-- upvalues: p1 (copy), VRService (upval), RobloxGui (upval), RoactModule (upval)
		local t = {}
		local None = nil
		repeat
			if VRService.VREnabled then
				local UserGui = RobloxGui.Modules.VR.UserGui
				local Success, Result = pcall(require, UserGui)
				
				if Success then
					None = Result
				else
					warn("Failure to Start CoreScript module " .. UserGui.Name .. ".\n" .. Result)
					None = nil
				end
				if None then break end
			end
			None = RoactModule.None
		until true
		t.userGui = None
		p1:setState(t)
	end
	
	function p1.onRenderStepped() --[[ Line: 638 ]]
		-- upvalues: VRUtil (upval), p1 (copy)
		local IsYAbove = VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).LookVector.Y > -0.2
		
		if p1.state.lookAway ~= IsYAbove then
			p1:setState({ lookAway = IsYAbove })
		end
	end
	
	p1.fadeTransparency, p1.setFadeTransparency = RoactModule.createBinding(0)
	p1.fadeTransparencyMotor = OtterModule.createSingleMotor(p1.fadeTransparency:getValue())
	p1.fadeTransparencyMotor:onStep(p1.setFadeTransparency)
	p1.fadeTransparencyMotor:setGoal(OtterModule.spring(0, config1.Default))
	
	function p1.getAlignedPanelPart() --[[ Line: 653 ]]
		-- upvalues: p1 (copy)
		local Panel = if p1.state.userGui then p1.state.userGui:getPanel() else nil
		local Part = Panel and Panel:GetPart()
		
		if not Part or not (if Panel:IsPositionLockedType() then Panel:IsVisible() or Panel.alwaysUpdatePosition else Panel:IsUIManagerManagedType() and (Panel:IsVisible() or Panel.alwaysUpdatePosition)) then return end
		return Part
	end
	
	function p1.bottomBarPanelOffsetCallback(p2) --[[ Line: 664 ]]
		-- upvalues: p1 (copy), VRUtil (upval)
		local FinalPosition = p2.finalPosition
		local CameraHeadScale = p2.cameraHeadScale
		local AlignedPanelPart = p1.getAlignedPanelPart()
		
		if AlignedPanelPart then
			local WorldPoint = AlignedPanelPart.CFrame:ToWorldSpace((CFrame.new(0, 0, p1.state.zOffset * CameraHeadScale - AlignedPanelPart.Size.Z * 0.5)))
			FinalPosition = Vector3.new(WorldPoint.Position.X, VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position.Y + p1.state.yOffset * CameraHeadScale, WorldPoint.Position.Z)
		end
		return FinalPosition
	end
	
	function p1.moreMenuPanelOffsetCallback(p2) --[[ Line: 687 ]]
		-- upvalues: p1 (copy), VRUtil (upval), v1 (upval), FFlagVRBottomBarDebugPositionConfigModule (upval)
		local FinalPosition = p2.finalPosition
		local CameraHeadScale = p2.cameraHeadScale
		local AlignedPanelPart = p1.getAlignedPanelPart()
		
		if AlignedPanelPart then
			local ScaledZOffset = (0.2 + p1.state.zOffset / 10) * v1
			FinalPosition = (CFrame.new(CFrame.new(p1.bottomBarPanelOffsetCallback(p2), VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position):ToWorldSpace((CFrame.new(-(FFlagVRBottomBarDebugPositionConfigModule and (#p1.state.itemList - 3) / 2 * ScaledZOffset or (#p1.state.itemList - 2.5) / 2 * ScaledZOffset) * CameraHeadScale, ScaledZOffset / 2 * CameraHeadScale, -0.025))).Position) * AlignedPanelPart.CFrame.Rotation):ToWorldSpace((CFrame.new(0, #p1.state.moreItemList * ScaledZOffset / 2 * CameraHeadScale, 0.025))).Position
		end
		return FinalPosition
	end
	
	function p1.moreMenuPanelTiltCallback(p2) --[[ Line: 716 ]]
		-- upvalues: p1 (copy)
		local PanelCFrame = p2.panelCFrame
		local AlignedPanelPart = p1.getAlignedPanelPart()
		
		if AlignedPanelPart then
			PanelCFrame = CFrame.new(PanelCFrame.Position) * AlignedPanelPart.CFrame.Rotation
		end
		return PanelCFrame
	end
end

function TopBarApp.didMount(p1) --[[ Line: 727 ]]
	-- upvalues: EmotesMenuMasterModule (copy), BackpackModule (copy)
	p1.emotesLoaded = EmotesMenuMasterModule:isEmotesLoaded()
	p1.backpackHasItems = BackpackModule.IsInventoryEmpty()
	p1.updateItemListState()
end

function TopBarApp.updateItems(p1) --[[ Line: 734 ]]
	-- upvalues: StarterGui (copy), IsSpatialRobloxGuiEnabledModule (copy), config2 (copy), config13 (copy), FFlagVRBottomBarDebugPositionConfigModule (copy), config3 (copy), StarterPlayer (copy), config7 (copy), GetFFlagEnableVrVoiceConnectDisconnectFunction (copy), Default (copy), config17 (copy), GetFFlagEnableVrVoiceParityFunction (copy), VRHub (copy), config8 (copy), config9 (copy), config11 (copy), config10 (copy), config14 (copy), config15 (copy), config16 (copy), config12 (copy)
	local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	local List = if IsSpatialRobloxGuiEnabledModule then if FFlagVRBottomBarDebugPositionConfigModule then {
		p1.getDebugYOffsetUp(), p1.getDebugYOffsetDown(), p1.getDebugZOffsetUp(),
		p1.getDebugZOffsetDown(), p1.getDebugTextLabel(), config13, config2, config13
	} else { config2, config13 } elseif FFlagVRBottomBarDebugPositionConfigModule then {
		p1.getDebugYOffsetUp(), p1.getDebugYOffsetDown(), p1.getDebugZOffsetUp(),
		p1.getDebugZOffsetDown(), p1.getDebugTextLabel(), config13, config2,
		config13, config3
	} else { config2, config13, config3 }
	local Inverted: boolean = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu) and not (StarterPlayer.UserEmotesEnabled and p1.emotesLoaded == false)
	local BackpackHasItems = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) and p1.backpackHasItems
	
	if StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Chat) then
		table.insert(List, config7)
	end
	if GetFFlagEnableVrVoiceConnectDisconnectFunction() and Default:ShouldShowJoinVoiceOnDisconnect() then
		table.insert(List, config17)
	elseif GetFFlagEnableVrVoiceParityFunction() and Default:ShouldShowJoinVoice() then
		table.insert(List, config17)
	end
	if p1.props.voiceEnabled then
		table.insert(List, p1.getVoiceIcon())
	end
	table.insert(List, config13)
	
	if VRHub.SafetyBubble and VRHub.SafetyBubble.enabled then
		table.insert(List, config8)
	else
		table.insert(List, config9)
	end
	if VRHub.ShowHighlightedLeaveGameIcon then
		table.insert(List, config11)
	else
		table.insert(List, config10)
	end
	local List1 = {}
	
	if Inverted then
		table.insert(List1, config14)
	end
	if CoreGuiEnabled then
		table.insert(List1, config15)
	end
	if BackpackHasItems then
		table.insert(List1, config16)
	end
	if #List1 > 0 then
		table.insert(List, config12)
	end
	return List, List1
end

function TopBarApp.renderWithStyle(p1, p2) --[[ Line: 824 ]]
	-- upvalues: v1 (copy), FFlagVRBottomBarDebugPositionConfigModule (copy), RoactModule (copy), Panel3D (copy), IsSpatialRobloxGuiEnabledModule (copy), Constants1 (ref), Constants (copy), EnableVRBottomBarWorksBehindObjectsEngineFeature (copy), GuiService (copy), RegisterRoactPanelFunction (ref), PanelType (ref), UIManager (ref), SystemBar (copy), Placement (copy), BaseMenu (copy), ImageSetLabel (copy), ExternalEventConnection (copy), VRHub (copy), StarterGui (copy), BackpackModule (copy), EmotesMenuMasterModule (copy), RunService (copy), VRService (copy)
	local ScaledZOffset = (0.2 + p1.state.zOffset / 10) * v1
	local ItemList = p1.state.itemList
	local MoreItemList = p1.state.moreItemList
	
	return RoactModule.createFragment({
		BottomBarPanel3D = RoactModule.createElement(Panel3D, {
			panelName = "BottomBar",
			lerp = true,
			tilt = 0,
			faceCamera = true,
			curvature = 0,
			zOffset = 1,
			partSize = if IsSpatialRobloxGuiEnabledModule then Vector2.new((#ItemList - 1) * Constants1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, Constants1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale) else Vector2.new((#ItemList - 1) * ScaledZOffset, ScaledZOffset),
			virtualScreenSize = Vector2.new((#ItemList - 1) * 50, 50),
			offset = p1.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0),
			offsetCallback = p1.bottomBarPanelOffsetCallback,
			anchoring = if IsSpatialRobloxGuiEnabledModule then Constants.AnchoringTypes.PanelManaged else Constants.AnchoringTypes.Head,
			alwaysOnTop = if EnableVRBottomBarWorksBehindObjectsEngineFeature then true else nil,
			parent = EnableVRBottomBarWorksBehindObjectsEngineFeature and GuiService.CoreGuiFolder or nil,
			connectPanelManagerFunction = if IsSpatialRobloxGuiEnabledModule then function(p3) --[[ Line: 861 ]]
				-- upvalues: RegisterRoactPanelFunction (upval), PanelType (upval), UIManager (upval)
				if p3 then
					RegisterRoactPanelFunction(p3, PanelType.BottomBar)
					
					return
				else
					UIManager.getInstance():removeRoactPanel(PanelType.BottomBar)
				end
			end else nil
		}, {
			CanvasGroup = RoactModule.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				GroupTransparency = p1.fadeTransparency,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				SystemBar = RoactModule.createElement(SystemBar, {
					layoutOrder = 1,
					roundCorners = true,
					buttonStroke = true,
					bgTransparency = 0,
					itemList = ItemList,
					selection = if p1.state.vrMenuOpen then if p1.state.moreMenuOpen and #MoreItemList > 0 then #ItemList elseif FFlagVRBottomBarDebugPositionConfigModule then 7 else 1 elseif FFlagVRBottomBarDebugPositionConfigModule then 9 else 3,
					placement = Placement.Bottom,
					hidden = p1.state.hidden,
					onSafeAreaChanged = function() --[[ Line: 881 ]] end,
					size = UDim2.new(1, 0, 1, 0),
					position = UDim2.new(),
					sortOrder = Enum.SortOrder.LayoutOrder
				})
			})
		}),
		MoreMenuPanel3D = p1.state.moreMenuOpen and RoactModule.createElement(Panel3D, {
			panelName = "MoreMenu",
			lerp = true,
			tilt = 0,
			faceCamera = true,
			zOffset = 2,
			partSize = if IsSpatialRobloxGuiEnabledModule then Vector2.new(5 * Constants1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, #MoreItemList * Constants1.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale) else Vector2.new(5 * ScaledZOffset, #MoreItemList * ScaledZOffset),
			virtualScreenSize = Vector2.new(250, #MoreItemList * 56 + 8),
			offset = p1.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0),
			offsetCallback = p1.moreMenuPanelOffsetCallback,
			tiltCallback = p1.moreMenuPanelTiltCallback,
			anchoring = if IsSpatialRobloxGuiEnabledModule then Constants.AnchoringTypes.PanelManaged else Constants.AnchoringTypes.Head,
			alwaysOnTop = if EnableVRBottomBarWorksBehindObjectsEngineFeature then true else nil,
			parent = EnableVRBottomBarWorksBehindObjectsEngineFeature and GuiService.CoreGuiFolder or nil,
			connectPanelManagerFunction = if IsSpatialRobloxGuiEnabledModule then function(p3) --[[ Line: 913 ]]
				-- upvalues: RegisterRoactPanelFunction (upval), PanelType (upval), UIManager (upval)
				if p3 then
					RegisterRoactPanelFunction(p3, PanelType.MoreMenu)
					
					return
				else
					UIManager.getInstance():removeRoactPanel(PanelType.MoreMenu)
				end
			end else nil
		}, {
			Content = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				MoreMenu = RoactModule.createElement(BaseMenu, {
					anchorPoint = Vector2.new(0.5, 1),
					buttonProps = MoreItemList,
					position = UDim2.new(0.5, 0, 1, -8),
					background = p2.Theme.BackgroundContrast
				}),
				Caret = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/MenuBar/dropdown-arrow.png",
					AnchorPoint = Vector2.new(0.5, 1),
					ImageColor3 = Color3.fromRGB(25, 27, 29),
					Position = UDim2.new(0.5, 0, 1, 0),
					Size = UDim2.new(0, 24, 0, 10)
				})
			})
		}),
		ShowHighlightedLeaveGameIconToggled = RoactModule.createElement(ExternalEventConnection, {
			event = VRHub.ShowHighlightedLeaveGameIconToggled.Event,
			callback = p1.updateItemListState
		}),
		ShowTopBarChanged = RoactModule.createElement(ExternalEventConnection, {
			event = VRHub.ShowTopBarChanged.Event,
			callback = p1.onShowTopBarChanged
		}),
		ShowMoreMenuChanged = RoactModule.createElement(ExternalEventConnection, {
			event = VRHub.ShowMoreMenuChanged.Event,
			callback = p1.onShowMoreMenuChanged
		}),
		CoreGuiChanged = RoactModule.createElement(ExternalEventConnection, {
			event = StarterGui.CoreGuiChangedSignal,
			callback = p1.updateItemListState
		}),
		SafetyBubbleToggled = VRHub.SafetyBubble and RoactModule.createElement(ExternalEventConnection, {
			event = VRHub.SafetyBubble.Toggled.Event,
			callback = p1.updateItemListState
		}),
		BackpackItemAdded = RoactModule.createElement(ExternalEventConnection, {
			event = BackpackModule.BackpackItemAdded.Event,
			callback = p1.onBackpackItemAdded
		}),
		BackpackEmpty = RoactModule.createElement(ExternalEventConnection, {
			event = BackpackModule.BackpackEmpty.Event,
			callback = p1.onBackpackEmpty
		}),
		EmotesLoaded = RoactModule.createElement(ExternalEventConnection, {
			event = EmotesMenuMasterModule.EmotesLoaded.Event,
			callback = p1.onEmotesLoaded
		}),
		RenderStepped = RoactModule.createElement(ExternalEventConnection, {
			event = RunService.RenderStepped,
			callback = p1.onRenderStepped
		}),
		VREnabled = RoactModule.createElement(ExternalEventConnection, {
			event = VRService:GetPropertyChangedSignal("VREnabled"),
			callback = p1.onVREnabledChanged
		})
	})
end

function TopBarApp.render(p1) --[[ Line: 987 ]]
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2) --[[ Line: 988 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

function TopBarApp.didUpdate(p1, p2, p3) --[[ Line: 993 ]]
	-- upvalues: OtterModule (copy), config1 (copy), VRHub (copy)
	if p3.lookAway ~= p1.state.lookAway or p3.vrMenuOpen ~= p1.state.vrMenuOpen then
		if not p1.state.vrMenuOpen and p1.state.lookAway then
			p1.fadeTransparencyMotor:setGoal(OtterModule.spring(1, config1.Slower))
		else
			p1.fadeTransparencyMotor:setGoal(OtterModule.spring(0, config1.Default))
		end
	end
	if p1.state.moreMenuOpen and #p1.state.moreItemList == 0 then
		VRHub:SetShowMoreMenu(false)
	end
	if p2.voiceEnabled ~= p1.props.voiceEnabled then
		p1.updateItemListState()
		
		return
	end
	if p3.yOffset ~= p1.state.yOffset or p3.zOffset ~= p1.state.zOffset then
		p1.updateItemListState()
	end
end

function TopBarApp.willUnmount(p1) --[[ Line: 1015 ]]
	p1.fadeTransparencyMotor:stop()
end

return RoactRoduxModule.UNSTABLE_connect2(nil, nil)(TopBarApp)