local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local parent = gameDetailRodux.Parent
local logging = require(parent.AppCommonLib).Logging
local promiseModule = require(parent.Promise)
local ageRecommendationDetailsModule = require(gameDetailRodux.AgeRecommendations.AgeRecommendationDetails)
local performFetch = require(parent.Http).PerformFetch
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local setAgeRecommendationModule = require(gameDetailRodux.AgeRecommendations.SetAgeRecommendation)
local setAgeRecommendationHeadersModule = require(gameDetailRodux.AgeRecommendations.SetAgeRecommendationHeaders)
local getAgeRecommendationModule = require(gameDetailRodux.AgeRecommendations.GetAgeRecommendation)

local function _(p0)
	return "luaapp.experience_guidelines.get-age-guidelines" .. p0
end

return {
	Fetch = function(p1, p2)
		-- upvalues: performFetch (ref), getAgeRecommendationModule (ref), ageRecommendationDetailsModule (ref), logging (ref), promiseModule (ref), setAgeRecommendationModule (ref), setAgeRecommendationHeadersModule (ref), setNetworkingErrorToast (ref)
		return performFetch.Single("luaapp.experience_guidelines.get-age-guidelines" .. p2, function(p3)
			-- upvalues: getAgeRecommendationModule (copy), p1 (ref), p2 (ref), ageRecommendationDetailsModule (copy), logging (copy), promiseModule (copy), setAgeRecommendationModule (copy), setAgeRecommendationHeadersModule (copy), setNetworkingErrorToast (copy)
			return getAgeRecommendationModule(p1, p2):andThen(function(p4)
				-- upvalues: ageRecommendationDetailsModule (copy), logging (copy), p2 (copy), promiseModule (copy), p3 (ref), setAgeRecommendationModule (copy), setAgeRecommendationHeadersModule (copy)
				local responseBody = p4.responseBody
				
				if responseBody == nil then
					logging.warn("Response from GetAgeRecommendation is malformed!")
					
					return promiseModule.reject({ HttpError = Enum.HttpError.OK })
				end
				local var6, var7 = ageRecommendationDetailsModule.fromJsonData(responseBody.ageRecommendationDetails):unwrap()
				
				if var6 == false then
					logging.warn("Failed to parse AgeRecommendationDetails for `" .. p2 .. "`")
					
					return promiseModule.reject(p4)
				end
				p3:dispatch(setAgeRecommendationModule(p2, var7))
				p3:dispatch(setAgeRecommendationHeadersModule(responseBody.headerDisplayName, responseBody.headerDisplayNameShort))
				
				return promiseModule.resolve(p4)
			end, function(p5)
				-- upvalues: p3 (ref), setNetworkingErrorToast (copy), promiseModule (copy)
				p3:dispatch(setNetworkingErrorToast(p5))
				
				return promiseModule.reject(p5)
			end)
		end)
	end,
	GetFetchingStatus = function(p6, p7)
		-- upvalues: performFetch (ref)
		return performFetch.GetStatus(p6, "luaapp.experience_guidelines.get-age-guidelines" .. p7)
	end
}