local UnifiedEventLogConstants = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceAnalytics).UnifiedEventLogConstants

local function _(p1, Text)
	-- upvalues: UnifiedEventLogConstants (copy)
	local v1 = p1[UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. Text]
	
	return if type(v1) == "number" then v1 else nil
end

return function(List, p1, p2)
	-- upvalues: UnifiedEventLogConstants (copy)
	local ATTRIBUTEPREFIX = UnifiedEventLogConstants.ATTRIBUTE_PREFIX
	local Text = ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_ID
	local Text1 = ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_TYPE
	
	for _, value in List do
		if tostring(value[Text]) == tostring(p1) and tostring(value[Text1]) == tostring(p2) then
			local Entry = value[UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. UnifiedEventLogConstants.FIELD_GRID_POSITION_ROW]
			local Entry1 = value[UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. UnifiedEventLogConstants.FIELD_GRID_POSITION_COLUMN]
			local Entry2 = if type(Entry1) == "number" then Entry1 else nil
			local Entry3 = value[UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. UnifiedEventLogConstants.FIELD_ELEMENT_SIZE_HEIGHT]
			local Entry4 = if type(Entry3) == "number" then Entry3 else nil
			local Entry5 = value[UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. UnifiedEventLogConstants.FIELD_ELEMENT_SIZE_WIDTH]
			local Entry6 = if type(Entry5) == "number" then Entry5 else nil
			local Entry7 = value[UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. UnifiedEventLogConstants.FIELD_SCREEN_SIZE_HEIGHT]
			local Entry8 = if type(Entry7) == "number" then Entry7 else nil
			local Entry9 = value[UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. UnifiedEventLogConstants.FIELD_SCREEN_SIZE_WIDTH]
			
			return {
				gridPositionRow = if type(Entry) == "number" then Entry else nil,
				gridPositionColumn = Entry2,
				elementSizeHeight = Entry4,
				elementSizeWidth = Entry6,
				screenSizeHeight = Entry8,
				screenSizeWidth = if type(Entry9) == "number" then Entry9 else nil
			}
		end
	end
	return {}
end