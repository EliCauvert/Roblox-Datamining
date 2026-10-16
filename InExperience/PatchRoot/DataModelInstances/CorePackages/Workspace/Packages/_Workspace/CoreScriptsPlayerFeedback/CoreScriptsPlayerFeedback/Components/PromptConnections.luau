local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local v1 = require(CoreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)()
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 21 ]]
	-- upvalues: UseEventConnectionFunction (copy)
	UseEventConnectionFunction(p1.event, p1.handler)
	
	return nil
end)

return (ReactModule.memo(function(p1) --[[ Line: 26 ]]
	-- upvalues: ReactModule (copy), v1 (copy), MemoResult (copy)
	local SocialService = game:GetService("SocialService")
	local UseResult = ReactModule.useCallback(function() --[[ Line: 29 ]]
		-- upvalues: p1 (copy)
		p1.openFeedbackPrompt()
	end, { p1.openFeedbackPrompt })
	local UseResult1 = ReactModule.useCallback(function(FeedbackType) --[[ Line: 32 ]]
		-- upvalues: p1 (copy)
		local IsPlayerSupportMatch = false
		pcall(function() --[[ Line: 34 ]]
			-- upvalues: IsPlayerSupportMatch (ref), FeedbackType (copy)
			IsPlayerSupportMatch = FeedbackType == Enum.FeedbackType.PlayerSupport
		end)
		
		if not IsPlayerSupportMatch then
			p1.openFeedbackPrompt()
		elseif p1.openPlayerSupportPrompt then
			p1.openPlayerSupportPrompt()
		else
			p1.openFeedbackPrompt()
		end
	end, { p1.openFeedbackPrompt, p1.openPlayerSupportPrompt })
	local UseResult2 = if v1 then UseResult1 else UseResult
	local UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 51 ]]
		-- upvalues: p1 (copy)
		if p1.openUnavailablePrompt then
			p1.openUnavailablePrompt(p2)
		end
	end, { p1.openUnavailablePrompt })
	local UseResult31 = ReactModule.useCallback(function(p2, FeedbackType) --[[ Line: 56 ]]
		-- upvalues: p1 (copy)
		local IsPlayerSupportMatch = false
		pcall(function() --[[ Line: 58 ]]
			-- upvalues: IsPlayerSupportMatch (ref), FeedbackType (copy)
			IsPlayerSupportMatch = FeedbackType == Enum.FeedbackType.PlayerSupport
		end)
		
		if IsPlayerSupportMatch then
			if p1.openPlayerSupportUnavailablePrompt then
				p1.openPlayerSupportUnavailablePrompt(p2)
			end
		elseif p1.openUnavailablePrompt then
			p1.openUnavailablePrompt(p2)
		end
	end, {
		p1.openUnavailablePrompt,
		p1.openPlayerSupportUnavailablePrompt
	})
	local UseResult4 = if v1 then UseResult31 else UseResult3
	local Event = nil
	local Event1 = nil
	
	if SocialService then
		local Success, Result = pcall(function() --[[ Line: 79 ]]
			-- upvalues: SocialService (copy)
			return SocialService.ShowPromptFeedbackSubmission
		end)
		
		if Success then
			Event = Result
		end
		local Success1, Result1 = pcall(function() --[[ Line: 86 ]]
			-- upvalues: SocialService (copy)
			return SocialService.ShowPromptFeedbackUnavailable
		end)
		
		if Success1 then
			Event1 = Result1
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		Show = Event and ReactModule.createElement(MemoResult, { event = Event, handler = UseResult2 }) or nil,
		Unavailable = Event1 and ReactModule.createElement(MemoResult, { event = Event1, handler = UseResult4 }) or nil
	})
end))