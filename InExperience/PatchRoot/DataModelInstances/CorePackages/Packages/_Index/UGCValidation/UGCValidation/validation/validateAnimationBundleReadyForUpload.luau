local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.BundlesMetadata)
local _ = require(parent.util.Types)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local destroyEditableInstancesModule = require(parent.util.destroyEditableInstances)
local _ = require(parent.validation.validateBundleReadyForUpload)
local getFFlagUGCValidationEnableFolderStructureModule = require(parent.flags.getFFlagUGCValidationEnableFolderStructure)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local legacyValidationAdapterModule = require(parent.util.LegacyValidationAdapter)
local httpService = game:GetService("HttpService")

return function(p0, p1, p2, p3, p4, p5) --[[ line: 23 | named "validateAnimationBundleReadyForUpload" ]]
	-- upvalues: promiseModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidationEnableFolderStructureModule (ref), httpService (ref), createEditableInstancesForContextModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref)
	p3 = p3 or function() --[[ line: 31 ]] end
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
	local t = {}
	
	if getFFlagUGCValidationAnimationPackSupportModule() and constantsModule.ANIMATION_ASSET_INFO then
		local t_1 = {}
		
		for i, v in constantsModule.ANIMATION_ASSET_INFO do
			t_1[v.modelName] = true
		end
		for i_1, v_1 in constantsModule.ANIMATION_ASSET_INFO do
			local modelName = p0:FindFirstChild(v_1.modelName)
			
			if modelName then
				t[i_1] = { modelName }
			end
		end
		local t_2 = {}
		
		for i_2, v_2 in p0:GetChildren() do
			if not t_1[v_2.Name] then
				table.insert(t_2, v_2.Name)
			end
		end
		if #t_2 > 0 then
			return promiseModule.resolve({
				errors = {
					{
						assetType = nil,
						error = {
							type = "message",
							message = string.gsub(errorSourceStringsModule.Values.AnimationPack_UnexpectedBundleChildren, "{unexpectedNames}", table.concat(t_2, ", "))
						}
					}
				},
				pieces = {}
			})
		end
	end
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
	if getFFlagUGCValidationAnimationPackSupportModule() and constantsModule.ANIMATION_ASSET_INFO then
		for i_1, v_1 in constantsModule.ANIMATION_ASSET_INFO do
			if t_1[i_1] then
				table.insert(t_3, t_1[i_1])
			end
		end
	end
	local t_4 = { errors = t_2, pieces = t_3 }
	p3(t_4)
	local var17 = if getFFlagUGCValidationEnableFolderStructureModule() then httpService:GenerateGUID() else nil
	
	return promiseModule.each(t_3, function(p7, p8) --[[ line: 153 ]]
		-- upvalues: p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), getFFlagUGCValidationEnableFolderStructureModule (copy), legacyValidationAdapterModule (copy), var17 (write), destroyEditableInstancesModule (copy), t_4 (write), p3 (write)
		if p7.status == "finished" then return end
		local var36, var37
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
		local var34, var35 = createEditableInstancesForContextModule.processAll(list, p4)
		
		if var34 then
			t.editableMeshes = var35.editableMeshes
			t.editableImages = var35.editableImages
			var37 = true
			var36 = nil
			
			if getFFlagUGCValidationEnableFolderStructureModule() then
				local var38, var39 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var17, var37, var36)
				var37 = var38
				var36 = var39
			end
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var36 = var35
			var37 = false
		end
		t_4 = table.clone(t_4)
		t_4.errors = table.clone(t_4.errors)
		
		if not var37 then
			assert(var36 ~= nil, "Failure without errors")
			
			for i, v in var36 do
				table.insert(t_4.errors, {
					assetType = p7.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_4.pieces = table.clone(t_4.pieces)
		t_4.pieces[p8].status = "finished"
		p3(t_4)
	end):andThen(function() --[[ line: 214 ]]
		-- upvalues: t_4 (write), p4 (ref), p5 (ref), createEditableInstancesForContextModule (copy), getFFlagUGCValidationEnableFolderStructureModule (copy), getFFlagUGCValidationAnimationPackSupportModule (copy), legacyValidationAdapterModule (copy), var17 (write), destroyEditableInstancesModule (copy), p3 (write)
		local function createFullBodyData(p6) --[[ line: 215 ]]
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
			var28 = true
			var27 = nil
			
			if getFFlagUGCValidationEnableFolderStructureModule() and getFFlagUGCValidationAnimationPackSupportModule() then
				local var29, var30 = legacyValidationAdapterModule.studioRFUBundleValidation(var22, Enum.BundleType.Animations, t, var17, var28, var27)
				var28 = var29
				var27 = var30
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
		p3(t_4)
	end):andThen(function() --[[ line: 288 ]]
		-- upvalues: t_4 (write)
		return t_4
	end)
end