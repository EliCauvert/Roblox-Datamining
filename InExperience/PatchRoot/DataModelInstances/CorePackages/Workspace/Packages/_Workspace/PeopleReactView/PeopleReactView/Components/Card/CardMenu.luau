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

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), constantsModule (ref), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (ref), useGetPeopleServiceModule (ref), personButtonConfigsModule (ref), signalsReactModule (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), reactModule (ref), fFlagPeoplePageDismissCardMenuOnScrollOutOfView (ref), useDismissWhenOutOfViewModule (ref), iconName (ref), personButtonModule (ref), view (ref), cardMenuWithVoiceVolumeModule (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (ref), menu (ref), inputSize (ref)
	local var1 = useLocalization({
		unblock = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK,
		block = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.BLOCK,
		unmute = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNMUTE,
		mute = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.MUTE,
		report = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REPORT,
		voiceSectionTitle = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then constantsModule.PEOPLEPAGE.CARD_MENU.LOCALIZED_STRINGS.VOICE_SECTION_TITLE else nil
	})
	local var2 = useGetPeopleServiceModule("PeopleBlockStatusStore")
	local var3 = useGetPeopleServiceModule("PeopleVoiceChatStore")
	local var4 = useGetPeopleServiceModule("PeopleAnalyticsManager")
	local var5 = useGetPeopleServiceModule("Constants")
	local var6 = personButtonConfigsModule(p1.person.UserId)
	local var7 = signalsReactModule.useSignalState(var2.getPlayerBlockStatus(p1.person.UserId))
	local var8 = signalsReactModule.useSignalState(var3.getPlayerIsLocalMuted(p1.person.UserId))
	local var9 = signalsReactModule.useSignalState(var3.getPlayerIsTalking(p1.person.UserId))
	local var10 = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then signalsReactModule.useSignalState(var3.getShowVolumeControl) else false
	local var11 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var10 and var6[var5.PERSON_BUTTONS.MUTE_PLAYER].shouldShow() else false
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var13 (ref)
		p1.onIsOpenChanged(p2)
		var13(p2)
	end, { p1.onIsOpenChanged })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var14 (ref)
		var4:trackPersonCardMenuToggled(false)
		var14(false)
	end, { var14 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var4 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var11 (ref), var5 (ref), var14 (ref)
		local var17 = not var12
		var4:trackPersonCardMenuToggled(var17)
		
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var17 and var11 then
			var4:recordPerUserVoiceVolumeUiOpened(var5.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
		end
		var14(var17)
	end, {
		var12,
		var14,
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var11 else nil,
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var5 else nil
	})
	local var17 = nil
	
	if fFlagPeoplePageDismissCardMenuOnScrollOutOfView then
		var17 = reactModule.useRef(nil)
		useDismissWhenOutOfViewModule(var12, var15, var17)
	end
	local var18 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), var5 (ref)
		return var6[var5.PERSON_BUTTONS.MUTE_PLAYER].animatedIcon
	end, { var6 })
	local var19 = nil
	
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		local getPlayerIsLocalMuted = var3.getPlayerIsLocalMuted
		var19 = reactModule.useCallback(function(p2)
			-- upvalues: getPlayerIsLocalMuted (ref)
			return if p2 and getPlayerIsLocalMuted then getPlayerIsLocalMuted(p2)(false) else false
		end, { getPlayerIsLocalMuted })
	end
	local var20 = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then reactModule.useMemo(function()
		-- upvalues: var6 (ref), var5 (ref), var8 (ref), var1 (ref), iconName (copy), var10 (ref), var7 (ref), var14 (ref)
		local MUTE_PLAYER = var6[var5.PERSON_BUTTONS.MUTE_PLAYER]
		local BLOCK_PLAYER = var6[var5.PERSON_BUTTONS.BLOCK_PLAYER]
		local REPORT_PLAYER = var6[var5.PERSON_BUTTONS.REPORT_PLAYER]
		local PEOPLE_CARD = var5.ANALYTICS.ENTRY_POINT.PEOPLE_CARD
		local t = {}
		local t_1 = {}
		local var21 = if MUTE_PLAYER.shouldShow() then {
			id = "mute",
			text = if var8 then var1.unmute else var1.mute,
			icon = if var8 then iconName.SpeakerSlash else iconName.Speaker,
			onActivated = function()
				-- upvalues: MUTE_PLAYER (ref), PEOPLE_CARD (ref)
				MUTE_PLAYER.onActivated(PEOPLE_CARD)
			end
		} else nil
		
		if var21 and not var10 then
			table.insert(t_1, var21)
		end
		if BLOCK_PLAYER.shouldShow() then
			table.insert(t_1, {
				id = "block",
				text = if var7 then var1.unblock else var1.block,
				icon = iconName.CircleSlash,
				onActivated = function()
					-- upvalues: BLOCK_PLAYER (ref), PEOPLE_CARD (ref), var14 (copy)
					BLOCK_PLAYER.onActivated(PEOPLE_CARD)
					var14(false)
				end
			})
		end
		if REPORT_PLAYER.shouldShow() then
			table.insert(t_1, {
				id = "report",
				text = var1.report,
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
		if var21 and var10 then
			table.insert(t, {
				showVolumeSlider = true,
				title = var1.voiceSectionTitle,
				items = { var21 }
			})
		end
		return t
	end, {
		var7, var8, var14, var6, var1, var10
	}) else reactModule.useMemo(function()
		-- upvalues: var6 (ref), var5 (ref), var8 (ref), var1 (ref), iconName (copy), var7 (ref), var14 (ref)
		local MUTE_PLAYER = var6[var5.PERSON_BUTTONS.MUTE_PLAYER]
		local BLOCK_PLAYER = var6[var5.PERSON_BUTTONS.BLOCK_PLAYER]
		local REPORT_PLAYER = var6[var5.PERSON_BUTTONS.REPORT_PLAYER]
		local t = {}
		
		if MUTE_PLAYER.shouldShow() then
			table.insert(t, {
				id = "mute",
				text = if var8 then var1.unmute else var1.mute,
				icon = if var8 then iconName.SpeakerSlash else iconName.Speaker,
				onActivated = function()
					-- upvalues: MUTE_PLAYER (ref), var5 (copy)
					MUTE_PLAYER.onActivated(var5.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		if BLOCK_PLAYER.shouldShow() then
			table.insert(t, {
				id = "block",
				text = if var7 then var1.unblock else var1.block,
				icon = iconName.CircleSlash,
				onActivated = function()
					-- upvalues: BLOCK_PLAYER (ref), var5 (copy), var14 (copy)
					BLOCK_PLAYER.onActivated(var5.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
					var14(false)
				end
			})
		end
		if REPORT_PLAYER.shouldShow() then
			table.insert(t, {
				id = "report",
				text = var1.report,
				icon = iconName.Flag,
				onActivated = function()
					-- upvalues: REPORT_PLAYER (ref), var5 (copy)
					REPORT_PLAYER.onActivated(var5.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		return t
	end, {
		var7,
		var8,
		var14,
		var6,
		var1
	})
	local var21 = reactModule.createElement(personButtonModule, {
		isBackgroundTransparent = true,
		LayoutOrder = 1,
		icon = { on = if var9 then nil else iconName.ThreeDotsHorizontal },
		animatedIcon = if var9 then var18 else nil,
		onActivated = var16,
		isBuilderIcon = not var9
	})
	local var22 = if fFlagPeoplePageDismissCardMenuOnScrollOutOfView then reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy", ref = var17 }, { Button = var21 }) else nil
	
	return if next(var20) == nil then nil elseif fFlagVoiceVolumeControlsPerUserPlayerGridMenu then reactModule.createElement(cardMenuWithVoiceVolumeModule, {
		isOpen = var12,
		menuGroups = var20,
		onPressedOutside = var15,
		userId = p1.person.UserId,
		voiceVolumeMin = var5.VOICE_CHAT.VOICE_VOLUME.MIN,
		voiceVolumeMax = var5.VOICE_CHAT.VOICE_VOLUME.MAX,
		getPlayerVoiceVolume = var3.getPlayerVoiceVolume,
		subscribePlayerVoiceVolume = var3.subscribePlayerVoiceVolume,
		setPlayerVoiceVolume = var3.setPlayerVoiceVolume,
		isMutedByLocalUser = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then var8 else nil,
		getPlayerIsLocalMuted = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var19 else nil,
		getVoiceSessionId = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var3.getVoiceSessionId else nil
	}, { MenuAnchor = var22 or var21 }) else reactModule.createElement(menu, {
		isOpen = var12,
		items = var20,
		size = inputSize.Medium,
		onPressedOutside = var15
	}, { MenuAnchor = var22 or var21 })
end)