local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local Menu = FoundationModule.Menu
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local PersonButtonConfigsModule = require(PeopleReactView.Configs.PersonButtonConfigs)
local UseGetPeopleServiceModule = require(PeopleReactView.Hooks.useGetPeopleService)
local PersonButtonModule = require(PeopleReactView.Components.Buttons.PersonButton)
local ConstantsModule = require(PeopleReactView.Constants)

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), UseGetPeopleServiceModule (copy), PersonButtonConfigsModule (copy), SignalsReactModule (copy), ReactModule (copy), IconName (copy), Menu (copy), InputSize (copy), PersonButtonModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		unblock = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK,
		block = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.BLOCK,
		unmute = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNMUTE,
		mute = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.MUTE,
		report = ConstantsModule.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REPORT
	})
	local PeopleBlockStatusStore = UseGetPeopleServiceModule("PeopleBlockStatusStore")
	local PeopleVoiceChatStore = UseGetPeopleServiceModule("PeopleVoiceChatStore")
	local PeopleAnalyticsManager = UseGetPeopleServiceModule("PeopleAnalyticsManager")
	local Constants = UseGetPeopleServiceModule("Constants")
	local PersonButtonConfigsModuleResult = PersonButtonConfigsModule(p1.person.UserId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PeopleBlockStatusStore.getPlayerBlockStatus(p1.person.UserId))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(PeopleVoiceChatStore.getPlayerIsLocalMuted(p1.person.UserId))
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(PeopleVoiceChatStore.getPlayerIsTalking(p1.person.UserId))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		p1.onIsOpenChanged(p2)
		UseStateResult2(p2)
	end, { p1.onIsOpenChanged })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: PeopleAnalyticsManager (copy), UseResult (copy)
		PeopleAnalyticsManager:trackPersonCardMenuToggled(false)
		UseResult(false)
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), PeopleAnalyticsManager (copy), UseResult (copy)
		local NoUseStateResult = not UseStateResult
		PeopleAnalyticsManager:trackPersonCardMenuToggled(NoUseStateResult)
		UseResult(NoUseStateResult)
	end, { UseStateResult, UseResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PersonButtonConfigsModuleResult (copy), Constants (copy)
		return PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.MUTE_PLAYER].animatedIcon
	end, { PersonButtonConfigsModuleResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
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
				onActivated = function()
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
				onActivated = function()
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
				onActivated = function()
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
	
	return if next(UseMemoResult1) == nil then nil else ReactModule.createElement(Menu, {
		isOpen = UseStateResult,
		items = UseMemoResult1,
		size = InputSize.Medium,
		onPressedOutside = UseResult1
	}, {
		MenuAnchor = ReactModule.createElement(PersonButtonModule, {
			isBackgroundTransparent = true,
			LayoutOrder = 1,
			icon = {
				on = if UseSignalStateResult2 then nil else IconName.ThreeDotsHorizontal
			},
			animatedIcon = if UseSignalStateResult2 then UseMemoResult else nil,
			onActivated = UseResult2,
			isBuilderIcon = not UseSignalStateResult2
		})
	})
end)