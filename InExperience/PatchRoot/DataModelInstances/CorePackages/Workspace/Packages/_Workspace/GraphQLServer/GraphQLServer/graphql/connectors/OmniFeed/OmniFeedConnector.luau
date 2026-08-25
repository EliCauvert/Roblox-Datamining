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

local function findOmniFeedBySessionId(p0, p1)
	-- upvalues: fetch (ref), buildOmniRecommendationsRequestModule (ref), promiseModule (ref), response (ref), graphQLError (ref), object (ref)
	local var8 = buildOmniRecommendationsRequestModule(p1 or fetch)
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: var8 (ref), p0 (ref), response (copy), graphQLError (copy), object (copy)
		local var9 = var8(p0.pageType, p0.sessionId, p0.nextPageToken, p0.supportedTreatmentTypes):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var9.ok then
			p3(graphQLError.new(string.format("Failed to fetch omni recommendations. Error code: %d", var9.status)))
			
			return nil
		end
		local var10 = var9:json():catch(function()
			return nil
		end):expect()
		
		if not var10 then
			p3(graphQLError.new("Failed to decode HTTP response as JSON for omni-recommendation fetch"))
		end
		p2(object.assign({ omniSessionId = p0.sessionId, pageType = p0.pageType }, var10))
		
		return nil
	end)
end

local var6 = urlBuilder.fromString("apis:discovery-api/omni-recommendation-metadata")

local function fetchMoreOmniRecommendationMetadata(p4, p5)
	-- upvalues: fetch (ref), promiseModule (ref), var6 (ref), httpService (ref), response (ref), graphQLError (ref), object (ref)
	local var11 = p5 or fetch
	
	return promiseModule.new(function(p6, p7)
		-- upvalues: var6 (copy), var11 (ref), httpService (copy), p4 (ref), response (copy), graphQLError (copy), object (copy)
		local var12 = var11(var6(), {
			method = "POST",
			body = httpService:JSONEncode({ sessionId = p4.sessionId, contents = p4.recommendations }),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var12.ok then
			p7(graphQLError.new(string.format("Failed to fetch additional metadata for topicId: %s", p4.topicId)))
			
			return
		end
		local var13 = var12:json():catch(function()
			return nil
		end):expect()
		
		if var13 then
			p6(object.assign(var13, {
				topicId = p4.topicId,
				recommendations = p4.recommendations
			}))
			
			return
		end
		p7(graphQLError.new(string.format("Failed to decode HTTP response as JSON for topicId: %s", p4.topicId)))
	end)
end

t.findOmniFeedBySessionId = findOmniFeedBySessionId
t.fetchMoreOmniRecommendationMetadata = fetchMoreOmniRecommendationMetadata

return t