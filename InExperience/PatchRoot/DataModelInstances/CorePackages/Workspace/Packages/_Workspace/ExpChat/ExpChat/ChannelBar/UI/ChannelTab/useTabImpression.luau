local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local analytics = require(parent.ExpChatShared).Analytics
local var2 = require(parent.Cryo).List.join(analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField) then { "addPlaySessionId" } else {})

return function(value)
	-- upvalues: reactModule (ref), analytics (ref), var2 (ref)
	local tabType = value.tabType or "Unknown"
	local var4 = if value.hasUnreadMessages then 1 else 0
	reactModule.useEffect(function()
		-- upvalues: value (ref), analytics (copy), tabType (ref), var4 (ref), var2 (copy)
		if value.enabled then
			analytics:TelemetryLogEvent(analytics.ExpChatTabImpressionConfig, {
				name = value.name,
				type = tabType,
				index = value.index,
				in_overflow = value.inOverflow,
				visible = value.visible,
				badge_count = var4
			}, var2)
			
			return
		end
	end, {
		value.enabled, value.name, tabType, value.index, value.inOverflow,
		value.visible, var4
	})
end