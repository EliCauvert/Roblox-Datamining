local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local _ = require(BuildExperience.Chat.chatTypes)
local StepSentencesModule = require(BuildExperience.Chat.stepSentences)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ActivityLabelHelpersModule = require(script.Parent.activityLabelHelpers)
local StepListToolLabelsModule = require(script.Parent.stepListToolLabels)
local LocalizeActivityLabelFunction = ActivityLabelHelpersModule.localizeActivityLabel
local UseReactiveValueFunction = ActivityLabelHelpersModule.useReactiveValue
local t = {}
local t1 = {}

local function localizeFailedActivityLabel(Title, DisplaySummary, p1, p2)
	-- upvalues: StepListToolLabelsModule (copy), LocalizationStringsModule (copy)
	local DisplaySummary1 = if DisplaySummary == nil or DisplaySummary == "" then nil else DisplaySummary
	
	if DisplaySummary1 == nil then
		local RunningKey = StepListToolLabelsModule.getRunningKey(Title)
		
		if RunningKey ~= nil then
			local Success, Result = pcall(p2.Format, p2, RunningKey)
			
			if Success then
				DisplaySummary1 = Result
			end
		end
	end
	return p2:Format(LocalizationStringsModule.CHAT_TOOL_FAILED_WITH_TITLE, {
		TITLE = DisplaySummary1 or (if typeof(Title) == "string" and Title ~= "" then Title else p1)
	})
end

local function localizeStepLabel(CHATTOOL, p1, p2, Tool, UseContextResult)
	-- upvalues: localizeFailedActivityLabel (copy), LocalizeActivityLabelFunction (copy), StepListToolLabelsModule (copy)
	return if p2[CHATTOOL] == nil and p1 ~= nil and p1.kind == "tool_call" and p1.status == "failed" then localizeFailedActivityLabel(p1.title, p1.displaySummary, Tool, UseContextResult) else LocalizeActivityLabelFunction(CHATTOOL, p1, p2, Tool, UseContextResult, StepListToolLabelsModule.getRunningKey)
end

return {
	localizeStepLabel = localizeStepLabel,
	useStepRows = function(p1)
		-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), LocalizationRoactContext (copy), UseReactiveValueFunction (copy), t (copy), StepSentencesModule (copy), localizeStepLabel (copy), t1 (copy)
		local Tool = UseLocalizationFunction({ tool = LocalizationStringsModule.CHAT_TOOL }).tool
		local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
		local UseReactiveValueResult = UseReactiveValueFunction(p1.activityItems or t)
		local UseReactiveValueResult1 = UseReactiveValueFunction(p1.isLoading or false)
		
		return ReactModule.useMemo(function()
			-- upvalues: StepSentencesModule (upval), UseReactiveValueResult (copy), localizeStepLabel (upval), LocalizationStringsModule (upval), t1 (upval), Tool (copy), UseContextResult (copy), UseReactiveValueResult1 (copy)
			return StepSentencesModule.buildStepRows(UseReactiveValueResult, function(p2)
				-- upvalues: localizeStepLabel (upval), LocalizationStringsModule (upval), t1 (upval), Tool (upval), UseContextResult (upval)
				return localizeStepLabel(LocalizationStringsModule.CHAT_TOOL, p2, t1, Tool, UseContextResult)
			end, UseReactiveValueResult1)
		end, {
			UseReactiveValueResult,
			UseReactiveValueResult1,
			Tool,
			UseContextResult
		})
	end
}