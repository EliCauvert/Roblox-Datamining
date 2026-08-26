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
local var1 = if squadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() then "size-800-800" else "size-600-600"
local t = {
	["icons/menu/platformChatOff"] = "speech-bubble-align-center",
	["icons/common/play"] = "play-large",
	["icons/common/search"] = "magnifying-glass",
	["icons/navigation/close"] = "x",
	["icons/controls/headphone"] = "headphones",
	["icons/actions/truncationCollapse_small"] = "chevron-large-up",
	["icons/status/player/developer"] = "hammer-code"
}
local var2 = if squadCoordinationExperienceJoinExperimentation.getIsSearchIconOnExpPickerEnabled() then "icons/common/search" else "icons/common/play"

local function _(p1)
	-- upvalues: appStorageService (ref), squadExperiencePickerTooltipSeenStorageValue (ref)
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy), p1 (ref)
		return appStorageService:GetItem(p1)
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

local var3 = function(p1)
	-- upvalues: reactModule (ref), controlState (ref), useTokens (ref), useLastInputMethod (ref), squadCoordinationExperienceJoinExperimentation (ref), appStorageService (ref), squadExperiencePickerTooltipSeenStorageValue (ref), inputUtilities (ref), coreGuiService (ref), externalEventConnection (ref), userInputService (ref), foundationModule (ref), withTooltip (ref), withHoverTooltip (ref)
	local var4, var5 = reactModule.useBinding(controlState.Initialize)
	local var6 = useTokens()
	local var7 = useLastInputMethod()
	local t = { headerText = p1.tooltipText }
	local var8, var9 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: squadCoordinationExperienceJoinExperimentation (copy), p1 (ref), appStorageService (copy), squadExperiencePickerTooltipSeenStorageValue (copy), var9 (ref)
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
			if p1.enableFirstTimeTooltip and p1.showFtuxCustomConditionsMet and (p1.currentHoveredButton == "" or p1.currentHoveredButton == p1.triggerPointName) then
				local ftuxAppStorageKey = p1.ftuxAppStorageKey
				local ok, status = pcall(function()
					-- upvalues: appStorageService (copy), ftuxAppStorageKey (ref)
					return appStorageService:GetItem(ftuxAppStorageKey)
				end)
				local var10 = if ok and status ~= nil then status == squadExperiencePickerTooltipSeenStorageValue else false
				
				if not var10 then
					var10 = p1.ftuxAppStorageKey
					pcall(function()
						-- upvalues: appStorageService (copy), var10 (ref), squadExperiencePickerTooltipSeenStorageValue (copy)
						appStorageService:SetItem(var10, squadExperiencePickerTooltipSeenStorageValue)
						appStorageService:Flush()
					end)
					
					if p1.currentHoveredButton == "" then
						var9(true)
						
						return
					end
				elseif not p1.enableFirstTimeTooltip or p1.currentHoveredButton ~= "" and p1.currentHoveredButton ~= p1.triggerPointName then
					var9(false)
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
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: inputUtilities (copy), var7 (ref), var9 (ref)
		if inputUtilities.isActivationInput(p2) or var7 == "Gamepad" then
			var9(false)
		end
	end, { var7 })
	local t_1 = {
		DisplayOrder = 6,
		disabled = false,
		guiTarget = coreGuiService,
		active = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var8 else nil,
		triggerPointName = p1.triggerPointName
	}
	
	local var11 = function(p2, p3, p4)
		-- upvalues: reactModule (copy), controlState (copy), squadCoordinationExperienceJoinExperimentation (copy), p1 (ref), var4 (ref), var5 (ref), var8 (ref), externalEventConnection (copy), userInputService (copy), var10 (ref), foundationModule (copy), var6 (ref)
		return reactModule.createElement("Frame", {
			AutomaticSize = p1.automaticSize,
			LayoutOrder = p1.layoutOrder,
			Size = UDim2.fromOffset(40, 40),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsolutePosition] = p2,
			[reactModule.Change.AbsoluteSize] = p3
		}, {
			InputEndedConnection = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and var8 then reactModule.createElement(externalEventConnection, { event = userInputService.InputEnded, callback = var10 }) else nil,
			reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromScale(1, 1),
				backgroundStyle = p1.backgroundStyle,
				cornerRadius = UDim.new(0, var6.Radius.Circle),
				isDisabled = p1.isDisabled,
				onActivated = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then reactModule.useCallback(function()
					-- upvalues: p1 (copy), var8 (copy)
					if p1.onActivated then
						p1.onActivated(var8)
					end
				end, { var8, p1.onActivated }) else p1.onActivated,
				onStateChanged = reactModule.useCallback(function(p5)
					-- upvalues: controlState (copy), squadCoordinationExperienceJoinExperimentation (copy), p1 (copy), p4 (ref), var4 (copy), var5 (copy)
					local var12 = controlState.fromRawValue(p5)
					
					if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
						if var12 == controlState.Hover then
							p1.onHoverCalled(p1.triggerPointName)
						elseif var12 == controlState.Default then
							p1.onHoverCalled("")
						end
					end
					if p4 then
						p4(var4:getValue(), var12)
					end
					var5(var12)
				end, { var4, p1.onHoverCalled, p1.triggerPointName, var5 })
			}, p1.children)
		})
	end
	
	return if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() and var8 then withTooltip(t, t_1, function(p2)
		-- upvalues: var11 (ref)
		return var11(p2, p2, nil)
	end) else withHoverTooltip(t, t_1, function(p2, p3)
		-- upvalues: var11 (ref)
		return var11(p2, p2, p3)
	end)
end

local _ = function(p1)
	return {
		["size-600-600"] = p1.Size.Size_600,
		["size-800-800"] = p1.Size.Size_800
	}
end

local function renderStandardImage(p1, p2, p3, p4)
	-- upvalues: t (ref), reactModule (ref), foundationModule (ref)
	local var4 = t[p2]
	
	if var4 then
		local t_1 = {
			["size-600-600"] = p4.Size.Size_600,
			["size-800-800"] = p4.Size.Size_800
		}
		
		return reactModule.createElement(foundationModule.Icon, {
			name = var4,
			style = if p1 then p4.Color.Content.Muted else p4.Color.Content.Emphasis,
			size = t_1[p3] or t_1["size-600-600"],
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	end
	return reactModule.createElement(foundationModule.Image, {
		Image = p2,
		tag = {
			["content-emphasis"] = not p1,
			["content-muted"] = p1,
			["anchor-center-center position-center-center " .. p13] = true
		}
	})
end

local function getLoadingIndicatorIcon(p1, p2, p3, p4, p5)
	-- upvalues: voiceChatModule (ref)
	local var4 = if p1.Config.ColorMode.IsLight == "true" then "MicDark" else "MicLight"
	
	return if not (not p3 or not p2 or p2.isMuted) then if p4 then voiceChatModule.Utils.GetIcon("Unmuted", var4, p5) else voiceChatModule.Utils.GetIcon("Unmuted0", var4) else voiceChatModule.Utils.GetIcon("Muted", var4)
end

local function renderToggleAudioFocusButton(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), var3 (ref), squadCoordinationExperienceJoinExperimentation (ref), foundationModule (ref)
	return reactModule.createElement(var3, {
		isDisabled = false,
		layoutOrder = 0,
		triggerPointName = "ToggleAudioFocusButton",
		automaticSize = Enum.AutomaticSize.X,
		currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then p4 else nil,
		enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
		ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
		onActivated = p3,
		onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then p5 else nil,
		showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
		tooltipText = p2
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.Padding.Small),
			PaddingRight = UDim.new(0, p1.Padding.Small)
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

return function(p1)
	-- upvalues: useDispatch (ref), useLocalization (ref), squadCoordinationExperienceJoinExperimentation (ref), useTokens (ref), useCurrentSquadParentChannelId (ref), useCurrentSquadSelector (ref), useVoiceStatus (ref), reactModule (ref), useAppPolicy (ref), httpService (ref), squadLobbySessionProvider (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), sessionType (ref), leaveSquad (ref), squadState (ref), var3 (ref), badge (ref), badgeVariant (ref), renderStandardImage (ref), var2 (ref), var1 (ref), getFFlagEnableCrossExpVoice (ref), useLocalUserId (ref), useBackgroundExperience (ref), useParticipant (ref), useIsVoiceConnected (ref), useIsVoiceDisconnected (ref), useIsVoiceFocused (ref), useParticipants (ref), useIsActiveParticipant (ref), audioFocusManagementEngineFeature (ref), crossExperienceVoiceManager (ref), runService (ref), renderToggleAudioFocusButton (ref), enableCrossExpVoiceDebug (ref), getLoadingIndicatorIcon (ref), foundationModule (ref), constantsModule (ref)
	local var4 = useDispatch()
	local var5 = useLocalization({
		audioText = "Feature.Squads.Label.Audio",
		leavePartyText = "Feature.Squads.Label.LeaveParty",
		muteMicText = "Feature.Squads.Label.MuteMic",
		unmuteMicText = "Feature.Squads.Label.UnmuteMic",
		viewChatText = "Feature.Squads.Label.ViewChat",
		findExperiencesText = if squadCoordinationExperienceJoinExperimentation.getIsNewTooltipCopyEnabled() then "Feature.Squads.Label.FindExperiencesPlayTogether" else "Feature.Squads.Label.FindExperiences"
	})
	local var6 = useTokens()
	local var7 = useCurrentSquadParentChannelId()
	local var8 = useCurrentSquadSelector()
	local var9 = useVoiceStatus()
	local var10, var11 = reactModule.useState("")
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref)
		var11(p2)
	end, {})
	local var13 = if var8 and var8.members then #var8.members else 0
	local var14 = useAppPolicy(reactModule.useCallback(function(p2)
		return p2.getCanUsePlatformChat()
	end, {}))
	local var15 = reactModule.useMemo(function()
		-- upvalues: httpService (copy)
		return httpService:GenerateGUID()
	end, {})
	local var16 = if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then reactModule.useContext(squadLobbySessionProvider.Context) else nil
	local var17 = reactModule.useContext(squadExternalContractContext)
	local var18 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var17.useIsChatEnabled() else true
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), eventNamesModule (copy), var7 (ref), squadPartySheetActionEnumModule (copy), var9 (ref), p1 (ref)
		var17.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var7,
			actionType = squadPartySheetActionEnumModule.ChatButtonClicked,
			isFtuxTooltipShown = p2,
			voiceStatus = var9
		})
		
		if var7 and var7 ~= "" and p1.navigateToChat then
			p1.navigateToChat(var7)
			
			return
		end
		p1.navigateAwayFromSquad()
	end, {
		p1.navigateAwayFromSquad,
		p1.navigateToChat,
		var7,
		var17.fireSquadAnalytics,
		var9
	})
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: squadCoordinationExperienceJoinExperimentation (copy), var16 (ref), sessionType (copy), httpService (copy), var17 (ref), eventNamesModule (copy), var7 (ref), squadPartySheetActionEnumModule (copy), var9 (ref), var4 (ref), p1 (ref)
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
			var16.updateMetadata(sessionType.Metadata.SquadLobbyPage.ExperiencePickerUuid, httpService:GenerateGUID(false))
		end
		var17.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var7,
			actionType = squadPartySheetActionEnumModule.PickExperienceButtonClicked,
			isFtuxTooltipShown = p2,
			voiceStatus = var9
		})
		
		if squadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then
			var17.showSearchOverlay(var4)
			
			return
		end
		p1.navigateToHomePage()
	end, {
		var7, p1.navigateToHomePage, var17.fireSquadAnalytics,
		if squadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then var4 else nil,
		if squadCoordinationExperienceJoinExperimentation.getShouldOpenSLPFromExpPickerEnabled() then var17.showSearchOverlay else nil,
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then var16.updateMetadata else nil,
		var9
	})
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), eventNamesModule (copy), var7 (ref), squadPartySheetActionEnumModule (copy), var9 (ref), var4 (ref), leaveSquad (copy), p1 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var18 (ref)
		var17.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
			parentChannelId = var7,
			actionType = squadPartySheetActionEnumModule.EndCallButtonClicked,
			isFtuxTooltipShown = p2,
			voiceStatus = var9
		})
		var4(leaveSquad(nil, var17.setSquadPrompt, function()
			-- upvalues: p1 (copy)
			p1.navigateAwayFromSquad()
		end, var17.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var18 else true))
	end, {
		var4, p1.navigateAwayFromSquad, var7, var17.fireSquadAnalytics,
		var17.setSquadPrompt, var17.squadLocation,
		if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var18 else nil,
		var9
	})
	local var22 = p1.squadState ~= squadState.Active
	local var23 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var3 (copy), squadCoordinationExperienceJoinExperimentation (copy), var10 (ref), var22 (ref), var19 (ref), var12 (ref), var5 (ref), p1 (ref), badge (copy), var6 (ref), badgeVariant (copy), renderStandardImage (copy)
		return reactModule.createElement(var3, {
			layoutOrder = 2,
			triggerPointName = "ChatButton",
			currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
			enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
			isDisabled = var22,
			onActivated = var19,
			onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil,
			showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			tooltipText = var5.viewChatText
		}, {
			UnreadMessagesBadge = if p1.hasUnreadMessages then reactModule.createElement(badge, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -var6.Size.Size_250, 0, var6.Size.Size_250),
				variant = badgeVariant.Alert
			}) else nil,
			renderStandardImage(var22, "icons/menu/platformChatOff", "size-800-800", var6)
		})
	end, {
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
		var6, var22, var5.viewChatText, var19,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil,
		p1.hasUnreadMessages
	})
	local var24 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), var3 (copy), squadCoordinationExperienceJoinExperimentation (copy), var10 (ref), var22 (ref), var20 (ref), var12 (ref), var13 (ref), var5 (ref), renderStandardImage (copy), var2 (copy), var1 (copy), var6 (ref)
		if p1.isInExperience then
			return nil
		end
		local var25
		local createElement = reactModule.createElement
		local t = {
			layoutOrder = 3,
			triggerPointName = "PickExperienceButton",
			currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
			enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then true else nil,
			ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "SquadExperiencePickerTooltipSeen" else nil,
			isDisabled = var22,
			onActivated = var20,
			onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil
		}
		
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then
			var25 = var13 >= 2
			var25 = nil
		else
			var25 = nil
		end
		t.showFtuxCustomConditionsMet = var25
		t.tooltipText = var5.findExperiencesText
		
		return createElement(var3, t, renderStandardImage(var22, var2, var1, var6))
	end, {
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
		var6, var22, var5.findExperiencesText,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var13 else nil,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil,
		p1.isInExperience, p1.navigateToHomePage
	})
	local var25 = reactModule.useMemo(function()
		-- upvalues: var22 (ref), var6 (ref), reactModule (copy), var3 (copy), squadCoordinationExperienceJoinExperimentation (copy), var10 (ref), var21 (ref), var12 (ref), var5 (ref), renderStandardImage (copy)
		return reactModule.createElement(var3, {
			layoutOrder = 4,
			triggerPointName = "EndCallButton",
			backgroundStyle = if var22 then var6.Color.ActionStandard.Background else var6.Color.System.Alert,
			currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
			enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
			isDisabled = var22,
			onActivated = var21,
			onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil,
			showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
			tooltipText = var5.leavePartyText
		}, renderStandardImage(var22, "icons/navigation/close", "size-600-600", var6))
	end, {
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
		var6, var22, var5.leavePartyText, var21,
		if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil
	})
	local var26 = nil
	local var27 = nil
	local var28 = nil
	
	if getFFlagEnableCrossExpVoice() then
		local var29 = tonumber(useLocalUserId()) or -1
		local var30 = reactModule.useRef(0)
		local var31 = useBackgroundExperience()
		local var32 = useParticipant(var29)
		local var33 = useIsVoiceConnected()
		local var34 = useIsVoiceDisconnected()
		local var35 = useIsVoiceFocused() or p1.forceIsVoiceFocused
		local var36 = useParticipants()
		local var37 = useIsActiveParticipant(var29)
		local var38, var39 = reactModule.useState(0)
		local var40 = audioFocusManagementEngineFeature
		local var41 = reactModule.useCallback(function(_)
			-- upvalues: httpService (copy), var31 (ref), var32 (ref), var36 (ref), crossExperienceVoiceManager (copy)
			print("----------- CEV FOREGROUND -----------")
			print("Experience info", httpService:JSONEncode(var31))
			print("Current Voice Participant", httpService:JSONEncode(var32))
			print("Squads Store Participants", httpService:JSONEncode(var36 or {}))
			print("--------------------------------------")
			crossExperienceVoiceManager.default:dumpDebugData()
		end, { var36, var32 })
		local var42 = reactModule.useCallback(function(_)
			-- upvalues: var32 (ref), crossExperienceVoiceManager (copy)
			if var32 then
				if var32.isMuted then
					crossExperienceVoiceManager.default:unmuteVoiceParticipant(var32.userId)
					
					return
				end
				crossExperienceVoiceManager.default:muteVoiceParticipant(var32.userId)
			end
		end, { var32 })
		reactModule.useEffect(function()
			-- upvalues: runService (copy), var15 (ref), var30 (ref), var39 (ref)
			runService:BindToRenderStep(var15, 1, function()
				-- upvalues: var30 (copy), var39 (copy)
				if var30.current > 3 then
					var39(math.random())
					var30.current = 0
					
					return
				end
				var30.current += 1
			end)
			
			return function()
				-- upvalues: runService (copy), var15 (copy)
				runService:UnbindFromRenderStep(var15)
			end
		end, {})
		var26 = reactModule.useMemo(function()
			-- upvalues: var22 (ref), var40 (ref), var33 (ref), renderToggleAudioFocusButton (copy), var6 (ref), var5 (ref), p1 (ref), var10 (ref), var12 (ref)
			return if var22 or not var40 or not var33 then nil else renderToggleAudioFocusButton(var6, var5.audioText, p1.toggleVoiceChatMenu, var10, var12)
		end, {
			var6, var40, var10, var22, var33, var5.audioText, var12,
			p1.toggleVoiceChatMenu
		})
		
		if enableCrossExpVoiceDebug then
			var27 = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), var3 (copy), squadCoordinationExperienceJoinExperimentation (copy), var10 (ref), var22 (ref), var41 (ref), var12 (ref), renderStandardImage (copy), var6 (ref)
				return reactModule.createElement(var3, {
					layoutOrder = 5,
					tooltipText = "Debug voice",
					triggerPointName = "DebugVoiceButton",
					currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
					enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
					ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
					isDisabled = var22,
					onActivated = var41,
					onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil,
					showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil
				}, renderStandardImage(var22, "icons/status/player/developer", "size-600-600", var6))
			end, {
				if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
				var6,
				var22,
				var41,
				if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil
			})
		end
		local var43 = reactModule.useMemo(function()
			-- upvalues: getLoadingIndicatorIcon (copy), var6 (ref), var32 (ref), var33 (ref), var22 (ref), var37 (ref), var38 (ref)
			return getLoadingIndicatorIcon(var6, var32, var33, not var22 and var37, var38)
		end, {
			var37, var22, var33, var38, var32, var6
		})
		var28 = reactModule.useMemo(function()
			-- upvalues: var34 (ref), var22 (ref), audioFocusManagementEngineFeature (copy), var35 (ref), var33 (ref), var32 (ref), reactModule (copy), var3 (copy), squadCoordinationExperienceJoinExperimentation (copy), var10 (ref), var42 (ref), var12 (ref), var5 (ref), renderStandardImage (copy), var43 (ref), var6 (ref)
			if var34 then
				return nil
			elseif not var22 and audioFocusManagementEngineFeature and not var35 then
				return nil
			end
			local var44 = if var33 then if var32 ~= nil then var22 else true else not var33
			
			return reactModule.createElement(var3, {
				layoutOrder = 1,
				triggerPointName = "ToggleMicButton",
				currentHoveredButton = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
				enableFirstTimeTooltip = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
				ftuxAppStorageKey = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then "" else nil,
				isDisabled = var44,
				onActivated = var42,
				onHoverCalled = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil,
				showFtuxCustomConditionsMet = if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then false else nil,
				tooltipText = if not var33 or (not var32 or var32.isMuted) then var5.unmuteMicText else var5.muteMicText
			}, renderStandardImage(var44, var43, "size-800-800", var6))
		end, {
			if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var10 else nil,
			var6, var43, var22, var35, var33, var5.muteMicText, var5.unmuteMicText,
			if squadCoordinationExperienceJoinExperimentation.getShouldShowFTUXOnExpPickerEnabled() then var12 else nil,
			var42, var32, var34
		})
	end
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.X,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		Size = UDim2.fromOffset(0, constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT),
		backgroundStyle = var6.Color.OverMedia.OverMedia_0,
		cornerRadius = UDim.new(0, var6.Radius.Circle),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, var6.Gap.Large),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		padding = var6.Padding.Small
	}, {
		ToggleAudioFocusButton = var26,
		ToggleMicButton = var28,
		ChatButton = if var14 then var23 else nil,
		PickExperienceButton = var24,
		EndCallButton = var25,
		DebugVoiceButton = var27
	})
end