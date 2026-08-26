local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local analytics = require(parent.ExpChatShared).Analytics
local var1 = require(parent.Cryo).List.join(analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField) then { "addPlaySessionId" } else {})

return function(value)
	-- upvalues: reactModule (ref), analytics (ref), var1 (ref)
	local tabType = value.tabType or "Unknown"
	local var2 = if value.hasUnreadMessages then 1 else 0
	reactModule.useEffect(function()
		-- upvalues: value (ref), analytics (copy), tabType (ref), var2 (ref), var1 (copy)
		if value.enabled then
			analytics:TelemetryLogEvent(analytics.ExpChatTabImpressionConfig, {
				name = value.name,
				type = tabType,
				index = value.index,
				in_overflow = value.inOverflow,
				visible = value.visible,
				badge_count = var2
			}, var1)
			
			return
		end
	end, {
		value.enabled, value.name, tabType, value.index, value.inOverflow,
		value.visible, var2
	})
end