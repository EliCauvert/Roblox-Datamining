local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagUGCValidateCheckDescendantIdsLoadableModule = require(parent.flags.getFFlagUGCValidateCheckDescendantIdsLoadable)
local getFFlagUGCValidateVersionedContentIdsModule = require(parent.flags.getFFlagUGCValidateVersionedContentIds)

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	local className = constantsModule.CONTENT_ID_EDITABLE_PROPERTY[p1.ClassName]
	local var1 = className and className[p2]
	
	return if var1 then p1[var1].SourceType == Enum.ContentSourceType.Object else false
end

local _ = function(value)
	-- upvalues: UGCValidationService (ref)
	local ok, status = pcall(function()
		-- upvalues: UGCValidationService (copy), value (ref)
		return UGCValidationService:CanLoadAsset(value)
	end)
	
	return ok and status
end

local function reportUnloadable(p1, p2, p3, p4)
	-- upvalues: errorSourceStringsModule (ref)
	if p2 then
		p1:fetchError(string.format("Failed to load asset referenced by %s.%s. Make sure the asset exists and try again.", p4.instance:GetFullName(), p4.fieldName))
		
		return
	end
	p1:fail(errorSourceStringsModule.Keys.AssetDoesNotExist, { AssetId = p3, InstancePath = p4.instance:GetFullName() })
end

return {
	categories = constantsModule.AllAssetUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.contentIds
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), constantsModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateVersionedContentIdsModule (ref), getFFlagUGCValidateCheckDescendantIdsLoadableModule (ref), parseContentIdsModule (ref), UGCValidationService (ref), reportUnloadable (ref)
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
		local v_2, uri
		local descendants = p2.rootInstance:GetDescendants()
		table.insert(descendants, p2.rootInstance)
		
		for i_1, v_1 in descendants do
			v_2 = constantsModule.CONTENT_ID_FIELDS[v_1.ClassName]
			
			if v_2 then
				local v_5
				local className = constantsModule.CONTENT_ID_REQUIRED_FIELDS[v_1.ClassName]
				uri = t[v_1]
				
				for i_2, v_4 in v_2 do
					v_5 = v_1[v_4]
					local var2 = className ~= nil and className[v_4] == true
					
					if v_5 == "" then
						if var2 then
							if var1 then
								local className_1 = constantsModule.CONTENT_ID_EDITABLE_PROPERTY[v_1.ClassName]
								local var3 = className_1 and className_1[v_4]
								
								if not (if not var3 then false else v_1[var3].SourceType == Enum.ContentSourceType.Object) then
									p1:fail(errorSourceStringsModule.Keys.DescendantIdMissing, { InstanceFullName = v_1:GetFullName(), FieldName = v_4 })
								end
							end
						end
					elseif not uri or not uri[v_4] then
						p1:fail(errorSourceStringsModule.Keys.DescendantIdMalformed, { InstanceFullName = v_1:GetFullName(), FieldName = v_4 })
					end
				end
				local className_1 = constantsModule.CONTENT_FIELDS_WITHOUT_CONTENTID[v_1.ClassName]
				
				if className_1 then
					for v_4, v_5 in className_1 do
						local var4 = v_1[v_5]
						
						if var4.SourceType == Enum.ContentSourceType.Uri and var4.Uri ~= "" and (not uri or not uri[v_5]) then
							p1:fail(errorSourceStringsModule.Keys.DescendantIdMalformed, { InstanceFullName = v_1:GetFullName(), FieldName = v_5 })
						end
					end
				end
			end
		end
		if getFFlagUGCValidateVersionedContentIdsModule() then
			for i_2, v_2 in p2.contentIds do
				for i_3, v_3 in v_2 do
					if v_3.version ~= nil then
						local t_1 = {
							InstanceFullName = v_3.instance:GetFullName(),
							FieldName = v_3.fieldName,
							Version = tostring(v_3.version),
							AssetId = i_2
						}
						
						if v_3.fieldName == "AnimationId" then
							p1:fail(errorSourceStringsModule.Keys.DescendantIdAnimationVersionNotSupported, t_1)
						elseif v_3.version ~= 1 then
							p1:fail(errorSourceStringsModule.Keys.DescendantIdVersionNotSupported, t_1)
						end
					end
				end
			end
		end
		local var5 = p2.consumerConfig.validationEnv == validationEnumsModule.ValidationEnv.Backend
		
		if var5 or getFFlagUGCValidateCheckDescendantIdsLoadableModule() then
			if getFFlagUGCValidateVersionedContentIdsModule() then
				for i_2, v_2 in parseContentIdsModule.getDistinctReferences(p2.contentIds) do
					uri = v_2.uri
					local ok, status = pcall(function()
						-- upvalues: UGCValidationService (copy), uri (ref)
						return UGCValidationService:CanLoadAsset(uri)
					end)
					
					if not ok or not status then
						reportUnloadable(p1, var5, v_2.key, v_2.entry)
					end
				end
				return
			else
				for i_2, v_2 in p2.contentIds do
					uri = "rbxassetid://" .. i_2
					local ok, status = pcall(function()
						-- upvalues: UGCValidationService (copy), uri (ref)
						return UGCValidationService:CanLoadAsset(uri)
					end)
					
					if not ok or not status then
						reportUnloadable(p1, var5, i_2, v_2[1])
					end
				end
			end
		end
	end
}