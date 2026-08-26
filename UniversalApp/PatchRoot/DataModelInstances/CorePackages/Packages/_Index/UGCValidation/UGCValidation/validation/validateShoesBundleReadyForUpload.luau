local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
local _ = require(parent.util.BundlesMetadata)
local _ = require(parent.util.Types)
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local destroyEditableInstancesModule = require(parent.util.destroyEditableInstances)
local _ = require(parent.util.createUGCBodyPartFolders)
local fixUpPreValidationModule = require(parent.util.fixUpPreValidation)
local validateInternalModule = require(parent.validation.validateInternal)
local validateShoesModule = require(parent.validation.validateShoes)
local _ = require(parent.validation.validateBundleReadyForUpload)
local validateFullShoesBundleStudio = game:DefineFastFlag("ValidateFullShoesBundleStudio", false)
local legacyValidationAdapterModule = require(parent.util.LegacyValidationAdapter)
local httpService = game:GetService("HttpService")

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: promiseModule (ref), fixUpPreValidationModule (ref), httpService (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref), validateFullShoesBundleStudio (ref), validateShoesModule (ref)
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
	local leftShoeAccessory = p1:FindFirstChild("LeftShoeAccessory")
	local rightShoeAccessory = p1:FindFirstChild("RightShoeAccessory")
	
	if not leftShoeAccessory or not leftShoeAccessory:IsA("Accessory") or (not rightShoeAccessory or not rightShoeAccessory:IsA("Accessory")) then
		return promiseModule.resolve({
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
	local t = {
		[Enum.AssetType.LeftShoeAccessory] = { fixUpPreValidationModule(leftShoeAccessory) },
		[Enum.AssetType.RightShoeAccessory] = { fixUpPreValidationModule(rightShoeAccessory) }
	}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in p2[p3].allowedAssetTypeSettings do
		local var1 = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if v.isEligibleForUpload then
			local var2 = t[var1]
			local var3 = var2 and var2[1]
			t_1[var1] = {
				assetType = var1,
				instance = var3,
				settings = v,
				status = if var3 == nil then "finished" else "pending"
			}
			
			if var3 == nil then
				table.insert(t_2, { assetType = var1, error = { type = "notFound" } })
			end
		end
	end
	table.insert(t_3, t_1[Enum.AssetType.LeftShoeAccessory])
	table.insert(t_3, t_1[Enum.AssetType.RightShoeAccessory])
	local t_4 = { errors = t_2, pieces = t_3 }
	p4(t_4)
	local var4 = httpService:GenerateGUID()
	
	return promiseModule.each(t_3, function(p7, p8)
		-- upvalues: p5 (ref), p6 (ref), createEditableInstancesForContextModule (copy), validateInternalModule (copy), legacyValidationAdapterModule (copy), var4 (ref), destroyEditableInstancesModule (copy), t_4 (write), p4 (write)
		if p7.status == "finished" then return end
		local var5, var6
		assert(p7.instance ~= nil, "Unfinished piece doesn't have an instance")
		local _ = nil
		local _ = nil
		local list = { p7.instance }
		local t = {
			instances = list,
			assetTypeEnum = p7.assetType,
			allowEditableInstances = p5,
			bypassFlags = p6
		}
		local var7, var8 = createEditableInstancesForContextModule.processAll(list, p5)
		
		if var7 then
			t.editableMeshes = var8.editableMeshes
			t.editableImages = var8.editableImages
			local var9, var10 = validateInternalModule(t)
			var9, var38 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var4, var9, var10)
			var6 = var9
			var5 = var10
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var5 = var8
			var6 = false
		end
		t_4 = table.clone(t_4)
		t_4.errors = table.clone(t_4.errors)
		
		if not var6 then
			assert(var5 ~= nil, "Failure without errors")
			
			for i, v in var5 do
				table.insert(t_4.errors, {
					assetType = p7.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_4.pieces = table.clone(t_4.pieces)
		t_4.pieces[p8].status = "finished"
		p4(t_4)
	end):andThen(function()
		-- upvalues: validateFullShoesBundleStudio (copy), t_4 (write), p5 (ref), p6 (ref), createEditableInstancesForContextModule (copy), validateShoesModule (copy), legacyValidationAdapterModule (copy), var4 (ref), destroyEditableInstancesModule (copy), p4 (write)
		if validateFullShoesBundleStudio then
			local function createFullBodyData(p9)
				local t = {}
				
				for i, v in p9 do
					table.insert(t, {
						assetTypeEnum = v.assetType,
						allSelectedInstances = if v.instance then { v.instance } else {}
					})
				end
				return t
			end
			
			local _ = nil
			local _ = nil
			local var11 = createFullBodyData(t_4.pieces)
			local t = {
				isServer = false,
				fullBodyData = var11,
				allowEditableInstances = p5,
				bypassFlags = p6
			}
			local t_1 = {}
			
			for i, v in var11 do
				for i_1, v_1 in v.allSelectedInstances do
					table.insert(t_1, v_1)
				end
			end
			local var12, var13
			local var14, var15 = createEditableInstancesForContextModule.processAll(t_1, p5)
			
			if var14 then
				t.editableMeshes = var15.editableMeshes
				t.editableImages = var15.editableImages
				local var16, var17 = validateShoesModule(t)
				var16, var29 = legacyValidationAdapterModule.studioRFUBundleValidation(var11, Enum.BundleType.Shoes, t, var4, var16, var17)
				var13 = var16
				var12 = var17
				destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
			else
				var12 = var15
				var13 = false
			end
			if not var13 then
				t_4 = table.clone(t_4)
				t_4.errors = table.clone(t_4.errors)
				assert(var12 and #var12 > 0, "There should always be a reason for failure")
				
				for i_1, v_1 in var12 do
					table.insert(t_4.errors, {
						assetType = nil,
						error = { type = "message", message = v_1 }
					})
				end
			end
		end
		p4(t_4)
	end):andThen(function()
		-- upvalues: t_4 (write)
		return t_4
	end)
end