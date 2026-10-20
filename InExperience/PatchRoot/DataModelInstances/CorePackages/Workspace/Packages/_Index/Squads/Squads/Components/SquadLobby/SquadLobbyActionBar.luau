local Squads = script:FindFirstAncestor("Squads")
local AppStorageService = game:GetService("AppStorageService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Parent = Squads.Parent
local _ = require(Parent.CrossExperience)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local VoiceChatModule = require(Parent.VoiceChat)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ConstantsModule = require(Squads.Common.Constants)
local DependenciesModule = require(Squads.dependencies)
local SquadPartySheetActionEnumModule = require(Squads.Enums.SquadPartySheetActionEnum)
local FFlagSquadLobbyActionBarFixMicLevelRerenderModule = require(Squads.Flags.FFlagSquadLobbyActionBarFixMicLevelRerender)
local SharedFlags = DependenciesModule.SharedFlags
local SquadCoordinationExperienceJoinExperimentation = DependenciesModule.SocialExperiments.SquadCoordinationExperienceJoinExperimentation
local SquadLobbySessionProvider = require(Parent.SquadsCore.SquadSessionProvider).SquadLobbySessionProvider
local SquadState = require(Parent.SquadsCore.Enums).SquadState
local LeaveSquadFunction = require(Parent.SquadsCore.Thunks).leaveSquad
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local UseCurrentSquadSelectorFunction = DependenciesModule.Hooks.useCurrentSquadSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLastInputMethodFunction = require(Parent.FocusNavigationUtils).useLastInputMethod
local ExternalEventConnection = require(Parent.RoactUtils).ExternalEventConnection
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local InputUtilities = require(Parent.SocialCommon).Utils.InputUtilities
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local WithHoverTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withHoverTooltip
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local UseParticipantFunction = CrossExperienceVoiceModule.Hooks.useParticipant
local UseParticipantsFunction = CrossExperienceVoiceModule.Hooks.useParticipants
local UseIsVoiceConnectedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceConnected
local UseIsVoiceFocusedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceFocused
local UseIsVoiceDisconnectedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceDisconnected
local UseBackgroundExperienceFunction = CrossExperienceVoiceModule.Hooks.useBackgroundExperience
local UseIsActiveParticipantFunction = CrossExperienceVoiceModule.Hooks.useIsActiveParticipant
local UseVoiceStatusFunction = CrossExperienceVoiceModule.Hooks.useVoiceStatus
local CrossExperienceVoiceManager = CrossExperienceVoiceModule.CrossExperienceVoiceManager
local GetFFlagEnableCrossExpVoiceFunction = SharedFlags.GetFFlagEnableCrossExpVoice
local EnableCrossExpVoiceDebug = game:DefineFastFlag("EnableCrossExpVoiceDebug", false)
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local SquadExperiencePickerTooltipSeenStorageValue = game:DefineFastString("SquadExperiencePickerTooltipSeenStorageValue", "True")
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = SharedFlags.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local Size: string = if SquadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() then "size-800-800" else "size-600-600"
local config = {
	["icons/menu/platformChatOff"] = "speech-bubble-align-center",
	["icons/common/play"] = "play-large",
	["icons/common/search"] = "magnifying-glass",
	["icons/navigation/close"] = "x",
	["icons/controls/headphone"] = "headphones",
	["icons/actions/truncationCollapse_small"] = "chevron-large-up",
	["icons/status/player/developer"] = "hammer-code"
}
local Search: string = if SquadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() then "icons/common/search" else "icons/common/play"

local function _(p1): boolean
	-- upvalues: AppStorageService (copy), SquadExperiencePickerTooltipSeenStorageValue (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval), p1 (copy)
		return AppStorageService:GetItem(p1)
	end)
	
	return if Success and Result ~= nil then Result == SquadExperiencePickerTooltipSeenStorageValue else false
end

local _ = function(p1)
	-- upvalues: AppStorageService (copy), SquadExperiencePickerTooltipSeenStorageValue (copy)
	pcall(function()
		-- upvalues: AppStorageService (upval), p1 (copy), SquadExperiencePickerTooltipSeenStorageValue (upval)
		AppStorageService:SetItem(p1, SquadExperiencePickerTooltipSeenStorageValue)
		AppStorageService:Flush()
	end)
end

local function v40(p1)
	-- upvalues: ReactModule (copy), ControlState (copy), UseTokensFunction (copy), UseLastInputMethodFunction (copy), SquadCoordinationExperienceJoinExperimentation (copy), AppStorageService (copy), SquadExperiencePickerTooltipSeenStorageValue (copy), InputUtilities (copy), CoreGui (copy), ExternalEventConnection (copy), UserInputService (copy), FoundationModule (copy), WithTooltipFunction (copy), WithHoverTooltipFunction (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ControlState.Initialize)
	local UseTokensResult = UseTokensFunction()
	local UseLastInputMethodResult = UseLastInputMethodFunction()
	local config = { headerText = p1.tooltipText }
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: SquadCoordinationExperienceJoinExperimentation (upval), p1 (copy), AppStorageService (upval), SquadExperiencePickerTooltipSeenStorageValue (upval), UseStateResult2 (copy)
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
			repeat
				if p1.enableFirstTimeTooltip and p1.showFtuxCustomConditionsMet and (p1.currentHoveredButton == "" or p1.currentHoveredButton == p1.triggerPointName) then
					local FtuxAppStorageKey = p1.ftuxAppStorageKey
					local Success, Result = pcall(function()
						-- upvalues: AppStorageService (upval), FtuxAppStorageKey (copy)
						return AppStorageService:GetItem(FtuxAppStorageKey)
					end)
					
					if not (if Success and Result ~= nil then Result == SquadExperiencePickerTooltipSeenStorageValue else false) then
						local FtuxAppStorageKey1 = p1.ftuxAppStorageKey
						pcall(function()
							-- upvalues: AppStorageService (upval), FtuxAppStorageKey1 (copy), SquadExperiencePickerTooltipSeenStorageValue (upval)
							AppStorageService:SetItem(FtuxAppStorageKey1, SquadExperiencePickerTooltipSeenStorageValue)
							AppStorageService:Flush()
						end)
						
						if p1.currentHoveredButton ~= "" then break end
						UseStateResult2(true)
						break
					end
				end
				if p1.enableFirstTimeTooltip and (p1.currentHoveredButton == "" or p1.currentHoveredButton == p1.triggerPointName) then break end
				UseStateResult2(false)
			until true
		end
	end, {
		p1.currentHoveredButton,
		p1.enableFirstTimeTooltip,
		p1.ftuxAppStorageKey,
		p1.showFtuxCustomConditionsMet,
		p1.triggerPointName
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: InputUtilities (upval), UseLastInputMethodResult (copy), UseStateResult2 (copy)
		if InputUtilities.isActivationInput(p2) or UseLastInputMethodResult == "Gamepad" then
			UseStateResult2(false)
		end
	end, { UseLastInputMethodResult })
	local config1 = {
		DisplayOrder = 6,
		disabled = false,
		guiTarget = CoreGui,
		active = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
		triggerPointName = p1.triggerPointName
	}
	
	local function v56(p2, p3, Callback)
		-- upvalues: ReactModule (upval), ControlState (upval), SquadCoordinationExperienceJoinExperimentation (upval), p1 (copy), UseBindingResult (copy), UseBindingResult2 (copy), UseStateResult (copy), ExternalEventConnection (upval), UserInputService (upval), UseResult (copy), FoundationModule (upval), UseTokensResult (copy)
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: p1 (upval), UseStateResult (upval)
			if p1.onActivated then
				p1.onActivated(UseStateResult)
			end
		end, { UseStateResult, p1.onActivated })
		
		return ReactModule.createElement("Frame", {
			AutomaticSize = p1.automaticSize,
			LayoutOrder = p1.layoutOrder,
			Size = UDim2.fromOffset(40, 40),
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsolutePosition] = p2,
			[ReactModule.Change.AbsoluteSize] = p3
		}, {
			InputEndedConnection = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and UseStateResult then ReactModule.createElement(ExternalEventConnection, {
				event = UserInputService.InputEnded,
				callback = UseResult
			}) else nil,
			ReactModule.createElement(FoundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				backgroundStyle = p1.backgroundStyle,
				cornerRadius = UDim.new(0, UseTokensResult.Radius.Circle),
				isDisabled = p1.isDisabled,
				onActivated = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult1 else p1.onActivated,
				onStateChanged = ReactModule.useCallback(function(p4)
					-- upvalues: ControlState (upval), SquadCoordinationExperienceJoinExperimentation (upval), p1 (upval), Callback (copy), UseBindingResult (upval), UseBindingResult2 (upval)
					local FromRawValueResult = ControlState.fromRawValue(p4)
					
					if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
						if FromRawValueResult == ControlState.Hover then
							p1.onHoverCalled(p1.triggerPointName)
						elseif FromRawValueResult == ControlState.Default then
							p1.onHoverCalled("")
						end
					end
					if Callback then
						Callback(UseBindingResult:getValue(), FromRawValueResult)
					end
					UseBindingResult2(FromRawValueResult)
				end, {
					UseBindingResult,
					p1.onHoverCalled,
					p1.triggerPointName,
					UseBindingResult2
				})
			}, p1.children)
		})
	end
	
	local function v57(p2)
		-- upvalues: v56 (copy)
		return v56(p2, p2, nil)
	end
	
	local function v58(p2, p3)
		-- upvalues: v56 (copy)
		return v56(p2, p2, p3)
	end
	
	return if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and UseStateResult then WithTooltipFunction(config, config1, v57) else WithHoverTooltipFunction(config, config1, v58)
end

local _ = function(p1)
	return {
		["size-600-600"] = p1.Size.Size_600,
		["size-800-800"] = p1.Size.Size_800
	}
end

local function renderStandardImage(IsNotSquadStateMatch, Image, Size, p1, TestId)
	-- upvalues: config (copy), ReactModule (copy), FoundationModule (copy)
	local Entry = config[Image]
	
	if Entry then
		local config1 = {
			["size-600-600"] = p1.Size.Size_600,
			["size-800-800"] = p1.Size.Size_800
		}
		
		return ReactModule.createElement(FoundationModule.Icon, {
			name = Entry,
			style = if IsNotSquadStateMatch then p1.Color.Content.Muted else p1.Color.Content.Emphasis,
			size = config1[Size] or config1["size-600-600"],
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			testId = TestId
		})
	else
		return ReactModule.createElement(FoundationModule.Image, {
			Image = Image,
			tag = {
				["content-emphasis"] = not IsNotSquadStateMatch,
				["content-muted"] = IsNotSquadStateMatch,
				["anchor-center-center position-center-center " .. Size] = true
			},
			testId = TestId
		})
	end
end

local function getLoadingIndicatorIcon(p1, Input, p2, p3, p4)
	-- upvalues: VoiceChatModule (copy)
	local MicDark: string = if p1.Config.ColorMode.IsLight == "true" then "MicDark" else "MicLight"
	
	return if p2 and Input and not Input.isMuted then if p3 then VoiceChatModule.Utils.GetIcon("Unmuted", MicDark, p4) else VoiceChatModule.Utils.GetIcon("Unmuted0", MicDark) else VoiceChatModule.Utils.GetIcon("Muted", MicDark)
end

local function renderToggleAudioFocusButton(p1, TooltipText, OnActivated, p2, UseResult)
	-- upvalues: ReactModule (copy), v40 (copy), SquadCoordinationExperienceJoinExperimentation (copy), FoundationModule (copy), FFlagSquadsEnableFoundationTestIdsModule (copy)
	return ReactModule.createElement(v40, {
		isDisabled = false,
		layoutOrder = 0,
		triggerPointName = "ToggleAudioFocusButton",
		automaticSize = Enum.AutomaticSize.X,
		currentHoveredButton = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then p2 else nil,
		enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
		ftuxAppStorageKey = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
		onActivated = OnActivated,
		onHoverCalled = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
		showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
		tooltipText = TooltipText
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.Padding.Small),
			PaddingRight = UDim.new(0, p1.Padding.Small)
		}),
		ToggleFocusButtonIcon = ReactModule.createElement(FoundationModule.Image, {
			Image = "icons/controls/headphone",
			tag = "anchor-center-center position-center-center size-900 content-emphasis",
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--audio-focus-button--icon" else nil
		}),
		CaretIcon = ReactModule.createElement(FoundationModule.Image, {
			Image = "icons/actions/truncationCollapse_small",
			tag = "anchor-center-center position-center-center size-300-300 content-emphasis",
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--audio-focus-button--caret" else nil
		})
	})
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), SquadCoordinationExperienceJoinExperimentation (copy), UseTokensFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), UseCurrentSquadSelectorFunction (copy), UseVoiceStatusFunction (copy), ReactModule (copy), UseAppPolicyFunction (copy), HttpService (copy), SquadLobbySessionProvider (copy), SquadExternalContractContext (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), EventNamesModule (copy), SquadPartySheetActionEnumModule (copy), SessionType (copy), LeaveSquadFunction (copy), SquadState (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), v40 (copy), Badge (copy), BadgeVariant (copy), renderStandardImage (copy), Search (copy), Size (copy), GetFFlagEnableCrossExpVoiceFunction (copy), UseLocalUserIdFunction (copy), UseBackgroundExperienceFunction (copy), UseParticipantFunction (copy), UseIsVoiceConnectedFunction (copy), UseIsVoiceDisconnectedFunction (copy), UseIsVoiceFocusedFunction (copy), UseParticipantsFunction (copy), UseIsActiveParticipantFunction (copy), AudioFocusManagementEngineFeature (copy), CrossExperienceVoiceManager (copy), FFlagSquadLobbyActionBarFixMicLevelRerenderModule (copy), RunService (copy), renderToggleAudioFocusButton (copy), EnableCrossExpVoiceDebug (copy), getLoadingIndicatorIcon (copy), FoundationModule (copy), ConstantsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		audioText = "Feature.Squads.Label.Audio",
		leavePartyText = "Feature.Squads.Label.LeaveParty",
		muteMicText = "Feature.Squads.Label.MuteMic",
		unmuteMicText = "Feature.Squads.Label.UnmuteMic",
		viewChatText = "Feature.Squads.Label.ViewChat",
		findExperiencesText = if SquadCoordinationExperienceJoinExperimentation.getIsNewTooltipCopyEnabled() then "Feature.Squads.Label.FindExperiencesPlayTogether" else "Feature.Squads.Label.FindExperiences"
	})
	local UseTokensResult = UseTokensFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction()
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local CountMembers: number = if UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.members then #UseCurrentSquadSelectorResult.members else 0
	local UseAppPolicyResult = UseAppPolicyFunction((ReactModule.useCallback(function(p2)
		return p2.getCanUsePlatformChat()
	end, {})))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HttpService (upval)
		return HttpService:GenerateGUID()
	end, {})
	local UseContextResult = if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then ReactModule.useContext(SquadLobbySessionProvider.Context) else nil
	local UseContextResult1 = ReactModule.useContext(SquadExternalContractContext)
	local NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled = not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseContextResult1.useIsChatEnabled()
	local UseResult1 = ReactModule.useCallback(function(IsFtuxTooltipShown)
		-- upvalues: UseContextResult1 (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy), p1 (copy)
		UseContextResult1.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
			parentChannelId = UseCurrentSquadParentChannelIdResult,
			actionType = SquadPartySheetActionEnumModule.ChatButtonClicked,
			isFtuxTooltipShown = IsFtuxTooltipShown,
			voiceStatus = UseVoiceStatusResult
		})
		
		if UseCurrentSquadParentChannelIdResult and UseCurrentSquadParentChannelIdResult ~= "" and p1.navigateToChat then
			p1.navigateToChat(UseCurrentSquadParentChannelIdResult)
			
			return
		else
			p1.navigateAwayFromSquad()
		end
	end, {
		p1.navigateAwayFromSquad,
		p1.navigateToChat,
		UseCurrentSquadParentChannelIdResult,
		UseContextResult1.fireSquadAnalytics,
		UseVoiceStatusResult
	})
	local UseResult2 = ReactModule.useCallback(function(IsFtuxTooltipShown)
		-- upvalues: SquadCoordinationExperienceJoinExperimentation (upval), UseContextResult (copy), SessionType (upval), HttpService (upval), UseContextResult1 (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy), UseDispatchResult (copy), p1 (copy)
		if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
			UseContextResult.updateMetadata(SessionType.Metadata.SquadLobbyPage.ExperiencePickerUuid, HttpService:GenerateGUID(false))
		end
		UseContextResult1.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
			parentChannelId = UseCurrentSquadParentChannelIdResult,
			actionType = SquadPartySheetActionEnumModule.PickExperienceButtonClicked,
			isFtuxTooltipShown = IsFtuxTooltipShown,
			voiceStatus = UseVoiceStatusResult
		})
		
		if SquadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then
			UseContextResult1.showSearchOverlay(UseDispatchResult)
			
			return
		else
			p1.navigateToHomePage()
		end
	end, {
		UseCurrentSquadParentChannelIdResult, p1.navigateToHomePage,
		UseContextResult1.fireSquadAnalytics,
		if SquadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then UseDispatchResult else nil,
		if SquadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then UseContextResult1.showSearchOverlay else nil,
		if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then UseContextResult.updateMetadata else nil,
		UseVoiceStatusResult
	})
	local UseResult3 = ReactModule.useCallback(function(IsFtuxTooltipShown)
		-- upvalues: UseContextResult1 (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy), UseDispatchResult (copy), LeaveSquadFunction (upval), p1 (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy)
		UseContextResult1.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
			parentChannelId = UseCurrentSquadParentChannelIdResult,
			actionType = SquadPartySheetActionEnumModule.EndCallButtonClicked,
			isFtuxTooltipShown = IsFtuxTooltipShown,
			voiceStatus = UseVoiceStatusResult
		})
		UseDispatchResult(LeaveSquadFunction(nil, UseContextResult1.setSquadPrompt, function()
			-- upvalues: p1 (upval)
			p1.navigateAwayFromSquad()
		end, UseContextResult1.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled))
	end, {
		UseDispatchResult, p1.navigateAwayFromSquad,
		UseCurrentSquadParentChannelIdResult, UseContextResult1.fireSquadAnalytics,
		UseContextResult1.setSquadPrompt, UseContextResult1.squadLocation,
		if FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled else nil,
		UseVoiceStatusResult
	})
	local IsNotSquadStateMatch = p1.squadState ~= SquadState.Active
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FFlagSquadsEnableFoundationTestIdsModule (upval), ReactModule (upval), v40 (upval), SquadCoordinationExperienceJoinExperimentation (upval), UseStateResult (copy), IsNotSquadStateMatch (copy), UseResult1 (copy), UseResult (copy), UseLocalizationResult (copy), p1 (copy), Badge (upval), UseTokensResult (copy), BadgeVariant (upval), renderStandardImage (upval)
		return ReactModule.createElement(v40, {
			layoutOrder = 2,
			triggerPointName = "ChatButton",
			currentHoveredButton = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
			enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			ftuxAppStorageKey = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
			isDisabled = IsNotSquadStateMatch,
			onActivated = UseResult1,
			onHoverCalled = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
			showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			tooltipText = UseLocalizationResult.viewChatText
		}, {
			UnreadMessagesBadge = if p1.hasUnreadMessages then ReactModule.createElement(Badge, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -UseTokensResult.Size.Size_250, 0, UseTokensResult.Size.Size_250),
				variant = BadgeVariant.Alert,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--chat-button--unread-badge" else nil
			}) else nil,
			renderStandardImage(IsNotSquadStateMatch, "icons/menu/platformChatOff", "size-800-800", UseTokensResult, if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--chat-button--icon" else nil)
		})
	end, {
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
		UseTokensResult, IsNotSquadStateMatch, UseLocalizationResult.viewChatText,
		UseResult1,
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
		p1.hasUnreadMessages
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FFlagSquadsEnableFoundationTestIdsModule (upval), p1 (copy), ReactModule (upval), v40 (upval), SquadCoordinationExperienceJoinExperimentation (upval), UseStateResult (copy), IsNotSquadStateMatch (copy), UseResult2 (copy), UseResult (copy), CountMembers (copy), UseLocalizationResult (copy), renderStandardImage (upval), Search (upval), Size (upval), UseTokensResult (copy)
		local SocialSquadLobbyActionBarPickExperienceButtonIcon = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--pick-experience-button--icon" else nil
		
		return if p1.isInExperience then nil else ReactModule.createElement(v40, {
			layoutOrder = 3,
			triggerPointName = "PickExperienceButton",
			currentHoveredButton = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
			enableFirstTimeTooltip = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then true else nil,
			ftuxAppStorageKey = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "SquadExperiencePickerTooltipSeen" else nil,
			isDisabled = IsNotSquadStateMatch,
			onActivated = UseResult2,
			onHoverCalled = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
			showFtuxCustomConditionsMet = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then CountMembers >= 2 else nil,
			tooltipText = UseLocalizationResult.findExperiencesText
		}, renderStandardImage(IsNotSquadStateMatch, Search, Size, UseTokensResult, SocialSquadLobbyActionBarPickExperienceButtonIcon))
	end, {
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
		UseTokensResult, IsNotSquadStateMatch,
		UseLocalizationResult.findExperiencesText,
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then CountMembers else nil,
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
		p1.isInExperience, p1.navigateToHomePage
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: IsNotSquadStateMatch (copy), UseTokensResult (copy), FFlagSquadsEnableFoundationTestIdsModule (upval), ReactModule (upval), v40 (upval), SquadCoordinationExperienceJoinExperimentation (upval), UseStateResult (copy), UseResult3 (copy), UseResult (copy), UseLocalizationResult (copy), renderStandardImage (upval)
		return ReactModule.createElement(v40, {
			layoutOrder = 4,
			triggerPointName = "EndCallButton",
			backgroundStyle = if IsNotSquadStateMatch then UseTokensResult.Color.ActionStandard.Background else UseTokensResult.Color.System.Alert,
			currentHoveredButton = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
			enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			ftuxAppStorageKey = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
			isDisabled = IsNotSquadStateMatch,
			onActivated = UseResult3,
			onHoverCalled = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
			showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
			tooltipText = UseLocalizationResult.leavePartyText
		}, renderStandardImage(IsNotSquadStateMatch, "icons/navigation/close", "size-600-600", UseTokensResult, if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--end-call-button--icon" else nil))
	end, {
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
		UseTokensResult, IsNotSquadStateMatch, UseLocalizationResult.leavePartyText,
		UseResult3,
		if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil
	})
	local UseMemoResult4 = nil
	local UseMemoResult5 = nil
	local UseMemoResult6 = nil
	
	if GetFFlagEnableCrossExpVoiceFunction() then
		local Number: number = tonumber(UseLocalUserIdFunction()) or -1
		local UseRefResult = ReactModule.useRef(0)
		local UseBackgroundExperienceResult = UseBackgroundExperienceFunction()
		local UseParticipantResult = UseParticipantFunction(Number)
		local UseIsVoiceConnectedResult = UseIsVoiceConnectedFunction()
		local UseIsVoiceDisconnectedResult = UseIsVoiceDisconnectedFunction()
		local UseIsVoiceFocusedResult = UseIsVoiceFocusedFunction() or p1.forceIsVoiceFocused
		local UseParticipantsResult = UseParticipantsFunction()
		local UseIsActiveParticipantResult = UseIsActiveParticipantFunction(Number)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
		local UseResult4 = ReactModule.useCallback(function(_)
			-- upvalues: HttpService (upval), UseBackgroundExperienceResult (copy), UseParticipantResult (copy), UseParticipantsResult (copy), CrossExperienceVoiceManager (upval)
			print("----------- CEV FOREGROUND -----------")
			print("Experience info", HttpService:JSONEncode(UseBackgroundExperienceResult))
			print("Current Voice Participant", HttpService:JSONEncode(UseParticipantResult))
			print("Squads Store Participants", HttpService:JSONEncode(UseParticipantsResult or {}))
			print("--------------------------------------")
			CrossExperienceVoiceManager.default:dumpDebugData()
		end, { UseParticipantsResult, UseParticipantResult })
		local UseResult5 = ReactModule.useCallback(function(_)
			-- upvalues: UseParticipantResult (copy), CrossExperienceVoiceManager (upval)
			if UseParticipantResult then
				if UseParticipantResult.isMuted then
					CrossExperienceVoiceManager.default:unmuteVoiceParticipant(UseParticipantResult.userId)
					
					return
				end
				CrossExperienceVoiceManager.default:muteVoiceParticipant(UseParticipantResult.userId)
			end
		end, { UseParticipantResult })
		local IsUseIsActiveParticipantResult: boolean = not IsNotSquadStateMatch and (UseIsVoiceConnectedResult and (UseParticipantResult ~= nil and (not UseParticipantResult.isMuted and UseIsActiveParticipantResult == true)))
		ReactModule.useEffect(function()
			-- upvalues: FFlagSquadLobbyActionBarFixMicLevelRerenderModule (upval), IsUseIsActiveParticipantResult (copy), p1 (copy), RunService (upval), UseMemoResult (copy), UseRefResult (copy), UseStateResult2_1 (copy)
			if FFlagSquadLobbyActionBarFixMicLevelRerenderModule and not IsUseIsActiveParticipantResult then
				return nil
			else
				local RenderStepService = p1.renderStepService or RunService
				RenderStepService:BindToRenderStep(UseMemoResult, 1, function()
					-- upvalues: UseRefResult (upval), UseStateResult2_1 (upval)
					if UseRefResult.current > 3 then
						UseStateResult2_1(math.random())
						UseRefResult.current = 0
						
						return
					else
						UseRefResult.current += 1
					end
				end)
				
				return function()
					-- upvalues: RenderStepService (copy), UseMemoResult (upval)
					RenderStepService:UnbindFromRenderStep(UseMemoResult)
				end
			end
		end, if FFlagSquadLobbyActionBarFixMicLevelRerenderModule then { IsUseIsActiveParticipantResult, p1.renderStepService } else { p1.renderStepService })
		UseMemoResult4 = ReactModule.useMemo(function()
			-- upvalues: IsNotSquadStateMatch (copy), AudioFocusManagementEngineFeature (copy), UseIsVoiceConnectedResult (copy), renderToggleAudioFocusButton (upval), UseTokensResult (copy), UseLocalizationResult (copy), p1 (copy), UseStateResult (copy), UseResult (copy)
			return if IsNotSquadStateMatch or not AudioFocusManagementEngineFeature or not UseIsVoiceConnectedResult then nil else renderToggleAudioFocusButton(UseTokensResult, UseLocalizationResult.audioText, p1.toggleVoiceChatMenu, UseStateResult, UseResult)
		end, {
			UseTokensResult, AudioFocusManagementEngineFeature, UseStateResult,
			IsNotSquadStateMatch, UseIsVoiceConnectedResult,
			UseLocalizationResult.audioText, UseResult, p1.toggleVoiceChatMenu
		})
		
		if EnableCrossExpVoiceDebug then
			UseMemoResult5 = ReactModule.useMemo(function()
				-- upvalues: FFlagSquadsEnableFoundationTestIdsModule (upval), ReactModule (upval), v40 (upval), SquadCoordinationExperienceJoinExperimentation (upval), UseStateResult (copy), IsNotSquadStateMatch (copy), UseResult4 (copy), UseResult (copy), renderStandardImage (upval), UseTokensResult (copy)
				return ReactModule.createElement(v40, {
					layoutOrder = 5,
					tooltipText = "Debug voice",
					triggerPointName = "DebugVoiceButton",
					currentHoveredButton = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
					enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
					ftuxAppStorageKey = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
					isDisabled = IsNotSquadStateMatch,
					onActivated = UseResult4,
					onHoverCalled = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
					showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil
				}, renderStandardImage(IsNotSquadStateMatch, "icons/status/player/developer", "size-600-600", UseTokensResult, if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--debug-voice-button--icon" else nil))
			end, {
				if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
				UseTokensResult,
				IsNotSquadStateMatch,
				UseResult4,
				if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil
			})
		end
		local UseMemoResult7 = ReactModule.useMemo(function()
			-- upvalues: getLoadingIndicatorIcon (upval), UseTokensResult (copy), UseParticipantResult (copy), UseIsVoiceConnectedResult (copy), IsNotSquadStateMatch (copy), UseIsActiveParticipantResult (copy), UseStateResult1 (copy)
			return getLoadingIndicatorIcon(UseTokensResult, UseParticipantResult, UseIsVoiceConnectedResult, not IsNotSquadStateMatch and UseIsActiveParticipantResult, UseStateResult1)
		end, {
			UseIsActiveParticipantResult, IsNotSquadStateMatch, UseIsVoiceConnectedResult,
			UseStateResult1, UseParticipantResult, UseTokensResult
		})
		UseMemoResult6 = ReactModule.useMemo(function()
			-- upvalues: UseIsVoiceDisconnectedResult (copy), IsNotSquadStateMatch (copy), AudioFocusManagementEngineFeature (upval), UseIsVoiceFocusedResult (copy), UseIsVoiceConnectedResult (copy), UseParticipantResult (copy), FFlagSquadsEnableFoundationTestIdsModule (upval), ReactModule (upval), v40 (upval), SquadCoordinationExperienceJoinExperimentation (upval), UseStateResult (copy), UseResult5 (copy), UseResult (copy), UseLocalizationResult (copy), renderStandardImage (upval), UseMemoResult7 (copy), UseTokensResult (copy)
			if UseIsVoiceDisconnectedResult then
				return nil
			elseif IsNotSquadStateMatch or not AudioFocusManagementEngineFeature or UseIsVoiceFocusedResult then
				local NoUseIsVoiceConnectedResult = not UseIsVoiceConnectedResult or (UseParticipantResult == nil or IsNotSquadStateMatch)
				local NoUseIsVoiceConnectedResult1 = not UseIsVoiceConnectedResult or (not UseParticipantResult or UseParticipantResult.isMuted)
				
				return ReactModule.createElement(v40, {
					layoutOrder = 1,
					triggerPointName = "ToggleMicButton",
					currentHoveredButton = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
					enableFirstTimeTooltip = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
					ftuxAppStorageKey = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
					isDisabled = NoUseIsVoiceConnectedResult,
					onActivated = UseResult5,
					onHoverCalled = if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
					showFtuxCustomConditionsMet = not SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and nil,
					tooltipText = if NoUseIsVoiceConnectedResult1 then UseLocalizationResult.unmuteMicText else UseLocalizationResult.muteMicText
				}, renderStandardImage(NoUseIsVoiceConnectedResult, UseMemoResult7, "size-800-800", UseTokensResult, if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar--mic-button--icon" else nil))
			else
				return nil
			end
		end, {
			if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseStateResult else nil,
			UseTokensResult, UseMemoResult7, IsNotSquadStateMatch, UseIsVoiceFocusedResult,
			UseIsVoiceConnectedResult, UseLocalizationResult.muteMicText,
			UseLocalizationResult.unmuteMicText,
			if SquadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then UseResult else nil,
			UseResult5, UseParticipantResult, UseIsVoiceDisconnectedResult
		})
	end
	return ReactModule.createElement(FoundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.X,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		Size = UDim2.fromOffset(0, ConstantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT),
		backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0,
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Circle),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, UseTokensResult.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		padding = UseTokensResult.Padding.Small,
		testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-action-bar" else nil
	}, {
		ToggleAudioFocusButton = UseMemoResult4,
		ToggleMicButton = UseMemoResult6,
		ChatButton = if UseAppPolicyResult then UseMemoResult1 else nil,
		PickExperienceButton = UseMemoResult2,
		EndCallButton = UseMemoResult3,
		DebugVoiceButton = UseMemoResult5
	})
end