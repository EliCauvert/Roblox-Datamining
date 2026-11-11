local Parent = script:FindFirstAncestor("GameDetailRodux").Parent
local DashModule = require(Parent.Dash)
local TModule = require(Parent.t)
local ResultModule = require(Parent.Result)
local AgeRecommendationDetailsModule = {
	new = function()
		return {}
	end,
	validateModel = TModule.interface({
		summary = TModule.interface({
			ageRecommendation = TModule.optional(TModule.interface({
				displayName = TModule.optional(TModule.string),
				displayNameWithHeaderShort = TModule.optional(TModule.string),
				minimumAge = TModule.number,
				minimumAgeDisplay = TModule.optional(TModule.string),
				contentMaturity = TModule.optional(TModule.string),
				igrsRating = TModule.optional(TModule.string),
				igrsRatingDisplayMessage = TModule.optional(TModule.string)
			}))
		}),
		descriptorUsages = TModule.optional(TModule.array(TModule.interface({
			name = TModule.optional(TModule.string),
			followsComplianceApi = TModule.optional(TModule.boolean),
			descriptor = TModule.interface({
				name = TModule.string,
				displayName = TModule.string,
				complianceApiSupported = TModule.boolean,
				iconUrl = TModule.optional(TModule.string),
				localeCode = TModule.optional(TModule.string)
			}),
			descriptorDimensionUsages = TModule.optional(TModule.array(TModule.interface({
				dimensionName = TModule.optional(TModule.string),
				dimensionValue = TModule.optional(TModule.string)
			})))
		})))
	})
}

function AgeRecommendationDetailsModule.mock(p1)
	-- upvalues: AgeRecommendationDetailsModule (copy), DashModule (copy)
	local P0 = p1 or {}
	local NewAgeRecommendationDetails = AgeRecommendationDetailsModule.new()
	NewAgeRecommendationDetails.summary = {
		ageRecommendation = { displayName = "13+", minimumAge = 13 }
	}
	NewAgeRecommendationDetails.descriptorUsages = {
		[1] = {
			name = "blood",
			descriptor = {
				complianceApiSupported = false,
				displayName = "Blood",
				iconUrl = "https://images.rbxcdn.com/blood-icon.svg",
				name = "blood"
			},
			descriptorDimensionUsages = {
				[1] = {
					dimensionName = "realism",
					dimensionValue = "unrealistic"
				},
				[2] = { dimensionName = "blood-level", dimensionValue = "heavy" }
			}
		},
		[2] = {
			name = "violence",
			descriptor = {
				complianceApiSupported = false,
				displayName = "Violence",
				iconUrl = "https://images.rbxcdn.com/violence-icon.svg",
				name = "violence"
			},
			descriptorDimensionUsages = {
				[1] = { dimensionName = "intensity", dimensionValue = "mild" },
				[2] = {
					dimensionName = "frequency",
					dimensionValue = "infrequent"
				}
			}
		}
	}
	local JoinDeepResult = DashModule.joinDeep(NewAgeRecommendationDetails, P0)
	
	return if AgeRecommendationDetailsModule.validateModel(JoinDeepResult) then JoinDeepResult else error("AgeRecommendationDetails mockData is invalid")
end

function AgeRecommendationDetailsModule.fromJsonData(p1)
	-- upvalues: AgeRecommendationDetailsModule (copy), ResultModule (copy), DashModule (copy)
	return if AgeRecommendationDetailsModule.validateModel(p1) then ResultModule.success((DashModule.joinDeep(AgeRecommendationDetailsModule.new(), p1))) else ResultModule.error("AgeRecommendationDetails.fromJsonData expects a valid moderation JSON response")
end

return AgeRecommendationDetailsModule