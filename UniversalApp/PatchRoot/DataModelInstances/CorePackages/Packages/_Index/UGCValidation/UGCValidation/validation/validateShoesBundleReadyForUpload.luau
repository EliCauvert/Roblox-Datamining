local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
local _ = require(Parent.util.BundlesMetadata)
local _ = require(Parent.util.Types)
local CreateEditableInstancesForContextModule = require(Parent.util.createEditableInstancesForContext)
local DestroyEditableInstancesModule = require(Parent.util.destroyEditableInstances)
local _ = require(Parent.util.createUGCBodyPartFolders)
local FixUpPreValidationModule = require(Parent.util.fixUpPreValidation)
local ValidateInternalModule = require(Parent.validation.validateInternal)
local ValidateShoesModule = require(Parent.validation.validateShoes)
local _ = require(Parent.validation.validateBundleReadyForUpload)
local ValidateFullShoesBundleStudio = game:DefineFastFlag("ValidateFullShoesBundleStudio", false)
local LegacyValidationAdapterModule = require(Parent.util.LegacyValidationAdapter)
local HttpService = game:GetService("HttpService")

return function(Model: Model, p1, p2, p3, AllowEditableInstances, BypassFlags) --[[ Line: 25 | Named "validateShoesBundleReadyForUpload" ]]
	-- upvalues: PromiseModule (copy), FixUpPreValidationModule (copy), HttpService (copy), CreateEditableInstancesForContextModule (copy), ValidateInternalModule (copy), LegacyValidationAdapterModule (copy), DestroyEditableInstancesModule (copy), ValidateFullShoesBundleStudio (copy), ValidateShoesModule (copy)
	local Callback: (any) -> () = p3 or function() --[[ Line: 33 ]] end
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
	local LeftShoeAccessory = Model:FindFirstChild("LeftShoeAccessory")
	local RightShoeAccessory = Model:FindFirstChild("RightShoeAccessory")
	
	if not LeftShoeAccessory or not LeftShoeAccessory:IsA("Accessory") or not RightShoeAccessory or not RightShoeAccessory:IsA("Accessory") then
		return PromiseModule.resolve({
			errors = {
				{
					assetType = nil,
					error = {
						type = "message",
						message = "Shoes must of type 'Accessory' and names must be 'LeftShoeAccessory' and 'RightShoeAccessory'"
					}
				}
			},
			pieces = {}
		})
	end
	local config = {
		[Enum.AssetType.LeftShoeAccessory] = { FixUpPreValidationModule(LeftShoeAccessory) },
		[Enum.AssetType.RightShoeAccessory] = { FixUpPreValidationModule(RightShoeAccessory) }
	}
	local t = {}
	local Errors = {}
	local List = {}
	
	for i, allowedAssetTypeSetting in p1[p2].allowedAssetTypeSettings do
		local AssetTypeNameDoesnTMapToAnEnumItem = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if allowedAssetTypeSetting.isEligibleForUpload then
			local Entry = config[AssetTypeNameDoesnTMapToAnEnumItem]
			local Entry1 = Entry and Entry[1]
			t[AssetTypeNameDoesnTMapToAnEnumItem] = {
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
	table.insert(List, t[Enum.AssetType.LeftShoeAccessory])
	table.insert(List, t[Enum.AssetType.RightShoeAccessory])
	local Tbl = { errors = Errors, pieces = List }
	Callback(Tbl)
	local Guid = HttpService:GenerateGUID()
	
	return PromiseModule.each(List, function(p4, p5) --[[ Line: 124 ]]
		-- upvalues: AllowEditableInstances (copy), BypassFlags (copy), CreateEditableInstancesForContextModule (upval), ValidateInternalModule (upval), LegacyValidationAdapterModule (upval), Guid (copy), DestroyEditableInstancesModule (upval), Tbl (ref), Callback (ref)
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
		local v1 = nil
		local Messages = nil
		
		if ProcessAllResult then
			config.editableMeshes = ProcessAllResult2.editableMeshes
			config.editableImages = ProcessAllResult2.editableImages
			local ValidateInternalModuleResult, ValidateInternalModuleResult2 = ValidateInternalModule(config)
			v1, Messages = LegacyValidationAdapterModule.studioRFUAssetValidation(config, Guid, ValidateInternalModuleResult, ValidateInternalModuleResult2)
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
	end):andThen(function() --[[ Line: 184 ]]
		-- upvalues: ValidateFullShoesBundleStudio (upval), Tbl (ref), AllowEditableInstances (copy), BypassFlags (copy), CreateEditableInstancesForContextModule (upval), ValidateShoesModule (upval), LegacyValidationAdapterModule (upval), Guid (copy), DestroyEditableInstancesModule (upval), Callback (ref)
		if ValidateFullShoesBundleStudio then
			local FullBodyData = (function(List) --[[ Line: 186 | Named "createFullBodyData" ]]
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
			local v2 = nil
			
			if ProcessAllResult then
				config.editableMeshes = ProcessAllResult2.editableMeshes
				config.editableImages = ProcessAllResult2.editableImages
				local ValidateShoesModuleResult, ValidateShoesModuleResult2 = ValidateShoesModule(config)
				v2, Messages = LegacyValidationAdapterModule.studioRFUBundleValidation(FullBodyData, Enum.BundleType.Shoes, config, Guid, ValidateShoesModuleResult, ValidateShoesModuleResult2)
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
		end
		Callback(Tbl)
	end):andThen(function() --[[ Line: 259 ]]
		-- upvalues: Tbl (ref)
		return Tbl
	end)
end