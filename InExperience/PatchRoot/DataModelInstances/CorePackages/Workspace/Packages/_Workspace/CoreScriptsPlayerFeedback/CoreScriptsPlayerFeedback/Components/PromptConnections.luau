local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactUtilsModule = require(parent.ReactUtils)
local getFFlagEnablePlayerSupportPromptModule = require(coreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)
local reactModule = require(parent.React)
local useEventConnection = reactUtilsModule.useEventConnection
local var4 = getFFlagEnablePlayerSupportPromptModule()
local var5 = reactModule.memo(function(p0) --[[ line: 21 ]]
	-- upvalues: useEventConnection (ref)
	useEventConnection(p0.event, p0.handler)
	
	return nil
end)

return reactModule.memo(function(p1) --[[ line: 26 ]]
	-- upvalues: reactModule (ref), var4 (ref), var5 (ref)
	local socialService = game:GetService("SocialService")
	local var7 = if var4 then reactModule.useCallback(function(p2) --[[ line: 32 ]]
		-- upvalues: p1 (ref)
		local var12 = false
		pcall(function() --[[ line: 34 ]]
			-- upvalues: var12 (write), p2 (ref)
			var12 = p2 == Enum.FeedbackType.PlayerSupport
		end)
		p1.openFeedbackPrompt()
	end, { p1.openFeedbackPrompt, p1.openPlayerSupportPrompt }) else reactModule.useCallback(function() --[[ line: 29 ]]
		-- upvalues: p1 (ref)
		p1.openFeedbackPrompt()
	end, { p1.openFeedbackPrompt })
	local var8 = if var4 then reactModule.useCallback(function(p4, p5) --[[ line: 56 ]]
		-- upvalues: p1 (ref)
		local var13 = false
		pcall(function() --[[ line: 58 ]]
			-- upvalues: var13 (write), p5 (ref)
			var13 = p5 == Enum.FeedbackType.PlayerSupport
		end)
		
		if p1.openUnavailablePrompt then
			p1.openUnavailablePrompt(p4)
		end
	end, {
		p1.openUnavailablePrompt,
		p1.openPlayerSupportUnavailablePrompt
	}) else reactModule.useCallback(function(p3) --[[ line: 51 ]]
		-- upvalues: p1 (ref)
		if p1.openUnavailablePrompt then
			p1.openUnavailablePrompt(p3)
		end
	end, { p1.openUnavailablePrompt })
	local var9 = nil
	local var10 = nil
	
	if socialService then
		local ok, status = pcall(function() --[[ line: 79 ]]
			-- upvalues: socialService (ref)
			return socialService.ShowPromptFeedbackSubmission
		end)
		
		if ok then
			var9 = status
		end
		local ok_1, status_1 = pcall(function() --[[ line: 86 ]]
			-- upvalues: socialService (ref)
			return socialService.ShowPromptFeedbackUnavailable
		end)
		local var11 = status_1
		
		if ok_1 then
			var10 = var11
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		Show = var9 and reactModule.createElement(var5, { event = var9, handler = var7 }) or nil,
		Unavailable = var10 and reactModule.createElement(var5, { event = var10, handler = var8 }) or nil
	})
end)