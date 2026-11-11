local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local GetFFlagUGCValidateCheckDescendantIdsLoadableModule = require(Parent.flags.getFFlagUGCValidateCheckDescendantIdsLoadable)
local GetFFlagUGCValidateAllowEmissivesModule = require(Parent.flags.getFFlagUGCValidateAllowEmissives)

local function _(p1, p2): boolean
	-- upvalues: ConstantsModule (copy)
	local CONTENTIDEDITABLEPROPERTYEntry = ConstantsModule.CONTENT_ID_EDITABLE_PROPERTY[p1.ClassName]
	local CONTENTIDEDITABLEPROPERTYEntry1 = CONTENTIDEDITABLEPROPERTYEntry and CONTENTIDEDITABLEPROPERTYEntry[p2]
	
	return if CONTENTIDEDITABLEPROPERTYEntry1 then p1[CONTENTIDEDITABLEPROPERTYEntry1].SourceType == Enum.ContentSourceType.Object else false
end

return {
	categories = ConstantsModule.AllAssetUploadCategories,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.contentIds
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), ConstantsModule (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateAllowEmissivesModule (copy), GetFFlagUGCValidateCheckDescendantIdsLoadableModule (copy), UGCValidationService (copy)
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
				if GetFFlagUGCValidateAllowEmissivesModule() then
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
		end
		local IsConsumerEnvMatch1 = p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend
		
		if IsConsumerEnvMatch1 or GetFFlagUGCValidateCheckDescendantIdsLoadableModule() then
			for AssetId, contentId1 in p2.contentIds do
				local v1 = contentId1[1]
				local Success, Result = pcall(function()
					-- upvalues: UGCValidationService (upval), AssetId (copy)
					return UGCValidationService:CanLoadAsset("rbxassetid://" .. AssetId)
				end)
				
				if not Success or not Result then
					if IsConsumerEnvMatch1 then
						p1:fetchError(string.format("Failed to load asset referenced by %s.%s. Make sure the asset exists and try again.", v1.instance:GetFullName(), v1.fieldName))
					else
						p1:fail(ErrorSourceStringsModule.Keys.AssetDoesNotExist, {
							AssetId = AssetId,
							InstancePath = v1.instance:GetFullName()
						})
					end
				end
			end
		end
	end
}