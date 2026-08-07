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
local var2 = urlBuilder.new({
	path = "profile-insights-api/v1/multiProfileInsights",
	base = urlBase.APIS
})

return {
	findProfileInsightsByUserIds = function(p0, p1, p2, p3) --[[ line: 113 ]]
		-- upvalues: fetch (ref), promiseModule (ref), var2 (ref), httpService (ref), response (ref), graphQLError (ref)
		local var3 = p3 or fetch
		
		return promiseModule.new(function(p4, p5) --[[ line: 121 ]]
			-- upvalues: var3 (ref), var2 (copy), httpService (copy), p0 (ref), p2 (ref), p1 (ref), response (copy), graphQLError (copy)
			local var4 = var3(var2(), {
				method = "POST",
				body = httpService:JSONEncode({
					userIds = p0,
					count = if p2 then nil else p1 or 2,
					rankingStrategy = p2
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function() --[[ line: 135 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var4.ok then
				p5(graphQLError.new(string.format("Failed to fetch profile insights. Error code: %d", var4.status)))
				
				return
			end
			local var5 = var4:json():catch(function() --[[ line: 151 ]]
				return nil
			end):expect()
			
			if var5 then
				p4(var5.userInsights)
				
				return
			end
			p5(graphQLError.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", httpService:JSONEncode(p0))))
		end)
	end,
	findProfileInsightsByUserIdsFeed = function(p6, p7, p8, p9, p10) --[[ line: 173 ]]
		-- upvalues: fFlagPlayerSearchEnableOnlineFrequents (ref), fetch (ref), promiseModule (ref), var2 (ref), httpService (ref), response (ref), graphQLError (ref)
		local var6 = if fFlagPlayerSearchEnableOnlineFrequents then p9 else nil
		local var7 = p10 or fetch
		
		return promiseModule.new(function(p12, p13) --[[ line: 121 ]]
			-- upvalues: var7 (ref), var2 (copy), httpService (copy), p6 (ref), var6 (ref), p7 (ref), response (copy), graphQLError (copy)
			local var4 = var7(var2(), {
				method = "POST",
				body = httpService:JSONEncode({
					userIds = p6,
					count = if var6 then nil else p7 or 2,
					rankingStrategy = var6
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function() --[[ line: 135 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var4.ok then
				p13(graphQLError.new(string.format("Failed to fetch profile insights. Error code: %d", var4.status)))
				
				return
			end
			local var5 = var4:json():catch(function() --[[ line: 151 ]]
				return nil
			end):expect()
			
			if var5 then
				p12(var5.userInsights)
				
				return
			end
			p13(graphQLError.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", httpService:JSONEncode(p6))))
		end):andThen(function(p11) --[[ line: 185 ]]
			-- upvalues: p8 (ref)
			return { pageId = p8, profileInsights = p11 }
		end)
	end
}