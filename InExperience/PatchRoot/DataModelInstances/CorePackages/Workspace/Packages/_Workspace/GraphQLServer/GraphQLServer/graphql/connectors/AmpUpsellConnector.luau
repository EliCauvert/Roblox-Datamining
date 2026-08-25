local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local urlBuilder = require(graphQLServer.Parent.UrlBuilder).UrlBuilder
local urlBase = require(graphQLServer.Parent.UrlBuilder).UrlBase
local _ = require(graphQLServer.Parent.LuauPolyfill)
local promiseModule = require(graphQLServer.Parent.Promise)
local graphQLError = require(graphQLServer.Parent.GraphQL).GraphQLError
local _ = require(graphQLServer.graphql.generatedTypes)
local fetchModule = require(graphQLServer.Parent.Fetch)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local t = {}
local var4 = urlBuilder.new({
	path = "access-management/v1/feature-access",
	base = urlBase.APIS,
	query = { featureNames = "{featureNames}" }
})

function t.getFeatureAccessFromFeatureNamesList(p0, p1)
	-- upvalues: fetch (ref), promiseModule (ref), var4 (ref), response (ref), graphQLError (ref)
	local var6 = p1 or fetch
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: p0 (ref), var4 (copy), var6 (ref), response (copy), graphQLError (copy)
		local var7 = var6(var4({ featureNames = table.concat(p0, ",") }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var7.status == 304 then
			p3(graphQLError.new("Got Response: 304, using cached data instead"))
			
			return
		elseif not var7.ok then
			p3(graphQLError.new("Failed to find feature access values"))
			
			return
		end
		local var8 = var7:json():catch(function()
			return nil
		end):expect()
		
		if not var8 then
			p3(graphQLError.new("Failed to decode HTTP response as JSON for AMP Feature Access API"))
			
			return
		end
		local t = {}
		
		for i, v in var8.features do
			table.insert(t, { featureName = v.featureName, access = v.access })
		end
		p2({ features = t })
	end)
end

local var5 = urlBuilder.new({
	path = "access-management/v1/upsell-feature-access",
	base = urlBase.APIS,
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

function t.getUpsellFeatureAccessFromFeatureName(p4, p5, p6, p7, p8)
	-- upvalues: fetch (ref), promiseModule (ref), var5 (ref), response (ref), graphQLError (ref)
	local var10 = p6 or fetch
	
	return promiseModule.new(function(p9, p10)
		-- upvalues: p5 (ref), var5 (copy), p4 (ref), p7 (ref), p8 (ref), var10 (ref), response (copy), graphQLError (copy)
		local var11 = var10(var5({
			featureName = p4,
			successfulActions = table.concat(p5, ","),
			nameSpace = p7,
			extraParameters = p8
		}), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var11.status == 304 then
			p10(graphQLError.new("Got Response: 304, using cached data instead"))
			
			return
		elseif not var11.ok then
			p10(graphQLError.new("Failed to find upsell feature access values"))
			
			return
		end
		local var12 = var11:json():catch(function()
			return nil
		end):expect()
		
		if var12 then
			p9({
				featureName = var12.featureName,
				access = var12.access,
				recourse = var12.recourse,
				recourses = var12.recourses,
				shouldPrompt = var12.shouldPrompt
			})
			
			return
		end
		p10(graphQLError.new("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API"))
	end)
end

return t