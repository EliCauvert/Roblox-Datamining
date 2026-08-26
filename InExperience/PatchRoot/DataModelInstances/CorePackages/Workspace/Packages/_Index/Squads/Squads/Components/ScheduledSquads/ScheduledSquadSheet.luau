local parent = script:FindFirstAncestor("Squads").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local _ = require(parent.SquadsCore.Types)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local createScheduledSquad = require(parent.SquadsCore.Thunks).createScheduledSquad
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadPromptResponse = require(parent.SquadsCore.Enums).SquadPromptResponse
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local updateScheduledSquad = require(parent.SquadsCore.NetworkRequests).updateScheduledSquad

return function(p1)
	-- upvalues: reactModule (ref), squadExternalContractContext (ref), useDispatch (ref), useLocalUserId (ref), useStore (ref), useLocalization (ref), squadPromptType (ref), updateScheduledSquad (ref), eventNamesModule (ref), squadPromptResponse (ref), createScheduledSquad (ref), sheet (ref), text (ref), foundationModule (ref), view (ref)
	local var1
	local var2 = reactModule.useContext(squadExternalContractContext)
	local var3 = useDispatch()
	local var4 = useLocalUserId()
	local var5 = useStore()
	local var6 = useLocalization({
		cancelText = "CommonUI.Controls.Action.Cancel",
		deleteText = "Feature.Chat.Action.Delete",
		fieldIsRequiredText = "Feature.Squads.Label.ThisFieldIsRequired",
		saveText = "Feature.Chat.Action.Save",
		scheduledPartyText = "Feature.Squads.Label.ScheduledParty",
		scheduleAPartyText = "Feature.Squads.Action.ScheduleAParty",
		startTimeText = "Feature.Squads.Label.StartTime",
		titleText = "Feature.Squads.Description.Title"
	})
	local useState = reactModule.useState
	local var7 = if p1.scheduledSquad and p1.scheduledSquad.startTime then p1.scheduledSquad.startTime else nil
	useState, var9 = useState(var7)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(if p1.scheduledSquad then p1.scheduledSquad.title else "")
	local var12, var13 = reactModule.useState(false)
	local _ = if var12 then var6.fieldIsRequiredText else ""
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p1 (ref), var9 (ref), var13 (ref)
		var7(if p1.scheduledSquad and p1.scheduledSquad.startTime then p1.scheduledSquad.startTime else nil)
		var9(false)
		var13(false)
	end, {
		p1.isOpen,
		p1.scheduledSquad and p1.scheduledSquad.startTime
	})
	local var14 = p1.scheduledSquad and tostring(p1.scheduledSquad.initiatorId) == tostring(var4)
	local currentDateTime = DateTime.now()
	local var15 = currentDateTime:ToLocalTime()
	local var16 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var2 (ref), var5 (ref), squadPromptType (copy)
		p1.onClose()
		var2.setSquadPrompt(var5, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { p1.onClose, var2.setSquadPrompt, var5 })
	local _ = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref), var13 (ref), var11 (ref)
		if var12 then
			var13(false)
		end
		var11(p2)
	end, { var12, var13, var11 })
	local var17 = reactModule.useCallback(function(p2, p3)
		return if p2 == 2 and (p3 % 4 == 0 and p3 % 100 ~= 0 or p3 % 400 == 0) then 29 else ({
			31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
		})[p2]
	end, {})
	local var18 = reactModule.useCallback(function(p2, _)
		-- upvalues: var8 (ref), var9 (ref), var7 (ref)
		if p2 and var8 then
			var9(false)
		end
		var7(if p2 then p2:ToIsoDate() else nil)
	end, { var9, var7, var8 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: useState (ref), var9 (ref), var14 (ref), p1 (ref), updateScheduledSquad (copy), var10 (ref), var16 (ref), var2 (ref), eventNamesModule (copy), squadPromptType (copy), squadPromptResponse (copy), var3 (ref), createScheduledSquad (copy)
		local var20 = false
		
		if useState then
			local dateTime = DateTime.fromIsoDate(useState)
			
			if dateTime and dateTime.UnixTimestampMillis < DateTime.now().UnixTimestampMillis then
				var9(true)
				var20 = true
			end
		else
			var9(true)
			var20 = true
		end
		if not var20 then
			if var14 and p1.scheduledSquad then
				updateScheduledSquad({
					scheduledGroupUpId = p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
					title = var10,
					startTime = useState
				}, p1.onClose, var16)
				var2.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
					promptType = squadPromptType.ScheduleSquad,
					scheduledSquadId = p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
					squadLocation = var2.squadLocation,
					responseType = squadPromptResponse.Update
				})
				
				return
			end
			p1.onClose()
			var3(createScheduledSquad({
				parentChannelId = p1.conversationId or "",
				title = var10,
				startTime = useState
			}, var2.setSquadPrompt))
			var2.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
				promptType = squadPromptType.ScheduleSquad,
				squadLocation = var2.squadLocation,
				responseType = squadPromptResponse.Create
			})
		end
	end, {
		var16, false, var14, p1.conversationId, p1.scheduledSquad, p1.onClose,
		useState, var9, var13, var12, var10, var2.setSquadPrompt,
		var2.fireSquadAnalytics, var2.squadLocation
	})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var17 (ref)
		local day = var15.Day
		local var21 = if var15.Month + 6 > 12 then (var15.Month + 6) % 12 else var15.Month + 6
		local var22 = if var15.Month + 6 > 12 then var15.Year + 1 else var15.Year
		local var23 = var17(var21, var22)
		
		return if var23 < day then DateTime.fromLocalTime(var22, var21, var23) else DateTime.fromLocalTime(var22, var21, day)
	end, { var15, var17 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var2 (ref), eventNamesModule (copy), squadPromptType (copy), squadPromptResponse (copy)
		p1.onClose()
		var2.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
			promptType = squadPromptType.ScheduleSquad,
			scheduledSquadId = p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
			squadLocation = var2.squadLocation,
			responseType = squadPromptResponse.Cancel
		})
	end, {
		p1.scheduledSquad and p1.scheduledSquad.scheduledGroupUpId,
		var2.fireSquadAnalytics,
		p1.onClose,
		var2.squadLocation
	})
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		onClose = p1.onClose,
		isOpen = p1.isOpen
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left",
				Text = var6.scheduleAPartyText
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			TitleInput = nil,
			DateTimePicker = reactModule.createElement(foundationModule.DateTimePicker, {
				LayoutOrder = 2,
				isRequired = true,
				defaultDates = if var14 and p1.scheduledSquad then DateTime.fromIsoDate(p1.scheduledSquad.startTime) else nil,
				hasError = var8,
				label = var6.startTimeText,
				onChanged = var18,
				selectableDateRange = { endDate = var20(), startDate = currentDateTime },
				variant = foundationModule.Enums.DateTimePickerVariant.SingleWithTime,
				width = UDim.new(1, 0)
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local actions = sheet.Actions
	local t_2 = {}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = { tag = "col auto-y gap-small size-full-0" }
	local t_5 = {}
	local createElement_3 = reactModule.createElement
	local button = foundationModule.Button
	local t_6 = { LayoutOrder = 1 }
	
	if var14 and p1.scheduledSquad then
		var1 = false
		
		if p1.scheduledSquad.startTime == useState then
			local _ = p1.scheduledSquad.title == var10
		end
	else
		var1 = false
	end
	t_6.isDisabled = var1
	t_6.onActivated = var19
	t_6.text = var6.saveText
	t_6.variant = foundationModule.Enums.ButtonVariant.Emphasis
	t_6.width = UDim.new(1, 0)
	t_5.ConfirmButton = createElement_3(button, t_6)
	t_5.CancelButton = reactModule.createElement(foundationModule.Button, {
		LayoutOrder = 2,
		onActivated = var21,
		text = var6.cancelText,
		variant = foundationModule.Enums.ButtonVariant.Standard,
		width = UDim.new(1, 0)
	})
	t_3.ActionList = createElement_2(view, t_4, t_5)
	t_1.Action = createElement_1(actions, t_2, t_3)
	
	return createElement(root, t, t_1)
end