local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local CloseReminderOfNormsPopupModule = require(Modules.LuaApp.Thunks.Moderation.CloseReminderOfNormsPopup)
local ReminderOfNormsAnalyticsModule = require(Modules.LuaApp.Components.Moderation.ReminderOfNormsAnalytics)
local EventIngestService = game:GetService("EventIngestService")
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest

function getReminderVariantBodyKey(p1): string
	local v1 = ""
	
	if p1 == "positive" then
		v1 = "Feature.Home.Experiment.Reminders.BodyPositiveVariant"
		
		return v1
	end
	if p1 == "warning" then
		v1 = "Feature.Home.Experiment.Reminders.BodyWarningVariant"
	end
	return v1
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseScreenSizeFunction (copy), UseStyleFunction (copy), ReactModule (copy), UseSelectorFunction (copy), CloseReminderOfNormsPopupModule (copy), EventIngest (copy), EventIngestService (copy), ReminderOfNormsAnalyticsModule (copy), UseLocalizationFunction (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local Theme = UseStyleFunction().Theme
	local UseRefResult = ReactModule.useRef(DateTime.now().UnixTimestampMillis)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseReminderOfNormsPopupModule (upval)
		UseDispatchResult(CloseReminderOfNormsPopupModule())
	end, { UseDispatchResult })
	local EventIngest1 = p1.eventIngest or EventIngest.new(EventIngestService)
	local UseResult1 = ReactModule.useCallback(function(Interaction)
		-- upvalues: UseSelectorResult (copy), p1 (copy), UseRefResult (copy)
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		
		return {
			user_id = UseSelectorResult,
			source_intervention_id = p1.interventionId,
			reminder_number = p1.reminderNumber,
			experiment_variant = p1.experimentVariant,
			timestamp_milliseconds = UnixTimestampMillis,
			time_to_interact_seconds = (UnixTimestampMillis - UseRefResult.current) / 1000,
			interaction = Interaction
		}
	end, {
		UseSelectorResult,
		p1.interventionId,
		p1.reminderNumber,
		p1.experimentVariant
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy), ReminderOfNormsAnalyticsModule (upval), EventIngest1 (copy), UseResult (copy)
		ReminderOfNormsAnalyticsModule.sendEvent(EventIngest1, (UseResult1(ReminderOfNormsAnalyticsModule.Constants.EventTypes.Dimissed)))
		UseResult()
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy), ReminderOfNormsAnalyticsModule (upval), EventIngest1 (copy), UseResult (copy)
		ReminderOfNormsAnalyticsModule.sendEvent(EventIngest1, (UseResult1(ReminderOfNormsAnalyticsModule.Constants.EventTypes.CtaClicked)))
		UseResult()
	end, { UseResult1 })
	local UseLocalizationResult = UseLocalizationFunction({
		reminderTitle = "Feature.Home.Experiment.Reminders.Title",
		buttonText = "Feature.Home.Experiment.Reminders.Button",
		sharedBody = {
			"Feature.Home.Experiment.Reminders.BodyShared",
			policy_violation = UseLocalizationFunction({ policyViolation = `Feature.Home.{p1.policyViolation}` }).policyViolation
		},
		variantBody = getReminderVariantBodyKey(p1.contentVariant)
	})
	
	return ReactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BackgroundColor = Theme.BackgroundTransparency,
		[ReactModule.Event.Activated] = UseResult2
	}, {
		Popup = ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.reminderTitle,
			bodyText = `{UseLocalizationResult.sharedBody} \n\n {UseLocalizationResult.variantBody}`,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseResult3,
							text = UseLocalizationResult.buttonText
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = UseScreenSizeResult
		})
	})
end