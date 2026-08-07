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

return function(p0, p1, p2) --[[ line: 25 ]]
	-- upvalues: collectionService (ref), unifiedEventLogConstantsModule (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), t (ref)
	if not p0.current then return end
	collectionService:AddTag(p0.current, unifiedEventLogConstantsModule.TAG_NAME)
	
	if p2 and p2.hasDeferredActions then
		p0.current:SetAttribute(unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION, true)
	end
	if fFlagAXMISEnableMultiShoppingUnifiedEvents and p2 and p2.isSelected ~= nil then
		p0.current:SetAttribute(unifiedEventLogConstantsModule.IS_SELECTED, p2.isSelected)
	end
	if p2 and p2.sessionTagName then
		p0.current:SetAttribute(unifiedEventLogConstantsModule.SESSION_TAG_NAME, p2.sessionTagName)
	end
	if fFlagAXUnifiedImpressionsOnThumbnail and p2 and p2.skipImpressionDetection then
		p0.current:SetAttribute(unifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION, true)
	end
	if p1 then
		for i, v in p1 do
			if t[type(p1[i])] then
				p0.current:SetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i, if type(p1[i]) == "table" then table.concat(p1[i], ",") else p1[i])
			end
		end
	end
end