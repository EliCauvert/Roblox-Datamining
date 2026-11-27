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
	local UseActivitySummaryLabelResult = UseActivitySummaryLabelFunction(Segment)
	local LocalizationContext = UseActivitySummaryLabelResult.localizationContext
	local Label = UseActivitySummaryLabelResult.label
	local DoneText = p1.doneText
	local IsIsWaitingForLocalTool = Segment.isWaitingForLocalTool == true
	local UseStallStateResult = if FFlagBuildExperiencePromptStallMessageModule then UseStallStateFunction(Segment, UseActivitySummaryLabelResult.labelSource, #UseActivitySummaryLabelResult.activityItems) else nil
	local ClockBinding = p1.clockBinding
	local UseRefResult = ReactModule.useRef(nil)
	local Text: string = if UseActivitySummaryLabelResult.runningKey == nil then `{p1.agentMessageCount}:{UseActivitySummaryLabelResult.labelSource}` else `{Segment.key}:{UseActivitySummaryLabelResult.runningKey}`
	
	if UseRefResult.current == nil or UseRefResult.current.id ~= Text then
		UseRefResult.current = { id = Text, startedAt = ClockBinding:getValue() }
	end
	local IsLabelSourceMatch = UseActivitySummaryLabelResult.labelSource == ChatConstantsModule.ASSISTANT_LOADING_TEXT
	local TakingLongerText = UseActivitySummaryLabelResult.takingLongerText
	
	return {
		text = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), DoneText (copy), ClockBinding (copy), FFlagBuildExperiencePromptStallMessageModule (upval), IsLabelSourceMatch (copy), IsIsWaitingForLocalTool (copy), UseStallStateResult (copy), TakingLongerText (copy), ChatConstantsModule (upval), UseRefResult (copy), Label (copy), formatTitleForDuration (upval), LocalizationContext (copy)
			return if p1.isDone then DoneText else ClockBinding:map(function(p2)
				-- upvalues: FFlagBuildExperiencePromptStallMessageModule (upval), IsLabelSourceMatch (upval), IsIsWaitingForLocalTool (upval), UseStallStateResult (upval), TakingLongerText (upval), ChatConstantsModule (upval), UseRefResult (upval), Label (upval), formatTitleForDuration (upval), LocalizationContext (upval)
				if FFlagBuildExperiencePromptStallMessageModule and IsLabelSourceMatch and not IsIsWaitingForLocalTool and UseStallStateResult ~= nil and TakingLongerText ~= nil then
					local LastProgressAt = UseStallStateResult.lastProgressAt or p2
					UseStallStateResult.lastProgressAt = LastProgressAt
					
					if ChatConstantsModule.PROMPT_STALL_SECONDS <= p2 - LastProgressAt then
						return TakingLongerText
					end
				end
				local Current = UseRefResult.current
				
				return if IsIsWaitingForLocalTool then Label else formatTitleForDuration(LocalizationContext, Label, (math.max(0, (math.floor(p2 - Current.startedAt)))))
			end)
		end, {
			p1.isDone, DoneText, Label, IsLabelSourceMatch, IsIsWaitingForLocalTool,
			TakingLongerText, UseStallStateResult, LocalizationContext, ClockBinding
		})
	}
end