local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local Analytics = require(Parent.ExpChatShared).Analytics
local JoinResult = require(Parent.Cryo).List.join(Analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if require(ExpChat.Flags.FFlagGlobalTextChatAddPlaySessionField) then { "addPlaySessionId" } else {})

return function(p1)
	-- upvalues: ReactModule (copy), Analytics (copy), FFlagExpChatGlobalTabDefaultModule (copy), JoinResult (copy)
	local TabType = p1.tabType or "Unknown"
	local Badge_count: number = if p1.hasUnreadMessages then 1 else 0
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Analytics (upval), TabType (copy), Badge_count (copy), FFlagExpChatGlobalTabDefaultModule (upval), JoinResult (upval)
		if p1.enabled then
			Analytics:TelemetryLogEvent(Analytics.ExpChatTabImpressionConfig, {
				name = p1.name,
				type = TabType,
				index = p1.index,
				in_overflow = p1.inOverflow,
				visible = p1.visible,
				badge_count = Badge_count,
				is_selected = if FFlagExpChatGlobalTabDefaultModule then p1.isSelected == true else nil
			}, JoinResult)
			
			return
		end
	end, {
		p1.enabled, p1.name, TabType, p1.index, p1.inOverflow, p1.visible, Badge_count,
		if FFlagExpChatGlobalTabDefaultModule then p1.isSelected else nil
	})
end