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
local var1 = urlBuilder.new({
	path = "access-management/v1/feature-access",
	base = urlBase.APIS,
	query = { featureNames = "{featureNames}" }
})

function t.getFeatureAccessFromFeatureNamesList(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), response (ref), graphQLError (ref)
	local var2 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: p1 (ref), var1 (copy), var2 (ref), response (copy), graphQLError (copy)
		local var3 = var2(var1({ featureNames = table.concat(p1, ",") }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var3.status == 304 then
			p4(graphQLError.new("Got Response: 304, using cached data instead"))
			
			return
		elseif not var3.ok then
			p4(graphQLError.new("Failed to find feature access values"))
			
			return
		end
		local var4 = var3:json():catch(function()
			return nil
		end):expect()
		
		if not var4 then
			p4(graphQLError.new("Failed to decode HTTP response as JSON for AMP Feature Access API"))
			
			return
		end
		local t = {}
		
		for i, v in var4.features do
			table.insert(t, { featureName = v.featureName, access = v.access })
		end
		p3({ features = t })
	end)
end

local var3 = urlBuilder.new({
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

function t.getUpsellFeatureAccessFromFeatureName(p3, p4, p5, p6, p7)
	-- upvalues: fetch (ref), promiseModule (ref), var3 (ref), response (ref), graphQLError (ref)
	local var4 = p5 or fetch
	
	return promiseModule.new(function(p8, p9)
		-- upvalues: p4 (ref), var3 (copy), p3 (ref), p6 (ref), p7 (ref), var4 (ref), response (copy), graphQLError (copy)
		local var5 = var4(var3({
			featureName = p3,
			successfulActions = table.concat(p4, ","),
			nameSpace = p6,
			extraParameters = p7
		}), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var5.status == 304 then
			p9(graphQLError.new("Got Response: 304, using cached data instead"))
			
			return
		elseif not var5.ok then
			p9(graphQLError.new("Failed to find upsell feature access values"))
			
			return
		end
		local var6 = var5:json():catch(function()
			return nil
		end):expect()
		
		if var6 then
			p8({
				featureName = var6.featureName,
				access = var6.access,
				recourse = var6.recourse,
				recourses = var6.recourses,
				shouldPrompt = var6.shouldPrompt
			})
			
			return
		end
		p9(graphQLError.new("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API"))
	end)
end

return t