local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SetAppLoadedModule = require(AppChat.Actions.SetAppLoaded)
local RoactChatAnalyticsModule = require(AppChat.LegacyAnalytics.RoactChatAnalytics)
local NewResult = require(AppChat.Logger):new(script.Name)
local NewResult1 = require(Parent.Analytics).Analytics.new((game:GetService("RbxAnalyticsService")))
local AppChatNetworkingModule = require(Parent.AppChatNetworking)

return function() --[[ Line: 13 ]]
	-- upvalues: NewResult (copy), AppChatNetworkingModule (copy), RoactChatAnalyticsModule (copy), NewResult1 (copy), SetAppLoadedModule (copy)
	NewResult:info("Fetching chat metadata...")
	
	return function(p1) --[[ Line: 16 ]]
		-- upvalues: AppChatNetworkingModule (upval), NewResult (upval), RoactChatAnalyticsModule (upval), NewResult1 (upval), SetAppLoadedModule (upval)
		local LocalUserId = p1:getState().LocalUserId
		
		return p1:dispatch(AppChatNetworkingModule.rodux.GetMetadata.API()):andThen(function(Result) --[[ Line: 20 ]]
			-- upvalues: NewResult (upval), LocalUserId (copy), RoactChatAnalyticsModule (upval), NewResult1 (upval), p1 (copy), SetAppLoadedModule (upval)
			local IsChatEnabled = Result.responseBody.isChatEnabled
			
			if IsChatEnabled then
				NewResult:info("Chat is enabled and privacy settings allow chat")
				
				if LocalUserId then
					RoactChatAnalyticsModule.new(NewResult1, LocalUserId):userLoadedChat()
				end
			else
				NewResult:info("Chat is disabled or privacy settings do not allow chat")
			end
			p1:dispatch(SetAppLoadedModule(IsChatEnabled))
			
			return IsChatEnabled
		end):catch(function(Err) --[[ Line: 37 ]]
			-- upvalues: NewResult (upval)
			NewResult:warning("FetchChatData failed with error: {}", (tostring(Err)))
		end)
	end
end