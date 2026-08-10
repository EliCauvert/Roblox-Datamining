local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local _ = require(parent.util.BundlesMetadata)
local _ = require(parent.util.Types)
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local destroyEditableInstancesModule = require(parent.util.destroyEditableInstances)
local createUGCBodyPartFoldersModule = require(parent.util.createUGCBodyPartFolders)
local fixUpPreValidationModule = require(parent.util.fixUpPreValidation)
local validateInternalModule = require(parent.validation.validateInternal)
local validateFullBodyModule = require(parent.validation.validateFullBody)
local legacyValidationAdapterModule = require(parent.util.LegacyValidationAdapter)
local httpService = game:GetService("HttpService")
local list = {
	Enum.AssetType.DynamicHead, Enum.AssetType.Torso, Enum.AssetType.LeftArm,
	Enum.AssetType.RightArm, Enum.AssetType.LeftLeg, Enum.AssetType.RightLeg,
	Enum.AssetType.HairAccessory, Enum.AssetType.EyebrowAccessory,
	Enum.AssetType.EyelashAccessory
}

return function(p0, p1, p2, p3, p4, p5) --[[ line: 56 | named "validateBundleReadyForUpload" ]]
	-- upvalues: promiseModule (ref), fixUpPreValidationModule (ref), createUGCBodyPartFoldersModule (ref), list (ref), httpService (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref), constantsInterfaceModule (ref), validateFullBodyModule (ref)
	p3 = p3 or function() --[[ line: 64 ]] end
	assert(p3 ~= nil, "Luau")
	
	if not p0:IsA("Model") then
		return promiseModule.resolve({
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
	local var11 = createUGCBodyPartFoldersModule(fixUpPreValidationModule(p0), p1, p2, false)
	local t = {}
	local t_1 = {}
	
	for i, v in p1[p2].allowedAssetTypeSettings do
		local var16 = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if v.isEligibleForUpload then
			assert(if v.minimumQuantity ~= 0 then v.minimumQuantity == 1 else true, "Invalid minimum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.")
			assert(if v.maximumQuantity ~= 0 then v.maximumQuantity == 1 else true, "Invalid maximum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.")
			local var17 = var11[var16]
			local var18 = var17 and var17[1]
			
			if v.minimumQuantity ~= 0 or var18 ~= nil then
				table.insert(t_1, {
					assetType = var16,
					instance = var18,
					settings = v,
					status = if var18 == nil then "finished" else "pending"
				})
				
				if var18 == nil then
					table.insert(t, { assetType = var16, error = { type = "notFound" } })
				end
			end
		end
	end
	table.sort(t_1, function(p6, p7) --[[ line: 141 ]]
		-- upvalues: list (copy)
		return (table.find(list, p6.assetType) or 1e999) < (table.find(list, p7.assetType) or 1e999)
	end)
	local t_2 = { errors = t, pieces = t_1 }
	p3(t_2)
	local var15 = httpService:GenerateGUID()
	
	return promiseModule.each(t_1, function(p9, p10) --[[ line: 157 ]]
		-- upvalues: p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), validateInternalModule (copy), legacyValidationAdapterModule (copy), var15 (ref), destroyEditableInstancesModule (copy), t_2 (write), p3 (write)
		if p9.status == "finished" then return end
		local var34, var35
		assert(p9.instance ~= nil, "Unfinished piece doesn't have an instnace")
		local _ = nil
		local _ = nil
		local list = { p9.instance }
		local t = {
			allowUnreviewedAssets = false,
			isServer = false,
			isAsync = false,
			validateMeshPartAccessories = true,
			requireAllFolders = false,
			instances = list,
			assetTypeEnum = p9.assetType,
			allowEditableInstances = p4,
			bypassFlags = p5
		}
		local var32, var33 = createEditableInstancesForContextModule.processAll(list, p4)
		
		if var32 then
			t.editableMeshes = var33.editableMeshes
			t.editableImages = var33.editableImages
			local var36, var37 = validateInternalModule(t)
			var36, var37 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var15, var36, var37)
			var35 = var36
			var34 = var37
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var34 = var33
			var35 = false
		end
		t_2 = table.clone(t_2)
		t_2.errors = table.clone(t_2.errors)
		
		if not var35 then
			assert(var34 ~= nil, "Failure without errors")
			
			for i, v in var34 do
				table.insert(t_2.errors, {
					assetType = p9.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_2.pieces = table.clone(t_2.pieces)
		t_2.pieces[p10].status = "finished"
		p3(t_2)
	end):andThen(function() --[[ line: 222 ]]
		-- upvalues: p2 (ref), constantsInterfaceModule (copy), t_2 (write), p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), validateFullBodyModule (copy), legacyValidationAdapterModule (copy), var15 (ref), destroyEditableInstancesModule (copy), p3 (write)
		if p2 == "Body" then
			local function createFullBodyData(p8) --[[ line: 224 ]]
				-- upvalues: constantsInterfaceModule (copy)
				local t = {}
				
				for i, v in p8 do
					if constantsInterfaceModule.isBodyPart(v.assetType) then
						table.insert(t, {
							assetTypeEnum = v.assetType,
							allSelectedInstances = if v.instance then { v.instance } else {}
						})
					end
				end
				return t
			end
			
			local _ = nil
			local _ = nil
			local var20 = createFullBodyData(t_2.pieces)
			local t = {
				isServer = false,
				validateMeshPartAccessories = false,
				requireAllFolders = false,
				fullBodyData = var20,
				allowEditableInstances = p4,
				bypassFlags = p5
			}
			local t_1 = {}
			
			for i, v in var20 do
				for i_1, v_1 in v.allSelectedInstances do
					table.insert(t_1, v_1)
				end
			end
			local var25, var26
			local var23, var24 = createEditableInstancesForContextModule.processAll(t_1, p4)
			
			if var23 then
				t.editableMeshes = var24.editableMeshes
				t.editableImages = var24.editableImages
				local var27, var28 = validateFullBodyModule(t)
				var27, var28 = legacyValidationAdapterModule.studioRFUBundleValidation(var20, Enum.BundleType.BodyParts, t, var15, var27, var28)
				var26 = var27
				var25 = var28
				destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
			else
				var25 = var24
				var26 = false
			end
			if not var26 then
				t_2 = table.clone(t_2)
				t_2.errors = table.clone(t_2.errors)
				assert(var25 and #var25 > 0, "There should always be a reason for failure")
				
				for i_1, v_1 in var25 do
					table.insert(t_2.errors, {
						assetType = nil,
						error = { type = "message", message = v_1 }
					})
				end
			end
			p3(t_2)
		end
	end):andThen(function() --[[ line: 303 ]]
		-- upvalues: t_2 (write)
		return t_2
	end)
end