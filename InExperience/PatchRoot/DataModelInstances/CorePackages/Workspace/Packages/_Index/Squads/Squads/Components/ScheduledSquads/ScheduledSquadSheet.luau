local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.SquadsCore.Types)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local CreateScheduledSquadFunction = require(Parent.SquadsCore.Thunks).createScheduledSquad
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadPromptResponse = require(Parent.SquadsCore.Enums).SquadPromptResponse
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local UpdateScheduledSquadFunction = require(Parent.SquadsCore.NetworkRequests).updateScheduledSquad

return function(p1) --[[ Line: 40 ]]
	-- upvalues: ReactModule (copy), SquadExternalContractContext (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseStoreFunction (copy), UseLocalizationFunction (copy), SquadPromptType (copy), UpdateScheduledSquadFunction (copy), EventNamesModule (copy), SquadPromptResponse (copy), CreateScheduledSquadFunction (copy), Sheet (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), Text (copy), FoundationModule (copy), View (copy)
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseStoreResult = UseStoreFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		cancelText = "CommonUI.Controls.Action.Cancel",
		deleteText = "Feature.Chat.Action.Delete",
		fieldIsRequiredText = "Feature.Squads.Label.ThisFieldIsRequired",
		saveText = "Feature.Chat.Action.Save",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		scheduleAPartyText = "Feature.Squads.Action.ScheduleAParty",
		startTimeText = "Feature.Squads.Label.StartTime",
		titleText = "Feature.Squads.Description.Title"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(if p1.scheduledSquad and p1.scheduledSquad.startTime then p1.scheduledSquad.startTime else nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(if p1.scheduledSquad then p1.scheduledSquad.title else "")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	
	if UseStateResult4 then
		local _ = UseLocalizationResult.fieldIsRequiredText
	end
	ReactModule.useEffect(function() --[[ Line: 66 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy)
		UseStateResult2(if p1.scheduledSquad and p1.scheduledSquad.startTime then p1.scheduledSquad.startTime else nil)
		UseStateResult2_1(false)
		UseStateResult2_3(false)
	end, {
		p1.isOpen,
		p1.scheduledSquad and p1.scheduledSquad.startTime
	})
	local IsTextMatch: boolean = p1.scheduledSquad and tostring(p1.scheduledSquad.initiatorId) == tostring(UseLocalUserIdResult)
	local _DateTime = DateTime.now()
	local LocalTime = _DateTime:ToLocalTime()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 82 ]]
		-- upvalues: p1 (copy), UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval)
		p1.onClose()
		UseContextResult.setSquadPrompt(UseStoreResult, {
			hideCancelButton = true,
			promptType = SquadPromptType.Error
		})
	end, {
		p1.onClose,
		UseContextResult.setSquadPrompt,
		UseStoreResult
	})
	local _ = ReactModule.useCallback(function(p2) --[[ Line: 90 ]]
		-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy), UseStateResult2_2 (copy)
		if UseStateResult4 then
			UseStateResult2_3(false)
		end
		UseStateResult2_2(p2)
	end, { UseStateResult4, UseStateResult2_3, UseStateResult2_2 })
	local UseResult1 = ReactModule.useCallback(function(p2, p3: number) --[[ Line: 98 ]]
		local list = {
			31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
		}
		
		return if p2 == 2 and (p3 % 4 == 0 and p3 % 100 ~= 0 or p3 % 400 == 0) then 29 else list[p2]
	end, {})
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = p1.onClose,
		isOpen = p1.isOpen,
		testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-sheet" else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left",
				Text = UseLocalizationResult.scheduleAPartyText,
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-sheet--title" else nil
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, {}, {
			TitleInput = nil,
			DateTimePicker = ReactModule.createElement(FoundationModule.DateTimePicker, {
				LayoutOrder = 2,
				isRequired = true,
				defaultDates = if IsTextMatch and p1.scheduledSquad then DateTime.fromIsoDate(p1.scheduledSquad.startTime) else nil,
				hasError = UseStateResult1,
				label = UseLocalizationResult.startTimeText,
				onChanged = ReactModule.useCallback(function(p2, _) --[[ Line: 111 ]]
					-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
					if p2 and UseStateResult1 then
						UseStateResult2_1(false)
					end
					UseStateResult2(if p2 then p2:ToIsoDate() else nil)
				end, { UseStateResult2_1, UseStateResult2, UseStateResult1 }),
				selectableDateRange = {
					endDate = ReactModule.useCallback(function() --[[ Line: 191 ]]
						-- upvalues: LocalTime (copy), UseResult1 (copy)
						local Day = LocalTime.Day
						local MonthRemainder: number = if LocalTime.Month + 6 > 12 then (LocalTime.Month + 6) % 12 else LocalTime.Month + 6
						local NewYear = if LocalTime.Month + 6 > 12 then LocalTime.Year + 1 else LocalTime.Year
						local UseResultResult = UseResult1(MonthRemainder, NewYear)
						
						return if UseResultResult < Day then DateTime.fromLocalTime(NewYear, MonthRemainder, UseResultResult) else DateTime.fromLocalTime(NewYear, MonthRemainder, Day)
					end, { LocalTime, UseResult1 })(),
					startDate = _DateTime
				},
				variant = FoundationModule.Enums.DateTimePickerVariant.SingleWithTime,
				width = UDim.new(1, 0),
				testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-sheet--start-time-picker" else nil
			})
		}),
		Action = ReactModule.createElement(Sheet.Actions, {}, {
			ActionList = ReactModule.createElement(View, { tag = "col auto-y gap-small size-full-0" }, {
				ConfirmButton = ReactModule.createElement(FoundationModule.Button, {
					LayoutOrder = 1,
					isDisabled = if IsTextMatch and p1.scheduledSquad and p1.scheduledSquad.startTime == UseStateResult then p1.scheduledSquad.title == UseStateResult3 else false,
					onActivated = ReactModule.useCallback(function() --[[ Line: 120 ]]
						-- upvalues: UseStateResult (copy), UseStateResult2_1 (copy), IsTextMatch (copy), p1 (copy), UpdateScheduledSquadFunction (upval), UseStateResult3 (copy), UseResult (copy), UseContextResult (copy), EventNamesModule (upval), SquadPromptType (upval), SquadPromptResponse (upval), UseDispatchResult (copy), CreateScheduledSquadFunction (upval)
						local Flag = false
						
						if UseStateResult then
							local _DateTime = DateTime.fromIsoDate(UseStateResult)
							
							if _DateTime and _DateTime.UnixTimestampMillis < DateTime.now().UnixTimestampMillis then
								UseStateResult2_1(true)
								Flag = true
							end
						else
							UseStateResult2_1(true)
							Flag = true
						end
						if not Flag then
							if IsTextMatch and p1.scheduledSquad then
								UpdateScheduledSquadFunction({
									scheduledGroupUpId = p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
									title = UseStateResult3,
									startTime = UseStateResult
								}, p1.onClose, UseResult)
								UseContextResult.fireSquadAnalytics(EventNamesModule.SquadPromptResponded, {
									promptType = SquadPromptType.ScheduleSquad,
									scheduledSquadId = p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
									squadLocation = UseContextResult.squadLocation,
									responseType = SquadPromptResponse.Update
								})
								
								return
							end
							p1.onClose()
							UseDispatchResult(CreateScheduledSquadFunction({
								parentChannelId = p1.conversationId or "",
								title = UseStateResult3,
								startTime = UseStateResult
							}, UseContextResult.setSquadPrompt))
							UseContextResult.fireSquadAnalytics(EventNamesModule.SquadPromptResponded, {
								promptType = SquadPromptType.ScheduleSquad,
								squadLocation = UseContextResult.squadLocation,
								responseType = SquadPromptResponse.Create
							})
						end
					end, {
						UseResult, false, IsTextMatch, p1.conversationId, p1.scheduledSquad,
						p1.onClose, UseStateResult, UseStateResult2_1, UseStateResult2_3,
						UseStateResult4, UseStateResult3, UseContextResult.setSquadPrompt,
						UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation
					}),
					text = UseLocalizationResult.saveText,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					width = UDim.new(1, 0),
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-sheet--save-button" else nil
				}),
				CancelButton = ReactModule.createElement(FoundationModule.Button, {
					LayoutOrder = 2,
					onActivated = ReactModule.useCallback(function() --[[ Line: 208 ]]
						-- upvalues: p1 (copy), UseContextResult (copy), EventNamesModule (upval), SquadPromptType (upval), SquadPromptResponse (upval)
						p1.onClose()
						UseContextResult.fireSquadAnalytics(EventNamesModule.SquadPromptResponded, {
							promptType = SquadPromptType.ScheduleSquad,
							scheduledSquadId = p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
							squadLocation = UseContextResult.squadLocation,
							responseType = SquadPromptResponse.Cancel
						})
					end, {
						p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
						UseContextResult.fireSquadAnalytics,
						p1.onClose,
						UseContextResult.squadLocation
					}),
					text = UseLocalizationResult.cancelText,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					width = UDim.new(1, 0),
					testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-scheduled-party-sheet--cancel-button" else nil
				})
			})
		})
	})
end