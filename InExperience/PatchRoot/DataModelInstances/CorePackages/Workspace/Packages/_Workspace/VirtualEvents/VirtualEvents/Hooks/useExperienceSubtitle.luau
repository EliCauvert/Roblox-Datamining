local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local roactUtilsModule = require(virtualEvents.Parent.RoactUtils)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local getDeepValue = require(virtualEvents.Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

return function(p0)
	-- upvalues: useSelector (ref), getDeepValue (ref), useLocalization (ref)
	local var2 = useSelector(function(p1)
		-- upvalues: getDeepValue (copy), p0 (ref)
		local var5 = getDeepValue(p1, "GameVotes." .. p0 .. ".upVotes")
		local var6 = getDeepValue(p1, "GameVotes." .. p0 .. ".downVotes")
		
		return if var5 and var6 then math.round(100 * var5 / (var5 + var6)) else nil
	end)
	
	if var2 ~= var2 or not var2 then
		local var3 = useSelector(function(p2)
			-- upvalues: p0 (ref)
			return p2.AgeRecommendations and p2.AgeRecommendations[p0]
		end)
		local ageRecommendation = var3 and (var3.summary and var3.summary.ageRecommendation)
		
		return ageRecommendation and ageRecommendation.displayNameWithHeaderShort
	end
	return useLocalization({
		ratingPercentage = {
			"Feature.VirtualEvents.Label.Rating",
			rating = tostring(var2)
		}
	}).ratingPercentage
end