local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local _ = require(Parent.util.Types)
local GetFFlagUGCValidateVersionedContentIdsModule = require(Parent.flags.getFFlagUGCValidateVersionedContentIds)

return {
	getData = function(p1)
		-- upvalues: ConstantsModule (copy), GetFFlagUGCValidateVersionedContentIdsModule (copy), ParseContentIdsModule (copy)
		local RootInstance = p1.rootInstance
		local t = {}
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, descendant in Descendants do
			local CONTENTIDFIELD = ConstantsModule.CONTENT_ID_FIELDS[descendant.ClassName]
			
			if CONTENTIDFIELD then
				for _, FieldName in CONTENTIDFIELD do
					local DescendantEntry = descendant[FieldName]
					
					if DescendantEntry ~= "" then
						local Version = nil
						local TryParseContentIdResult = nil
						
						if GetFFlagUGCValidateVersionedContentIdsModule() then
							TryParseContentIdResult, Version = ParseContentIdsModule.tryParseContentId(DescendantEntry)
						else
							TryParseContentIdResult = ParseContentIdsModule.tryGetAssetIdFromContentId(DescendantEntry)
						end
						if TryParseContentIdResult ~= nil then
							if t[TryParseContentIdResult] == nil then
								t[TryParseContentIdResult] = {}
							end
							table.insert(t[TryParseContentIdResult], {
								fieldName = FieldName,
								instance = descendant,
								version = Version
							})
						end
					end
				end
				local CONTENTFIELDSWITHOUTCONTENTIDEntry = ConstantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[descendant.ClassName]
				
				if CONTENTFIELDSWITHOUTCONTENTIDEntry then
					for _, FieldName1 in CONTENTFIELDSWITHOUTCONTENTIDEntry do
						local DescendantEntry = descendant[FieldName1]
						
						if DescendantEntry.SourceType == Enum.ContentSourceType.Uri then
							local Version = nil
							local TryParseContentIdResult1 = nil
							
							if GetFFlagUGCValidateVersionedContentIdsModule() then
								TryParseContentIdResult1, Version = ParseContentIdsModule.tryParseContentId(DescendantEntry.Uri)
							else
								TryParseContentIdResult1 = ParseContentIdsModule.tryGetAssetIdFromContentId(DescendantEntry.Uri)
							end
							if TryParseContentIdResult1 ~= nil then
								if t[TryParseContentIdResult1] == nil then
									t[TryParseContentIdResult1] = {}
								end
								table.insert(t[TryParseContentIdResult1], {
									fieldName = FieldName1,
									instance = descendant,
									version = Version
								})
							end
						end
					end
				end
			end
		end
		return t
	end
}