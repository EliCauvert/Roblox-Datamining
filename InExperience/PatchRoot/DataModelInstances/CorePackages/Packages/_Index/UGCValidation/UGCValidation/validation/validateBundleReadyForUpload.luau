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

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: promiseModule (ref), fixUpPreValidationModule (ref), createUGCBodyPartFoldersModule (ref), list (ref), httpService (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref), constantsInterfaceModule (ref), validateFullBodyModule (ref)
	p4 = p4 or function() end
	assert(p4 ~= nil, "Luau")
	
	if not p1:IsA("Model") then
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
	local var1 = createUGCBodyPartFoldersModule(fixUpPreValidationModule(p1), p2, p3, false)
	local t = {}
	local t_1 = {}
	
	for i, v in p2[p3].allowedAssetTypeSettings do
		local var2 = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if v.isEligibleForUpload then
			assert(if v.minimumQuantity ~= 0 then v.minimumQuantity == 1 else true, "Invalid minimum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.")
			assert(if v.maximumQuantity ~= 0 then v.maximumQuantity == 1 else true, "Invalid maximum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.")
			local var3 = var1[var2]
			local var4 = var3 and var3[1]
			
			if v.minimumQuantity ~= 0 or var4 ~= nil then
				table.insert(t_1, {
					assetType = var2,
					instance = var4,
					settings = v,
					status = if var4 == nil then "finished" else "pending"
				})
				
				if var4 == nil then
					table.insert(t, { assetType = var2, error = { type = "notFound" } })
				end
			end
		end
	end
	table.sort(t_1, function(p7, p8)
		-- upvalues: list (copy)
		return (table.find(list, p7.assetType) or 1e999) < (table.find(list, p8.assetType) or 1e999)
	end)
	local t_2 = { errors = t, pieces = t_1 }
	p4(t_2)
	local var5 = httpService:GenerateGUID()
	
	return promiseModule.each(t_1, function(p7, p8)
		-- upvalues: p5 (ref), p6 (ref), createEditableInstancesForContextModule (copy), validateInternalModule (copy), legacyValidationAdapterModule (copy), var5 (ref), destroyEditableInstancesModule (copy), t_2 (write), p4 (write)
		if p7.status == "finished" then return end
		local var6, var7
		assert(p7.instance ~= nil, "Unfinished piece doesn't have an instnace")
		local _ = nil
		local _ = nil
		local list = { p7.instance }
		local t = {
			allowUnreviewedAssets = false,
			isServer = false,
			isAsync = false,
			validateMeshPartAccessories = true,
			requireAllFolders = false,
			instances = list,
			assetTypeEnum = p7.assetType,
			allowEditableInstances = p5,
			bypassFlags = p6
		}
		local var8, var9 = createEditableInstancesForContextModule.processAll(list, p5)
		
		if var8 then
			t.editableMeshes = var9.editableMeshes
			t.editableImages = var9.editableImages
			local var10, var11 = validateInternalModule(t)
			var10, var37 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var5, var10, var11)
			var7 = var10
			var6 = var11
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var6 = var9
			var7 = false
		end
		t_2 = table.clone(t_2)
		t_2.errors = table.clone(t_2.errors)
		
		if not var7 then
			assert(var6 ~= nil, "Failure without errors")
			
			for i, v in var6 do
				table.insert(t_2.errors, {
					assetType = p7.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_2.pieces = table.clone(t_2.pieces)
		t_2.pieces[p8].status = "finished"
		p4(t_2)
	end):andThen(function()
		-- upvalues: p3 (ref), constantsInterfaceModule (copy), t_2 (write), p5 (ref), p6 (ref), createEditableInstancesForContextModule (copy), validateFullBodyModule (copy), legacyValidationAdapterModule (copy), var5 (ref), destroyEditableInstancesModule (copy), p4 (write)
		if p3 == "Body" then
			local function createFullBodyData(p9)
				-- upvalues: constantsInterfaceModule (copy)
				local t = {}
				
				for i, v in p9 do
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
			local var12 = createFullBodyData(t_2.pieces)
			local t = {
				isServer = false,
				validateMeshPartAccessories = false,
				requireAllFolders = false,
				fullBodyData = var12,
				allowEditableInstances = p5,
				bypassFlags = p6
			}
			local t_1 = {}
			
			for i, v in var12 do
				for i_1, v_1 in v.allSelectedInstances do
					table.insert(t_1, v_1)
				end
			end
			local var13, var14
			local var15, var16 = createEditableInstancesForContextModule.processAll(t_1, p5)
			
			if var15 then
				t.editableMeshes = var16.editableMeshes
				t.editableImages = var16.editableImages
				local var17, var18 = validateFullBodyModule(t)
				var17, var28 = legacyValidationAdapterModule.studioRFUBundleValidation(var12, Enum.BundleType.BodyParts, t, var5, var17, var18)
				var14 = var17
				var13 = var18
				destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
			else
				var13 = var16
				var14 = false
			end
			if not var14 then
				t_2 = table.clone(t_2)
				t_2.errors = table.clone(t_2.errors)
				assert(var13 and #var13 > 0, "There should always be a reason for failure")
				
				for i_1, v_1 in var13 do
					table.insert(t_2.errors, {
						assetType = nil,
						error = { type = "message", message = v_1 }
					})
				end
			end
			p4(t_2)
		end
	end):andThen(function()
		-- upvalues: t_2 (write)
		return t_2
	end)
end