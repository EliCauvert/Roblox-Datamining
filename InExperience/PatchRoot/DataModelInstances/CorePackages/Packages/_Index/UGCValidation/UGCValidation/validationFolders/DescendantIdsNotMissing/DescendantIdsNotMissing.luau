local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateCheckDescendantIdsLoadableModule = require(parent.flags.getFFlagUGCValidateCheckDescendantIdsLoadable)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	local className = constantsModule.CONTENT_ID_EDITABLE_PROPERTY[p1.ClassName]
	local var1 = className and className[p2]
	
	return if var1 then p1[var1].SourceType == Enum.ContentSourceType.Object else false
end

return {
	categories = constantsModule.AllAssetUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.contentIds
	},
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), constantsModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), getFFlagUGCValidateCheckDescendantIdsLoadableModule (ref), UGCValidationService (ref)
		local var1 = p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
		local t = {}
		
		for i, v in p2.contentIds do
			for i_1, v_1 in v do
				local instance = t[v_1.instance]
				
				if not instance then
					instance = {}
					t[v_1.instance] = instance
				end
				instance[v_1.fieldName] = true
			end
		end
		local v_2, ok
		local descendants = p2.rootInstance:GetDescendants()
		table.insert(descendants, p2.rootInstance)
		
		for i_1, v_1 in descendants do
			v_2 = constantsModule.CONTENT_ID_FIELDS[v_1.ClassName]
			
			if v_2 then
				local v_4
				local className = constantsModule.CONTENT_ID_REQUIRED_FIELDS[v_1.ClassName]
				ok = t[v_1]
				
				for i_2, v_3 in v_2 do
					v_4 = v_1[v_3]
					local var2 = className ~= nil and className[v_3] == true
					
					if v_4 == "" then
						if var2 then
							if var1 then
								local className_1 = constantsModule.CONTENT_ID_EDITABLE_PROPERTY[v_1.ClassName]
								local var3 = className_1 and className_1[v_3]
								
								if not (if not var3 then false else v_1[var3].SourceType == Enum.ContentSourceType.Object) then
									p1:fail(errorSourceStringsModule.Keys.DescendantIdMissing, { InstanceFullName = v_1:GetFullName(), FieldName = v_3 })
								end
							end
						end
					elseif not ok or not ok[v_3] then
						p1:fail(errorSourceStringsModule.Keys.DescendantIdMalformed, { InstanceFullName = v_1:GetFullName(), FieldName = v_3 })
					end
				end
				if getFFlagUGCValidateAllowEmissivesModule() then
					local className_1 = constantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[v_1.ClassName]
					
					if className_1 then
						for v_3, v_4 in className_1 do
							local var4 = v_1[v_4]
							
							if var4.SourceType == Enum.ContentSourceType.Uri and var4.Uri ~= "" and (not ok or not ok[v_4]) then
								p1:fail(errorSourceStringsModule.Keys.DescendantIdMalformed, { InstanceFullName = v_1:GetFullName(), FieldName = v_4 })
							end
						end
					end
				end
			end
		end
		local var5 = p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
		
		if var5 or getFFlagUGCValidateCheckDescendantIdsLoadableModule() then
			for i_2, v_2 in p2.contentIds do
				local var6 = v_2[1]
				ok, status = pcall(function()
					-- upvalues: UGCValidationService (copy), i_2 (ref)
					return UGCValidationService:CanLoadAsset("rbxassetid://" .. i_2)
				end)
				
				if not ok or not status then
					if var5 then
						p1:fetchError(string.format("Failed to load asset referenced by %s.%s. Make sure the asset exists and try again.", var6.instance:GetFullName(), var6.fieldName))
					else
						p1:fail(errorSourceStringsModule.Keys.AssetDoesNotExist, {
							AssetId = i_2,
							InstancePath = var6.instance:GetFullName()
						})
					end
				end
			end
		end
	end
}