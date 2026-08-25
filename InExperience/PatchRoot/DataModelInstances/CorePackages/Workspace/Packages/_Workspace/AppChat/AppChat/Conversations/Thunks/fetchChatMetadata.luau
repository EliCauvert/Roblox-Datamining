local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local setAppLoadedModule = require(appChat.Actions.SetAppLoaded)
local roactChatAnalyticsModule = require(appChat.LegacyAnalytics.RoactChatAnalytics)
local name = require(appChat.Logger):new(script.Name)
local var4 = require(parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService"))
local appChatNetworkingModule = require(parent.AppChatNetworking)

return function()
	-- upvalues: name (ref), appChatNetworkingModule (ref), roactChatAnalyticsModule (ref), var4 (ref), setAppLoadedModule (ref)
	name:info("Fetching chat metadata...")
	
	return function(p0)
		-- upvalues: appChatNetworkingModule (copy), name (copy), roactChatAnalyticsModule (copy), var4 (copy), setAppLoadedModule (copy)
		local localUserId = p0:getState().LocalUserId
		
		return p0:dispatch(appChatNetworkingModule.rodux.GetMetadata.API()):andThen(function(p2)
			-- upvalues: name (copy), localUserId (ref), roactChatAnalyticsModule (copy), var4 (copy), p0 (ref), setAppLoadedModule (copy)
			local isChatEnabled = p2.responseBody.isChatEnabled
			
			if isChatEnabled then
				name:info("Chat is enabled and privacy settings allow chat")
				
				if localUserId then
					roactChatAnalyticsModule.new(var4, localUserId):userLoadedChat()
				end
			else
				name:info("Chat is disabled or privacy settings do not allow chat")
			end
			p0:dispatch(setAppLoadedModule(isChatEnabled))
			
			return isChatEnabled
		end):catch(function(p1)
			-- upvalues: name (copy)
			name:warning("FetchChatData failed with error: {}", tostring(p1))
		end)
	end
end