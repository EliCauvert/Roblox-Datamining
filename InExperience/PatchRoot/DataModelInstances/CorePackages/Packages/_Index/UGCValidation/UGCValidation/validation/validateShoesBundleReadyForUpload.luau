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

return function(p0, p1, p2, p3, p4, p5) --[[ line: 25 | named "validateShoesBundleReadyForUpload" ]]
	-- upvalues: promiseModule (ref), fixUpPreValidationModule (ref), httpService (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref), validateFullShoesBundleStudio (ref), validateShoesModule (ref)
	p3 = p3 or function() --[[ line: 33 ]] end
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
	local leftShoeAccessory = p0:FindFirstChild("LeftShoeAccessory")
	local rightShoeAccessory = p0:FindFirstChild("RightShoeAccessory")
	
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
	
	for i, v in p1[p2].allowedAssetTypeSettings do
		local var17 = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if v.isEligibleForUpload then
			local var18 = t[var17]
			local var19 = var18 and var18[1]
			t_1[var17] = {
				assetType = var17,
				instance = var19,
				settings = v,
				status = if var19 == nil then "finished" else "pending"
			}
			
			if var19 == nil then
				table.insert(t_2, { assetType = var17, error = { type = "notFound" } })
			end
		end
	end
	table.insert(t_3, t_1[Enum.AssetType.LeftShoeAccessory])
	table.insert(t_3, t_1[Enum.AssetType.RightShoeAccessory])
	local t_4 = { errors = t_2, pieces = t_3 }
	p3(t_4)
	local var16 = httpService:GenerateGUID()
	
	return promiseModule.each(t_3, function(p7, p8) --[[ line: 124 ]]
		-- upvalues: p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), validateInternalModule (copy), legacyValidationAdapterModule (copy), var16 (ref), destroyEditableInstancesModule (copy), t_4 (write), p3 (write)
		if p7.status == "finished" then return end
		local var35, var36
		assert(p7.instance ~= nil, "Unfinished piece doesn't have an instance")
		local _ = nil
		local _ = nil
		local list = { p7.instance }
		local t = {
			instances = list,
			assetTypeEnum = p7.assetType,
			allowEditableInstances = p4,
			bypassFlags = p5
		}
		local var33, var34 = createEditableInstancesForContextModule.processAll(list, p4)
		
		if var33 then
			t.editableMeshes = var34.editableMeshes
			t.editableImages = var34.editableImages
			local var37, var38 = validateInternalModule(t)
			var37, var38 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var16, var37, var38)
			var36 = var37
			var35 = var38
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var35 = var34
			var36 = false
		end
		t_4 = table.clone(t_4)
		t_4.errors = table.clone(t_4.errors)
		
		if not var36 then
			assert(var35 ~= nil, "Failure without errors")
			
			for i, v in var35 do
				table.insert(t_4.errors, {
					assetType = p7.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_4.pieces = table.clone(t_4.pieces)
		t_4.pieces[p8].status = "finished"
		p3(t_4)
	end):andThen(function() --[[ line: 184 ]]
		-- upvalues: validateFullShoesBundleStudio (copy), t_4 (write), p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), validateShoesModule (copy), legacyValidationAdapterModule (copy), var16 (ref), destroyEditableInstancesModule (copy), p3 (write)
		if validateFullShoesBundleStudio then
			local function createFullBodyData(p6) --[[ line: 186 ]]
				local t = {}
				
				for i, v in p6 do
					table.insert(t, {
						assetTypeEnum = v.assetType,
						allSelectedInstances = if v.instance then { v.instance } else {}
					})
				end
				return t
			end
			
			local _ = nil
			local _ = nil
			local var21 = createFullBodyData(t_4.pieces)
			local t = {
				isServer = false,
				fullBodyData = var21,
				allowEditableInstances = p4,
				bypassFlags = p5
			}
			local t_1 = {}
			
			for i, v in var21 do
				for i_1, v_1 in v.allSelectedInstances do
					table.insert(t_1, v_1)
				end
			end
			local var26, var27
			local var24, var25 = createEditableInstancesForContextModule.processAll(t_1, p4)
			
			if var24 then
				t.editableMeshes = var25.editableMeshes
				t.editableImages = var25.editableImages
				local var28, var29 = validateShoesModule(t)
				var28, var29 = legacyValidationAdapterModule.studioRFUBundleValidation(var21, Enum.BundleType.Shoes, t, var16, var28, var29)
				var27 = var28
				var26 = var29
				destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
			else
				var26 = var25
				var27 = false
			end
			if not var27 then
				t_4 = table.clone(t_4)
				t_4.errors = table.clone(t_4.errors)
				assert(var26 and #var26 > 0, "There should always be a reason for failure")
				
				for i_1, v_1 in var26 do
					table.insert(t_4.errors, {
						assetType = nil,
						error = { type = "message", message = v_1 }
					})
				end
			end
		end
		p3(t_4)
	end):andThen(function() --[[ line: 259 ]]
		-- upvalues: t_4 (write)
		return t_4
	end)
end