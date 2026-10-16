local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local ChatInterventionGenericToastModule = require(InExperienceIntervention.Components.ChatInterventionGenericToast)

local function _(p1, p2, p3) --[[ Line: 14 | Named "format" ]]
	if p1 == nil then
		return p3
	else
		local Success, Result = pcall(function() --[[ Line: 18 ]]
			-- upvalues: p1 (copy), p2 (copy)
			return p1:Format(p2)
		end)
		
		return if Success and type(Result) == "string" and Result ~= "" then Result else p3
	end
end

return function() --[[ Line: 27 | Named "DictationSafetyReminderToast" ]]
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), FoundationModule (copy), ChatInterventionGenericToastModule (copy), InExperienceInterventionAnalyticsModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local CreateElementFunction = ReactModule.createElement
	local t = {}
	local VoiceTypingMayBeTurnedOffIfYouBreakTheRules = nil
	
	if UseContextResult == nil then
		VoiceTypingMayBeTurnedOffIfYouBreakTheRules = "Voice typing may be turned off if you break the rules"
	else
		local v1 = "Feature.InExperienceIntervention.Heading.VoiceTypingMayBeTurnedOff"
		local Success, Result = pcall(function() --[[ Line: 18 ]]
			-- upvalues: UseContextResult (copy), v1 (copy)
			return UseContextResult:Format(v1)
		end)
		VoiceTypingMayBeTurnedOffIfYouBreakTheRules = if Success and type(Result) == "string" and Result ~= "" then Result else "Voice typing may be turned off if you break the rules"
	end
	t.toastTitle = VoiceTypingMayBeTurnedOffIfYouBreakTheRules
	local KeepYourWordsKindAndYourCommunitySafe = nil
	
	if UseContextResult == nil then
		KeepYourWordsKindAndYourCommunitySafe = "Keep your words kind and your community safe."
	else
		local v2 = "Feature.InExperienceIntervention.Description.KeepWordsKindCommunitySafe"
		local Success1, Result1 = pcall(function() --[[ Line: 18 ]]
			-- upvalues: UseContextResult (copy), v2 (copy)
			return UseContextResult:Format(v2)
		end)
		KeepYourWordsKindAndYourCommunitySafe = if Success1 and type(Result1) == "string" and Result1 ~= "" then Result1 else "Keep your words kind and your community safe."
	end
	t.toastBody = KeepYourWordsKindAndYourCommunitySafe
	t.interventionType = InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.DictationSafetyReminder
	t.toastAppearEventName = InExperienceInterventionAnalyticsModule.Constants.EventTypes.DictationSafetyReminderToastAppeared
	t.toastDismissEventName = InExperienceInterventionAnalyticsModule.Constants.EventTypes.DictationSafetyReminderToastDismissed
	t.iconColor = UseTokensResult.Color.Content.Emphasis.Color3
	
	return CreateElementFunction(ChatInterventionGenericToastModule, t)
end