local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

local function buildTileFields(p0, p1, p2, p3, p4)
	-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (ref), momentsCommonModule (ref)
	if not getFFlagMomentsAnalyticsSchemaIdentity() then
		local t = { userId = p1 }
		local recommendationMetadata = p0.recommendationMetadata
		t.itemId = if recommendationMetadata == nil then "" else recommendationMetadata.feedItemId or ""
		t.gridIndex = tostring(p3)
		
		return t
	end
	local recommendationMetadata = p0.recommendationMetadata
	local var2 = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId
	
	if var2 == nil or var2 == "" then
		momentsCommonModule.Analytics.reportMomentSkip("tile", if var2 == nil then "nil" else "empty", { entry = "profile", parentEntity = p2 })
		
		return nil
	end
	local t = {
		surface = "profile",
		parentEntity = p2,
		surfaceId = p1,
		feedItemId = var2,
		tileIndex = tostring(p3)
	}
	
	if p4 ~= nil then
		t.interactionType = p4
	end
	return t
end

return {
	INTERACTION_OPEN = "open",
	getTileMomentId = function(p5)
		local recommendationMetadata = p5.recommendationMetadata
		
		return if recommendationMetadata == nil then "" else recommendationMetadata.feedItemId or ""
	end,
	makeProfileTileImpressionFields = function(p6, p7, p8, p9)
		-- upvalues: buildTileFields (ref)
		return buildTileFields(p6, p7, p8, p9, nil)
	end,
	makeProfileTileInteractionFields = function(p10, p11, p12, p13)
		-- upvalues: buildTileFields (ref)
		return buildTileFields(p10, p11, p12, p13, "open")
	end
}