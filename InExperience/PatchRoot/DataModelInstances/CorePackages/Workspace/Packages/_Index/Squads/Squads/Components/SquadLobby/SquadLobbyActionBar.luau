local squads = script:FindFirstAncestor("Squads")
local appStorageService = game:GetService("AppStorageService")
local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local parent = squads.Parent
local _ = require(parent.CrossExperience)
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local socialCommonModule = require(parent.SocialCommon)
local UIBloxModule = require(parent.UIBlox)
local voiceChatModule = require(parent.VoiceChat)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local constantsModule = require(squads.Common.Constants)
local dependenciesModule = require(squads.dependencies)
local squadPartySheetActionEnumModule = require(squads.Enums.SquadPartySheetActionEnum)
local sharedFlags = dependenciesModule.SharedFlags
local squadCoordinationExperienceJoinExperimentation = dependenciesModule.SocialExperiments.SquadCoordinationExperienceJoinExperimentation
local squadLobbySessionProvider = require(parent.SquadsCore.SquadSessionProvider).SquadLobbySessionProvider
local squadState = require(parent.SquadsCore.Enums).SquadState
local leaveSquad = require(parent.SquadsCore.Thunks).leaveSquad
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local useTokens = foundationModule.Hooks.useTokens
local useLastInputMethod = focusNavigationUtilsModule.useLastInputMethod
local externalEventConnection = roactUtilsModule.ExternalEventConnection
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local inputUtilities = socialCommonModule.Utils.InputUtilities
local sessionType = robloxAppSessionizationModule.SessionType
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local withHoverTooltip = UIBloxModule.App.Dialog.TooltipV2.withHoverTooltip
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local useParticipant = crossExperienceVoiceModule.Hooks.useParticipant
local useParticipants = crossExperienceVoiceModule.Hooks.useParticipants
local useIsVoiceConnected = crossExperienceVoiceModule.Hooks.useIsVoiceConnected
local useIsVoiceFocused = crossExperienceVoiceModule.Hooks.useIsVoiceFocused
local useIsVoiceDisconnected = crossExperienceVoiceModule.Hooks.useIsVoiceDisconnected
local useBackgroundExperience = crossExperienceVoiceModule.Hooks.useBackgroundExperience
local useIsActiveParticipant = crossExperienceVoiceModule.Hooks.useIsActiveParticipant
local useVoiceStatus = crossExperienceVoiceModule.Hooks.useVoiceStatus
local crossExperienceVoiceManager = crossExperienceVoiceModule.CrossExperienceVoiceManager
local getFFlagEnableCrossExpVoice = sharedFlags.GetFFlagEnableCrossExpVoice
local enableCrossExpVoiceDebug = game:DefineFastFlag("EnableCrossExpVoiceDebug", false)
local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local squadExperiencePickerTooltipSeenStorageValue = game:DefineFastString("SquadExperiencePickerTooltipSeenStorageValue", "True")
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlags.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local var22 = if squadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() then "size-800-800" else "size-600-600"
local t = {
	["icons/menu/platformChatOff"] = "speech-bubble-align-center",
	["icons/common/play"] = "play-large",
	["icons/common/search"] = "magnifying-glass",
	["icons/navigation/close"] = "x",
	["icons/controls/headphone"] = "headphones",
	["icons/actions/truncationCollapse_small"] = "chevron-large-up",
	["icons/status/player/developer"] = "hammer-code"
}
local var24 = if squadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() then "icons/common/search" else "icons/common/play"

local function _(p0)
	-- upvalues: appStorageService (ref), squadExperiencePickerTooltipSeenStorageValue (ref)
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy), p0 (ref)
		return appStorageService:GetItem(p0)
	end)
	
	return if ok and status ~= nil then status == squadExperiencePickerTooltipSeenStorageValue else false
end

local _ = function(value)
	-- upvalues: appStorageService (ref), squadExperiencePickerTooltipSeenStorageValue (ref)
	pcall(function()
		-- upvalues: appStorageService (copy), value (ref), squadExperiencePickerTooltipSeenStorageValue (copy)
		appStorageService:SetItem(value, squadExperiencePickerTooltipSeenStorageValue)
		appStorageService:Flush()
	end)
end

local var25 = function(p1)
	-- upvalues: reactModule (ref), controlState (ref), useTokens (ref), useLastInputMethod (ref), squadCoordinationExperienceJoinExperimentation (ref), appStorageService (ref), squadExperiencePickerTooltipSeenStorageValue (ref), inputUtilities (ref), coreGuiService (ref), externalEventConnection (ref), userInputService (ref), foundationModule (ref), withTooltip (ref), withHoverTooltip (ref)
	local var29, var30 = reactModule.useBinding(controlState.Initialize)
	local var31 = useTokens()
	local var32 = useLastInputMethod()
	local t = { headerText = p1.tooltipText }
	local var34, var35 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: squadCoordinationExperienceJoinExperimentation (copy), p1 (ref), appStorageService (copy), squadExperiencePickerTooltipSeenStorageValue (copy), var35 (ref)
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
			if p1.enableFirstTimeTooltip and p1.showFtuxCustomConditionsMet and (p1.currentHoveredButton == "" or p1.currentHoveredButton == p1.triggerPointName) then
				local ftuxAppStorageKey = p1.ftuxAppStorageKey
				local ok, status = pcall(function()
					-- upvalues: appStorageService (copy), ftuxAppStorageKey (ref)
					return appStorageService:GetItem(ftuxAppStorageKey)
				end)
				local var39 = if ok and status ~= nil then status == squadExperiencePickerTooltipSeenStorageValue else false
				
				if not var39 then
					var39 = p1.ftuxAppStorageKey
					pcall(function()
						-- upvalues: appStorageService (copy), var39 (ref), squadExperiencePickerTooltipSeenStorageValue (copy)
						appStorageService:SetItem(var39, squadExperiencePickerTooltipSeenStorageValue)
						appStorageService:Flush()
					end)
					
					if p1.currentHoveredButton == "" then
						var35(true)
						
						return
					end
				elseif not p1.enableFirstTimeTooltip or p1.currentHoveredButton ~= "" and p1.currentHoveredButton ~= p1.triggerPointName then
					var35(false)
				end
			end
		end
	end, {
		p1.currentHoveredButton,
		p1.enableFirstTimeTooltip,
		p1.ftuxAppStorageKey,
		p1.showFtuxCustomConditionsMet,
		p1.triggerPointName
	})
	local var36 = reactModule.useCallback(function(p2)
		-- upvalues: inputUtilities (copy), var32 (ref), var35 (ref)
		if inputUtilities.isActivationInput(p2) or var32 == "Gamepad" then
			var35(false)
		end
	end, { var32 })
	local t_1 = {
		DisplayOrder = 6,
		disabled = false,
		guiTarget = coreGuiService,
		active = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var34 else nil,
		triggerPointName = p1.triggerPointName
	}
	
	local var38 = function(p3, p4, p5)
		-- upvalues: reactModule (copy), controlState (copy), squadCoordinationExperienceJoinExperimentation (copy), p1 (ref), var29 (ref), var30 (ref), var34 (ref), externalEventConnection (copy), userInputService (copy), var36 (ref), foundationModule (copy), var31 (ref)
		return reactModule.createElement("Frame", {
			AutomaticSize = p1.automaticSize,
			LayoutOrder = p1.layoutOrder,
			Size = UDim2.fromOffset(40, 40),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsolutePosition] = p3,
			[reactModule.Change.AbsoluteSize] = p4
		}, {
			InputEndedConnection = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and var34 then reactModule.createElement(externalEventConnection, { event = userInputService.InputEnded, callback = var36 }) else nil,
			reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				backgroundStyle = p1.backgroundStyle,
				cornerRadius = UDim.new(0, var31.Radius.Circle),
				isDisabled = p1.isDisabled,
				onActivated = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then reactModule.useCallback(function()
					-- upvalues: p1 (copy), var34 (copy)
					if p1.onActivated then
						p1.onActivated(var34)
					end
				end, { var34, p1.onActivated }) else p1.onActivated,
				onStateChanged = reactModule.useCallback(function(p6)
					-- upvalues: controlState (copy), squadCoordinationExperienceJoinExperimentation (copy), p1 (copy), p5 (ref), var29 (copy), var30 (copy)
					local var40 = controlState.fromRawValue(p6)
					
					if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
						if var40 == controlState.Hover then
							p1.onHoverCalled(p1.triggerPointName)
						elseif var40 == controlState.Default then
							p1.onHoverCalled("")
						end
					end
					if p5 then
						p5(var29:getValue(), var40)
					end
					var30(var40)
				end, { var29, p1.onHoverCalled, p1.triggerPointName, var30 })
			}, p1.children)
		})
	end
	
	return if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and var34 then withTooltip(t, t_1, function(p9)
		-- upvalues: var38 (ref)
		return var38(p9, p9, nil)
	end) else withHoverTooltip(t, t_1, function(p7, p8)
		-- upvalues: var38 (ref)
		return var38(p7, p7, p8)
	end)
end

local _ = function(p10)
	return {
		["size-600-600"] = p10.Size.Size_600,
		["size-800-800"] = p10.Size.Size_800
	}
end

local function renderStandardImage(p11, p12, p13, p14)
	-- upvalues: t (ref), reactModule (ref), foundationModule (ref)
	local var41 = t[p12]
	
	if var41 then
		local t_1 = {
			["size-600-600"] = p14.Size.Size_600,
			["size-800-800"] = p14.Size.Size_800
		}
		
		return reactModule.createElement(foundationModule.Icon, {
			name = var41,
			style = if p11 then p14.Color.Content.Muted else p14.Color.Content.Emphasis,
			size = t_1[p13] or t_1["size-600-600"],
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	end
	return reactModule.createElement(foundationModule.Image, {
		Image = p12,
		tag = {
			["content-emphasis"] = not p11,
			["content-muted"] = p11,
			["anchor-center-center position-center-center " .. p13] = true
		}
	})
end

local function getLoadingIndicatorIcon(p15, p16, p17, p18, p19)
	-- upvalues: voiceChatModule (ref)
	local var43 = if p15.Config.ColorMode.IsLight == "true" then "MicDark" else "MicLight"
	
	return if not (not p17 or not p16 or p16.isMuted) then if p18 then voiceChatModule.Utils.GetIcon("Unmuted", var43, p19) else voiceChatModule.Utils.GetIcon("Unmuted0", var43) else voiceChatModule.Utils.GetIcon("Muted", var43)
end

local function renderToggleAudioFocusButton(p20, p21, p22, p23, p24)
	-- upvalues: reactModule (ref), var25 (ref), squadCoordinationExperienceJoinExperimentation (ref), foundationModule (ref)
	return reactModule.createElement(var25, {
		isDisabled = false,
		layoutOrder = 0,
		triggerPointName = "ToggleAudioFocusButton",
		automaticSize = Enum.AutomaticSize.X,
		currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then p23 else nil,
		enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
		ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
		onActivated = p22,
		onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then p24 else nil,
		showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
		tooltipText = p21
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p20.Padding.Small),
			PaddingRight = UDim.new(0, p20.Padding.Small)
		}),
		ToggleFocusButtonIcon = reactModule.createElement(foundationModule.Image, {
			Image = "icons/controls/headphone",
			tag = "anchor-center-center position-center-center size-900 content-emphasis"
		}),
		CaretIcon = reactModule.createElement(foundationModule.Image, {
			Image = "icons/actions/truncationCollapse_small",
			tag = "anchor-center-center position-center-center size-300-300 content-emphasis"
		})
	})
end

return function(p25)
	-- upvalues: useDispatch (ref), useLocalization (ref), squadCoordinationExperienceJoinExperimentation (ref), useTokens (ref), useCurrentSquadParentChannelId (ref), useCurrentSquadSelector (ref), useVoiceStatus (ref), reactModule (ref), useAppPolicy (ref), httpService (ref), squadLobbySessionProvider (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), sessionType (ref), leaveSquad (ref), squadState (ref), var25 (ref), badge (ref), badgeVariant (ref), renderStandardImage (ref), var24 (ref), var22 (ref), getFFlagEnableCrossExpVoice (ref), useLocalUserId (ref), useBackgroundExperience (ref), useParticipant (ref), useIsVoiceConnected (ref), useIsVoiceDisconnected (ref), useIsVoiceFocused (ref), useParticipants (ref), useIsActiveParticipant (ref), audioFocusManagementEngineFeature (ref), crossExperienceVoiceManager (ref), runService (ref), renderToggleAudioFocusButton (ref), enableCrossExpVoiceDebug (ref), getLoadingIndicatorIcon (ref), foundationModule (ref), constantsModule (ref)
	local var44 = useDispatch()
	local var45 = useLocalization({
		audioText = "Feature.Squads.Label.Audio",
		leavePartyText = "Feature.Squads.Label.LeaveParty",
		muteMicText = "Feature.Squads.Label.MuteMic",
		unmuteMicText = "Feature.Squads.Label.UnmuteMic",
		viewChatText = "Feature.Squads.Label.ViewChat",
		findExperiencesText = if squadCoordinationExperienceJoinExperimentation.getIsNewTooltipCopyEnabled() then "Feature.Squads.Label.FindExperiencesPlayTogether" else "Feature.Squads.Label.FindExperiences"
	})
	local var46 = useTokens()
	local var47 = useCurrentSquadParentChannelId()
	local var48 = useCurrentSquadSelector()
	local var49 = useVoiceStatus()
	local var50, var51 = reactModule.useState("")
	local var52 = reactModule.useCallback(function(p26)
		-- upvalues: var51 (ref)
		var51(p26)
	end, {})
	local var53 = if var48 and var48.members then #var48.members else 0
	local var54 = useAppPolicy(reactModule.useCallback(function(p27)
		return p27.getCanUsePlatformChat()
	end, {}))
	local var55 = reactModule.useMemo(function()
		-- upvalues: httpService (copy)
		return httpService:GenerateGUID()
	end, {})
	local var56 = if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then reactModule.useContext(squadLobbySessionProvider.Context) else nil
	local var57 = reactModule.useContext(squadExternalContractContext)
	local var58 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var57.useIsChatEnabled() else true
	local var59 = reactModule.useCallback(function(p28)
		-- upvalues: var57 (ref), eventNamesModule (copy), var47 (ref), squadPartySheetActionEnumModule (copy), var49 (ref), p25 (ref)
		var57.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var47,
			actionType = squadPartySheetActionEnumModule.ChatButtonClicked,
			isFtuxTooltipShown = p28,
			voiceStatus = var49
		})
		
		if var47 and var47 ~= "" and p25.navigateToChat then
			p25.navigateToChat(var47)
			
			return
		end
		p25.navigateAwayFromSquad()
	end, {
		p25.navigateAwayFromSquad,
		p25.navigateToChat,
		var47,
		var57.fireSquadAnalytics,
		var49
	})
	local var60 = reactModule.useCallback(function(p29)
		-- upvalues: squadCoordinationExperienceJoinExperimentation (copy), var56 (ref), sessionType (copy), httpService (copy), var57 (ref), eventNamesModule (copy), var47 (ref), squadPartySheetActionEnumModule (copy), var49 (ref), var44 (ref), p25 (ref)
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
			var56.updateMetadata(sessionType.Metadata.SquadLobbyPage.ExperiencePickerUuid, httpService:GenerateGUID(false))
		end
		var57.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var47,
			actionType = squadPartySheetActionEnumModule.PickExperienceButtonClicked,
			isFtuxTooltipShown = p29,
			voiceStatus = var49
		})
		
		if squadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then
			var57.showSearchOverlay(var44)
			
			return
		end
		p25.navigateToHomePage()
	end, {
		var47, p25.navigateToHomePage, var57.fireSquadAnalytics,
		if squadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then var44 else nil,
		if squadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then var57.showSearchOverlay else nil,
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then var56.updateMetadata else nil,
		var49
	})
	local var61 = reactModule.useCallback(function(p30)
		-- upvalues: var57 (ref), eventNamesModule (copy), var47 (ref), squadPartySheetActionEnumModule (copy), var49 (ref), var44 (ref), leaveSquad (copy), p25 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var58 (ref)
		var57.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var47,
			actionType = squadPartySheetActionEnumModule.EndCallButtonClicked,
			isFtuxTooltipShown = p30,
			voiceStatus = var49
		})
		var44(leaveSquad(nil, var57.setSquadPrompt, function()
			-- upvalues: p25 (copy)
			p25.navigateAwayFromSquad()
		end, var57.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var58 else true))
	end, {
		var44, p25.navigateAwayFromSquad, var47, var57.fireSquadAnalytics,
		var57.setSquadPrompt, var57.squadLocation,
		if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var58 else nil,
		var49
	})
	local var62 = p25.squadState ~= squadState.Active
	local var63 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var25 (copy), squadCoordinationExperienceJoinExperimentation (copy), var50 (ref), var62 (ref), var59 (ref), var52 (ref), var45 (ref), p25 (ref), badge (copy), var46 (ref), badgeVariant (copy), renderStandardImage (copy)
		return reactModule.createElement(var25, {
			layoutOrder = 2,
			triggerPointName = "ChatButton",
			currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
			enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
			isDisabled = var62,
			onActivated = var59,
			onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil,
			showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			tooltipText = var45.viewChatText
		}, {
			UnreadMessagesBadge = if p25.hasUnreadMessages then reactModule.createElement(badge, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -var46.Size.Size_250, 0, var46.Size.Size_250),
				variant = badgeVariant.Alert
			}) else nil,
			renderStandardImage(var62, "icons/menu/platformChatOff", "size-800-800", var46)
		})
	end, {
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
		var46, var62, var45.viewChatText, var59,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil,
		p25.hasUnreadMessages
	})
	local var64 = reactModule.useMemo(function()
		-- upvalues: p25 (ref), reactModule (copy), var25 (copy), squadCoordinationExperienceJoinExperimentation (copy), var50 (ref), var62 (ref), var60 (ref), var52 (ref), var53 (ref), var45 (ref), renderStandardImage (copy), var24 (copy), var22 (copy), var46 (ref)
		if p25.isInExperience then
			return nil
		end
		local var85
		local createElement = reactModule.createElement
		local t = {
			layoutOrder = 3,
			triggerPointName = "PickExperienceButton",
			currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
			enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then true else nil,
			ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "SquadExperiencePickerTooltipSeen" else nil,
			isDisabled = var62,
			onActivated = var60,
			onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil
		}
		
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
			var85 = var53 >= 2
			var85 = nil
		else
			var85 = nil
		end
		t.showFtuxCustomConditionsMet = var85
		t.tooltipText = var45.findExperiencesText
		
		return createElement(var25, t, renderStandardImage(var62, var24, var22, var46))
	end, {
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
		var46, var62, var45.findExperiencesText,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var53 else nil,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil,
		p25.isInExperience, p25.navigateToHomePage
	})
	local var65 = reactModule.useMemo(function()
		-- upvalues: var62 (ref), var46 (ref), reactModule (copy), var25 (copy), squadCoordinationExperienceJoinExperimentation (copy), var50 (ref), var61 (ref), var52 (ref), var45 (ref), renderStandardImage (copy)
		return reactModule.createElement(var25, {
			layoutOrder = 4,
			triggerPointName = "EndCallButton",
			backgroundStyle = if var62 then var46.Color.ActionStandard.Background else var46.Color.System.Alert,
			currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
			enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
			isDisabled = var62,
			onActivated = var61,
			onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil,
			showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			tooltipText = var45.leavePartyText
		}, renderStandardImage(var62, "icons/navigation/close", "size-600-600", var46))
	end, {
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
		var46, var62, var45.leavePartyText, var61,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil
	})
	local var66 = nil
	local var67 = nil
	local var68 = nil
	
	if getFFlagEnableCrossExpVoice() then
		local var69 = tonumber(useLocalUserId()) or -1
		local var70 = reactModule.useRef(0)
		local var71 = useBackgroundExperience()
		local var72 = useParticipant(var69)
		local var73 = useIsVoiceConnected()
		local var74 = useIsVoiceDisconnected()
		local var75 = useIsVoiceFocused() or p25.forceIsVoiceFocused
		local var76 = useParticipants()
		local var77 = useIsActiveParticipant(var69)
		local var78, var79 = reactModule.useState(0)
		local var80 = audioFocusManagementEngineFeature
		local var81 = reactModule.useCallback(function(_)
			-- upvalues: httpService (copy), var71 (ref), var72 (ref), var76 (ref), crossExperienceVoiceManager (copy)
			print("----------- CEV FOREGROUND -----------")
			print("Experience info", httpService:JSONEncode(var71))
			print("Current Voice Participant", httpService:JSONEncode(var72))
			print("Squads Store Participants", httpService:JSONEncode(var76 or {}))
			print("--------------------------------------")
			crossExperienceVoiceManager.default:dumpDebugData()
		end, { var76, var72 })
		local var82 = reactModule.useCallback(function(_)
			-- upvalues: var72 (ref), crossExperienceVoiceManager (copy)
			if var72 then
				if var72.isMuted then
					crossExperienceVoiceManager.default:unmuteVoiceParticipant(var72.userId)
					
					return
				end
				crossExperienceVoiceManager.default:muteVoiceParticipant(var72.userId)
			end
		end, { var72 })
		reactModule.useEffect(function()
			-- upvalues: runService (copy), var55 (ref), var70 (ref), var79 (ref)
			runService:BindToRenderStep(var55, 1, function()
				-- upvalues: var70 (copy), var79 (copy)
				if var70.current > 3 then
					var79(math.random())
					var70.current = 0
					
					return
				end
				var70.current += 1
			end)
			
			return function()
				-- upvalues: runService (copy), var55 (copy)
				runService:UnbindFromRenderStep(var55)
			end
		end, {})
		var66 = reactModule.useMemo(function()
			-- upvalues: var62 (ref), var80 (ref), var73 (ref), renderToggleAudioFocusButton (copy), var46 (ref), var45 (ref), p25 (ref), var50 (ref), var52 (ref)
			return if var62 or not var80 or not var73 then nil else renderToggleAudioFocusButton(var46, var45.audioText, p25.toggleVoiceChatMenu, var50, var52)
		end, {
			var46, var80, var50, var62, var73, var45.audioText, var52,
			p25.toggleVoiceChatMenu
		})
		
		if enableCrossExpVoiceDebug then
			var67 = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), var25 (copy), squadCoordinationExperienceJoinExperimentation (copy), var50 (ref), var62 (ref), var81 (ref), var52 (ref), renderStandardImage (copy), var46 (ref)
				return reactModule.createElement(var25, {
					layoutOrder = 5,
					tooltipText = "Debug voice",
					triggerPointName = "DebugVoiceButton",
					currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
					enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
					ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
					isDisabled = var62,
					onActivated = var81,
					onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil,
					showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil
				}, renderStandardImage(var62, "icons/status/player/developer", "size-600-600", var46))
			end, {
				if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
				var46,
				var62,
				var81,
				if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil
			})
		end
		local var83 = reactModule.useMemo(function()
			-- upvalues: getLoadingIndicatorIcon (copy), var46 (ref), var72 (ref), var73 (ref), var62 (ref), var77 (ref), var78 (ref)
			return getLoadingIndicatorIcon(var46, var72, var73, not var62 and var77, var78)
		end, {
			var77, var62, var73, var78, var72, var46
		})
		var68 = reactModule.useMemo(function()
			-- upvalues: var74 (ref), var62 (ref), audioFocusManagementEngineFeature (copy), var75 (ref), var73 (ref), var72 (ref), reactModule (copy), var25 (copy), squadCoordinationExperienceJoinExperimentation (copy), var50 (ref), var82 (ref), var52 (ref), var45 (ref), renderStandardImage (copy), var83 (ref), var46 (ref)
			if var74 then
				return nil
			elseif not var62 and audioFocusManagementEngineFeature and not var75 then
				return nil
			end
			local var86 = if var73 then if var72 ~= nil then var62 else true else not var73
			
			return reactModule.createElement(var25, {
				layoutOrder = 1,
				triggerPointName = "ToggleMicButton",
				currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
				enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
				ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
				isDisabled = var86,
				onActivated = var82,
				onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil,
				showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
				tooltipText = if not var73 or (not var72 or var72.isMuted) then var45.unmuteMicText else var45.muteMicText
			}, renderStandardImage(var86, var83, "size-800-800", var46))
		end, {
			if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var50 else nil,
			var46, var83, var62, var75, var73, var45.muteMicText, var45.unmuteMicText,
			if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var52 else nil,
			var82, var72, var74
		})
	end
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.X,
		AnchorPoint = p25.anchorPoint,
		Position = p25.position,
		Size = UDim2.fromOffset(0, constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT),
		backgroundStyle = var46.Color.OverMedia.OverMedia_0,
		cornerRadius = UDim.new(0, var46.Radius.Circle),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, var46.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		padding = var46.Padding.Small
	}, {
		ToggleAudioFocusButton = var66,
		ToggleMicButton = var68,
		ChatButton = if var54 then var63 else nil,
		PickExperienceButton = var64,
		EndCallButton = var65,
		DebugVoiceButton = var67
	})
end