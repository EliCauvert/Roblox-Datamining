local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactUtilsModule = require(parent.ReactUtils)
local getFFlagEnablePlayerSupportPromptModule = require(coreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)
local reactModule = require(parent.React)
local useEventConnection = reactUtilsModule.useEventConnection
local var1 = getFFlagEnablePlayerSupportPromptModule()
local var2 = reactModule.memo(function(p1)
	-- upvalues: useEventConnection (ref)
	useEventConnection(p1.event, p1.handler)
	
	return nil
end)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), var1 (ref), var2 (ref)
	local socialService = game:GetService("SocialService")
	local var3 = if var1 then reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		local var4 = false
		pcall(function()
			-- upvalues: var4 (write), p2 (ref)
			var4 = p2 == Enum.FeedbackType.PlayerSupport
		end)
		p1.openFeedbackPrompt()
	end, { p1.openFeedbackPrompt, p1.openPlayerSupportPrompt }) else reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.openFeedbackPrompt()
	end, { p1.openFeedbackPrompt })
	local var4 = if var1 then reactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (ref)
		local var5 = false
		pcall(function()
			-- upvalues: var5 (write), p3 (ref)
			var5 = p3 == Enum.FeedbackType.PlayerSupport
		end)
		
		if p1.openUnavailablePrompt then
			p1.openUnavailablePrompt(p2)
		end
	end, {
		p1.openUnavailablePrompt,
		p1.openPlayerSupportUnavailablePrompt
	}) else reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		if p1.openUnavailablePrompt then
			p1.openUnavailablePrompt(p2)
		end
	end, { p1.openUnavailablePrompt })
	local var5 = nil
	local var6 = nil
	
	if socialService then
		local ok, status = pcall(function()
			-- upvalues: socialService (ref)
			return socialService.ShowPromptFeedbackSubmission
		end)
		
		if ok then
			var5 = status
		end
		local ok_1, status_1 = pcall(function()
			-- upvalues: socialService (ref)
			return socialService.ShowPromptFeedbackUnavailable
		end)
		local var7 = status_1
		
		if ok_1 then
			var6 = var7
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		Show = var5 and reactModule.createElement(var2, { event = var5, handler = var3 }) or nil,
		Unavailable = var6 and reactModule.createElement(var2, { event = var6, handler = var4 }) or nil
	})
end)