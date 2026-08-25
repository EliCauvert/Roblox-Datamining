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

function generateNavigateToGroups(p0, p1)
	-- upvalues: enumScreensModule (ref), name (ref)
	return function()
		-- upvalues: p1 (ref), p0 (ref), enumScreensModule (copy), name (copy)
		if p1 then
			p1()
		end
		if p0 == nil then return end
		local groups = p0[enumScreensModule.Groups]
		
		if groups then
			name:info("Navigate To Groups from App Chat")
			groups()
			
			return
		end
		name:warning("Groups page was not set in navigateToLuaAppPages")
	end
end

local function _(p2, p3)
	-- upvalues: enumScreensModule (ref), openUnfilteredThreadsLearnMoreLinkModule (ref)
	return function(p4)
		-- upvalues: p2 (ref), p3 (ref), enumScreensModule (copy), openUnfilteredThreadsLearnMoreLinkModule (copy)
		if not p2 then return end
		if not p3 then
			p2(openUnfilteredThreadsLearnMoreLinkModule())
			
			return
		elseif p4 then
			p4(enumScreensModule.LearnMorePartialModal, {}, true)
		end
	end
end

function LuaAppNavigationContextProvider(p5)
	-- upvalues: reactModule (ref), useChatPlacementContext (ref), isPlacementInExperience (ref), useAnalyticsModule (ref), eventNamesModule (ref), luaAppNavigationContextModule (ref), enumScreensModule (ref), openUnfilteredThreadsLearnMoreLinkModule (ref)
	local var9 = reactModule.useRef(function() end)
	local var10 = isPlacementInExperience(useChatPlacementContext().chatPlacement)
	local var11 = useAnalyticsModule()
	
	if var11 then
		function var9.current()
			-- upvalues: var11 (ref), eventNamesModule (copy)
			var11.fireAnalyticsEvent(eventNamesModule.ChatLandingGroupsBtnClicked)
		end
	end
	local createElement = reactModule.createElement
	local provider = luaAppNavigationContextModule.Provider
	local t = {}
	local t_1 = {
		navigateToGroups = generateNavigateToGroups(p5.navigateToLuaAppPages, var9.current)
	}
	local dispatch = p5.dispatch
	
	function t_1.navigateToUnfilteredThreadsLearnMore(p6)
		-- upvalues: dispatch (ref), var10 (ref), enumScreensModule (copy), openUnfilteredThreadsLearnMoreLinkModule (copy)
		if not dispatch then return end
		if not var10 then
			dispatch(openUnfilteredThreadsLearnMoreLinkModule())
			
			return
		elseif p6 then
			p6(enumScreensModule.LearnMorePartialModal, {}, true)
		end
	end
	
	t.value = t_1
	
	return createElement(provider, t, p5.children)
end

return LuaAppNavigationContextProvider