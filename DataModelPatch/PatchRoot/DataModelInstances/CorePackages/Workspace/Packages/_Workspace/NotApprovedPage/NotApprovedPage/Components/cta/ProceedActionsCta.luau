local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local Fragment = ReactModule.Fragment
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local FoundationModule = require(Parent.Foundation)
local Checkbox = FoundationModule.Checkbox
local InputSize = FoundationModule.Enums.InputSize
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local SuspensionDurationAlertModule = require(NotApprovedPage.Components.SuspensionDurationAlert)
local ReactivationButtonModule = require(NotApprovedPage.Components.ReactivationButton)
local CanReactivateModule = require(NotApprovedPage.Utils.canReactivate)
local CalculateTimeRemainingModule = require(NotApprovedPage.Utils.calculateTimeRemaining)
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local Constants = require(Parent.NotApprovedPageShared).Constants
local EVENTTYPES = Constants.EVENT_TYPES
local INTERVENTIONTYPES = Constants.INTERVENTION_TYPES
local PUNISHMENTTYPETOINTERVENTIONMAP = Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP

return ReactModule.memo(function(p1)
	-- upvalues: UseNotApprovedPageContextFunction (copy), PUNISHMENTTYPETOINTERVENTIONMAP (copy), CanReactivateModule (copy), UseStateFunction (copy), UseEffectFunction (copy), INTERVENTIONTYPES (copy), ReactModule (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), CalculateTimeRemainingModule (copy), Fragment (copy), SuspensionDurationAlertModule (copy), Checkbox (copy), InputSize (copy), ReactivationButtonModule (copy)
	local Translations = UseNotApprovedPageContextFunction().translations
	local ModerationDetail = p1.moderationDetail
	local EndDate = ModerationDetail.endDate
	local PunishmentTypeDescription = ModerationDetail.punishmentTypeDescription
	local PUNISHMENTTYPETOINTERVENTION = PUNISHMENTTYPETOINTERVENTIONMAP[PunishmentTypeDescription]
	local CanReactivateModule1 = CanReactivateModule(PUNISHMENTTYPETOINTERVENTION, EndDate, ModerationDetail.verificationCategory)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	UseEffectFunction(function()
		-- upvalues: PUNISHMENTTYPETOINTERVENTION (copy), INTERVENTIONTYPES (upval), UseStateResult2_1 (copy)
		if PUNISHMENTTYPETOINTERVENTION ~= INTERVENTIONTYPES.Banned then return end
		local DelayedThread = task.delay(60, function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(function(p2): boolean
				return not p2
			end)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			if DelayedThread and typeof(DelayedThread) == "thread" then
				task.cancel(DelayedThread)
			end
		end
	end, { UseStateResult1, PunishmentTypeDescription })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), SendNotApprovedPageEventModule (upval), EVENTTYPES (upval)
		UseStateResult2(p2)
		SendNotApprovedPageEventModule({ eventType = EVENTTYPES.CheckboxChecked })
	end, {})
	local NoCanReactivateModule1 = not CanReactivateModule1
	local TimeRemainingModule = CalculateTimeRemainingModule(EndDate)
	
	return ReactModule.createElement(Fragment, nil, {
		SuspensionDurationAlert = NoCanReactivateModule1 and ReactModule.createElement(SuspensionDurationAlertModule, { layoutOrder = 1, timeRemaining = TimeRemainingModule }),
		AgreeCheckbox = not NoCanReactivateModule1 and ReactModule.createElement(Checkbox, {
			LayoutOrder = 2,
			isChecked = UseStateResult,
			size = InputSize.Small,
			onActivated = UseResult,
			label = Translations.acknowledgementCheckboxLabel
		}),
		ReactivationButton = ReactModule.createElement(ReactivationButtonModule, {
			layoutOrder = 3,
			moderationDetail = ModerationDetail,
			LogoutThunk = p1.LogoutThunk,
			isAgreed = UseStateResult,
			canReactivate = CanReactivateModule1,
			sendPageEvent = p1.sendPageEvent
		})
	})
end)