local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local menu = foundationModule.Menu
local useLocalization = require(parent.Localization).Hooks.useLocalization
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)
local personButtonModule = require(peopleReactView.Components.Buttons.PersonButton)
local constantsModule = require(peopleReactView.Constants)

return reactModule.memo(function(p0) --[[ line: 29 | named "CardMenu" ]]
	-- upvalues: useLocalization (ref), constantsModule (ref), useGetPeopleServiceModule (ref), personButtonConfigsModule (ref), signalsReactModule (ref), reactModule (ref), iconName (ref), menu (ref), inputSize (ref), personButtonModule (ref)
	local var8 = useLocalization({
		unblock = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK,
		block = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.BLOCK,
		unmute = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNMUTE,
		mute = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.MUTE,
		report = constantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REPORT
	})
	local var9 = useGetPeopleServiceModule("PeopleBlockStatusStore")
	local var10 = useGetPeopleServiceModule("PeopleVoiceChatStore")
	local var11 = useGetPeopleServiceModule("PeopleAnalyticsManager")
	local var12 = useGetPeopleServiceModule("Constants")
	local var13 = personButtonConfigsModule(p0.person.UserId)
	local var14 = signalsReactModule.useSignalState(var9.getPlayerBlockStatus(p0.person.UserId))
	local var15 = signalsReactModule.useSignalState(var10.getPlayerIsLocalMuted(p0.person.UserId))
	local var16 = signalsReactModule.useSignalState(var10.getPlayerIsTalking(p0.person.UserId))
	local var17, var18 = reactModule.useState(false)
	local var19 = reactModule.useCallback(function(p1) --[[ line: 51 ]]
		-- upvalues: p0 (ref), var18 (ref)
		p0.onIsOpenChanged(p1)
		var18(p1)
	end, { p0.onIsOpenChanged })
	local var20 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: var13 (ref), var12 (ref), var15 (ref), var8 (ref), iconName (copy), var14 (ref), var19 (ref)
		local MUTE_PLAYER = var13[var12.PERSON_BUTTONS.MUTE_PLAYER]
		local BLOCK_PLAYER = var13[var12.PERSON_BUTTONS.BLOCK_PLAYER]
		local REPORT_PLAYER = var13[var12.PERSON_BUTTONS.REPORT_PLAYER]
		local t = {}
		
		if MUTE_PLAYER.shouldShow() then
			table.insert(t, {
				id = "mute",
				text = if var15 then var8.unmute else var8.mute,
				icon = if var15 then iconName.SpeakerSlash else iconName.Speaker,
				onActivated = function() --[[ line: 83 ]]
					-- upvalues: MUTE_PLAYER (ref), var12 (copy)
					MUTE_PLAYER.onActivated(var12.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		if BLOCK_PLAYER.shouldShow() then
			table.insert(t, {
				id = "block",
				text = if var14 then var8.unblock else var8.block,
				icon = iconName.CircleSlash,
				onActivated = function() --[[ line: 93 ]]
					-- upvalues: BLOCK_PLAYER (ref), var12 (copy), var19 (copy)
					BLOCK_PLAYER.onActivated(var12.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
					var19(false)
				end
			})
		end
		if REPORT_PLAYER.shouldShow() then
			table.insert(t, {
				id = "report",
				text = var8.report,
				icon = iconName.Flag,
				onActivated = function() --[[ line: 104 ]]
					-- upvalues: REPORT_PLAYER (ref), var12 (copy)
					REPORT_PLAYER.onActivated(var12.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
				end
			})
		end
		return t
	end, {
		var14,
		var15,
		var19,
		var13,
		var8
	})
	
	return if next(var20) == nil then nil else reactModule.createElement(menu, {
		isOpen = var17,
		items = var20,
		size = inputSize.Medium,
		onPressedOutside = reactModule.useCallback(function() --[[ line: 56 ]]
			-- upvalues: var11 (ref), var19 (ref)
			var11:trackPersonCardMenuToggled(false)
			var19(false)
		end, { var19 })
	}, {
		MenuAnchor = reactModule.createElement(personButtonModule, {
			isBackgroundTransparent = true,
			LayoutOrder = 1,
			icon = { on = if var16 then nil else iconName.ThreeDotsHorizontal },
			animatedIcon = if var16 then reactModule.useMemo(function() --[[ line: 67 ]]
				-- upvalues: var13 (ref), var12 (ref)
				return var13[var12.PERSON_BUTTONS.MUTE_PLAYER].animatedIcon
			end, { var13 }) else nil,
			onActivated = reactModule.useCallback(function() --[[ line: 61 ]]
				-- upvalues: var17 (ref), var11 (ref), var19 (ref)
				local var22 = not var17
				var11:trackPersonCardMenuToggled(var22)
				var19(var22)
			end, { var17, var19 }),
			isBuilderIcon = not var16
		})
	})
end)