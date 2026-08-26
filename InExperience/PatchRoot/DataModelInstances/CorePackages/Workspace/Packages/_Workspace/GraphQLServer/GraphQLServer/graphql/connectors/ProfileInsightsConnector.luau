local parent = script:FindFirstAncestor("GraphQLServer").Parent
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local promiseModule = require(parent.Promise)
local graphQLError = require(parent.GraphQL).GraphQLError
local response = require(parent.Fetch).Response
local fetch = require(parent.Fetch).fetch
local _ = require(parent.LuauPolyfill)
local _ = require(script.Parent.Parent.generatedTypes)
local fFlagPlayerSearchEnableOnlineFrequents = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local var1 = urlBuilder.new({
	path = "profile-insights-api/v1/multiProfileInsights",
	base = urlBase.APIS
})

return {
	findProfileInsightsByUserIds = function(p1, p2, p3, p4)
		-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), httpService (ref), response (ref), graphQLError (ref)
		local var2 = p4 or fetch
		
		return promiseModule.new(function(p5, p6)
			-- upvalues: var2 (ref), var1 (copy), httpService (copy), p1 (ref), p3 (ref), p2 (ref), response (copy), graphQLError (copy)
			local var3 = var2(var1(), {
				method = "POST",
				body = httpService:JSONEncode({
					userIds = p1,
					count = if p3 then nil else p2 or 2,
					rankingStrategy = p3
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var3.ok then
				p6(graphQLError.new(string.format("Failed to fetch profile insights. Error code: %d", var3.status)))
				
				return
			end
			local var4 = var3:json():catch(function()
				return nil
			end):expect()
			
			if var4 then
				p5(var4.userInsights)
				
				return
			end
			p6(graphQLError.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", httpService:JSONEncode(p1))))
		end)
	end,
	findProfileInsightsByUserIdsFeed = function(p1, p2, p3, p4, p5)
		-- upvalues: fFlagPlayerSearchEnableOnlineFrequents (ref), fetch (ref), promiseModule (ref), var1 (ref), httpService (ref), response (ref), graphQLError (ref)
		local var2 = if fFlagPlayerSearchEnableOnlineFrequents then p4 else nil
		local var3 = p5 or fetch
		
		return promiseModule.new(function(p6, p7)
			-- upvalues: var3 (ref), var1 (copy), httpService (copy), p1 (ref), var2 (ref), p2 (ref), response (copy), graphQLError (copy)
			local var4 = var3(var1(), {
				method = "POST",
				body = httpService:JSONEncode({
					userIds = p1,
					count = if var2 then nil else p2 or 2,
					rankingStrategy = var2
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var4.ok then
				p7(graphQLError.new(string.format("Failed to fetch profile insights. Error code: %d", var4.status)))
				
				return
			end
			local var5 = var4:json():catch(function()
				return nil
			end):expect()
			
			if var5 then
				p6(var5.userInsights)
				
				return
			end
			p7(graphQLError.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", httpService:JSONEncode(p1))))
		end):andThen(function(p6)
			-- upvalues: p3 (ref)
			return { pageId = p3, profileInsights = p6 }
		end)
	end
}