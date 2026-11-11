local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local UrlBuilder = require(GraphQLServer.Parent.UrlBuilder).UrlBuilder
local UrlBase = require(GraphQLServer.Parent.UrlBuilder).UrlBase
local _ = require(GraphQLServer.Parent.LuauPolyfill)
local PromiseModule = require(GraphQLServer.Parent.Promise)
local GraphQLError = require(GraphQLServer.Parent.GraphQL).GraphQLError
local _ = require(GraphQLServer.graphql.generatedTypes)
local FetchModule = require(GraphQLServer.Parent.Fetch)
local Fetch = FetchModule.fetch
local Response = FetchModule.Response
local NewUrlBuilder = UrlBuilder.new({
	path = "access-management/v1/feature-access",
	base = UrlBase.APIS,
	query = { featureNames = "{featureNames}" }
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "access-management/v1/upsell-feature-access",
	base = UrlBase.APIS,
	query = {
		{
			name = "featureName",
			value = "{featureName}",
			optional = false
		},
		{
			name = "successfulActions",
			value = "{successfulActions}",
			optional = false
		},
		{
			name = "nameSpace",
			value = "{nameSpace}",
			optional = true
		},
		{
			name = "extraParameters",
			value = "{extraParameters}",
			optional = true
		}
	}
})

return {
	getFeatureAccessFromFeatureNamesList = function(List, p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), NewUrlBuilder (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: List (copy), NewUrlBuilder (upval), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(NewUrlBuilder({ featureNames = table.concat(List, ",") }), { method = "GET" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if v1.status == 304 then
				Callback(GraphQLError.new("Got Response: 304, using cached data instead"))
				
				return
			end
			if not v1.ok then
				Callback(GraphQLError.new("Failed to find feature access values"))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if not v2 then
				Callback(GraphQLError.new("Failed to decode HTTP response as JSON for AMP Feature Access API"))
				
				return
			end
			local Features = {}
			
			for _, feature in v2.features do
				table.insert(Features, {
					featureName = feature.featureName,
					access = feature.access
				})
			end
			Callback1({ features = Features })
		end)
	end,
	getUpsellFeatureAccessFromFeatureName = function(FeatureName, List, p2, NameSpace, ExtraParameters)
		-- upvalues: Fetch (copy), PromiseModule (copy), NewUrlBuilder1 (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p2 then p2 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: List (copy), NewUrlBuilder1 (upval), FeatureName (copy), NameSpace (copy), ExtraParameters (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(NewUrlBuilder1({
				featureName = FeatureName,
				successfulActions = table.concat(List, ","),
				nameSpace = NameSpace,
				extraParameters = ExtraParameters
			}), { method = "GET" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if v1.status == 304 then
				Callback(GraphQLError.new("Got Response: 304, using cached data instead"))
				
				return
			end
			if not v1.ok then
				Callback(GraphQLError.new("Failed to find upsell feature access values"))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1({
					featureName = v2.featureName,
					access = v2.access,
					recourse = v2.recourse,
					recourses = v2.recourses,
					shouldPrompt = v2.shouldPrompt
				})
				
				return
			else
				Callback(GraphQLError.new("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API"))
			end
		end)
	end
}