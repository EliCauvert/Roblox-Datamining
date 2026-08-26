local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local roactUtilsModule = require(virtualEvents.Parent.RoactUtils)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local getDeepValue = require(virtualEvents.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref), getDeepValue (ref), useLocalization (ref)
	local var1 = useSelector(function(p2)
		-- upvalues: getDeepValue (copy), p1 (ref)
		local var2 = getDeepValue(p2, "GameVotes." .. p0 .. ".upVotes")
		local var3 = getDeepValue(p2, "GameVotes." .. p0 .. ".downVotes")
		
		return if var2 and var3 then math.round(100 * var2 / (var2 + var3)) else nil
	end)
	
	if var1 ~= var1 or not var1 then
		local var2 = useSelector(function(p2)
			-- upvalues: p1 (ref)
			return p2.AgeRecommendations and p2.AgeRecommendations[p1]
		end)
		local ageRecommendation = var2 and (var2.summary and var2.summary.ageRecommendation)
		
		return ageRecommendation and ageRecommendation.displayNameWithHeaderShort
	end
	return useLocalization({
		ratingPercentage = {
			"Feature.VirtualEvents.Label.Rating",
			rating = tostring(var1)
		}
	}).ratingPercentage
end