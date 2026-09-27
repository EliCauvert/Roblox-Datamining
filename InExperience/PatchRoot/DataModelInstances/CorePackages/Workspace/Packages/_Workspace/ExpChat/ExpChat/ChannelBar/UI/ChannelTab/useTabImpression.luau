local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local expChatSharedModule = require(parent.ExpChatShared)
local cryoModule = require(parent.Cryo)
local fFlagGlobalTextChatAddPlaySessionFieldModule = require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local analytics = expChatSharedModule.Analytics
local var1 = cryoModule.List.join(analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if fFlagGlobalTextChatAddPlaySessionFieldModule then { "addPlaySessionId" } else {})

return function(value)
	-- upvalues: reactModule (ref), analytics (ref), fFlagExpChatGlobalTabDefaultModule (ref), var1 (ref)
	local tabType = value.tabType or "Unknown"
	local var2 = if value.hasUnreadMessages then 1 else 0
	reactModule.useEffect(function()
		-- upvalues: value (ref), analytics (copy), tabType (ref), var2 (ref), fFlagExpChatGlobalTabDefaultModule (copy), var1 (copy)
		if not value.enabled then return end
		local var3
		local expChatTabImpressionConfig = analytics.ExpChatTabImpressionConfig
		local t = {
			name = value.name,
			type = tabType,
			index = value.index,
			in_overflow = value.inOverflow,
			visible = value.visible,
			badge_count = var2
		}
		
		if fFlagExpChatGlobalTabDefaultModule then
			var3 = value.isSelected == true
			var3 = nil
		else
			var3 = nil
		end
		t.is_selected = var3
		analytics:TelemetryLogEvent(expChatTabImpressionConfig, t, var1)
	end, {
		value.enabled, value.name, tabType, value.index, value.inOverflow,
		value.visible, var2,
		if fFlagExpChatGlobalTabDefaultModule then value.isSelected else nil
	})
end