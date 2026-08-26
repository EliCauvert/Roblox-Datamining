local collectionService = game:GetService("CollectionService")
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local avatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceFlags)
local fFlagAXMISEnableMultiShoppingUnifiedEvents = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local fFlagAXUnifiedImpressionsOnThumbnail = avatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail
local t = {
	table = true,
	string = true,
	number = true,
	boolean = true
}

return function(p1, p2, p3)
	-- upvalues: collectionService (ref), unifiedEventLogConstantsModule (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), t (ref)
	if not p1.current then return end
	collectionService:AddTag(p1.current, unifiedEventLogConstantsModule.TAG_NAME)
	
	if p3 and p3.hasDeferredActions then
		p1.current:SetAttribute(unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION, true)
	end
	if fFlagAXMISEnableMultiShoppingUnifiedEvents and p3 and p3.isSelected ~= nil then
		p1.current:SetAttribute(unifiedEventLogConstantsModule.IS_SELECTED, p3.isSelected)
	end
	if p3 and p3.sessionTagName then
		p1.current:SetAttribute(unifiedEventLogConstantsModule.SESSION_TAG_NAME, p3.sessionTagName)
	end
	if fFlagAXUnifiedImpressionsOnThumbnail and p3 and p3.skipImpressionDetection then
		p1.current:SetAttribute(unifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION, true)
	end
	if p2 then
		for i, v in p2 do
			if t[type(p2[i])] then
				p1.current:SetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i, if type(p2[i]) == "table" then table.concat(p2[i], ",") else p2[i])
			end
		end
	end
end