local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local LuaAppNavigationContextModule = require(script.Parent.LuaAppNavigationContext)
local EnumScreensModule = require(script.Parent.EnumScreens)
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local EventNamesModule = require(AppChat.Analytics.EventNames)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local OpenUnfilteredThreadsLearnMoreLinkModule = require(AppChat.Conversations.Thunks.OpenUnfilteredThreadsLearnMoreLink)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local UseChatPlacementContextFunction = ChatPlacementContextModule.useChatPlacementContext
local IsPlacementInExperienceFunction = ChatPlacementContextModule.isPlacementInExperience

function generateNavigateToGroups(p1, Callback) --[[ Line: 23 ]]
	-- upvalues: EnumScreensModule (copy), NewResult (copy)
	return function() --[[ Line: 24 ]]
		-- upvalues: Callback (copy), p1 (copy), EnumScreensModule (upval), NewResult (upval)
		if Callback then
			Callback()
		end
		if p1 == nil then return end
		local Callback1: () -> () = p1[EnumScreensModule.Groups]
		
		if Callback1 then
			NewResult:info("Navigate To Groups from App Chat")
			Callback1()
			
			return
		else
			NewResult:warning("Groups page was not set in navigateToLuaAppPages")
		end
	end
end

local function _(p1, p2) --[[ Line: 43 | Named "generateNavigateToUnfilteredThreadsLearnMore" ]]
	-- upvalues: EnumScreensModule (copy), OpenUnfilteredThreadsLearnMoreLinkModule (copy)
	return function(Callback: (any, any, any) -> ()) --[[ Line: 44 ]]
		-- upvalues: p1 (copy), p2 (copy), EnumScreensModule (upval), OpenUnfilteredThreadsLearnMoreLinkModule (upval)
		if not p1 then return end
		if not p2 then
			p1(OpenUnfilteredThreadsLearnMoreLinkModule())
			
			return
		end
		if Callback then
			Callback(EnumScreensModule.LearnMorePartialModal, {}, true)
		end
	end
end

function LuaAppNavigationContextProvider(p1) --[[ Line: 58 ]]
	-- upvalues: ReactModule (copy), UseChatPlacementContextFunction (copy), IsPlacementInExperienceFunction (copy), UseAnalyticsModule (copy), EventNamesModule (copy), LuaAppNavigationContextModule (copy), EnumScreensModule (copy), OpenUnfilteredThreadsLearnMoreLinkModule (copy)
	local UseRefResult = ReactModule.useRef(function() --[[ Line: 59 ]] end)
	local IsPlacementInExperience = IsPlacementInExperienceFunction(UseChatPlacementContextFunction().chatPlacement)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	
	if UseAnalyticsModuleResult then
		function UseRefResult.current() --[[ Line: 66 ]]
			-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval)
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ChatLandingGroupsBtnClicked)
		end
	end
	local DispatchFunction = p1.dispatch
	
	return ReactModule.createElement(LuaAppNavigationContextModule.Provider, {
		value = {
			navigateToGroups = generateNavigateToGroups(p1.navigateToLuaAppPages, UseRefResult.current),
			navigateToUnfilteredThreadsLearnMore = function(Callback: (any, any, any) -> ()) --[[ Line: 44 ]]
				-- upvalues: DispatchFunction (copy), IsPlacementInExperience (copy), EnumScreensModule (upval), OpenUnfilteredThreadsLearnMoreLinkModule (upval)
				if not DispatchFunction then return end
				if not IsPlacementInExperience then
					DispatchFunction(OpenUnfilteredThreadsLearnMoreLinkModule())
					
					return
				end
				if Callback then
					Callback(EnumScreensModule.LearnMorePartialModal, {}, true)
				end
			end
		}
	}, p1.children)
end

return LuaAppNavigationContextProvider