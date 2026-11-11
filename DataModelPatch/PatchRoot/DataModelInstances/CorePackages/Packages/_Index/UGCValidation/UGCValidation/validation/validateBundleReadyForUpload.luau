local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.BundlesMetadata)
local _ = require(Parent.util.Types)
local CreateEditableInstancesForContextModule = require(Parent.util.createEditableInstancesForContext)
local DestroyEditableInstancesModule = require(Parent.util.destroyEditableInstances)
local CreateUGCBodyPartFoldersModule = require(Parent.util.createUGCBodyPartFolders)
local FixUpPreValidationModule = require(Parent.util.fixUpPreValidation)
local ValidateInternalModule = require(Parent.validation.validateInternal)
local ValidateFullBodyModule = require(Parent.validation.validateFullBody)
local GetFFlagUGCValidationEnableFolderStructureModule = require(Parent.flags.getFFlagUGCValidationEnableFolderStructure)
local LegacyValidationAdapterModule = require(Parent.util.LegacyValidationAdapter)
local HttpService = game:GetService("HttpService")
local List = {
	Enum.AssetType.DynamicHead, Enum.AssetType.Torso, Enum.AssetType.LeftArm,
	Enum.AssetType.RightArm, Enum.AssetType.LeftLeg, Enum.AssetType.RightLeg,
	Enum.AssetType.HairAccessory, Enum.AssetType.EyebrowAccessory,
	Enum.AssetType.EyelashAccessory
}

return function(Model: Model, p1, p2, p3, AllowEditableInstances, BypassFlags)
	-- upvalues: PromiseModule (copy), FixUpPreValidationModule (copy), CreateUGCBodyPartFoldersModule (copy), List (copy), GetFFlagUGCValidationEnableFolderStructureModule (copy), HttpService (copy), CreateEditableInstancesForContextModule (copy), ValidateInternalModule (copy), LegacyValidationAdapterModule (copy), DestroyEditableInstancesModule (copy), ConstantsInterfaceModule (copy), ValidateFullBodyModule (copy)
	local Callback: (any) -> () = p3 or function() end
	assert(Callback ~= nil, "Luau")
	
	if not Model:IsA("Model") then
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
	local UGCBodyPartFoldersModule = CreateUGCBodyPartFoldersModule(FixUpPreValidationModule(Model), p1, p2, false)
	local Errors = {}
	local List1 = {}
	
	for i, allowedAssetTypeSetting in p1[p2].allowedAssetTypeSettings do
		local AssetTypeNameDoesnTMapToAnEnumItem = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if allowedAssetTypeSetting.isEligibleForUpload then
			assert(allowedAssetTypeSetting.minimumQuantity == 0 or allowedAssetTypeSetting.minimumQuantity == 1, "Invalid minimum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.")
			assert(allowedAssetTypeSetting.maximumQuantity == 0 or allowedAssetTypeSetting.maximumQuantity == 1, "Invalid maximum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.")
			local UGCBodyPartFoldersModuleEntry = UGCBodyPartFoldersModule[AssetTypeNameDoesnTMapToAnEnumItem]
			local UGCBodyPartFoldersModuleEntry1 = UGCBodyPartFoldersModuleEntry and UGCBodyPartFoldersModuleEntry[1]
			
			if allowedAssetTypeSetting.minimumQuantity ~= 0 or UGCBodyPartFoldersModuleEntry1 ~= nil then
				table.insert(List1, {
					assetType = AssetTypeNameDoesnTMapToAnEnumItem,
					instance = UGCBodyPartFoldersModuleEntry1,
					settings = allowedAssetTypeSetting,
					status = if UGCBodyPartFoldersModuleEntry1 == nil then "finished" else "pending"
				})
				
				if UGCBodyPartFoldersModuleEntry1 == nil then
					table.insert(Errors, {
						assetType = AssetTypeNameDoesnTMapToAnEnumItem,
						error = { type = "notFound" }
					})
				end
			end
		end
	end
	table.sort(List1, function(A, B): boolean
		-- upvalues: List (upval)
		return (table.find(List, A.assetType) or 1e999) < (table.find(List, B.assetType) or 1e999)
	end)
	local Tbl = { errors = Errors, pieces = List1 }
	Callback(Tbl)
	local Guid = if GetFFlagUGCValidationEnableFolderStructureModule() then HttpService:GenerateGUID() else nil
	
	return PromiseModule.each(List1, function(p4, p5)
		-- upvalues: AllowEditableInstances (copy), BypassFlags (copy), CreateEditableInstancesForContextModule (upval), ValidateInternalModule (upval), GetFFlagUGCValidationEnableFolderStructureModule (upval), LegacyValidationAdapterModule (upval), Guid (ref), DestroyEditableInstancesModule (upval), Tbl (ref), Callback (ref)
		if p4.status == "finished" then return end
		assert(p4.instance ~= nil, "Unfinished piece doesn't have an instnace")
		local Instances = { p4.instance }
		local config = {
			allowUnreviewedAssets = false,
			isServer = false,
			isAsync = false,
			validateMeshPartAccessories = true,
			requireAllFolders = false,
			instances = Instances,
			assetTypeEnum = p4.assetType,
			allowEditableInstances = AllowEditableInstances,
			bypassFlags = BypassFlags
		}
		local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances, AllowEditableInstances)
		local Messages = nil
		local v1 = nil
		
		if ProcessAllResult then
			config.editableMeshes = ProcessAllResult2.editableMeshes
			config.editableImages = ProcessAllResult2.editableImages
			v1, Messages = ValidateInternalModule(config)
			
			if GetFFlagUGCValidationEnableFolderStructureModule() then
				v1, Messages = LegacyValidationAdapterModule.studioRFUAssetValidation(config, Guid, v1, Messages)
			end
			DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
		else
			Messages = ProcessAllResult2
			v1 = false
		end
		Tbl = table.clone(Tbl)
		Tbl.errors = table.clone(Tbl.errors)
		
		if not v1 then
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
		-- upvalues: p2 (copy), ConstantsInterfaceModule (upval), Tbl (ref), AllowEditableInstances (copy), BypassFlags (copy), CreateEditableInstancesForContextModule (upval), ValidateFullBodyModule (upval), GetFFlagUGCValidationEnableFolderStructureModule (upval), LegacyValidationAdapterModule (upval), Guid (ref), DestroyEditableInstancesModule (upval), Callback (ref)
		if p2 == "Body" then
			local FullBodyData = (function(List)
				-- upvalues: ConstantsInterfaceModule (upval)
				local List1 = {}
				
				for _, value in List do
					if ConstantsInterfaceModule.isBodyPart(value.assetType) then
						table.insert(List1, {
							assetTypeEnum = value.assetType,
							allSelectedInstances = if value.instance then { value.instance } else {}
						})
					end
				end
				return List1
			end)(Tbl.pieces)
			local config = {
				isServer = false,
				validateMeshPartAccessories = false,
				requireAllFolders = false,
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
			local v2 = nil
			local Messages = nil
			
			if ProcessAllResult then
				config.editableMeshes = ProcessAllResult2.editableMeshes
				config.editableImages = ProcessAllResult2.editableImages
				v2, Messages = ValidateFullBodyModule(config)
				
				if GetFFlagUGCValidationEnableFolderStructureModule() then
					v2, Messages = LegacyValidationAdapterModule.studioRFUBundleValidation(FullBodyData, Enum.BundleType.BodyParts, config, Guid, v2, Messages)
				end
				DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
			else
				Messages = ProcessAllResult2
				v2 = false
			end
			if not v2 then
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
		end
	end):andThen(function()
		-- upvalues: Tbl (ref)
		return Tbl
	end)
end