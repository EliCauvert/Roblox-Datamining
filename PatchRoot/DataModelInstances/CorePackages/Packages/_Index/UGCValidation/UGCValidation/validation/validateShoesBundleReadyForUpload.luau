-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

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
local getFFlagUGCValidationEnableFolderStructureModule = require(parent.flags.getFFlagUGCValidationEnableFolderStructure)
local legacyValidationAdapterModule = require(parent.util.LegacyValidationAdapter)
local httpService = game:GetService("HttpService")

return function(p0, p1, p2, p3, p4, p5) --[[ line: 26 | named "validateShoesBundleReadyForUpload" ]]
	-- upvalues: promiseModule (ref), fixUpPreValidationModule (ref), getFFlagUGCValidationEnableFolderStructureModule (ref), httpService (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref), validateFullShoesBundleStudio (ref), validateShoesModule (ref)
	p3 = p3 or function() --[[ line: 34 ]] end
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
		local var18 = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if v.isEligibleForUpload then
			local var19 = t[var18]
			local var20 = var19 and var19[1]
			t_1[var18] = {
				assetType = var18,
				instance = var20,
				settings = v,
				status = if var20 == nil then "finished" else "pending"
			}
			
			if var20 == nil then
				table.insert(t_2, { assetType = var18, error = { type = "notFound" } })
			end
		end
	end
	table.insert(t_3, t_1[Enum.AssetType.LeftShoeAccessory])
	table.insert(t_3, t_1[Enum.AssetType.RightShoeAccessory])
	local t_4 = { errors = t_2, pieces = t_3 }
	p3(t_4)
	local var17 = if getFFlagUGCValidationEnableFolderStructureModule() then httpService:GenerateGUID() else nil
	
	return promiseModule.each(t_3, function(p7, p8) --[[ line: 128 ]]
		-- upvalues: p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), validateInternalModule (copy), getFFlagUGCValidationEnableFolderStructureModule (copy), legacyValidationAdapterModule (copy), var17 (write), destroyEditableInstancesModule (copy), t_4 (write), p3 (write)
		if p7.status == "finished" then return end
		local var38, var39
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
		local var36, var37 = createEditableInstancesForContextModule.processAll(list, p4)
		
		if var36 then
			t.editableMeshes = var37.editableMeshes
			t.editableImages = var37.editableImages
			local var40, var41 = validateInternalModule(t)
			var39 = var40
			var38 = var41
			
			if getFFlagUGCValidationEnableFolderStructureModule() then
				local var42, var43 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var17, var39, var38)
				var39 = var42
				var38 = var43
			end
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var38 = var37
			var39 = false
		end
		t_4 = table.clone(t_4)
		t_4.errors = table.clone(t_4.errors)
		
		if not var39 then
			assert(var38 ~= nil, "Failure without errors")
			
			for i, v in var38 do
				table.insert(t_4.errors, {
					assetType = p7.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_4.pieces = table.clone(t_4.pieces)
		t_4.pieces[p8].status = "finished"
		p3(t_4)
	end):andThen(function() --[[ line: 190 ]]
		-- upvalues: validateFullShoesBundleStudio (copy), t_4 (write), p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), validateShoesModule (copy), getFFlagUGCValidationEnableFolderStructureModule (copy), legacyValidationAdapterModule (copy), var17 (write), destroyEditableInstancesModule (copy), p3 (write)
		if validateFullShoesBundleStudio then
			local function createFullBodyData(p6) --[[ line: 192 ]]
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
			local var22 = createFullBodyData(t_4.pieces)
			local t = {
				isServer = false,
				fullBodyData = var22,
				allowEditableInstances = p4,
				bypassFlags = p5
			}
			local t_1 = {}
			
			for i, v in var22 do
				for i_1, v_1 in v.allSelectedInstances do
					table.insert(t_1, v_1)
				end
			end
			local var27, var28
			local var25, var26 = createEditableInstancesForContextModule.processAll(t_1, p4)
			
			if var25 then
				t.editableMeshes = var26.editableMeshes
				t.editableImages = var26.editableImages
				local var29, var30 = validateShoesModule(t)
				var28 = var29
				var27 = var30
				
				if getFFlagUGCValidationEnableFolderStructureModule() then
					local var31, var32 = legacyValidationAdapterModule.studioRFUBundleValidation(var22, Enum.BundleType.Shoes, t, var17, var28, var27)
					var28 = var31
					var27 = var32
				end
				destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
			else
				var27 = var26
				var28 = false
			end
			if not var28 then
				t_4 = table.clone(t_4)
				t_4.errors = table.clone(t_4.errors)
				assert(var27 and #var27 > 0, "There should always be a reason for failure")
				
				for i_1, v_1 in var27 do
					table.insert(t_4.errors, {
						assetType = nil,
						error = { type = "message", message = v_1 }
					})
				end
			end
		end
		p3(t_4)
	end):andThen(function() --[[ line: 267 ]]
		-- upvalues: t_4 (write)
		return t_4
	end)
end