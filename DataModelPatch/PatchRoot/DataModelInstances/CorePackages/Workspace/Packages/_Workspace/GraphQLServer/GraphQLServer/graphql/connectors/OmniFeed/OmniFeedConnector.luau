local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local Object = require(Parent.LuauPolyfill).Object
local PromiseModule = require(Parent.Promise)
local FetchModule = require(Parent.Fetch)
local Fetch = FetchModule.fetch
local Response = FetchModule.Response
local GraphQLError = require(Parent.GraphQL).GraphQLError
local BuildOmniRecommendationsRequestModule = require(script.Parent.buildOmniRecommendationsRequest)
local _ = require(script.Parent.Parent.Parent.generatedTypes)
local OmniRecommendationMetadata = require(Parent.UrlBuilder).UrlBuilder.fromString("apis:discovery-api/omni-recommendation-metadata")

return {
	findOmniFeedBySessionId = function(p1, p2)
		-- upvalues: Fetch (copy), BuildOmniRecommendationsRequestModule (copy), PromiseModule (copy), Response (copy), GraphQLError (copy), Object (copy)
		local OmniRecommendationsRequestModule = BuildOmniRecommendationsRequestModule(if p2 then p2 else Fetch)
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: OmniRecommendationsRequestModule (copy), p1 (copy), Response (upval), GraphQLError (upval), Object (upval)
			local v1 = OmniRecommendationsRequestModule(p1.pageType, p1.sessionId, p1.nextPageToken, p1.supportedTreatmentTypes):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to fetch omni recommendations. Error code: %d", v1.status)))
				
				return nil
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if not v2 then
				Callback(GraphQLError.new("Failed to decode HTTP response as JSON for omni-recommendation fetch"))
			end
			Callback1(Object.assign({ omniSessionId = p1.sessionId, pageType = p1.pageType }, v2))
			
			return nil
		end)
	end,
	fetchMoreOmniRecommendationMetadata = function(p1, p2)
		-- upvalues: Fetch (copy), PromiseModule (copy), OmniRecommendationMetadata (copy), HttpService (copy), Response (copy), GraphQLError (copy), Object (copy)
		local Fetch1 = if p2 then p2 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: OmniRecommendationMetadata (upval), Fetch1 (copy), HttpService (upval), p1 (copy), Response (upval), GraphQLError (upval), Object (upval)
			local v1 = Fetch1(OmniRecommendationMetadata(), {
				method = "POST",
				body = HttpService:JSONEncode({ sessionId = p1.sessionId, contents = p1.recommendations }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to fetch additional metadata for topicId: %s", p1.topicId)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(Object.assign(v2, {
					topicId = p1.topicId,
					recommendations = p1.recommendations
				}))
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for topicId: %s", p1.topicId)))
			end
		end)
	end
}