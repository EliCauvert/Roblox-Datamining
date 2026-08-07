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
local var6 = urlBuilder.new({
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
local var7 = urlBuilder.new({
	path = "access-management/v1/feature-access",
	base = urlBase.APIS,
	query = if fFlagAllowAmpV2FeatureAccessCall then {
		featureNames = "{featureNames}",
		nameSpace = "{nameSpace}"
	} else { featureNames = "{featureNames}" }
})

local function _(p0, p1, p2, p3) --[[ line: 54 | named "getUpsellFeatureAccessFromFeatureName" ]]
	-- upvalues: fetch (ref), promiseModule (ref), var6 (ref), response (ref)
	return promiseModule.new(function(p4, p5) --[[ line: 61 ]]
		-- upvalues: p1 (ref), var6 (copy), p0 (ref), p2 (ref), p3 (ref), fetch (ref), response (copy)
		local var8 = fetch(var6({
			featureName = p0,
			successfulActions = table.concat(p1, ","),
			nameSpace = p2,
			extraParameters = p3
		}), { method = "GET" }):catch(function() --[[ line: 70 ]]
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var8.status == 304 then
			p5("Got Response: 304")
			
			return
		elseif not var8.ok then
			p5("Failed to find upsell feature access values")
			
			return
		end
		local var9 = var8:json():catch(function() --[[ line: 88 ]]
			return nil
		end):expect()
		
		if var9 then
			p4({
				access = var9.access,
				recourse = var9.recourse,
				recourses = var9.recourses,
				shouldPrompt = var9.shouldPrompt
			})
			
			return
		end
		p5("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
	end)
end

return {
	upsellFeatureAccess = function(p6, p7, p8, p9) --[[ line: 107 ]]
		-- upvalues: base64 (ref), httpService (ref), fetch (ref), promiseModule (ref), var6 (ref), response (ref), accessResponseEnum (ref)
		local var10 = if p9 then base64.Encode(httpService:JSONEncode(p9)) else nil
		
		return promiseModule.new(function(p10, p11) --[[ line: 61 ]]
			-- upvalues: p7 (ref), var6 (copy), p6 (ref), p8 (ref), var10 (ref), fetch (ref), response (copy)
			local var8 = fetch(var6({
				featureName = p6,
				successfulActions = table.concat(p7, ","),
				nameSpace = p8,
				extraParameters = var10
			}), { method = "GET" }):catch(function() --[[ line: 70 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if var8.status == 304 then
				p11("Got Response: 304")
				
				return
			elseif not var8.ok then
				p11("Failed to find upsell feature access values")
				
				return
			end
			local var9 = var8:json():catch(function() --[[ line: 88 ]]
				return nil
			end):expect()
			
			if var9 then
				p10({
					access = var9.access,
					recourse = var9.recourse,
					recourses = var9.recourses,
					shouldPrompt = var9.shouldPrompt
				})
				
				return
			end
			p11("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
		end):catch(function(_) --[[ line: 117 ]]
			-- upvalues: accessResponseEnum (copy)
			return { access = accessResponseEnum.Error }
		end):expect()
	end,
	upsellFeatureAccessGql = function(p12, p13, p14, p15, p16) --[[ line: 189 ]]
		-- upvalues: gql (ref), base64 (ref), httpService (ref), getFFlagAmpGqlPassSuccessfulActionsModule (ref), accessResponseEnum (ref)
		local var11 = p12:query({
			fetchPolicy = "network-only",
			query = gql(require(script.Parent.GetUpsellFeatureAccess)),
			variables = {
				featureName = p13,
				successfulActions = if getFFlagAmpGqlPassSuccessfulActionsModule() then p14 else {},
				nameSpace = p15,
				extraParameters = if p16 then base64.Encode(httpService:JSONEncode(p16)) else nil
			}
		}):catch(function(_) --[[ line: 211 ]]
			-- upvalues: accessResponseEnum (copy)
			return { access = accessResponseEnum.Error }
		end):expect()
		
		return if var11.data and var11.data.getUpsellFeatureAccess.featureAccess then var11.data.getUpsellFeatureAccess.featureAccess else { access = accessResponseEnum.Error }
	end,
	getFeatureAccess = function(p17, p18) --[[ line: 126 ]]
		-- upvalues: fetch (ref), promiseModule (ref), fFlagAllowAmpV2FeatureAccessCall (ref), var7 (ref), response (ref), accessResponseEnum (ref)
		return promiseModule.new(function(p19, p20) --[[ line: 128 ]]
			-- upvalues: p17 (ref), fFlagAllowAmpV2FeatureAccessCall (copy), var7 (copy), p18 (ref), fetch (ref), response (copy)
			local joined = table.concat(p17, ",")
			local var13 = fetch(if fFlagAllowAmpV2FeatureAccessCall then var7({ featureNames = joined, nameSpace = p18 or "" }) else var7({ featureNames = joined }), { method = "GET" }):catch(function() --[[ line: 140 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if var13.status == 304 then
				p20("Got Response: 304")
				
				return
			elseif not var13.ok then
				p20("Failed to find get feature access values")
				
				return
			end
			local var14 = var13:json():catch(function() --[[ line: 158 ]]
				return nil
			end):expect()
			
			if not var14 then
				p20("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
				
				return
			end
			local t = {}
			
			for i, v in var14.features do
				table.insert(t, { feature = v.featureName, access = v.access })
			end
			p19({ featureAccessList = t })
		end):catch(function(_) --[[ line: 181 ]]
			-- upvalues: accessResponseEnum (copy)
			return { access = accessResponseEnum.Error }
		end):expect()
	end
}