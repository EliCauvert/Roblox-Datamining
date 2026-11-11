local RoactAnalyticsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactAnalytics)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		return {
			inviteePageLoad = function(ReferringUserId, Page)
				-- upvalues: GetResult (copy)
				GetResult.EventStream:setRBXEventStream("profileShareLink", "luaPageLoad", {
					target = "mobile",
					referringUserId = ReferringUserId,
					page = Page
				})
			end,
			inviterButtonClick = function(Page)
				-- upvalues: GetResult (copy)
				GetResult.EventStream:setRBXEventStream("profileShareLink", "buttonClick", {
					btn = "userShareProfileLink",
					target = "mobile",
					page = Page
				})
			end
		}
	end
}