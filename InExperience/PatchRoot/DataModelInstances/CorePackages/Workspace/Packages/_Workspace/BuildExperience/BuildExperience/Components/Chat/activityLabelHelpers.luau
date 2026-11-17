local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.chatTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceManageMonetizationTool = require(Parent.SharedFlags).FFlagBuildExperienceManageMonetizationTool
local FFlagBuildExperienceToolDisplaySummaryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolDisplaySummary)

local function constantSource(): number
	return 0
end

return {
	useReactiveValue = function(Callback)
		-- upvalues: ReactModule (copy), constantSource (copy), SignalsReactModule (copy)
		return (SignalsReactModule.useSignalState((ReactModule.useCallback(function(Callback1: (any) -> ())
			-- upvalues: Callback (copy), constantSource (upval)
			if typeof(Callback) == "function" then
				return Callback(Callback1)
			end
			if typeof(Callback1) == "function" then
				Callback1(constantSource)
			end
			return Callback
		end, { Callback }))))
	end,
	localizeActivityLabel = function(p1, p2, p3, p4, p5)
		-- upvalues: FFlagBuildExperienceToolDisplaySummaryModule (copy), LocalizationStringsModule (copy), FFlagBuildExperienceManageMonetizationTool (copy)
		local v1 = p3[p1]
		
		if v1 ~= nil then
			return v1
		end
		if p2 == nil or p2.kind ~= "tool_call" then
			return p1
		end
		if FFlagBuildExperienceToolDisplaySummaryModule and p2.status ~= "failed" and typeof(p2.displaySummary) == "string" and p2.displaySummary ~= "" then
			return p2.displaySummary
		end
		local Title = if typeof(p2.title) == "string" and p2.title ~= "" then p2.title else LocalizationStringsModule.CHAT_TOOL
		local ChatToolActivityLocalizationKey = LocalizationStringsModule.getChatToolActivityLocalizationKey(p2.title, p2.status)
		
		if ChatToolActivityLocalizationKey ~= nil then
			if not FFlagBuildExperienceManageMonetizationTool then
				return p5:Format(ChatToolActivityLocalizationKey)
			end
			local Success, Result = pcall(p5.Format, p5, ChatToolActivityLocalizationKey)
			
			if Success then
				return Result
			end
		end
		local Title1 = if Title == LocalizationStringsModule.CHAT_TOOL then p4 else Title
		
		return if p2.status == "completed" then p5:Format(LocalizationStringsModule.CHAT_TOOL_FINISHED, { TITLE = Title1 }) elseif p2.status == "failed" then p5:Format(LocalizationStringsModule.CHAT_TOOL_FAILED, { TITLE = Title1 }) else p5:Format(LocalizationStringsModule.CHAT_TOOL_RUNNING, { title = Title1 })
	end,
	useStallState = function(Segment, Label, ActivityCount)
		-- upvalues: ReactModule (copy)
		local Current = ReactModule.useRef({
			segment = nil,
			label = "",
			activityCount = 0,
			lastProgressAt = nil
		}).current
		
		if Current.segment ~= Segment or Current.label ~= Label or Current.activityCount ~= ActivityCount then
			Current.segment = Segment
			Current.label = Label
			Current.activityCount = ActivityCount
			Current.lastProgressAt = nil
		end
		return Current
	end
}