local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SearchModule = require(Modules.LuaApp.Analytics.Events.search)
local NsOpenCTAShownModule = require(Modules.LuaApp.Analytics.Events.nsOpenCTAShown)
local NsOpenContentModule = require(Modules.LuaApp.Analytics.Events.nsOpenContent)
local ButtonClickModule = require(Modules.LuaApp.Analytics.Events.buttonClick)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), SearchModule (copy), ButtonClickModule (copy), NsOpenContentModule (copy), NsOpenCTAShownModule (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		local function _(p2, p3, p4)
			-- upvalues: SearchModule (upval), GetResult (copy)
			SearchModule(GetResult.EventStream, p2, p3, p4)
		end
		
		return {
			reportSearchButtonClick = function(p2)
				-- upvalues: ButtonClickModule (upval), GetResult (copy)
				ButtonClickModule(GetResult.EventStream, p2, "search")
			end,
			reportSearchFocused = function(p2)
				-- upvalues: SearchModule (upval), GetResult (copy)
				SearchModule(GetResult.EventStream, p2, "open", nil)
			end,
			reportSearched = function(p2, p3)
				-- upvalues: SearchModule (upval), GetResult (copy)
				SearchModule(GetResult.EventStream, p2, "search", p3)
			end,
			reportSearchCanceled = function(p2)
				-- upvalues: SearchModule (upval), GetResult (copy)
				SearchModule(GetResult.EventStream, p2, "cancel", nil)
			end,
			reportNSButtonTouch = function(p2)
				-- upvalues: NsOpenContentModule (upval), GetResult (copy)
				NsOpenContentModule(GetResult.EventStream, "touch", p2)
			end,
			reportNSOpenCTAShown = function(p2)
				-- upvalues: NsOpenCTAShownModule (upval), GetResult (copy)
				NsOpenCTAShownModule(GetResult.EventStream, "seen", p2)
			end,
			reportRobuxButtonClick = function(p2)
				-- upvalues: ButtonClickModule (upval), GetResult (copy)
				ButtonClickModule(GetResult.EventStream, p2, "robux")
			end,
			reportBackButtonClick = function(p2)
				-- upvalues: ButtonClickModule (upval), GetResult (copy)
				ButtonClickModule(GetResult.EventStream, p2, "back")
			end,
			reportAddFriendsButtonClick = function(p2)
				-- upvalues: ButtonClickModule (upval), GetResult (copy)
				ButtonClickModule(GetResult.EventStream, p2, "addFriends")
			end
		}
	end
}