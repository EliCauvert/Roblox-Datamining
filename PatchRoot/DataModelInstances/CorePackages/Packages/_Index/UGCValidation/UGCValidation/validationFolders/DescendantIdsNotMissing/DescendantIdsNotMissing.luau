-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:47 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateCheckDescendantIdsLoadableModule = require(parent.flags.getFFlagUGCValidateCheckDescendantIdsLoadable)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)

local function _(p0, p1) --[[ line: 14 | named "hasEditableBacking" ]]
	-- upvalues: constantsModule (ref)
	local className = constantsModule.CONTENT_ID_EDITABLE_PROPERTY[p0.ClassName]
	local var7 = className and className[p1]
	
	return if var7 then p0[var7].SourceType == Enum.ContentSourceType.Object else false
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
	run = function(p2, p3) --[[ line: 34 ]]
		-- upvalues: validationEnumsModule (ref), constantsModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateAllowEmissivesModule (ref), getFFlagUGCValidateCheckDescendantIdsLoadableModule (ref), UGCValidationService (ref)
		local var8 = p3.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
		local t = {}
		
		for i, v in p3.contentIds do
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
		local descendants = p3.rootInstance:GetDescendants()
		table.insert(descendants, p3.rootInstance)
		
		for i_1, v_1 in descendants do
			v_2 = constantsModule.CONTENT_ID_FIELDS[v_1.ClassName]
			
			if v_2 then
				local v_4
				local className = constantsModule.CONTENT_ID_REQUIRED_FIELDS[v_1.ClassName]
				ok = t[v_1]
				
				for i_2, v_3 in v_2 do
					v_4 = v_1[v_3]
					local var14 = className ~= nil and className[v_3] == true
					
					if v_4 == "" then
						if var14 then
							if var8 then
								local className_1 = constantsModule.CONTENT_ID_EDITABLE_PROPERTY[v_1.ClassName]
								local var15 = className_1 and className_1[v_3]
								
								if not (if not var15 then false else v_1[var15].SourceType == Enum.ContentSourceType.Object) then
									p2:fail(errorSourceStringsModule.Keys.DescendantIdMissing, { InstanceFullName = v_1:GetFullName(), FieldName = v_3 })
								end
							end
						end
					elseif not ok or not ok[v_3] then
						p2:fail(errorSourceStringsModule.Keys.DescendantIdMalformed, { InstanceFullName = v_1:GetFullName(), FieldName = v_3 })
					end
				end
				if getFFlagUGCValidateAllowEmissivesModule() then
					local className_1 = constantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[v_1.ClassName]
					
					if className_1 then
						for v_3, v_4 in className_1 do
							local var13 = v_1[v_4]
							
							if var13.SourceType == Enum.ContentSourceType.Uri and var13.Uri ~= "" and (not ok or not ok[v_4]) then
								p2:fail(errorSourceStringsModule.Keys.DescendantIdMalformed, { InstanceFullName = v_1:GetFullName(), FieldName = v_4 })
							end
						end
					end
				end
			end
		end
		local var11 = p3.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
		
		if var11 or getFFlagUGCValidateCheckDescendantIdsLoadableModule() then
			for i_2, v_2 in p3.contentIds do
				local var12 = v_2[1]
				ok, status = pcall(function() --[[ line: 112 ]]
					-- upvalues: UGCValidationService (copy), i_2 (ref)
					return UGCValidationService:CanLoadAsset("rbxassetid://" .. i_2)
				end)
				
				if not ok or not status then
					if var11 then
						p2:fetchError(string.format("Failed to load asset referenced by %s.%s. Make sure the asset exists and try again.", var12.instance:GetFullName(), var12.fieldName))
					else
						p2:fail(errorSourceStringsModule.Keys.AssetDoesNotExist, {
							AssetId = i_2,
							InstancePath = var12.instance:GetFullName()
						})
					end
				end
			end
		end
	end
}