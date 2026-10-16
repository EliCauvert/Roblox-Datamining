local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local GetFFlagUGCValidateCheckDescendantIdsLoadableModule = require(Parent.flags.getFFlagUGCValidateCheckDescendantIdsLoadable)
local GetFFlagUGCValidateVersionedContentIdsModule = require(Parent.flags.getFFlagUGCValidateVersionedContentIds)

local function _(p1, p2): boolean --[[ Line: 14 | Named "hasEditableBacking" ]]
	-- upvalues: ConstantsModule (copy)
	local CONTENTIDEDITABLEPROPERTYEntry = ConstantsModule.CONTENT_ID_EDITABLE_PROPERTY[p1.ClassName]
	local CONTENTIDEDITABLEPROPERTYEntry1 = CONTENTIDEDITABLEPROPERTYEntry and CONTENTIDEDITABLEPROPERTYEntry[p2]
	
	return if CONTENTIDEDITABLEPROPERTYEntry1 then p1[CONTENTIDEDITABLEPROPERTYEntry1].SourceType == Enum.ContentSourceType.Object else false
end

local _ = function(p1) --[[ Line: 23 | Named "canLoadAsset" ]]
	-- upvalues: UGCValidationService (copy)
	local Success, Result = pcall(function() --[[ Line: 24 ]]
		-- upvalues: UGCValidationService (upval), p1 (copy)
		return UGCValidationService:CanLoadAsset(p1)
	end)
	
	return Success and Result
end

local function reportUnloadable(p1, IsValidationEnvMatch, AssetId, p2) --[[ Line: 30 ]]
	-- upvalues: ErrorSourceStringsModule (copy)
	if IsValidationEnvMatch then
		p1:fetchError(string.format("Failed to load asset referenced by %s.%s. Make sure the asset exists and try again.", p2.instance:GetFullName(), p2.fieldName))
		
		return
	else
		p1:fail(ErrorSourceStringsModule.Keys.AssetDoesNotExist, {
			AssetId = AssetId,
			InstancePath = p2.instance:GetFullName()
		})
	end
end

return {
	categories = ConstantsModule.AllAssetUploadCategories,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.contentIds
	},
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 63 ]]
		-- upvalues: ValidationEnumsModule (copy), ConstantsModule (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateVersionedContentIdsModule (copy), GetFFlagUGCValidateCheckDescendantIdsLoadableModule (copy), ParseContentIdsModule (copy), UGCValidationService (copy), reportUnloadable (copy)
		local IsConsumerEnvMatch = p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC
		local t = {}
		
		for _, contentId in p2.contentIds do
			for _, value in contentId do
				local Entry = t[value.instance]
				
				if not Entry then
					Entry = {}
					t[value.instance] = Entry
				end
				Entry[value.fieldName] = true
			end
		end
		local Descendants = p2.rootInstance:GetDescendants()
		table.insert(Descendants, p2.rootInstance)
		
		for _, descendant in Descendants do
			local CONTENTIDFIELD = ConstantsModule.CONTENT_ID_FIELDS[descendant.ClassName]
			
			if CONTENTIDFIELD then
				local CONTENTIDREQUIREDFIELD = ConstantsModule.CONTENT_ID_REQUIRED_FIELDS[descendant.ClassName]
				local Entry = t[descendant]
				
				for _, FieldName in CONTENTIDFIELD do
					local IsCONTENTIDREQUIREDFIELDEntry: boolean = CONTENTIDREQUIREDFIELD ~= nil and CONTENTIDREQUIREDFIELD[FieldName] == true
					
					if descendant[FieldName] == "" then
						if IsCONTENTIDREQUIREDFIELDEntry then
							if IsConsumerEnvMatch then
								local CONTENTIDEDITABLEPROPERTYEntry = ConstantsModule.CONTENT_ID_EDITABLE_PROPERTY[descendant.ClassName]
								local CONTENTIDEDITABLEPROPERTYEntry1 = CONTENTIDEDITABLEPROPERTYEntry and CONTENTIDEDITABLEPROPERTYEntry[FieldName]
								
								if if CONTENTIDEDITABLEPROPERTYEntry1 then descendant[CONTENTIDEDITABLEPROPERTYEntry1].SourceType == Enum.ContentSourceType.Object else false then
									continue
								end
							end
							p1:fail(ErrorSourceStringsModule.Keys.DescendantIdMissing, {
								InstanceFullName = descendant:GetFullName(),
								FieldName = FieldName
							})
						end
					elseif not Entry or not Entry[FieldName] then
						p1:fail(ErrorSourceStringsModule.Keys.DescendantIdMalformed, {
							InstanceFullName = descendant:GetFullName(),
							FieldName = FieldName
						})
					end
				end
				local CONTENTFIELDSWITHOUTCONTENTIDEntry = ConstantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[descendant.ClassName]
				
				if CONTENTFIELDSWITHOUTCONTENTIDEntry then
					for _, FieldName1 in CONTENTFIELDSWITHOUTCONTENTIDEntry do
						local DescendantEntry = descendant[FieldName1]
						
						if DescendantEntry.SourceType == Enum.ContentSourceType.Uri and DescendantEntry.Uri ~= "" and (not Entry or not Entry[FieldName1]) then
							p1:fail(ErrorSourceStringsModule.Keys.DescendantIdMalformed, {
								InstanceFullName = descendant:GetFullName(),
								FieldName = FieldName1
							})
						end
					end
				end
			end
		end
		if GetFFlagUGCValidateVersionedContentIdsModule() then
			for AssetId, contentId1 in p2.contentIds do
				for _, value1 in contentId1 do
					if value1.version ~= nil then
						local config = {
							InstanceFullName = value1.instance:GetFullName(),
							FieldName = value1.fieldName,
							Version = tostring(value1.version),
							AssetId = AssetId
						}
						
						if value1.fieldName == "AnimationId" then
							p1:fail(ErrorSourceStringsModule.Keys.DescendantIdAnimationVersionNotSupported, config)
						elseif value1.version ~= 1 then
							p1:fail(ErrorSourceStringsModule.Keys.DescendantIdVersionNotSupported, config)
						end
					end
				end
			end
		end
		local IsValidationEnvMatch = p2.consumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend
		
		if IsValidationEnvMatch or GetFFlagUGCValidateCheckDescendantIdsLoadableModule() then
			if GetFFlagUGCValidateVersionedContentIdsModule() then
				for _, value2 in ParseContentIdsModule.getDistinctReferences(p2.contentIds) do
					local Uri = value2.uri
					local Success, Result = pcall(function() --[[ Line: 24 ]]
						-- upvalues: UGCValidationService (upval), Uri (copy)
						return UGCValidationService:CanLoadAsset(Uri)
					end)
					
					if not Success or not Result then
						reportUnloadable(p1, IsValidationEnvMatch, value2.key, value2.entry)
					end
				end
				return
			else
				for i, contentId2 in p2.contentIds do
					local Text = "rbxassetid://" .. i
					local Success1, Result1 = pcall(function() --[[ Line: 24 ]]
						-- upvalues: UGCValidationService (upval), Text (copy)
						return UGCValidationService:CanLoadAsset(Text)
					end)
					
					if not Success1 or not Result1 then
						reportUnloadable(p1, IsValidationEnvMatch, i, contentId2[1])
					end
				end
			end
		end
	end
}