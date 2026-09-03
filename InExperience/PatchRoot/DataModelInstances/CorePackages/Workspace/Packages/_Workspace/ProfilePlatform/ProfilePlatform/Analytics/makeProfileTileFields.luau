local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.DataHydration.MomentsStoreTypes)

local function buildTileFields(p1, p2, p3, p4, p5)
	-- upvalues: momentsCommonModule (ref)
	local recommendationMetadata = p1.recommendationMetadata
	local var1 = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId
	
	if var1 == nil or var1 == "" then
		momentsCommonModule.Analytics.reportMomentSkip("tile", if var1 == nil then "nil" else "empty", { entry = "profile", parentEntity = p3 })
		
		return nil
	end
	local t = {
		surface = "profile",
		parentEntity = p3,
		surfaceId = p2,
		feedItemId = var1,
		tileIndex = tostring(p4)
	}
	
	if p5 ~= nil then
		t.interactionType = p5
	end
	return t
end

return {
	INTERACTION_OPEN = "open",
	makeProfileTileImpressionFields = function(p1, p2, p3, p4)
		-- upvalues: buildTileFields (ref)
		return buildTileFields(p1, p2, p3, p4, nil)
	end,
	makeProfileTileInteractionFields = function(p1, p2, p3, p4)
		-- upvalues: buildTileFields (ref)
		return buildTileFields(p1, p2, p3, p4, "open")
	end
}