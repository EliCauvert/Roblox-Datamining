local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local GetDeepValueFunction = require(VirtualEvents.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseSelectorFunction = require(VirtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GetDeepValueFunction (copy), UseLocalizationFunction (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), p1 (copy)
		local DeepValue: number = GetDeepValueFunction(p2, "GameVotes." .. p1 .. ".upVotes")
		local DeepValue1: number = GetDeepValueFunction(p2, "GameVotes." .. p1 .. ".downVotes")
		
		return if DeepValue and DeepValue1 then math.round(100 * DeepValue / (DeepValue + DeepValue1)) else nil
	end)
	
	if UseSelectorResult ~= UseSelectorResult or not UseSelectorResult then
		local UseSelectorResult1 = UseSelectorFunction(function(p2)
			-- upvalues: p1 (copy)
			return p2.AgeRecommendations and p2.AgeRecommendations[p1]
		end)
		local AgeRecommendation = UseSelectorResult1 and (UseSelectorResult1.summary and UseSelectorResult1.summary.ageRecommendation)
		
		return AgeRecommendation and AgeRecommendation.displayNameWithHeaderShort
	else
		return UseLocalizationFunction({
			ratingPercentage = {
				"Feature.VirtualEvents.Label.Rating",
				rating = tostring(UseSelectorResult)
			}
		}).ratingPercentage
	end
end