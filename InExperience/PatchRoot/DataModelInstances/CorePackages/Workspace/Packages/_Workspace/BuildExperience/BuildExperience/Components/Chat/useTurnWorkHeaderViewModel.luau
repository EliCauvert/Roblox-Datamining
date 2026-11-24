local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local _ = require(BuildExperience.Chat.chatTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperiencePromptStallMessageModule = require(BuildExperience.Flags.FFlagBuildExperiencePromptStallMessage)
local UseActivitySummaryLabelFunction = require(script.Parent.useActivitySummaryLabel).useActivitySummaryLabel
local UseStallStateFunction = require(script.Parent.activityLabelHelpers).useStallState

local function formatTitleForDuration(LocalizationContext, Label, Largest: number)
	-- upvalues: LocalizationStringsModule (copy)
	return if Largest < 60 then LocalizationContext:Format(LocalizationStringsModule.CHAT_STEP_FOR_SECONDS, { TITLE = Label, SECONDS = tostring(Largest) }) else LocalizationContext:Format(LocalizationStringsModule.CHAT_STEP_FOR_MINUTES_SECONDS, {
		TITLE = Label,
		MINUTES = tostring((math.floor(Largest / 60))),
		REM_SECONDS = tostring(Largest % 60)
	})
end

return function(p1)
	-- upvalues: UseActivitySummaryLabelFunction (copy), FFlagBuildExperiencePromptStallMessageModule (copy), UseStallStateFunction (copy), ReactModule (copy), ChatConstantsModule (copy), formatTitleForDuration (copy)
	local Segment = p1.segment
	local UseActivitySummaryLabelResult = UseActivitySummaryLabelFunction(Segment, p1.otherStep)
	local LocalizationContext = UseActivitySummaryLabelResult.localizationContext
	local Label = UseActivitySummaryLabelResult.label
	local DoneText = p1.doneText
	local IsIsWaitingForLocalTool = Segment.isWaitingForLocalTool == true
	local UseStallStateResult = if FFlagBuildExperiencePromptStallMessageModule then UseStallStateFunction(Segment, UseActivitySummaryLabelResult.labelSource, #UseActivitySummaryLabelResult.activityItems) else nil
	local ClockBinding = p1.clockBinding
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local Text = if UseActivitySummaryLabelResult.stepId == nil then `{p1.agentMessageCount}:{UseActivitySummaryLabelResult.labelSource}` else UseActivitySummaryLabelResult.stepId
	
	if UseActivitySummaryLabelResult.stepId == nil then
		table.clear(UseRefResult1.current)
	end
	if UseRefResult.current == nil or UseRefResult.current.id ~= Text then
		local CurrentEntry = (if UseActivitySummaryLabelResult.stepId == nil then nil else UseRefResult1.current[Text]) or ClockBinding:getValue()
		
		if UseActivitySummaryLabelResult.stepId ~= nil then
			UseRefResult1.current[Text] = CurrentEntry
		end
		UseRefResult.current = { id = Text, startedAt = CurrentEntry }
	end
	local NoIsStepRunning: boolean = UseActivitySummaryLabelResult.labelSource == ChatConstantsModule.ASSISTANT_LOADING_TEXT and not UseActivitySummaryLabelResult.isStepRunning
	local TakingLongerText = UseActivitySummaryLabelResult.takingLongerText
	local StillWorkingText = UseActivitySummaryLabelResult.stillWorkingText
	local NoStepId: boolean = NoIsStepRunning and UseActivitySummaryLabelResult.stepId == nil
	
	return {
		text = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), DoneText (copy), ClockBinding (copy), FFlagBuildExperiencePromptStallMessageModule (upval), NoIsStepRunning (copy), IsIsWaitingForLocalTool (copy), UseStallStateResult (copy), TakingLongerText (copy), ChatConstantsModule (upval), UseRefResult (copy), Label (copy), NoStepId (copy), StillWorkingText (copy), formatTitleForDuration (upval), LocalizationContext (copy)
			return if p1.isDone then DoneText else ClockBinding:map(function(p2)
				-- upvalues: FFlagBuildExperiencePromptStallMessageModule (upval), NoIsStepRunning (upval), IsIsWaitingForLocalTool (upval), UseStallStateResult (upval), TakingLongerText (upval), ChatConstantsModule (upval), UseRefResult (upval), Label (upval), NoStepId (upval), StillWorkingText (upval), formatTitleForDuration (upval), LocalizationContext (upval)
				if FFlagBuildExperiencePromptStallMessageModule and NoIsStepRunning and not IsIsWaitingForLocalTool and UseStallStateResult ~= nil and TakingLongerText ~= nil then
					local LastProgressAt = UseStallStateResult.lastProgressAt or p2
					UseStallStateResult.lastProgressAt = LastProgressAt
					
					if ChatConstantsModule.PROMPT_STALL_SECONDS <= p2 - LastProgressAt then
						return TakingLongerText
					end
				end
				local Current = UseRefResult.current
				
				if IsIsWaitingForLocalTool then
					return Label
				else
					local Largest = math.max(0, (math.floor(p2 - Current.startedAt)))
					
					return if NoStepId and math.floor(Largest / ChatConstantsModule.ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS) % 2 == 1 then StillWorkingText else formatTitleForDuration(LocalizationContext, Label, Largest)
				end
			end)
		end, {
			p1.isDone, DoneText, Label, NoIsStepRunning, NoStepId, IsIsWaitingForLocalTool,
			TakingLongerText, StillWorkingText, UseStallStateResult, LocalizationContext,
			ClockBinding
		})
	}
end