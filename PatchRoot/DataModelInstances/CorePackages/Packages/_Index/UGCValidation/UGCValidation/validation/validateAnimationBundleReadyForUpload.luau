-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:41 2026 Pacific Standard Time.

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
local getFFlagUGCValidationAnimationPackFolderStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)
local getFFlagUGCValidationAnimationPackDisableModelStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackDisableModelStructure)
local getFFlagUGCValidationAnimationPackMissingTypeMessageModule = require(parent.flags.getFFlagUGCValidationAnimationPackMissingTypeMessage)
local legacyValidationAdapterModule = require(parent.util.LegacyValidationAdapter)
local httpService = game:GetService("HttpService")

local function hasExactStringValueNames(p0, p1) --[[ line: 29 ]]
	local t = {}
	
	for i, v in p1 do
		t[v] = true
	end
	local t_1 = {}
	
	for i_1, v_1 in p0:GetChildren() do
		if v_1:IsA("StringValue") then
			if t[v_1.Name] and not t_1[v_1.Name] then
				t_1[v_1.Name] = true
				continue
			end
			return false
		end
	end
	for i_2, v_1 in p1 do
		if not t_1[v_1] then
			return false
		end
	end
	return true
end

return function(p2, p3, p4, p5, p6, p7) --[[ line: 54 | named "validateAnimationBundleReadyForUpload" ]]
	-- upvalues: promiseModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), constantsModule (ref), getFFlagUGCValidationAnimationPackDisableModelStructureModule (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref), hasExactStringValueNames (ref), getFFlagUGCValidationAnimationPackMissingTypeMessageModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidationEnableFolderStructureModule (ref), httpService (ref), createEditableInstancesForContextModule (ref), legacyValidationAdapterModule (ref), destroyEditableInstancesModule (ref)
	p5 = p5 or function() --[[ line: 62 ]] end
	assert(p5 ~= nil, "Luau")
	
	if not p2:IsA("Model") then
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
		
		if getFFlagUGCValidationAnimationPackDisableModelStructureModule() or getFFlagUGCValidationAnimationPackFolderStructureModule() and p2:FindFirstChild("R15Anim") ~= nil then
			local var21
			t_3 = {}
			
			for i, v in constantsModule.ANIMATION_ASSET_INFO do
				var21 = false
				
				for i_1, v_2 in p2:GetChildren() do
					if not t_3[v_2] and (v_2.Name == "R15Anim" and (v_2:IsA("Folder") and hasExactStringValueNames(v_2, v.stringValueNames))) then
						t[i] = { v_2 }
						t_3[v_2] = true
						var21 = true
						break
					end
				end
				if not var21 then
					table.insert(t_2, i.Name)
				end
			end
			for i_1, v_1 in p2:GetChildren() do
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
				local modelName = p2:FindFirstChild(v_1.modelName)
				
				if modelName then
					t[i_1] = { modelName }
				end
			end
			for i_2, v_2 in p2:GetChildren() do
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
	
	for i, v_1 in p3[p4].allowedAssetTypeSettings do
		local var26 = assert(Enum.AssetType[i], "Asset type name doesn't map to an enum item")
		
		if v_1.isEligibleForUpload then
			local var27 = t[var26]
			local var28 = var27 and var27[1]
			t_1[var26] = {
				assetType = var26,
				instance = var28,
				settings = v_1,
				status = if var28 == nil then "finished" else "pending"
			}
			
			if var28 == nil then
				table.insert(t_2, { assetType = var26, error = { type = "notFound" } })
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
	p5(t_4)
	local var25 = if getFFlagUGCValidationEnableFolderStructureModule() then httpService:GenerateGUID() else nil
	
	return promiseModule.each(t_3, function(p9, p10) --[[ line: 251 ]]
		-- upvalues: p6 (ref), p7 (ref), createEditableInstancesForContextModule (copy), getFFlagUGCValidationEnableFolderStructureModule (copy), legacyValidationAdapterModule (copy), var25 (write), destroyEditableInstancesModule (copy), t_4 (write), p5 (write)
		if p9.status == "finished" then return end
		local var44, var45
		assert(p9.instance ~= nil, "Unfinished piece doesn't have an instance")
		local _ = nil
		local _ = nil
		local list = { p9.instance }
		local t = {
			instances = list,
			assetTypeEnum = p9.assetType,
			allowEditableInstances = p6,
			bypassFlags = p7
		}
		local var42, var43 = createEditableInstancesForContextModule.processAll(list, p6)
		
		if var42 then
			t.editableMeshes = var43.editableMeshes
			t.editableImages = var43.editableImages
			var45 = true
			var44 = nil
			
			if getFFlagUGCValidationEnableFolderStructureModule() then
				local var46, var47 = legacyValidationAdapterModule.studioRFUAssetValidation(t, var25, var45, var44)
				var45 = var46
				var44 = var47
			end
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var44 = var43
			var45 = false
		end
		t_4 = table.clone(t_4)
		t_4.errors = table.clone(t_4.errors)
		
		if not var45 then
			assert(var44 ~= nil, "Failure without errors")
			
			for i, v in var44 do
				table.insert(t_4.errors, {
					assetType = p9.assetType,
					error = { type = "message", message = v }
				})
			end
		end
		t_4.pieces = table.clone(t_4.pieces)
		t_4.pieces[p10].status = "finished"
		p5(t_4)
	end):andThen(function() --[[ line: 312 ]]
		-- upvalues: t_4 (write), p6 (ref), p7 (ref), createEditableInstancesForContextModule (copy), getFFlagUGCValidationEnableFolderStructureModule (copy), getFFlagUGCValidationAnimationPackSupportModule (copy), legacyValidationAdapterModule (copy), var25 (write), destroyEditableInstancesModule (copy), p5 (write)
		local function createFullBodyData(p8) --[[ line: 313 ]]
			local t = {}
			
			for i, v in p8 do
				table.insert(t, {
					assetTypeEnum = v.assetType,
					allSelectedInstances = if v.instance then { v.instance } else {}
				})
			end
			return t
		end
		
		local _ = nil
		local _ = nil
		local var30 = createFullBodyData(t_4.pieces)
		local t = {
			isServer = false,
			fullBodyData = var30,
			allowEditableInstances = p6,
			bypassFlags = p7
		}
		local t_1 = {}
		
		for i, v in var30 do
			for i_1, v_1 in v.allSelectedInstances do
				table.insert(t_1, v_1)
			end
		end
		local var35, var36
		local var33, var34 = createEditableInstancesForContextModule.processAll(t_1, p6)
		
		if var33 then
			t.editableMeshes = var34.editableMeshes
			t.editableImages = var34.editableImages
			var36 = true
			var35 = nil
			
			if getFFlagUGCValidationEnableFolderStructureModule() and getFFlagUGCValidationAnimationPackSupportModule() then
				local var37, var38 = legacyValidationAdapterModule.studioRFUBundleValidation(var30, Enum.BundleType.Animations, t, var25, var36, var35)
				var36 = var37
				var35 = var38
			end
			destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
		else
			var35 = var34
			var36 = false
		end
		if not var36 then
			t_4 = table.clone(t_4)
			t_4.errors = table.clone(t_4.errors)
			assert(var35 and #var35 > 0, "There should always be a reason for failure")
			
			for i_1, v_1 in var35 do
				table.insert(t_4.errors, {
					assetType = nil,
					error = { type = "message", message = v_1 }
				})
			end
		end
		p5(t_4)
	end):andThen(function() --[[ line: 386 ]]
		-- upvalues: t_4 (write)
		return t_4
	end)
end