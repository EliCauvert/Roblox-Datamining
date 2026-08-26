local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("GraphQLServer").Parent
local object = require(parent.LuauPolyfill).Object
local promiseModule = require(parent.Promise)
local t = {}
local fetchModule = require(parent.Fetch)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local graphQLError = require(parent.GraphQL).GraphQLError
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local buildOmniRecommendationsRequestModule = require(script.Parent.buildOmniRecommendationsRequest)
local _ = require(script.Parent.Parent.Parent.generatedTypes)

local function findOmniFeedBySessionId(p1, p2)
	-- upvalues: fetch (ref), buildOmniRecommendationsRequestModule (ref), promiseModule (ref), response (ref), graphQLError (ref), object (ref)
	local var1 = buildOmniRecommendationsRequestModule(p2 or fetch)
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var1 (ref), p1 (ref), response (copy), graphQLError (copy), object (copy)
		local var2 = var1(p1.pageType, p1.sessionId, p1.nextPageToken, p1.supportedTreatmentTypes):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var2.ok then
			p4(graphQLError.new(string.format("Failed to fetch omni recommendations. Error code: %d", var2.status)))
			
			return nil
		end
		local var3 = var2:json():catch(function()
			return nil
		end):expect()
		
		if not var3 then
			p4(graphQLError.new("Failed to decode HTTP response as JSON for omni-recommendation fetch"))
		end
		p3(object.assign({ omniSessionId = p1.sessionId, pageType = p1.pageType }, var3))
		
		return nil
	end)
end

local var1 = urlBuilder.fromString("apis:discovery-api/omni-recommendation-metadata")

local function fetchMoreOmniRecommendationMetadata(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), httpService (ref), response (ref), graphQLError (ref), object (ref)
	local var2 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var1 (copy), var2 (ref), httpService (copy), p1 (ref), response (copy), graphQLError (copy), object (copy)
		local var3 = var2(var1(), {
			method = "POST",
			body = httpService:JSONEncode({ sessionId = p1.sessionId, contents = p1.recommendations }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var3.ok then
			p4(graphQLError.new(string.format("Failed to fetch additional metadata for topicId: %s", p1.topicId)))
			
			return
		end
		local var4 = var3:json():catch(function()
			return nil
		end):expect()
		
		if var4 then
			p3(object.assign(var4, {
				topicId = p1.topicId,
				recommendations = p1.recommendations
			}))
			
			return
		end
		p4(graphQLError.new(string.format("Failed to decode HTTP response as JSON for topicId: %s", p1.topicId)))
	end)
end

t.findOmniFeedBySessionId = findOmniFeedBySessionId
t.fetchMoreOmniRecommendationMetadata = fetchMoreOmniRecommendationMetadata

return t