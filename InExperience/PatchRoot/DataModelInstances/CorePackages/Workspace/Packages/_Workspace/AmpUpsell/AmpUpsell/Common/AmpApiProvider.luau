local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local fetchModule = require(parent.Fetch)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local accessResponseEnum = require(ampUpsell.Common.Enums).AccessResponseEnum
local _ = require(ampUpsell.Common.Types)
local gql = require(parent.ApolloClient).gql
local base64 = require(parent.AuthCommon).Utils.Base64
local getFFlagAmpGqlPassSuccessfulActionsModule = require(ampUpsell.Flags.GetFFlagAmpGqlPassSuccessfulActions)
local fFlagAllowAmpV2FeatureAccessCall = sharedFlagsModule.FFlagAllowAmpV2FeatureAccessCall
local var1 = urlBuilder.new({
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
local var2 = urlBuilder.new({
	path = "access-management/v1/feature-access",
	base = urlBase.APIS,
	query = if fFlagAllowAmpV2FeatureAccessCall then {
		featureNames = "{featureNames}",
		nameSpace = "{nameSpace}"
	} else { featureNames = "{featureNames}" }
})

local function _(p1, p2, p3, p4)
	-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), response (ref)
	return promiseModule.new(function(p5, p6)
		-- upvalues: p2 (ref), var1 (copy), p1 (ref), p3 (ref), p4 (ref), fetch (ref), response (copy)
		local var3 = fetch(var1({
			featureName = p1,
			successfulActions = table.concat(p2, ","),
			nameSpace = p3,
			extraParameters = p4
		}), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var3.status == 304 then
			p6("Got Response: 304")
			
			return
		elseif not var3.ok then
			p6("Failed to find upsell feature access values")
			
			return
		end
		local var4 = var3:json():catch(function()
			return nil
		end):expect()
		
		if var4 then
			p5({
				access = var4.access,
				recourse = var4.recourse,
				recourses = var4.recourses,
				shouldPrompt = var4.shouldPrompt
			})
			
			return
		end
		p6("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
	end)
end

return {
	upsellFeatureAccess = function(p1, p2, p3, p4)
		-- upvalues: base64 (ref), httpService (ref), fetch (ref), promiseModule (ref), var1 (ref), response (ref), accessResponseEnum (ref)
		local var3 = if p4 then base64.Encode(httpService:JSONEncode(p4)) else nil
		
		return promiseModule.new(function(p5, p6)
			-- upvalues: p2 (ref), var1 (copy), p1 (ref), p3 (ref), var3 (ref), fetch (ref), response (copy)
			local var4 = fetch(var1({
				featureName = p1,
				successfulActions = table.concat(p2, ","),
				nameSpace = p3,
				extraParameters = var3
			}), { method = "GET" }):catch(function()
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if var4.status == 304 then
				p6("Got Response: 304")
				
				return
			elseif not var4.ok then
				p6("Failed to find upsell feature access values")
				
				return
			end
			local var5 = var4:json():catch(function()
				return nil
			end):expect()
			
			if var5 then
				p5({
					access = var5.access,
					recourse = var5.recourse,
					recourses = var5.recourses,
					shouldPrompt = var5.shouldPrompt
				})
				
				return
			end
			p6("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
		end):catch(function(_)
			-- upvalues: accessResponseEnum (copy)
			return { access = accessResponseEnum.Error }
		end):expect()
	end,
	upsellFeatureAccessGql = function(p1, p2, p3, p4, p5)
		-- upvalues: gql (ref), base64 (ref), httpService (ref), getFFlagAmpGqlPassSuccessfulActionsModule (ref), accessResponseEnum (ref)
		local var3 = p1:query({
			fetchPolicy = "network-only",
			query = gql(require(script.Parent.GetUpsellFeatureAccess)),
			variables = {
				featureName = p2,
				successfulActions = if getFFlagAmpGqlPassSuccessfulActionsModule() then p3 else {},
				nameSpace = p4,
				extraParameters = if p5 then base64.Encode(httpService:JSONEncode(p5)) else nil
			}
		}):catch(function(_)
			-- upvalues: accessResponseEnum (copy)
			return { access = accessResponseEnum.Error }
		end):expect()
		
		return if var3.data and var3.data.getUpsellFeatureAccess.featureAccess then var3.data.getUpsellFeatureAccess.featureAccess else { access = accessResponseEnum.Error }
	end,
	getFeatureAccess = function(p1, p2)
		-- upvalues: fetch (ref), promiseModule (ref), fFlagAllowAmpV2FeatureAccessCall (ref), var2 (ref), response (ref), accessResponseEnum (ref)
		return promiseModule.new(function(p3, p4)
			-- upvalues: p1 (ref), fFlagAllowAmpV2FeatureAccessCall (copy), var2 (copy), p2 (ref), fetch (ref), response (copy)
			local joined = table.concat(p1, ",")
			local var3 = fetch(if fFlagAllowAmpV2FeatureAccessCall then var2({ featureNames = joined, nameSpace = p2 or "" }) else var2({ featureNames = joined }), { method = "GET" }):catch(function()
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if var3.status == 304 then
				p4("Got Response: 304")
				
				return
			elseif not var3.ok then
				p4("Failed to find get feature access values")
				
				return
			end
			local var4 = var3:json():catch(function()
				return nil
			end):expect()
			
			if not var4 then
				p4("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
				
				return
			end
			local t = {}
			
			for i, v in var4.features do
				table.insert(t, { feature = v.featureName, access = v.access })
			end
			p3({ featureAccessList = t })
		end):catch(function(_)
			-- upvalues: accessResponseEnum (copy)
			return { access = accessResponseEnum.Error }
		end):expect()
	end
}