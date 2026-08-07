local fFlagLuaAppAddIgrsImages = require(script:FindFirstAncestor("DiscoveryTypes").Parent.SharedFlags).FFlagLuaAppAddIgrsImages

return {
	IgrsThirteenPlus = "IGRS_RATING_THIRTEEN_PLUS",
	IgrsFifteenPlus = "IGRS_RATING_FIFTEEN_PLUS",
	IgrsEighteenPlus = "IGRS_RATING_EIGHTEEN_PLUS",
	IgrsUnrated = "IGRS_RATING_UNRATED",
	IgrsThreePlus = if fFlagLuaAppAddIgrsImages then "IGRS_RATING_THREE_PLUS" else nil,
	IgrsSevenPlus = if fFlagLuaAppAddIgrsImages then "IGRS_RATING_SEVEN_PLUS" else nil
}