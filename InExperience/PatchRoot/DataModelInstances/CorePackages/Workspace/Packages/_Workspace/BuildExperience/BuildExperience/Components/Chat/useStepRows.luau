local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local _ = require(BuildExperience.Chat.chatTypes)
local LocalToolStepsModule = require(BuildExperience.Chat.localToolSteps)
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
	getHeaderStep = function(p1, p2, p3, p4)
		if p2 and p1.isWaitingForLocalTool ~= true and p1.hasLabelOverride ~= true then
			local v1 = if p1.ignoresEarlierSteps == true then nil else p4
			local P16 = if p3 == nil or not p3.isRunning then (v1 == nil or not v1.isRunning) and p3 or v1 else p3
			
			return if P16 == nil or P16.isFailed ~= true then P16 else nil
		else
			return nil
		end
	end,
	getNamedStep = function(SegmentKey, p1)
		local v1 = p1[#p1]
		
		for i = #p1, 1, -1 do
			if p1[i].isRunning ~= true then
				continue
			end
			v1 = p1[i]
			break
		end
		return if v1 == nil then nil else {
			segmentKey = SegmentKey,
			key = v1.key,
			title = v1.title,
			isRunning = v1.isRunning == true,
			isFailed = v1.isFailed == true
		}
	end,
	localizeStepLabel = localizeStepLabel,
	useStepRows = function(p2)
		-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), LocalizationRoactContext (copy), UseReactiveValueFunction (copy), t (copy), LocalToolStepsModule (copy), StepSentencesModule (copy), localizeStepLabel (copy), t1 (copy)
		local Tool = UseLocalizationFunction({ tool = LocalizationStringsModule.CHAT_TOOL }).tool
		local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
		local UseReactiveValueResult = UseReactiveValueFunction(p2.activityItems or t)
		local UseReactiveValueResult1 = UseReactiveValueFunction(p2.isLoading or false)
		local UseRefResult = ReactModule.useRef(p2.localToolSteps)
		
		if not LocalToolStepsModule.areStepsEqual(UseRefResult.current, p2.localToolSteps) then
			UseRefResult.current = p2.localToolSteps
		end
		local Current = UseRefResult.current
		local IsCompleted = p2.summaryKind == "completed"
		
		return ReactModule.useMemo(function()
			-- upvalues: StepSentencesModule (upval), UseReactiveValueResult (copy), localizeStepLabel (upval), LocalizationStringsModule (upval), t1 (upval), Tool (copy), UseContextResult (copy), UseReactiveValueResult1 (copy), IsCompleted (copy), Current (copy), LocalToolStepsModule (upval)
			return StepSentencesModule.buildStepRows(UseReactiveValueResult, function(p3)
				-- upvalues: localizeStepLabel (upval), LocalizationStringsModule (upval), t1 (upval), Tool (upval), UseContextResult (upval)
				return localizeStepLabel(LocalizationStringsModule.CHAT_TOOL, p3, t1, Tool, UseContextResult)
			end, UseReactiveValueResult1, IsCompleted, Current, function(p3)
				-- upvalues: LocalToolStepsModule (upval)
				return if p3.plan == nil then nil else LocalToolStepsModule.getPlanBody(p3.plan)
			end)
		end, {
			UseReactiveValueResult, UseReactiveValueResult1, IsCompleted, Current, Tool,
			UseContextResult
		})
	end
}