local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local dashModule = require(parent.Dash)
local tModule = require(parent.t)
local resultModule = require(parent.Result)
local t = {
	new = function() --[[ line: 47 ]]
		return {}
	end,
	validateModel = tModule.interface({
		summary = tModule.interface({
			ageRecommendation = tModule.optional(tModule.interface({
				displayName = tModule.optional(tModule.string),
				displayNameWithHeaderShort = tModule.optional(tModule.string),
				minimumAge = tModule.number,
				minimumAgeDisplay = tModule.optional(tModule.string),
				contentMaturity = tModule.optional(tModule.string),
				igrsRating = tModule.optional(tModule.string),
				igrsRatingDisplayMessage = tModule.optional(tModule.string)
			}))
		}),
		descriptorUsages = tModule.optional(tModule.array(tModule.interface({
			name = tModule.optional(tModule.string),
			followsComplianceApi = tModule.optional(tModule.boolean),
			descriptor = tModule.interface({
				name = tModule.string,
				displayName = tModule.string,
				complianceApiSupported = tModule.boolean,
				iconUrl = tModule.optional(tModule.string),
				localeCode = tModule.optional(tModule.string)
			}),
			descriptorDimensionUsages = tModule.optional(tModule.array(tModule.interface({
				dimensionName = tModule.optional(tModule.string),
				dimensionValue = tModule.optional(tModule.string)
			})))
		})))
	})
}

function t.mock(p0) --[[ line: 80 ]]
	-- upvalues: t (ref), dashModule (ref)
	p0 = p0 or {}
	local var5 = t.new()
	var5.summary = {
		ageRecommendation = { displayName = "13+", minimumAge = 13 }
	}
	var5.descriptorUsages = {
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
	local var6 = dashModule.joinDeep(var5, p0)
	
	return if t.validateModel(var6) then var6 else error("AgeRecommendationDetails mockData is invalid")
end

function t.fromJsonData(p1) --[[ line: 140 ]]
	-- upvalues: t (ref), resultModule (ref), dashModule (ref)
	return if t.validateModel(p1) then resultModule.success(dashModule.joinDeep(t.new(), p1)) else resultModule.error("AgeRecommendationDetails.fromJsonData expects a valid moderation JSON response")
end

return t