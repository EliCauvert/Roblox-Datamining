local MessageBusService = game:GetService("MessageBusService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("SocialGraphSync").Parent
local PromiseModule = require(Parent.Promise)
local FetchFriendsCarouselFunction = require(Parent.FriendsCarousel).FetchFriendsCarousel
local SocialGraphSyncRequestRetryCount = game:DefineFastInt("SocialGraphSyncRequestRetryCount", 1)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "platform-social-graph-sync-gateway/v1/start-sync",
	base = require(Parent.UrlBuilder).UrlBase.APIS
})

local function _()
	-- upvalues: PromiseModule (copy), NewResult (copy), MessageBusService (copy)
	return PromiseModule.new(function(Callback, _)
		-- upvalues: NewResult (upval), MessageBusService (upval)
		MessageBusService:MakeRequest("CredentialsProtocol", "getHeaders", { url = NewResult(), method = "POST" }, function(p1)
			-- upvalues: Callback (copy)
			Callback(p1)
		end, {})
	end)
end

return function(Callback1, Callback, p1)
	-- upvalues: PromiseModule (copy), NewResult (copy), MessageBusService (copy), HttpService (copy), SocialGraphSyncRequestRetryCount (copy), FetchFriendsCarouselFunction (copy)
	return PromiseModule.new(function(Callback, _)
		-- upvalues: NewResult (upval), MessageBusService (upval)
		MessageBusService:MakeRequest("CredentialsProtocol", "getHeaders", { url = NewResult(), method = "POST" }, function(p2)
			-- upvalues: Callback (copy)
			Callback(p2)
		end, {})
	end):andThen(function(Result)
		-- upvalues: HttpService (upval), SocialGraphSyncRequestRetryCount (upval), NewResult (upval), Callback (copy), Callback1 (copy), FetchFriendsCarouselFunction (upval), PromiseModule (upval), p1 (copy)
		if Result == nil or not Result.success then
			warn("credential headers error")
			
			return
		else
			return Callback(NewResult(), "POST", {
				headers = Result.headers or {},
				postBody = HttpService:JSONEncode({}),
				maxRetryCount = SocialGraphSyncRequestRetryCount
			}):andThen(function(_)
				-- upvalues: Callback1 (upval), FetchFriendsCarouselFunction (upval), PromiseModule (upval)
				Callback1(FetchFriendsCarouselFunction()):andThen(function(_)
					-- upvalues: PromiseModule (upval)
					return PromiseModule.resolve()
				end, function(_)
					-- upvalues: PromiseModule (upval)
					warn("Refresh friends carousel failed after syncing platform friends")
					
					return PromiseModule.resolve()
				end)
			end, function(_)
				-- upvalues: p1 (upval), PromiseModule (upval)
				warn("platform social graph sync request failed")
				p1.Diag:reportCounter("TriggerPlatformSocialGraphSyncFailed", 1)
				
				return PromiseModule.resolve()
			end)
		end
	end)
end