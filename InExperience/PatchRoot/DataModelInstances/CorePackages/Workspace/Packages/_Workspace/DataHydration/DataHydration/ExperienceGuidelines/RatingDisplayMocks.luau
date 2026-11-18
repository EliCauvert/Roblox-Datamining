local HttpService = game:GetService("HttpService")
local HttpClientModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

local function _(p1)
	local Body = p1.body
	assert(typeof(Body) == "string", "rating display mock expects a JSON string body")
	
	return Body
end

return {
	PEGI_7 = {
		sourceType = "RATING_SOURCE_TYPE_RA",
		source = "PEGI",
		rating = "PEGI 7",
		fullIconVariant = {
			contentId = "rbxassetid://0",
			widthPx = 64,
			heightPx = 78,
			aspectRatio = 0.82,
			contentSource = "CONTENT_SOURCE_ASSETS_REGISTRY"
		},
		minimizedIconVariant = {
			contentId = "rbxassetid://0",
			widthPx = 24,
			heightPx = 29,
			aspectRatio = 0.82,
			contentSource = "CONTENT_SOURCE_ASSETS_REGISTRY"
		},
		localizedDescriptorStrings = { "Mild Violence" },
		iarc = {
			raid = 2,
			ageId = 7,
			productId = "0-00000000",
			interactiveElementsStrings = { "In-Game Purchases" }
		}
	},
	CONTENT_MATURITY_MODERATE = {
		sourceType = "RATING_SOURCE_TYPE_CONTENT_MATURITY",
		source = "Roblox",
		rating = "Moderate",
		fullIconVariant = {
			contentId = "rbxassetid://0",
			widthPx = 64,
			heightPx = 64,
			aspectRatio = 1,
			contentSource = "CONTENT_SOURCE_ASSETS_REGISTRY"
		},
		minimizedIconVariant = {
			contentId = "rbxassetid://0",
			widthPx = 24,
			heightPx = 24,
			aspectRatio = 1,
			contentSource = "CONTENT_SOURCE_ASSETS_REGISTRY"
		},
		localizedDescriptorStrings = { "Moderate Violence" },
		contentMaturity = { creatorOverrides = "" }
	},
	createRatingDisplayMockNetwork = function(p1)
		-- upvalues: HttpService (copy), HttpClientModule (copy)
		local function _(UniverseId)
			-- upvalues: p1 (copy)
			local Tbl = p1[UniverseId]
			
			if Tbl == nil then
				return nil
			else
				local Copy = table.clone(Tbl)
				Copy.universeId = UniverseId
				
				return Copy
			end
		end
		
		return HttpClientModule.createMockNetwork({
			routes = {
				{
					pattern = "/v2beta1/batch-rating-display",
					respond = function(p2)
						-- upvalues: HttpService (upval), p1 (copy)
						local DisplayRating = {}
						local Body = p2.body
						assert(typeof(Body) == "string", "rating display mock expects a JSON string body")
						
						for _, universeId in HttpService:JSONDecode(Body).universeIds do
							local Tbl = p1[universeId]
							local v1 = nil
							
							if Tbl == nil then
								v1 = nil
							else
								local Copy = table.clone(Tbl)
								Copy.universeId = universeId
								v1 = Copy
							end
							if v1 then
								table.insert(DisplayRating, v1)
							end
						end
						return { displayRating = DisplayRating }
					end
				}
			}
		})
	end
}