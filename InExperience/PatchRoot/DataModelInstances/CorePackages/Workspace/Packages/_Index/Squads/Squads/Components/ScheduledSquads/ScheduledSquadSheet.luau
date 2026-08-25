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

return function(p0)
	-- upvalues: reactModule (ref), squadExternalContractContext (ref), useDispatch (ref), useLocalUserId (ref), useStore (ref), useLocalization (ref), squadPromptType (ref), updateScheduledSquad (ref), eventNamesModule (ref), squadPromptResponse (ref), createScheduledSquad (ref), sheet (ref), text (ref), foundationModule (ref), view (ref)
	local var32
	local var4 = reactModule.useContext(squadExternalContractContext)
	local var5 = useDispatch()
	local var6 = useLocalUserId()
	local var7 = useStore()
	local var8 = useLocalization({
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
	local var9 = if p0.scheduledSquad and p0.scheduledSquad.startTime then p0.scheduledSquad.startTime else nil
	useState, var9 = useState(var9)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(if p0.scheduledSquad then p0.scheduledSquad.title else "")
	local var14, var15 = reactModule.useState(false)
	local _ = if var14 then var8.fieldIsRequiredText else ""
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), p0 (ref), var11 (ref), var15 (ref)
		var9(if p0.scheduledSquad and p0.scheduledSquad.startTime then p0.scheduledSquad.startTime else nil)
		var11(false)
		var15(false)
	end, {
		p0.isOpen,
		p0.scheduledSquad and p0.scheduledSquad.startTime
	})
	local var16 = p0.scheduledSquad and tostring(p0.scheduledSquad.initiatorId) == tostring(var6)
	local currentDateTime = DateTime.now()
	local var18 = currentDateTime:ToLocalTime()
	local var19 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var4 (ref), var7 (ref), squadPromptType (copy)
		p0.onClose()
		var4.setSquadPrompt(var7, {
			hideCancelButton = true,
			promptType = squadPromptType.Error
		})
	end, { p0.onClose, var4.setSquadPrompt, var7 })
	local _ = reactModule.useCallback(function(p1)
		-- upvalues: var14 (ref), var15 (ref), var13 (ref)
		if var14 then
			var15(false)
		end
		var13(p1)
	end, { var14, var15, var13 })
	local var20 = reactModule.useCallback(function(p2, p3)
		return if p2 == 2 and (p3 % 4 == 0 and p3 % 100 ~= 0 or p3 % 400 == 0) then 29 else ({
			31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
		})[p2]
	end, {})
	local var21 = reactModule.useCallback(function(p4, _)
		-- upvalues: var10 (ref), var11 (ref), var9 (ref)
		if p4 and var10 then
			var11(false)
		end
		var9(if p4 then p4:ToIsoDate() else nil)
	end, { var11, var9, var10 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: useState (ref), var11 (ref), var16 (ref), p0 (ref), updateScheduledSquad (copy), var12 (ref), var19 (ref), var4 (ref), eventNamesModule (copy), squadPromptType (copy), squadPromptResponse (copy), var5 (ref), createScheduledSquad (copy)
		local var33 = false
		
		if useState then
			local dateTime = DateTime.fromIsoDate(useState)
			
			if dateTime and dateTime.UnixTimestampMillis < DateTime.now().UnixTimestampMillis then
				var11(true)
				var33 = true
			end
		else
			var11(true)
			var33 = true
		end
		if not var33 then
			if var16 and p0.scheduledSquad then
				updateScheduledSquad({
					scheduledGroupUpId = p0.scheduledSquad and p0.scheduledSquad.scheduledGroupUpId,
					title = var12,
					startTime = useState
				}, p0.onClose, var19)
				var4.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
					promptType = squadPromptType.ScheduleSquad,
					scheduledSquadId = p0.scheduledSquad and p0.scheduledSquad.scheduledGroupUpId,
					squadLocation = var4.squadLocation,
					responseType = squadPromptResponse.Update
				})
				
				return
			end
			p0.onClose()
			var5(createScheduledSquad({
				parentChannelId = p0.conversationId or "",
				title = var12,
				startTime = useState
			}, var4.setSquadPrompt))
			var4.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
				promptType = squadPromptType.ScheduleSquad,
				squadLocation = var4.squadLocation,
				responseType = squadPromptResponse.Create
			})
		end
	end, {
		var19, false, var16, p0.conversationId, p0.scheduledSquad, p0.onClose,
		useState, var11, var15, var14, var12, var4.setSquadPrompt,
		var4.fireSquadAnalytics, var4.squadLocation
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var20 (ref)
		local day = var18.Day
		local var35 = if var18.Month + 6 > 12 then (var18.Month + 6) % 12 else var18.Month + 6
		local var36 = if var18.Month + 6 > 12 then var18.Year + 1 else var18.Year
		local var37 = var20(var35, var36)
		
		return if var37 < day then DateTime.fromLocalTime(var36, var35, var37) else DateTime.fromLocalTime(var36, var35, day)
	end, { var18, var20 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var4 (ref), eventNamesModule (copy), squadPromptType (copy), squadPromptResponse (copy)
		p0.onClose()
		var4.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
			promptType = squadPromptType.ScheduleSquad,
			scheduledSquadId = p0.scheduledSquad and p0.scheduledSquad.scheduledGroupUpId,
			squadLocation = var4.squadLocation,
			responseType = squadPromptResponse.Cancel
		})
	end, {
		p0.scheduledSquad and p0.scheduledSquad.scheduledGroupUpId,
		var4.fireSquadAnalytics,
		p0.onClose,
		var4.squadLocation
	})
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		onClose = p0.onClose,
		isOpen = p0.isOpen
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left",
				Text = var8.scheduleAPartyText
			})
		}),
		Content = reactModule.createElement(sheet.Content, {}, {
			TitleInput = nil,
			DateTimePicker = reactModule.createElement(foundationModule.DateTimePicker, {
				LayoutOrder = 2,
				isRequired = true,
				defaultDates = if var16 and p0.scheduledSquad then DateTime.fromIsoDate(p0.scheduledSquad.startTime) else nil,
				hasError = var10,
				label = var8.startTimeText,
				onChanged = var21,
				selectableDateRange = { endDate = var23(), startDate = currentDateTime },
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
	
	if var16 and p0.scheduledSquad then
		var32 = false
		
		if p0.scheduledSquad.startTime == useState then
			local _ = p0.scheduledSquad.title == var12
		end
	else
		var32 = false
	end
	t_6.isDisabled = var32
	t_6.onActivated = var22
	t_6.text = var8.saveText
	t_6.variant = foundationModule.Enums.ButtonVariant.Emphasis
	t_6.width = UDim.new(1, 0)
	t_5.ConfirmButton = createElement_3(button, t_6)
	t_5.CancelButton = reactModule.createElement(foundationModule.Button, {
		LayoutOrder = 2,
		onActivated = var24,
		text = var8.cancelText,
		variant = foundationModule.Enums.ButtonVariant.Standard,
		width = UDim.new(1, 0)
	})
	t_3.ActionList = createElement_2(view, t_4, t_5)
	t_1.Action = createElement_1(actions, t_2, t_3)
	
	return createElement(root, t, t_1)
end