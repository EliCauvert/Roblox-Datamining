local ExpChat = script:FindFirstAncestor("ExpChat")
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(ExpChat.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local GetTextAndTranslationModule = require(ExpChat.getTextAndTranslation)
local IsFullyFilteredTextModule = require(script.Parent.isFullyFilteredText)

local function _(p1)
	-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy)
	return (if GetFFlagExpChatProtectedChatInternalAPIsFunction() then p1.TextInternal else p1.Text) or ""
end

local _ = function(p1)
	-- upvalues: GetTextAndTranslationModule (copy)
	return GetTextAndTranslationModule(p1) or ""
end

local _ = function(Text: string): string
	return (string.gsub(Text, "^%s*(.-)%s*$", "%1"))
end

return function(p1)
	-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), IsFullyFilteredTextModule (copy), GetTextAndTranslationModule (copy)
	local Clock = p1.clock or os.clock
	local Flag = false
	local List = {}
	local Tbl = {}
	
	local function prune(At)
		-- upvalues: List (copy), Tbl (copy)
		for i = #List, 1, -1 do
			if At - List[i].at > 30 then
				table.remove(List, i)
			end
		end
		for i1, value in Tbl do
			if At - value.at > 30 then
				Tbl[i1] = nil
			end
		end
	end
	
	return {
		trackContinuousSend = function(Text: string)
			-- upvalues: Flag (ref), Clock (copy), prune (copy), List (copy)
			if not Flag then
				local ClockResult = Clock()
				prune(ClockResult)
				table.insert(List, {
					text = string.gsub(Text, "^%s*(.-)%s*$", "%1"),
					at = ClockResult
				})
				
				return
			end
		end,
		onOutgoingMessage = function(p2)
			-- upvalues: Flag (ref), List (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), Tbl (copy)
			if Flag or #List == 0 then return end
			local Replaced = string.gsub((if GetFFlagExpChatProtectedChatInternalAPIsFunction() then p2.TextInternal else p2.Text) or "", "^%s*(.-)%s*$", "%1")
			
			for i, value in List do
				if value.text == Replaced then
					table.remove(List, i)
					Tbl[p2.MessageId] = value
					break
				end
			end
		end,
		onIncomingMessage = function(p3)
			-- upvalues: Tbl (copy), Flag (ref), IsFullyFilteredTextModule (upval), GetTextAndTranslationModule (upval), List (copy), p1 (copy)
			local Entry = Tbl[p3.MessageId]
			
			if Entry == nil then return end
			if p3.Status == Enum.TextChatMessageStatus.Sending then return end
			Tbl[p3.MessageId] = nil
			
			if Flag or p3.Status ~= Enum.TextChatMessageStatus.Success then return end
			if IsFullyFilteredTextModule(Entry.text, (string.gsub(GetTextAndTranslationModule(p3) or "", "^%s*(.-)%s*$", "%1"))) then
				Flag = true
				table.clear(List)
				table.clear(Tbl)
				p1.onTriggered()
			end
		end
	}
end