local CollectionService = game:GetService("CollectionService")
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local AvatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXSkipTapDetection = AvatarExperienceFlagsModule.FFlagAXSkipTapDetection
local FFlagAXUnifiedImpressionsOnThumbnail = AvatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail
local config = {
	table = true,
	string = true,
	number = true,
	boolean = true
}

return function(p1, List, p2)
	-- upvalues: CollectionService (copy), UnifiedEventLogConstantsModule (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), FFlagAXUnifiedImpressionsOnThumbnail (copy), FFlagAXSkipTapDetection (copy), config (copy)
	if not p1.current then return end
	CollectionService:AddTag(p1.current, UnifiedEventLogConstantsModule.TAG_NAME)
	
	if p2 and p2.hasDeferredActions then
		p1.current:SetAttribute(UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION, true)
	end
	if FFlagAXMISEnableMultiShoppingUnifiedEvents and p2 and p2.isSelected ~= nil then
		p1.current:SetAttribute(UnifiedEventLogConstantsModule.IS_SELECTED, p2.isSelected)
	end
	if p2 and p2.sessionTagName then
		p1.current:SetAttribute(UnifiedEventLogConstantsModule.SESSION_TAG_NAME, p2.sessionTagName)
	end
	if FFlagAXUnifiedImpressionsOnThumbnail and p2 and p2.skipImpressionDetection then
		p1.current:SetAttribute(UnifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION, true)
	end
	if FFlagAXSkipTapDetection then
		p1.current:SetAttribute(UnifiedEventLogConstantsModule.SKIP_TAP_DETECTION, if p2 and p2.skipTapDetection then true else nil)
	end
	if List then
		for i, _ in List do
			if config[type(List[i])] then
				p1.current:SetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i, if type(List[i]) == "table" then table.concat(List[i], ",") else List[i])
			end
		end
	end
end