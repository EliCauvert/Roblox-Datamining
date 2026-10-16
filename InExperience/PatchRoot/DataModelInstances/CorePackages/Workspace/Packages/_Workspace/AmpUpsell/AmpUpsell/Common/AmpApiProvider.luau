local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FetchModule = require(Parent.Fetch)
local PromiseModule = require(Parent.Promise)
local FetchFunction = FetchModule.fetch
local Response = FetchModule.Response
local AccessResponseEnum = require(AmpUpsell.Common.Enums).AccessResponseEnum
local _ = require(AmpUpsell.Common.Types)
local GqlFunction = require(Parent.ApolloClient).gql
local Base64 = require(Parent.AuthCommon).Utils.Base64
local GetFFlagAmpGqlPassSuccessfulActionsModule = require(AmpUpsell.Flags.GetFFlagAmpGqlPassSuccessfulActions)
local FFlagAllowAmpV2FeatureAccessCall = require(Parent.SharedFlags).FFlagAllowAmpV2FeatureAccessCall
local NewUrlBuilder = UrlBuilder.new({
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
local NewUrlBuilder1 = UrlBuilder.new({
	path = "access-management/v1/feature-access",
	base = UrlBase.APIS,
	query = if FFlagAllowAmpV2FeatureAccessCall then {
		featureNames = "{featureNames}",
		nameSpace = "{nameSpace}"
	} else { featureNames = "{featureNames}" }
})

local function _(FeatureName, List, NameSpace, ExtraParameters) --[[ Line: 54 | Named "getUpsellFeatureAccessFromFeatureName" ]]
	-- upvalues: FetchFunction (copy), PromiseModule (copy), NewUrlBuilder (copy), Response (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 61 ]]
		-- upvalues: List (copy), NewUrlBuilder (upval), FeatureName (copy), NameSpace (copy), ExtraParameters (copy), FetchFunction (copy), Response (upval)
		local v1 = FetchFunction(NewUrlBuilder({
			featureName = FeatureName,
			successfulActions = table.concat(List, ","),
			nameSpace = NameSpace,
			extraParameters = ExtraParameters
		}), { method = "GET" }):catch(function() --[[ Line: 70 ]]
			-- upvalues: Response (upval)
			return Response.error()
		end):expect()
		
		if v1.status == 304 then
			Callback("Got Response: 304")
			
			return
		end
		if not v1.ok then
			Callback("Failed to find upsell feature access values")
			
			return
		end
		local v2 = v1:json():catch(function() --[[ Line: 88 ]]
			return nil
		end):expect()
		
		if v2 then
			Callback1({
				access = v2.access,
				recourse = v2.recourse,
				recourses = v2.recourses,
				shouldPrompt = v2.shouldPrompt
			})
			
			return
		else
			Callback("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
		end
	end)
end

return {
	upsellFeatureAccess = function(FeatureName, List, NameSpace, Input) --[[ Line: 107 ]]
		-- upvalues: Base64 (copy), HttpService (copy), FetchFunction (copy), PromiseModule (copy), NewUrlBuilder (copy), Response (copy), AccessResponseEnum (copy)
		local EncodeResult = if Input then Base64.Encode(HttpService:JSONEncode(Input)) else nil
		
		return (PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 61 ]]
			-- upvalues: List (copy), NewUrlBuilder (upval), FeatureName (copy), NameSpace (copy), EncodeResult (copy), FetchFunction (copy), Response (upval)
			local v1 = FetchFunction(NewUrlBuilder({
				featureName = FeatureName,
				successfulActions = table.concat(List, ","),
				nameSpace = NameSpace,
				extraParameters = EncodeResult
			}), { method = "GET" }):catch(function() --[[ Line: 70 ]]
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if v1.status == 304 then
				Callback("Got Response: 304")
				
				return
			end
			if not v1.ok then
				Callback("Failed to find upsell feature access values")
				
				return
			end
			local v2 = v1:json():catch(function() --[[ Line: 88 ]]
				return nil
			end):expect()
			
			if v2 then
				Callback1({
					access = v2.access,
					recourse = v2.recourse,
					recourses = v2.recourses,
					shouldPrompt = v2.shouldPrompt
				})
				
				return
			else
				Callback("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
			end
		end):catch(function(_) --[[ Line: 117 ]]
			-- upvalues: AccessResponseEnum (upval)
			return { access = AccessResponseEnum.Error }
		end):expect())
	end,
	upsellFeatureAccessGql = function(p1, FeatureName, p2, NameSpace, Input) --[[ Line: 189 ]]
		-- upvalues: GqlFunction (copy), Base64 (copy), HttpService (copy), GetFFlagAmpGqlPassSuccessfulActionsModule (copy), AccessResponseEnum (copy)
		local v1 = p1:query({
			fetchPolicy = "network-only",
			query = GqlFunction(require(script.Parent.GetUpsellFeatureAccess)),
			variables = {
				featureName = FeatureName,
				successfulActions = if GetFFlagAmpGqlPassSuccessfulActionsModule() then p2 else {},
				nameSpace = NameSpace,
				extraParameters = if Input then Base64.Encode(HttpService:JSONEncode(Input)) else nil
			}
		}):catch(function(_) --[[ Line: 211 ]]
			-- upvalues: AccessResponseEnum (upval)
			return { access = AccessResponseEnum.Error }
		end):expect()
		
		return if v1.data and v1.data.getUpsellFeatureAccess.featureAccess then v1.data.getUpsellFeatureAccess.featureAccess else { access = AccessResponseEnum.Error }
	end,
	getFeatureAccess = function(List, p1) --[[ Line: 126 ]]
		-- upvalues: FetchFunction (copy), PromiseModule (copy), FFlagAllowAmpV2FeatureAccessCall (copy), NewUrlBuilder1 (copy), Response (copy), AccessResponseEnum (copy)
		return (PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 128 ]]
			-- upvalues: List (copy), FFlagAllowAmpV2FeatureAccessCall (upval), NewUrlBuilder1 (upval), p1 (copy), FetchFunction (copy), Response (upval)
			local Joined = table.concat(List, ",")
			local v1 = FetchFunction(if FFlagAllowAmpV2FeatureAccessCall then NewUrlBuilder1({ featureNames = Joined, nameSpace = if p1 then p1 else "" }) else NewUrlBuilder1({ featureNames = Joined }), { method = "GET" }):catch(function() --[[ Line: 140 ]]
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if v1.status == 304 then
				Callback("Got Response: 304")
				
				return
			end
			if not v1.ok then
				Callback("Failed to find get feature access values")
				
				return
			end
			local v2 = v1:json():catch(function() --[[ Line: 158 ]]
				return nil
			end):expect()
			
			if not v2 then
				Callback("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")
				
				return
			end
			local FeatureAccessList = {}
			
			for _, feature in v2.features do
				table.insert(FeatureAccessList, { feature = feature.featureName, access = feature.access })
			end
			Callback1({ featureAccessList = FeatureAccessList })
		end):catch(function(_) --[[ Line: 181 ]]
			-- upvalues: AccessResponseEnum (upval)
			return { access = AccessResponseEnum.Error }
		end):expect())
	end
}