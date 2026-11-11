local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local _ = require(Parent.util.Types)
local GetFFlagUGCValidateAllowEmissivesModule = require(Parent.flags.getFFlagUGCValidateAllowEmissives)

return {
	getData = function(p1)
		-- upvalues: ConstantsModule (copy), ParseContentIdsModule (copy), GetFFlagUGCValidateAllowEmissivesModule (copy)
		local RootInstance = p1.rootInstance
		local t = {}
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, descendant in Descendants do
			local CONTENTIDFIELD = ConstantsModule.CONTENT_ID_FIELDS[descendant.ClassName]
			
			if CONTENTIDFIELD then
				for _, FieldName in CONTENTIDFIELD do
					local DescendantEntry = descendant[FieldName]
					local IsDescendantEntryMatch = DescendantEntry == ""
					local TryGetAssetIdFromContentIdResult = nil
					
					if not IsDescendantEntryMatch then
						TryGetAssetIdFromContentIdResult = ParseContentIdsModule.tryGetAssetIdFromContentId(DescendantEntry)
						IsDescendantEntryMatch = TryGetAssetIdFromContentIdResult == nil
					end
					if not IsDescendantEntryMatch then
						if t[TryGetAssetIdFromContentIdResult] == nil then
							t[TryGetAssetIdFromContentIdResult] = {}
						end
						table.insert(t[TryGetAssetIdFromContentIdResult], { fieldName = FieldName, instance = descendant })
					end
				end
				if GetFFlagUGCValidateAllowEmissivesModule() then
					local CONTENTFIELDSWITHOUTCONTENTIDEntry = ConstantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[descendant.ClassName]
					
					if CONTENTFIELDSWITHOUTCONTENTIDEntry then
						for _, FieldName1 in CONTENTFIELDSWITHOUTCONTENTIDEntry do
							local DescendantEntry = descendant[FieldName1]
							
							if DescendantEntry.SourceType == Enum.ContentSourceType.Uri then
								local TryGetAssetIdFromContentIdResult = ParseContentIdsModule.tryGetAssetIdFromContentId(DescendantEntry.Uri)
								
								if TryGetAssetIdFromContentIdResult ~= nil then
									if t[TryGetAssetIdFromContentIdResult] == nil then
										t[TryGetAssetIdFromContentIdResult] = {}
									end
									table.insert(t[TryGetAssetIdFromContentIdResult], { fieldName = FieldName1, instance = descendant })
								end
							end
						end
					end
				end
			end
		end
		return t
	end
}