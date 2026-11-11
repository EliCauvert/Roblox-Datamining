local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local GraphQLError = require(Parent.GraphQL).GraphQLError
local Response = require(Parent.Fetch).Response
local Fetch = require(Parent.Fetch).fetch
local _ = require(Parent.LuauPolyfill)
local _ = require(script.Parent.Parent.generatedTypes)
local FFlagPlayerSearchEnableOnlineFrequents = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "profile-insights-api/v1/multiProfileInsights",
	base = require(Parent.UrlBuilder).UrlBase.APIS
})

return {
	findProfileInsightsByUserIds = function(UserIds, p1, RankingStrategy, p2)
		-- upvalues: Fetch (copy), PromiseModule (copy), NewResult (copy), HttpService (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p2 then p2 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Fetch1 (copy), NewResult (upval), HttpService (upval), UserIds (copy), RankingStrategy (copy), p1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(NewResult(), {
				method = "POST",
				body = HttpService:JSONEncode({
					userIds = UserIds,
					count = if RankingStrategy then nil else p1 or 2,
					rankingStrategy = RankingStrategy
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to fetch profile insights. Error code: %d", v1.status)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2.userInsights)
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", HttpService:JSONEncode(UserIds))))
			end
		end)
	end,
	findProfileInsightsByUserIdsFeed = function(UserIds, p1, PageId, p2, p3)
		-- upvalues: FFlagPlayerSearchEnableOnlineFrequents (copy), Fetch (copy), PromiseModule (copy), NewResult (copy), HttpService (copy), Response (copy), GraphQLError (copy)
		local RankingStrategy = if FFlagPlayerSearchEnableOnlineFrequents then p2 else nil
		local Fetch1 = if p3 then p3 else Fetch
		
		return (PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Fetch1 (copy), NewResult (upval), HttpService (upval), UserIds (copy), RankingStrategy (copy), p1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(NewResult(), {
				method = "POST",
				body = HttpService:JSONEncode({
					userIds = UserIds,
					count = if RankingStrategy then nil else p1 or 2,
					rankingStrategy = RankingStrategy
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to fetch profile insights. Error code: %d", v1.status)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2.userInsights)
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", HttpService:JSONEncode(UserIds))))
			end
		end):andThen(function(Result)
			-- upvalues: PageId (copy)
			return { pageId = PageId, profileInsights = Result }
		end))
	end
}