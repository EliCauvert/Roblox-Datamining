local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local menu = foundationModule.Menu
local view = foundationModule.View
local useLocalization = require(parent.Localization).Hooks.useLocalization
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)
local personButtonModule = require(peopleReactView.Components.Buttons.PersonButton)
local cardMenuWithVoiceVolumeModule = require(peopleReactView.Components.Card.CardMenuWithVoiceVolume)
local useDismissWhenOutOfViewModule = require(peopleReactView.Hooks.useDismissWhenOutOfView)
local constantsModule = require(peopleReactView.Constants)
local flags = require(parent.PeopleService).getService("Flags")
local fFlagVoiceVolumeControlsPerUserPlayerGridMenu = flags.FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local fFlagPeoplePageDismissCardMenuOnScrollOutOfView = flags.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule = require(peopleReactView.Flags.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted)
local fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = flags.FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry

return reactModule.memo(function(p0)
	-- upvalues: useLocalization (ref), constantsModule (ref), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (ref), useGetPeopleServiceModule (ref), personButtonConfigsModule (ref), signalsReactModule (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), reactModule (ref), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (ref), useDismissWhenOutOfViewModule (ref), iconName (ref), personButtonModule (ref), view (ref), cardMenuWithVoiceVolumeModule (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (ref), menu (ref), inputSize (ref)
	local var12 = useLocalization({
		unblock = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK,
		block = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.BLOCK,
		unmute = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNMUTE,
		mute = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.MUTE,
		report = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REPORT,
		voiceSectionTitle = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then constantsModule.PEOPLEPAGE.CARD_MENU.LOCALIZED_STRINGS.VOICE_SECTION_TITLE else nil
	})
	local var13 = useGetPeopleServiceModule("PeopleBlockStatusStore")
	local var14 = useGetPeopleServiceModule("PeopleVoiceChatStore")
	local var15 = useGetPeopleServiceModule("PeopleAnalyticsManager")
	local var16 = useGetPeopleServiceModule("Constants")
	local var17 = personButtonConfigsModule(p0.person.UserId)
	local var18 = signalsReactModule.useSignalState(var13.getPlayerBlockStatus(p0.person.UserId))
	local var19 = signalsReactModule.useSignalState(var14.getPlayerIsLocalMuted(p0.person.UserId))
	local var20 = signalsReactModule.useSignalState(var14.getPlayerIsTalking(p0.person.UserId))
	local var21 = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then signalsReactModule.useSignalState(var14.getShowVolumeControl) else false
	local var22 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var21 and var17[var16.PERSON_BUTTONS.MUTE_PLAYER].shouldShow() else false
	local var23, var24 = reactModule.useState(false)
	local var25 = reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), var24 (ref)
		p0.onIsOpenChanged(p1)
		var24(p1)
	end, { p0.onIsOpenChanged })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var25 (ref)
		var15:trackPersonCardMenuToggled(false)
		var25(false)
	end, { var25 })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), var15 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var22 (ref), var16 (ref), var25 (ref)
		local var34 = not var23
		var15:trackPersonCardMenuToggled(var34)
		
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var34 and var22 then
			var15:recordPerUserVoiceVolumeUiOpened(var16.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
		end
		var25(var34)
	end, {
		var23,
		var25,
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var22 else nil,
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var16 else nil
	})
	local var28 = nil
	
	if fFlagPeoplePageDismissCardMenuOnScrollOutOfView then
		var28 = reactModule.useRef(nil)
		useDismissWhenOutOfViewModule(var23, var26, var28)
	end
	local var29 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), var16 (ref)
		return var17[var16.PERSON_BUTTONS.MUTE_PLAYER].animatedIcon
	end, { var17 })
	local var30 = nil
	
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		local getPlayerIsLocalMuted = var14.getPlayerIsLocalMuted
		var30 = reactModule.useCallback(function(p2)
			-- upvalues: getPlayerIsLocalMuted (ref)
			return if p2 and getPlayerIsLocalMuted then getPlayerIsLocalMuted(p2)(false) else false
		end, { getPlayerIsLocalMuted })
	end
	local var31 = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then reactModule.useMemo(function()
		-- upvalues: var17 (ref), var16 (ref), var19 (ref), var12 (ref), iconName (copy), var21 (ref), var18 (ref), var25 (ref)
		local MUTE_PLAYER = var17[var16.PERSON_BUTTONS.MUTE_PLAYER]
		local BLOCK_PLAYER = var17[var16.PERSON_BUTTONS.BLOCK_PLAYER]
		local REPORT_PLAYER = var17[var16.PERSON_BUTTONS.REPORT_PLAYER]
		local PEOPLE_CARD = var16.ANALYTICS.ENTRY_POINT.PEOPLE_CARD
		local t = {}
		local t_1 = {}
		local var38 = if MUTE_PLAYER.shouldShow() then {
			id = "mute",
			text = if var19 then var12.unmute else var12.mute,
			icon = if var19 then iconName.SpeakerSlash else iconName.Speaker,
			onActivated = function()
				-- upvalues: MUTE_PLAYER (ref), PEOPLE_CARD (ref)
				MUTE_PLAYER.onActivated(PEOPLE_CARD)
			end
		} else nil
		
		if var38 and not var21 then
			table.insert(t_1, var38)
		end
		if BLOCK_PLAYER.shouldShow() then
			table.insert(t_1, {
				id = "block",
				text = if var18 then var12.unblock else var12.block,
				icon = iconName.CircleSlash,
				onActivated = function()
					-- upvalues: BLOCK_PLAYER (ref), PEOPLE_CARD (ref), var25 (copy)
					BLOCK_PLAYER.onActivated(PEOPLE_CARD)
					var25(false)
				end
			})
		end
		if REPORT_PLAYER.shouldShow() then
			table.insert(t_1, {
				id = "report",
				text = var12.report,
				icon = iconName.Flag,
				onActivated = function()
					-- upvalues: REPORT_PLAYER (ref), PEOPLE_CARD (ref)
					REPORT_PLAYER.onActivated(PEOPLE_CARD)
				end
			})
		end
		if #t_1 > 0 then
			table.insert(t, { items = t_1 })
		end
		if var38 and var21 then
			table.insert(t, {
				showVolumeSlider = true,
				title = var12.voiceSectionTitle,
				items = { var38 }
			})
		end
		return t
	end, {
		var18, var19, var25, var17, var12, var21
	}) else reactModule.useMemo(function()
		-- upvalues: var17 (ref), var16 (ref), var19 (ref), var12 (ref), iconName (copy), var18 (ref), var25 (ref)
		local MUTE_PLAYER = var17[var16.PERSON_BUTTONS.MUTE_PLAYER]
		local BLOCK_PLAYER = var17[var16.PERSON_BUTTONS.BLOCK_PLAYER]
		local REPORT_PLAYER = var17[var16.PERSON_BUTTONS.REPORT_PLAYER]
		local t = {}
		
		if MUTE_PLAYER.shouldShow() then
			table.insert(t, {
				id = "mute",
				text = if var19 then var12.unmute else var12.mute,
				icon = if var19 then iconName.SpeakerSlash else iconName.Speaker,
				onActivated = function()
					-- upvalues: MUTE_PLAYER (ref), var16 (copy)
					MUTE_PLAYER.onActivated(var16.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		if BLOCK_PLAYER.shouldShow() then
			table.insert(t, {
				id = "block",
				text = if var18 then var12.unblock else var12.block,
				icon = iconName.CircleSlash,
				onActivated = function()
					-- upvalues: BLOCK_PLAYER (ref), var16 (copy), var25 (copy)
					BLOCK_PLAYER.onActivated(var16.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
					var25(false)
				end
			})
		end
		if REPORT_PLAYER.shouldShow() then
			table.insert(t, {
				id = "report",
				text = var12.report,
				icon = iconName.Flag,
				onActivated = function()
					-- upvalues: REPORT_PLAYER (ref), var16 (copy)
					REPORT_PLAYER.onActivated(var16.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		return t
	end, {
		var18,
		var19,
		var25,
		var17,
		var12
	})
	local var32 = reactModule.createElement(personButtonModule, {
		isBackgroundTransparent = true,
		LayoutOrder = 1,
		icon = { on = if var20 then nil else iconName.ThreeDotsHorizontal },
		animatedIcon = if var20 then var29 else nil,
		onActivated = var27,
		isBuilderIcon = not var20
	})
	local var33 = if fFlagPeoplePageDismissCardMenuOnScrollOutOfView then reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy", ref = var28 }, { Button = var32 }) else nil
	
	return if next(var31) == nil then nil elseif fFlagVoiceVolumeControlsPerUserPlayerGridMenu then reactModule.createElement(cardMenuWithVoiceVolumeModule, {
		isOpen = var23,
		menuGroups = var31,
		onPressedOutside = var26,
		userId = p0.person.UserId,
		voiceVolumeMin = var16.VOICE_CHAT.VOICE_VOLUME.MIN,
		voiceVolumeMax = var16.VOICE_CHAT.VOICE_VOLUME.MAX,
		getPlayerVoiceVolume = var14.getPlayerVoiceVolume,
		subscribePlayerVoiceVolume = var14.subscribePlayerVoiceVolume,
		setPlayerVoiceVolume = var14.setPlayerVoiceVolume,
		isMutedByLocalUser = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then var19 else nil,
		getPlayerIsLocalMuted = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var30 else nil,
		getVoiceSessionId = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var14.getVoiceSessionId else nil
	}, { MenuAnchor = var33 or var32 }) else reactModule.createElement(menu, {
		isOpen = var23,
		items = var31,
		size = inputSize.Medium,
		onPressedOutside = var26
	}, { MenuAnchor = var33 or var32 })
end)