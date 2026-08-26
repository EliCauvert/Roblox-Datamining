local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.BundlesMetadata)
local _ = require(parent.util.Types)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local destroyEditableInstancesModule = require(parent.util.destroyEditableInstances)
local _ = require(parent.validation.validateBundleReadyForUpload)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidationAnimationPackFolderStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)
local getFFlagUGCValidationAnimationPackDisableModelStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackDisableModelStructure)
local getFFlagUGCValidationAnimationPackMissingTypeMessageModule = require(parent.flags.getFFlagUGCValidationAnimationPackMissingTypeMessage)
local legacyValidationAdapterModule = require(parent.util.LegacyValidationAdapter)
local httpService = game:GetService("HttpService")

local function hasExactStringValueNames(p1, p2)
	local t = {}
	
	for i, v in p2 do
		t[v] = true
	end
	local t_1 = {}
	
	for i_1, v_1 in p1:GetChildren() do
		if v_1:IsA("StringValue") then
			if t[v_1.Name] and not t_1[v_1.Name] then
				t_1[v_1.Name] = true
				continue
			end
			return false
		end
	end
	for i_2, v_1 in p2 do
		if not t_1[v_1] then
			return false
		end
	end
	return true
end

return function(p3, p4, p5, p6, p7, p8)
	-- upvalues: promiseModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), getFFlagUGCValidationAnimationPackDisableModelStructureModule (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref), hasExactStringValueNames (ref), getFFlagUGCValidationAnimationPackMissingTypeMessageModule (ref), errorSourceStringsModule (ref), httpService (ref), createEditableInstancesForContextModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref)
	p6 = p6 or function() end
	assert(p6 ~= nil, "Luau")
	
	if not p3:IsA("Model") then
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
	local t_3
	local t = {}
	
	if getFFlagUGCValidationAnimationPackSupportModule() and constantsModule.ANIMATION_ASSET_INFO then
		local t_1 = {}
		local t_2 = {}
		
		if getFFlagUGCValidationAnimationPackDisableModelStructureModule() or getFFlagUGCValidationAnimationPackFolderStructureModule() and p3:FindFirstChild("R15Anim") ~= nil then
			local var1
			t_3 = {}
			
			for i, v in constantsModule.ANIMATION_ASSET_INFO do
				var1 = false
				
				for i_1, v_2 in p3:GetChildren() do
					if not t_3[v_2] and (v_2.Name == "R15Anim" and (v_2:IsA("Folder") and hasExactStringValueNames(v_2, v.stringValueNames))) then
						t[i] = { v_2 }
						t_3[v_2] = true
						var1 = true
						break
					end
				end
				if not var1 then
					table.insert(t_2, i.Name)
				end
			end
			for i_1, v_1 in p3:GetChildren() do
				if not t_3[v_1] and (v_1.Name ~= "R15Anim" or not getFFlagUGCValidationAnimationPackMissingTypeMessageModule()) then
					table.insert(t_1, v_1.Name)
				end
			end
		else
			local t_3 = {}
			
			for i, v in constantsModule.ANIMATION_ASSET_INFO do
				t_3[v.modelName] = true
			end
			for i_1, v_1 in constantsModule.ANIMATION_ASSET_INFO do
				local modelName = p3:FindFirstChild(v_1.modelName)
				
				if modelName then
					t[i_1] = { modelName }
				end
			end
			for i_2, v_2 in p3:GetChildren() do
				if not t_3[v_2.Name] then
					table.insert(t_1, v_2.Name)
				end
			end
		end
		if getFFlagUGCValidationAnimationPackMissingTypeMessageModule() and #t_2 > 0 then
			return promiseModule.resolve({
				errors = {
					{
						assetType = nil,
						error = {
							type = "message",
							message = string.gsub(errorSourceStringsModule.Values.AnimationPack_InvalidR15AnimChildren, "{missingAnimationTypes}", table.concat(t_2, ", "))
						}
					}
				},
				pieces = {}
			})
		elseif #t_1 > 0 then
			return promiseModule.resolve({
				errors = {
					{
						assetType = nil,
						error = {
							type = "message",
							message = string.gsub(errorSourceStringsModule.Values.AnimationPack_UnexpectedBundleChildren, "{unexpectedNames}", table.concat(t_1, ", "))
						}
					}
				},
				pieces = {}
			})
		end
	end
	local t_1 = {}
	local t_2 = {}
	t_3 = {}
	
	for i, v_1 in p4[p5].allowedAssetTypeSettings do
		local var2 = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if v_1.isEligibleForUpload then
			local var3 = t[var2]
			local var4 = var3 and var3[1]
			t_1[var2] = {
				assetType = var2,
				instance = var4,
				settings = v_1,
				status = if var4 == nil then "finished" else "pending"
			}
			
			if var4 == nil then
				table.insert(t_2, { assetType = var2, error = { type = "notFound" } })
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
	p6(t_4)
	local var5 = httpService:GenerateGUID()
	
	return promiseModule.each(t_3, function(p9, p10)
		-- upvalues: p7 (ref), p8 (ref), createEditableInstancesForContextModule (copy), legacyValidationAdapterModule (copy), var5 (ref), destroyEditableInstancesModule (copy), t_4 (write), p6 (write)
		if p9.status == "finished" then return end
		local var6, var7
		assert(p9.instance ~= nil, "Unfinished piece doesn't have an instance")
		local _ = nil
		local _ = nil
		local list = { p9.instance }
		local t = {
			instances = list,
			assetTypeEnum = p9.assetType,
			allowEditableInstances = p7,
			bypassFlags = p8
		}
		local var8, var9 = createEditableInstancesForContextModule.processAll(list, p7)
		
		if var8 then
			t.editableMeshes = var9.editableMeshes
			t.editableImages = var9.editableImages
			local var10, var11 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var5, true, nil)
			var7 = var10
			var6 = var11
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var6 = var9
			var7 = false
		end
		t_4 = table.clone(t_4)
		t_4.errors = table.clone(t_4.errors)
		
		if not var7 then
			assert(var6 ~= nil, "Failure without errors")
			
			for i, v in var6 do
				table.insert(t_4.errors, {
					assetType = p9.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_4.pieces = table.clone(t_4.pieces)
		t_4.pieces[p10].status = "finished"
		p6(t_4)
	end):andThen(function()
		-- upvalues: t_4 (write), p7 (ref), p8 (ref), createEditableInstancesForContextModule (copy), getFFlagUGCValidationAnimationPackSupportModule (copy), legacyValidationAdapterModule (copy), var5 (ref), destroyEditableInstancesModule (copy), p6 (write)
		local function createFullBodyData(p11)
			local t = {}
			
			for i, v in p11 do
				table.insert(t, {
					assetTypeEnum = v.assetType,
					allSelectedInstances = if v.instance then { v.instance } else {}
				})
			end
			return t
		end
		
		local _ = nil
		local _ = nil
		local var12 = createFullBodyData(t_4.pieces)
		local t = {
			isServer = false,
			fullBodyData = var12,
			allowEditableInstances = p7,
			bypassFlags = p8
		}
		local t_1 = {}
		
		for i, v in var12 do
			for i_1, v_1 in v.allSelectedInstances do
				table.insert(t_1, v_1)
			end
		end
		local var13, var14
		local var15, var16 = createEditableInstancesForContextModule.processAll(t_1, p7)
		
		if var15 then
			t.editableMeshes = var16.editableMeshes
			t.editableImages = var16.editableImages
			var14 = true
			var13 = nil
			
			if getFFlagUGCValidationAnimationPackSupportModule() then
				local var17, var18 = legacyValidationAdapterModule.studioRFUBundleValidation(var12, Enum.BundleType.Animations, t, var5, var14, var13)
				var14 = var17
				var13 = var18
			end
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var13 = var16
			var14 = false
		end
		if not var14 then
			t_4 = table.clone(t_4)
			t_4.errors = table.clone(t_4.errors)
			assert(var13 and #var13 > 0, "There should always be a reason for failure")
			
			for i_1, v_1 in var13 do
				table.insert(t_4.errors, {
					assetType = nil,
					error = { type = "message", message = v_1 }
				})
			end
		end
		p6(t_4)
	end):andThen(function()
		-- upvalues: t_4 (write)
		return t_4
	end)
end