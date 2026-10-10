local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local chatInterventionGenericToastModule = require(inExperienceIntervention.Components.ChatInterventionGenericToast)

local function _(p1, p2, p3)
	if p1 == nil then
		return p3
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1:Format(p2)
	end)
	
	return if ok and type(status) == "string" and status ~= "" then status else p3
end

return function()
	-- upvalues: reactModule (ref), localizationRoactContext (ref), foundationModule (ref), chatInterventionGenericToastModule (ref), inExperienceInterventionAnalyticsModule (ref)
	local var1, ok, status
	local var2 = reactModule.useContext(localizationRoactContext)
	local var3 = foundationModule.Hooks.useTokens()
	local createElement = reactModule.createElement
	local t = {}
	
	if var2 == nil then
		var1 = "Voice typing may be turned off if you break the rules"
	else
		local var4 = "Feature.InExperienceIntervention.Heading.VoiceTypingMayBeTurnedOff"
		ok, status = pcall(function()
			-- upvalues: var2 (ref), var4 (ref)
			return var2:Format(var4)
		end)
		var1 = if ok and type(status) == "string" and status ~= "" then status else "Voice typing may be turned off if you break the rules"
	end
	local var5
	t.toastTitle = var1
	
	if var2 == nil then
		var5 = "Keep your words kind and your community safe."
	else
		local var6 = "Feature.InExperienceIntervention.Description.KeepWordsKindCommunitySafe"
		ok, status = pcall(function()
			-- upvalues: var2 (ref), var6 (ref)
			return var2:Format(var6)
		end)
		var5 = if ok and type(status) == "string" and status ~= "" then status else "Keep your words kind and your community safe."
	end
	t.toastBody = var5
	t.interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.DictationSafetyReminder
	t.toastAppearEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.DictationSafetyReminderToastAppeared
	t.toastDismissEventName = inExperienceInterventionAnalyticsModule.Constants.EventTypes.DictationSafetyReminderToastDismissed
	t.iconColor = var3.Color.Content.Emphasis.Color3
	
	return createElement(chatInterventionGenericToastModule, t)
end