local httpService = game:GetService("HttpService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local emojiListModule = require(parent.EmojiList)
local expChatSharedModule = require(parent.ExpChatShared)
local constantsModule = require(expChat.PresetChat.Constants)
local emojiUnicodeToIdModule = require(expChat.PresetChat.emojiUnicodeToId)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), emojiUnicodeToIdModule (ref), emojiListModule (ref), expChatSharedModule (ref), constantsModule (ref), httpService (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p3 (ref), emojiUnicodeToIdModule (copy), emojiListModule (copy), expChatSharedModule (copy), constantsModule (copy), httpService (copy)
		local current = var1.current
		
		if current == nil then return end
		local t = {}
		
		for i, v in current.lastVisibleResults do
			t[v] = i - 1
		end
		local var3 = if p3 then p3.current else nil
		local t_1 = {}
		
		for i_1, v_1 in current.seenOrder do
			table.insert(t_1, {
				emoji_id = emojiUnicodeToIdModule(emojiListModule[v_1].base),
				index = t[v_1] or -1,
				click = if v_1 == var3 then 1 else 0
			})
		end
		var1.current = nil
		
		if p3 then
			p3.current = nil
		end
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Dismiss,
			component = constantsModule.Analytics.Components.EmojiDropdown,
			preset_items = httpService:JSONEncode(t_1)
		}, constantsModule.Analytics.ExtendedStandardizedFields)
	end, { p3 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref), p3 (ref), p2 (ref)
		if not p1 then
			var2()
			
			return
		end
		local current = var1.current
		
		if current == nil then
			current = { seenOrder = {}, seenSet = {}, lastVisibleResults = {} }
			var1.current = current
			
			if p3 then
				p3.current = nil
			end
		end
		for i, v in p2 do
			if not current.seenSet[v] then
				current.seenSet[v] = true
				table.insert(current.seenOrder, v)
			end
		end
		current.lastVisibleResults = table.clone(p2)
	end, { p1, p2, p3, var2 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return var2
	end, { var2 })
end