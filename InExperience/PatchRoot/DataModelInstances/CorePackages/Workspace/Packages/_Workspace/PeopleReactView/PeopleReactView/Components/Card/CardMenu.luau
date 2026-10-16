local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local Menu = FoundationModule.Menu
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local PersonButtonConfigsModule = require(PeopleReactView.Configs.PersonButtonConfigs)
local UseGetPeopleServiceModule = require(PeopleReactView.Hooks.useGetPeopleService)
local PersonButtonModule = require(PeopleReactView.Components.Buttons.PersonButton)
local CardMenuWithVoiceVolumeModule = require(PeopleReactView.Components.Card.CardMenuWithVoiceVolume)
local UseDismissWhenOutOfViewModule = require(PeopleReactView.Hooks.useDismissWhenOutOfView)
local ConstantsModule = require(PeopleReactView.Constants)
local FlagsService = require(Parent.PeopleService).getService("Flags")
local FFlagVoiceVolumeControlsPerUserPlayerGridMenu = FlagsService.FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local FFlagPeoplePageDismissCardMenuOnScrollOutOfView = FlagsService.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule = require(PeopleReactView.Flags.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted)
local FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = FlagsService.FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry

return ReactModule.memo(function(p1) --[[ Line: 42 | Named "CardMenu" ]]
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), UseGetPeopleServiceModule (copy), PersonButtonConfigsModule (copy), SignalsReactModule (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), ReactModule (copy), FFlagPeoplePageDismissCardMenuOnScrollOutOfView (copy), UseDismissWhenOutOfViewModule (copy), IconName (copy), PersonButtonModule (copy), View (copy), CardMenuWithVoiceVolumeModule (copy), FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (copy), Menu (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		unblock = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK,
		block = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.BLOCK,
		unmute = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNMUTE,
		mute = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.MUTE,
		report = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REPORT,
		voiceSectionTitle = if FFlagVoiceVolumeControlsPerUserPlayerGridMenu then ConstantsModule.PEOPLEPAGE.CARD_MENU.LOCALIZED_STRINGS.VOICE_SECTION_TITLE else nil
	})
	local PeopleBlockStatusStore = UseGetPeopleServiceModule("PeopleBlockStatusStore")
	local PeopleVoiceChatStore = UseGetPeopleServiceModule("PeopleVoiceChatStore")
	local PeopleAnalyticsManager = UseGetPeopleServiceModule("PeopleAnalyticsManager")
	local Constants = UseGetPeopleServiceModule("Constants")
	local PersonButtonConfigsModuleResult = PersonButtonConfigsModule(p1.person.UserId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PeopleBlockStatusStore.getPlayerBlockStatus(p1.person.UserId))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(PeopleVoiceChatStore.getPlayerIsLocalMuted(p1.person.UserId))
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(PeopleVoiceChatStore.getPlayerIsTalking(p1.person.UserId))
	local UseSignalStateResult3 = if FFlagVoiceVolumeControlsPerUserPlayerGridMenu then SignalsReactModule.useSignalState(PeopleVoiceChatStore.getShowVolumeControl) else false
	local ShouldShow = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then UseSignalStateResult3 and PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.MUTE_PLAYER].shouldShow() else false
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 73 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		p1.onIsOpenChanged(p2)
		UseStateResult2(p2)
	end, { p1.onIsOpenChanged })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 78 ]]
		-- upvalues: PeopleAnalyticsManager (copy), UseResult (copy)
		PeopleAnalyticsManager:trackPersonCardMenuToggled(false)
		UseResult(false)
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 84 ]]
		-- upvalues: UseStateResult (copy), PeopleAnalyticsManager (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (upval), ShouldShow (copy), Constants (copy), UseResult (copy)
		local NoUseStateResult = not UseStateResult
		PeopleAnalyticsManager:trackPersonCardMenuToggled(NoUseStateResult)
		
		if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and NoUseStateResult and ShouldShow then
			PeopleAnalyticsManager:recordPerUserVoiceVolumeUiOpened(Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
		end
		UseResult(NoUseStateResult)
	end, {
		UseStateResult,
		UseResult,
		if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then ShouldShow else nil,
		if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then Constants else nil
	})
	local UseRefResult = nil
	
	if FFlagPeoplePageDismissCardMenuOnScrollOutOfView then
		UseRefResult = ReactModule.useRef(nil)
		UseDismissWhenOutOfViewModule(UseStateResult, UseResult1, UseRefResult)
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 112 ]]
		-- upvalues: PersonButtonConfigsModuleResult (copy), Constants (copy)
		return PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.MUTE_PLAYER].animatedIcon
	end, { PersonButtonConfigsModuleResult })
	local UseResult3 = nil
	
	if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		local GetPlayerIsLocalMutedFunction = PeopleVoiceChatStore.getPlayerIsLocalMuted
		UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 119 ]]
			-- upvalues: GetPlayerIsLocalMutedFunction (copy)
			return if p2 and GetPlayerIsLocalMutedFunction then GetPlayerIsLocalMutedFunction(p2)(false) else false
		end, { GetPlayerIsLocalMutedFunction })
	end
	local UseMemoResult1 = if FFlagVoiceVolumeControlsPerUserPlayerGridMenu then ReactModule.useMemo(function() --[[ Line: 130 ]]
		-- upvalues: PersonButtonConfigsModuleResult (copy), Constants (copy), UseSignalStateResult1 (copy), UseLocalizationResult (copy), IconName (upval), UseSignalStateResult3 (copy), UseSignalStateResult (copy), UseResult (copy)
		local PersonButtonConfigsModuleResultEntry = PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.MUTE_PLAYER]
		local PersonButtonConfigsModuleResultEntry1 = PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.BLOCK_PLAYER]
		local PersonButtonConfigsModuleResultEntry2 = PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.REPORT_PLAYER]
		local PEOPLECARD = Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD
		local List = {}
		local List1 = {}
		local Config = if PersonButtonConfigsModuleResultEntry.shouldShow() then {
			id = "mute",
			text = if UseSignalStateResult1 then UseLocalizationResult.unmute else UseLocalizationResult.mute,
			icon = if UseSignalStateResult1 then IconName.SpeakerSlash else IconName.Speaker,
			onActivated = function() --[[ Line: 145 ]]
				-- upvalues: PersonButtonConfigsModuleResultEntry (copy), PEOPLECARD (copy)
				PersonButtonConfigsModuleResultEntry.onActivated(PEOPLECARD)
			end
		} else nil
		
		if Config and not UseSignalStateResult3 then
			table.insert(List1, Config)
		end
		if PersonButtonConfigsModuleResultEntry1.shouldShow() then
			table.insert(List1, {
				id = "block",
				text = if UseSignalStateResult then UseLocalizationResult.unblock else UseLocalizationResult.block,
				icon = IconName.CircleSlash,
				onActivated = function() --[[ Line: 161 ]]
					-- upvalues: PersonButtonConfigsModuleResultEntry1 (copy), PEOPLECARD (copy), UseResult (upval)
					PersonButtonConfigsModuleResultEntry1.onActivated(PEOPLECARD)
					UseResult(false)
				end
			})
		end
		if PersonButtonConfigsModuleResultEntry2.shouldShow() then
			table.insert(List1, {
				id = "report",
				text = UseLocalizationResult.report,
				icon = IconName.Flag,
				onActivated = function() --[[ Line: 172 ]]
					-- upvalues: PersonButtonConfigsModuleResultEntry2 (copy), PEOPLECARD (copy)
					PersonButtonConfigsModuleResultEntry2.onActivated(PEOPLECARD)
				end
			})
		end
		if #List1 > 0 then
			table.insert(List, { items = List1 })
		end
		if Config and UseSignalStateResult3 then
			table.insert(List, {
				showVolumeSlider = true,
				title = UseLocalizationResult.voiceSectionTitle,
				items = { Config }
			})
		end
		return List
	end, {
		UseSignalStateResult, UseSignalStateResult1, UseResult,
		PersonButtonConfigsModuleResult, UseLocalizationResult, UseSignalStateResult3
	}) else ReactModule.useMemo(function() --[[ Line: 201 ]]
		-- upvalues: PersonButtonConfigsModuleResult (copy), Constants (copy), UseSignalStateResult1 (copy), UseLocalizationResult (copy), IconName (upval), UseSignalStateResult (copy), UseResult (copy)
		local PersonButtonConfigsModuleResultEntry = PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.MUTE_PLAYER]
		local PersonButtonConfigsModuleResultEntry1 = PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.BLOCK_PLAYER]
		local PersonButtonConfigsModuleResultEntry2 = PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.REPORT_PLAYER]
		local List = {}
		
		if PersonButtonConfigsModuleResultEntry.shouldShow() then
			table.insert(List, {
				id = "mute",
				text = if UseSignalStateResult1 then UseLocalizationResult.unmute else UseLocalizationResult.mute,
				icon = if UseSignalStateResult1 then IconName.SpeakerSlash else IconName.Speaker,
				onActivated = function() --[[ Line: 213 ]]
					-- upvalues: PersonButtonConfigsModuleResultEntry (copy), Constants (upval)
					PersonButtonConfigsModuleResultEntry.onActivated(Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		if PersonButtonConfigsModuleResultEntry1.shouldShow() then
			table.insert(List, {
				id = "block",
				text = if UseSignalStateResult then UseLocalizationResult.unblock else UseLocalizationResult.block,
				icon = IconName.CircleSlash,
				onActivated = function() --[[ Line: 223 ]]
					-- upvalues: PersonButtonConfigsModuleResultEntry1 (copy), Constants (upval), UseResult (upval)
					PersonButtonConfigsModuleResultEntry1.onActivated(Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
					UseResult(false)
				end
			})
		end
		if PersonButtonConfigsModuleResultEntry2.shouldShow() then
			table.insert(List, {
				id = "report",
				text = UseLocalizationResult.report,
				icon = IconName.Flag,
				onActivated = function() --[[ Line: 234 ]]
					-- upvalues: PersonButtonConfigsModuleResultEntry2 (copy), Constants (upval)
					PersonButtonConfigsModuleResultEntry2.onActivated(Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		return List
	end, {
		UseSignalStateResult,
		UseSignalStateResult1,
		UseResult,
		PersonButtonConfigsModuleResult,
		UseLocalizationResult
	})
	local Element = ReactModule.createElement(PersonButtonModule, {
		isBackgroundTransparent = true,
		LayoutOrder = 1,
		icon = {
			on = if UseSignalStateResult2 then nil else IconName.ThreeDotsHorizontal
		},
		animatedIcon = if UseSignalStateResult2 then UseMemoResult else nil,
		onActivated = UseResult2,
		isBuilderIcon = not UseSignalStateResult2
	})
	local Element1 = if FFlagPeoplePageDismissCardMenuOnScrollOutOfView then ReactModule.createElement(View, { LayoutOrder = 1, tag = "auto-xy", ref = UseRefResult }, { Button = Element }) else nil
	
	return if next(UseMemoResult1) == nil then nil elseif FFlagVoiceVolumeControlsPerUserPlayerGridMenu then ReactModule.createElement(CardMenuWithVoiceVolumeModule, {
		isOpen = UseStateResult,
		menuGroups = UseMemoResult1,
		onPressedOutside = UseResult1,
		userId = p1.person.UserId,
		voiceVolumeMin = Constants.VOICE_CHAT.VOICE_VOLUME.MIN,
		voiceVolumeMax = Constants.VOICE_CHAT.VOICE_VOLUME.MAX,
		getPlayerVoiceVolume = PeopleVoiceChatStore.getPlayerVoiceVolume,
		subscribePlayerVoiceVolume = PeopleVoiceChatStore.subscribePlayerVoiceVolume,
		setPlayerVoiceVolume = PeopleVoiceChatStore.setPlayerVoiceVolume,
		isMutedByLocalUser = if FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then UseSignalStateResult1 else nil,
		getPlayerIsLocalMuted = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then UseResult3 else nil,
		getVoiceSessionId = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then PeopleVoiceChatStore.getVoiceSessionId else nil
	}, { MenuAnchor = Element1 or Element }) else ReactModule.createElement(Menu, {
		isOpen = UseStateResult,
		items = UseMemoResult1,
		size = InputSize.Medium,
		onPressedOutside = UseResult1
	}, { MenuAnchor = Element1 or Element })
end)