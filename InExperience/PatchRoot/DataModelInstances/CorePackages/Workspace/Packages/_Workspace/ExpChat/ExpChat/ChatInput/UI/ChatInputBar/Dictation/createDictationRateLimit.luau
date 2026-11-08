local Parent = script:FindFirstAncestor("ExpChat").Parent
local Signal = require(Parent.AppCommonLib).Signal
local NewResult = require(Parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)

return function(p1)
	-- upvalues: Signal (copy), NewResult (copy)
	local NewSignal = Signal.new()
	
	return {
		stopRequested = NewSignal,
		onIncomingMessage = function(p2, UserId): boolean
			-- upvalues: p1 (copy), NewSignal (copy), NewResult (upval)
			if not p1.getIsListening() or UserId == nil then
				return false
			end
			if p2.Status ~= Enum.TextChatMessageStatus.Floodchecked then
				return false
			end
			local TextSource = p2.TextSource
			
			if TextSource ~= nil and TextSource.UserId ~= UserId then
				return false
			end
			local Success, Result = pcall(function()
				-- upvalues: NewSignal (upval)
				NewSignal:fire()
			end)
			
			if not Success then
				NewResult:error("Failed to stop dictation after a rate limit: {}", (tostring(Result)))
			end
			return true
		end,
		getStoppedMessage = function(Translator)
			local Success, Result = pcall(function()
				-- upvalues: Translator (copy)
				return Translator:FormatByKey("CoreScripts.TextChat.MessageStatus.Warning.DictationRateLimited")
			end)
			
			return if Success then Result else ""
		end
	}
end