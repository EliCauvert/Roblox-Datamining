local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return {
	fetchBatchRatingDisplay = function(UniverseIds, p1)
		-- upvalues: FetchFunction (copy), UrlBase (copy), AsPromiseFunction (copy)
		local P1 = p1 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "experience-guidelines.rating-display.batch-get",
			network = P1.network,
			url = (P1.baseUrl or UrlBase.APIS) .. "/experience-guidelines-service/v2beta1/batch-rating-display",
			body = { universeIds = UniverseIds },
			decode = function(p2)
				-- upvalues: UniverseIds (copy)
				local t = {}
				
				for _, universeId in UniverseIds do
					t[tostring(universeId)] = {}
				end
				local DisplayRating = p2.displayRating or {}
				for _, DisplayRating1 in DisplayRating do
					local Text = tostring((tonumber(DisplayRating1.universeId)))
					
					if t[Text] ~= nil then
						t[Text] = { displayRating = DisplayRating1 }
					end
				end
				return t
			end
		})))
	end
}