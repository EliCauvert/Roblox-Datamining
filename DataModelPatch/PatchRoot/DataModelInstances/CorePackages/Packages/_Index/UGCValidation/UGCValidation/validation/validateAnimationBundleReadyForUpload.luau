local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.BundlesMetadata)
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CreateEditableInstancesForContextModule = require(Parent.util.createEditableInstancesForContext)
local DestroyEditableInstancesModule = require(Parent.util.destroyEditableInstances)
local _ = require(Parent.validation.validateBundleReadyForUpload)
local GetFFlagUGCValidationEnableFolderStructureModule = require(Parent.flags.getFFlagUGCValidationEnableFolderStructure)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local GetFFlagUGCValidationAnimationPackFolderStructureModule = require(Parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)
local LegacyValidationAdapterModule = require(Parent.util.LegacyValidationAdapter)
local HttpService = game:GetService("HttpService")

local function hasExactStringValueNames(Folder, List): boolean
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	local t1 = {}
	
	for _, StringValue in Folder:GetChildren() do
		if StringValue:IsA("StringValue") then
			if not t[StringValue.Name] or t1[StringValue.Name] then
				return false
			end
			t1[StringValue.Name] = true
		end
	end
	for _, value1 in List do
		if not t1[value1] then
			return false
		end
	end
	return true
end

return function(Object, p1, p2, p3, AllowEditableInstances, BypassFlags)
	-- upvalues: PromiseModule (copy), GetFFlagUGCValidationAnimationPackSupportModule (copy), ConstantsModule (copy), GetFFlagUGCValidationAnimationPackFolderStructureModule (copy), hasExactStringValueNames (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidationEnableFolderStructureModule (copy), HttpService (copy), CreateEditableInstancesForContextModule (copy), LegacyValidationAdapterModule (copy), DestroyEditableInstancesModule (copy)
	local Callback: (any) -> () = p3 or function() end
	assert(Callback ~= nil, "Luau")
	
	if not Object:IsA("Model") then
		return PromiseModule.resolve({
			errors = {
				{
					assetType = nil,
					error = {
						type = "message",
						message = "Invalid root instance, must be a model"
					}
				}
			},
			pieces = {}
		})
	end
	local t = {}
	
	if GetFFlagUGCValidationAnimationPackSupportModule() and ConstantsModule.ANIMATION_ASSET_INFO then
		local List = {}
		
		if GetFFlagUGCValidationAnimationPackFolderStructureModule() and Object:FindFirstChild("R15Anim") ~= nil then
			local t2 = {}
			
			for i, value in ConstantsModule.ANIMATION_ASSET_INFO do
				for _, Folder in Object:GetChildren() do
					local HasExactStringValueNames = Folder.Name == "R15Anim" and (Folder:IsA("Folder") and hasExactStringValueNames(Folder, value.stringValueNames))
					
					if not t2[Folder] and HasExactStringValueNames then
						t[i] = { Folder }
						t2[Folder] = true
						break
					end
				end
			end
			for _, child in Object:GetChildren() do
				if not t2[child] then
					table.insert(List, child.Name)
				end
			end
		else
			local t3 = {}
			
			for _, value1 in ConstantsModule.ANIMATION_ASSET_INFO do
				t3[value1.modelName] = true
			end
			for i1, value2 in ConstantsModule.ANIMATION_ASSET_INFO do
				local ModelName = Object:FindFirstChild(value2.modelName)
				
				if ModelName then
					t[i1] = { ModelName }
				end
			end
			for _, child1 in Object:GetChildren() do
				if not t3[child1.Name] then
					table.insert(List, child1.Name)
				end
			end
		end
		if #List > 0 then
			return PromiseModule.resolve({
				errors = {
					{
						assetType = nil,
						error = {
							type = "message",
							message = string.gsub(ErrorSourceStringsModule.Values.AnimationPack_UnexpectedBundleChildren, "{unexpectedNames}", table.concat(List, ", "))
						}
					}
				},
				pieces = {}
			})
		end
	end
	local t4 = {}
	local Errors = {}
	local Pieces = {}
	
	for i3, allowedAssetTypeSetting in p1[p2].allowedAssetTypeSettings do
		local AssetTypeNameDoesnTMapToAnEnumItem = assert(Enum.AssetType[i3], "Asset type name doesn't map to an enum item")
		
		if allowedAssetTypeSetting.isEligibleForUpload then
			local Entry = t[AssetTypeNameDoesnTMapToAnEnumItem]
			local Entry1 = Entry and Entry[1]
			t4[AssetTypeNameDoesnTMapToAnEnumItem] = {
				assetType = AssetTypeNameDoesnTMapToAnEnumItem,
				instance = Entry1,
				settings = allowedAssetTypeSetting,
				status = if Entry1 == nil then "finished" else "pending"
			}
			
			if Entry1 == nil then
				table.insert(Errors, {
					assetType = AssetTypeNameDoesnTMapToAnEnumItem,
					error = { type = "notFound" }
				})
			end
		end
	end
	if GetFFlagUGCValidationAnimationPackSupportModule() and ConstantsModule.ANIMATION_ASSET_INFO then
		for i2, _ in ConstantsModule.ANIMATION_ASSET_INFO do
			if t4[i2] then
				table.insert(Pieces, t4[i2])
			end
		end
	end
	local Tbl = { errors = Errors, pieces = Pieces }
	Callback(Tbl)
	local Guid = if GetFFlagUGCValidationEnableFolderStructureModule() then HttpService:GenerateGUID() else nil
	
	return PromiseModule.each(Pieces, function(p4, p5)
		-- upvalues: AllowEditableInstances (copy), BypassFlags (copy), CreateEditableInstancesForContextModule (upval), GetFFlagUGCValidationEnableFolderStructureModule (upval), LegacyValidationAdapterModule (upval), Guid (ref), DestroyEditableInstancesModule (upval), Tbl (ref), Callback (ref)
		if p4.status == "finished" then return end
		assert(p4.instance ~= nil, "Unfinished piece doesn't have an instance")
		local Instances = { p4.instance }
		local config = {
			instances = Instances,
			assetTypeEnum = p4.assetType,
			allowEditableInstances = AllowEditableInstances,
			bypassFlags = BypassFlags
		}
		local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances, AllowEditableInstances)
		local Flag = nil
		local Messages = nil
		
		if ProcessAllResult then
			config.editableMeshes = ProcessAllResult2.editableMeshes
			config.editableImages = ProcessAllResult2.editableImages
			Flag = true
			Messages = nil
			
			if GetFFlagUGCValidationEnableFolderStructureModule() then
				Flag, Messages = LegacyValidationAdapterModule.studioRFUAssetValidation(config, Guid, Flag, Messages)
			end
			DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
		else
			Messages = ProcessAllResult2
			Flag = false
		end
		Tbl = table.clone(Tbl)
		Tbl.errors = table.clone(Tbl.errors)
		
		if not Flag then
			assert(Messages ~= nil, "Failure without errors")
			
			for _, message in Messages do
				table.insert(Tbl.errors, {
					assetType = p4.assetType,
					error = { type = "message", message = message }
				})
			end
		end
		Tbl.pieces = table.clone(Tbl.pieces)
		Tbl.pieces[p5].status = "finished"
		Callback(Tbl)
	end):andThen(function()
		-- upvalues: Tbl (ref), AllowEditableInstances (copy), BypassFlags (copy), CreateEditableInstancesForContextModule (upval), GetFFlagUGCValidationEnableFolderStructureModule (upval), GetFFlagUGCValidationAnimationPackSupportModule (upval), LegacyValidationAdapterModule (upval), Guid (ref), DestroyEditableInstancesModule (upval), Callback (ref)
		local FullBodyData = (function(List)
			local List1 = {}
			
			for _, value in List do
				table.insert(List1, {
					assetTypeEnum = value.assetType,
					allSelectedInstances = if value.instance then { value.instance } else {}
				})
			end
			return List1
		end)(Tbl.pieces)
		local config = {
			isServer = false,
			fullBodyData = FullBodyData,
			allowEditableInstances = AllowEditableInstances,
			bypassFlags = BypassFlags
		}
		local List = {}
		
		for _, value in FullBodyData do
			for _, allSelectedInstance in value.allSelectedInstances do
				table.insert(List, allSelectedInstance)
			end
		end
		local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(List, AllowEditableInstances)
		local Messages = nil
		local Flag = nil
		
		if ProcessAllResult then
			config.editableMeshes = ProcessAllResult2.editableMeshes
			config.editableImages = ProcessAllResult2.editableImages
			Flag = true
			Messages = nil
			
			if GetFFlagUGCValidationEnableFolderStructureModule() and GetFFlagUGCValidationAnimationPackSupportModule() then
				Flag, Messages = LegacyValidationAdapterModule.studioRFUBundleValidation(FullBodyData, Enum.BundleType.Animations, config, Guid, Flag, Messages)
			end
			DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
		else
			Messages = ProcessAllResult2
			Flag = false
		end
		if not Flag then
			Tbl = table.clone(Tbl)
			Tbl.errors = table.clone(Tbl.errors)
			assert(Messages and #Messages > 0, "There should always be a reason for failure")
			
			for _, message in Messages do
				table.insert(Tbl.errors, {
					assetType = nil,
					error = { type = "message", message = message }
				})
			end
		end
		Callback(Tbl)
	end):andThen(function()
		-- upvalues: Tbl (ref)
		return Tbl
	end)
end