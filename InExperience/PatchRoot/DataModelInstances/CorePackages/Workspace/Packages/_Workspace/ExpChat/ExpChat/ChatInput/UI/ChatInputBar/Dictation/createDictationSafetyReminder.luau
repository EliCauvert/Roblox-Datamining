local expChat = script:FindFirstAncestor("ExpChat")
local getFFlagExpChatProtectedChatInternalAPIs = require(expChat.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local getTextAndTranslationModule = require(expChat.getTextAndTranslation)
local isFullyFilteredTextModule = require(script.Parent.isFullyFilteredText)

local function _(p1)
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref)
	return (if getFFlagExpChatProtectedChatInternalAPIs() then p1.TextInternal else p1.Text) or ""
end

local _ = function(p1)
	-- upvalues: getTextAndTranslationModule (ref)
	return getTextAndTranslationModule(p1) or ""
end

local _ = function(p1)
	return string.gsub(p1, "^%s*(.-)%s*$", "%1")
end

return function(a)
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), isFullyFilteredTextModule (ref), getTextAndTranslationModule (ref)
	local clock = a.clock or os.clock
	local var1 = false
	local t = {}
	local t_1 = {}
	
	local function prune(p1)
		-- upvalues: t (ref), t_1 (ref)
		for i = #t, 1, -1 do
			if p1 - t[i].at > 30 then
				table.remove(t, i)
			end
		end
		for i_1, v in t_1 do
			if p1 - v.at > 30 then
				t_1[i_1] = nil
			end
		end
	end
	
	return {
		trackContinuousSend = function(p2)
			-- upvalues: var1 (write), clock (ref), prune (ref), t (ref)
			if var1 then
				return
			end
			local var2 = clock()
			prune(var2)
			table.insert(t, { text = string.gsub(p2, "^%s*(.-)%s*$", "%1"), at = var2 })
		end,
		onOutgoingMessage = function(p2)
			-- upvalues: var1 (write), t (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), t_1 (ref)
			if var1 or #t == 0 then return end
			local replaced = string.gsub((if getFFlagExpChatProtectedChatInternalAPIs() then p2.TextInternal else p2.Text) or "", "^%s*(.-)%s*$", "%1")
			
			for i, v in t do
				if v.text == replaced then
					table.remove(t, i)
					t_1[p2.MessageId] = v
					
					return
				end
			end
		end,
		onIncomingMessage = function(a_1)
			-- upvalues: t_1 (ref), var1 (write), isFullyFilteredTextModule (copy), getTextAndTranslationModule (copy), t (ref), a (ref)
			local messageId = t_1[a_1.MessageId]
			
			if messageId == nil then return end
			if a_1.Status == Enum.TextChatMessageStatus.Sending then return end
			t_1[a_1.MessageId] = nil
			
			if var1 or a_1.Status ~= Enum.TextChatMessageStatus.Success then return end
			if isFullyFilteredTextModule(messageId.text, string.gsub(getTextAndTranslationModule(a_1) or "", "^%s*(.-)%s*$", "%1")) then
				var1 = true
				table.clear(t)
				table.clear(t_1)
				a.onTriggered()
			end
		end
	}
end