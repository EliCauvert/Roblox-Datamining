local HttpService = game:GetService("HttpService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local EmojiListModule = require(Parent.EmojiList)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local EmojiUnicodeToIdModule = require(ExpChat.PresetChat.emojiUnicodeToId)

return function(p1, Tbl, p2)
	-- upvalues: ReactModule (copy), EmojiUnicodeToIdModule (copy), EmojiListModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), HttpService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), p2 (copy), EmojiUnicodeToIdModule (upval), EmojiListModule (upval), ExpChatSharedModule (upval), ConstantsModule (upval), HttpService (upval)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local t = {}
		
		for i, lastVisibleResult in Current.lastVisibleResults do
			t[lastVisibleResult] = i - 1
		end
		local Current1 = if p2 then p2.current else nil
		local List = {}
		
		for _, value in Current.seenOrder do
			table.insert(List, {
				emoji_id = EmojiUnicodeToIdModule(EmojiListModule[value].base),
				index = t[value] or -1,
				click = if value == Current1 then 1 else 0
			})
		end
		UseRefResult.current = nil
		
		if p2 then
			p2.current = nil
		end
		ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = ConstantsModule.Analytics.EventTypes.Dismiss,
			component = ConstantsModule.Analytics.Components.EmojiDropdown,
			preset_items = HttpService:JSONEncode(List)
		}, ConstantsModule.Analytics.ExtendedStandardizedFields)
	end, { p2 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult (copy), UseRefResult (copy), p2 (copy), Tbl (copy)
		if not p1 then
			UseResult()
			
			return
		end
		local Current = UseRefResult.current
		
		if Current == nil then
			Current = { seenOrder = {}, seenSet = {}, lastVisibleResults = {} }
			UseRefResult.current = Current
			
			if p2 then
				p2.current = nil
			end
		end
		for _, value in Tbl do
			if not Current.seenSet[value] then
				Current.seenSet[value] = true
				table.insert(Current.seenOrder, value)
			end
		end
		Current.lastVisibleResults = table.clone(Tbl)
	end, { p1, Tbl, p2, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
end