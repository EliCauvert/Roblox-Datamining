local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local luaAppNavigationContextModule = require(script.Parent.LuaAppNavigationContext)
local enumScreensModule = require(script.Parent.EnumScreens)
local name = require(parent.Loggers).Logger:new(script.Name)
local eventNamesModule = require(appChat.Analytics.EventNames)
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local openUnfilteredThreadsLearnMoreLinkModule = require(appChat.Conversations.Thunks.OpenUnfilteredThreadsLearnMoreLink)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local useChatPlacementContext = chatPlacementContextModule.useChatPlacementContext
local isPlacementInExperience = chatPlacementContextModule.isPlacementInExperience

function generateNavigateToGroups(p1, p2)
	-- upvalues: enumScreensModule (ref), name (ref)
	return function()
		-- upvalues: p2 (ref), p1 (ref), enumScreensModule (copy), name (copy)
		if p2 then
			p2()
		end
		if p1 == nil then return end
		local groups = p1[enumScreensModule.Groups]
		
		if groups then
			name:info("Navigate To Groups from App Chat")
			groups()
			
			return
		end
		name:warning("Groups page was not set in navigateToLuaAppPages")
	end
end

local function _(p1, p2)
	-- upvalues: enumScreensModule (ref), openUnfilteredThreadsLearnMoreLinkModule (ref)
	return function(p3)
		-- upvalues: p1 (ref), p2 (ref), enumScreensModule (copy), openUnfilteredThreadsLearnMoreLinkModule (copy)
		if not p1 then return end
		if not p2 then
			p1(openUnfilteredThreadsLearnMoreLinkModule())
			
			return
		elseif p3 then
			p3(enumScreensModule.LearnMorePartialModal, {}, true)
		end
	end
end

function LuaAppNavigationContextProvider(p1)
	-- upvalues: reactModule (ref), useChatPlacementContext (ref), isPlacementInExperience (ref), useAnalyticsModule (ref), eventNamesModule (ref), luaAppNavigationContextModule (ref), enumScreensModule (ref), openUnfilteredThreadsLearnMoreLinkModule (ref)
	local var1 = reactModule.useRef(function() end)
	local var2 = isPlacementInExperience(useChatPlacementContext().chatPlacement)
	local var3 = useAnalyticsModule()
	
	if var3 then
		function var9.current()
			-- upvalues: var3 (ref), eventNamesModule (copy)
			var3.fireAnalyticsEvent(eventNamesModule.ChatLandingGroupsBtnClicked)
		end
	end
	local createElement = reactModule.createElement
	local provider = luaAppNavigationContextModule.Provider
	local t = {}
	local t_1 = {
		navigateToGroups = generateNavigateToGroups(p1.navigateToLuaAppPages, var1.current)
	}
	local dispatch = p1.dispatch
	
	function t_1.navigateToUnfilteredThreadsLearnMore(p2)
		-- upvalues: dispatch (ref), var2 (ref), enumScreensModule (copy), openUnfilteredThreadsLearnMoreLinkModule (copy)
		if not dispatch then return end
		if not var2 then
			dispatch(openUnfilteredThreadsLearnMoreLinkModule())
			
			return
		elseif p2 then
			p2(enumScreensModule.LearnMorePartialModal, {}, true)
		end
	end
	
	t.value = t_1
	
	return createElement(provider, t, p1.children)
end

return LuaAppNavigationContextProvider