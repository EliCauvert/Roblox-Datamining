local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local Parent = GameDetailRodux.Parent
local Logging = require(Parent.AppCommonLib).Logging
local PromiseModule = require(Parent.Promise)
local AgeRecommendationDetailsModule = require(GameDetailRodux.AgeRecommendations.AgeRecommendationDetails)
local PerformFetch = require(Parent.Http).PerformFetch
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local SetAgeRecommendationModule = require(GameDetailRodux.AgeRecommendations.SetAgeRecommendation)
local SetAgeRecommendationHeadersModule = require(GameDetailRodux.AgeRecommendations.SetAgeRecommendationHeaders)
local GetAgeRecommendationModule = require(GameDetailRodux.AgeRecommendations.GetAgeRecommendation)

local function _(Text): string
	return "luaapp.experience_guidelines.get-age-guidelines" .. Text
end

return {
	Fetch = function(p1, Text)
		-- upvalues: PerformFetch (copy), GetAgeRecommendationModule (copy), AgeRecommendationDetailsModule (copy), Logging (copy), PromiseModule (copy), SetAgeRecommendationModule (copy), SetAgeRecommendationHeadersModule (copy), SetNetworkingErrorToastFunction (copy)
		return PerformFetch.Single("luaapp.experience_guidelines.get-age-guidelines" .. Text, function(p2)
			-- upvalues: GetAgeRecommendationModule (upval), p1 (copy), Text (copy), AgeRecommendationDetailsModule (upval), Logging (upval), PromiseModule (upval), SetAgeRecommendationModule (upval), SetAgeRecommendationHeadersModule (upval), SetNetworkingErrorToastFunction (upval)
			return GetAgeRecommendationModule(p1, Text):andThen(function(Result)
				-- upvalues: AgeRecommendationDetailsModule (upval), Logging (upval), Text (upval), PromiseModule (upval), p2 (copy), SetAgeRecommendationModule (upval), SetAgeRecommendationHeadersModule (upval)
				local ResponseBody = Result.responseBody
				
				if ResponseBody == nil then
					Logging.warn("Response from GetAgeRecommendation is malformed!")
					
					return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local UnwrapResult, UnwrapResult2 = AgeRecommendationDetailsModule.fromJsonData(ResponseBody.ageRecommendationDetails):unwrap()
				
				if UnwrapResult == false then
					Logging.warn("Failed to parse AgeRecommendationDetails for `" .. Text .. "`")
					
					return PromiseModule.reject(Result)
				else
					p2:dispatch(SetAgeRecommendationModule(Text, UnwrapResult2))
					p2:dispatch(SetAgeRecommendationHeadersModule(ResponseBody.headerDisplayName, ResponseBody.headerDisplayNameShort))
					
					return PromiseModule.resolve(Result)
				end
			end, function(p3)
				-- upvalues: p2 (copy), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
				p2:dispatch(SetNetworkingErrorToastFunction(p3))
				
				return PromiseModule.reject(p3)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.experience_guidelines.get-age-guidelines" .. Text)
	end
}