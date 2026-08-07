-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:43 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateMeshPartBodyPartModule = require(parent.validation.validateMeshPartBodyPart)
local validateTagsModule = require(parent.validation.validateTags)
local validatePropertyRequirementsModule = require(parent.validation.validatePropertyRequirements)
local validateAttributesModule = require(parent.validation.validateAttributes)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local createLimbsAndTorsoSchemaModule = require(parent.util.createLimbsAndTorsoSchema)
local _ = require(parent.util.Types)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)

local function _(p0, p1) --[[ line: 18 | named "getInstance" ]]
	for i, v in pairs(p0) do
		if v.Name == p1 then
			return v
		end
	end
	return nil
end

local function areTopLevelFoldersCorrect(p2, p3) --[[ line: 27 ]]
	if #p2 ~= #p3 then
		return false
	end
	for i, v in p3 do
		local var14
		for i_1, v_1 in pairs(p2) do
			if v_1.Name == v then
				var14 = v_1
				if not var14 or var14.ClassName ~= "Folder" then
					return false
				end
			end
		end
		var14 = nil
	end
	return true
end

local _ = function(p4, p5) --[[ line: 41 | named "getFullNameWithoutRootFolder" ]]
	local fullName = p4:GetFullName()
	local matchIndex, matchIndex_1 = string.find(fullName, p5 .. "%.")
	assert(matchIndex and matchIndex_1)
	
	return string.sub(fullName, matchIndex_1 + 1, #fullName)
end

local function compareFolderInfo(p6, p7, p8) --[[ line: 48 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var18 = failureReasonsAccumulatorModule.new()
	
	for i, v in p6 do
		if p7[i] == nil or p7[i] ~= v then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_FolderInfoMismatch, nil, p8)
			var18:updateReasons(false, {
				`Attribute {i} has different values in different children folders. You need to use the same value in all folders.`
			})
		end
	end
	return var18:getFinalResults()
end

local function validateFolderAssetIdsMatch(value, p9, p10) --[[ line: 70 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), compareFolderInfo (ref)
	if #p9 == 1 then
		return true
	end
	local var19 = nil
	local var20 = failureReasonsAccumulatorModule.new()
	
	for i, v in p9 do
		if v ~= constantsModule.FOLDER_NAMES.R6 then
			local var21
			for i_1, v_1 in pairs(value) do
				if v_1.Name == v then
					var21 = v_1
					assert(var21)
					local t = {}
					
					for v_1, v_2 in var21:GetDescendants() do
						local className = constantsModule.CONTENT_ID_FIELDS[v_2.ClassName]
						
						if className then
							for i_3, v_3 in className do
								local fullName = v_2:GetFullName()
								local matchIndex, matchIndex_1 = string.find(fullName, v .. "%.")
								assert(matchIndex and matchIndex_1)
								t[string.sub(fullName, matchIndex_1 + 1, #fullName) .. "." .. v_3] = v_2[v_3]
							end
						end
					end
					if var19 then
						var20:updateReasons(compareFolderInfo(var19, t, p10))
						var20:updateReasons(compareFolderInfo(t, var19, p10))
					else
						var19 = t
					end
				end
			end
			var21 = nil
		end
	end
	return var20:getFinalResults()
end

local function validateR6Folder(p11, p12, p13) --[[ line: 113 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref), validateTagsModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validatePropertyRequirementsModule (ref), validateAttributesModule (ref)
	local var26 = failureReasonsAccumulatorModule.new()
	
	if #p11:GetChildren() > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_R6FolderHasChildren, nil, p13)
		var26:updateReasons(false, {
			string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", p12.Name)
		})
	end
	var26:updateReasons(validateTagsModule(p11, p13))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		var26:updateReasons(validatePropertyRequirementsModule(p11, p12, p13))
		var26:updateReasons(validateAttributesModule(p11, p13))
	end
	return var26:getFinalResults()
end

return function(p14) --[[ line: 141 | named "validateLimbsAndTorso" ]]
	-- upvalues: constantsModule (ref), areTopLevelFoldersCorrect (ref), analyticsModule (ref), validateR6Folder (ref), validateMeshPartBodyPartModule (ref), createLimbsAndTorsoSchemaModule (ref), validateFolderAssetIdsMatch (ref)
	assert(p14.instances ~= nil, "instances required in validationContext for validateLimbsAndTorso")
	local instances = p14.instances
	assert(p14.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateLimbsAndTorso")
	local requireAllFolders = p14.requireAllFolders
	local assetTypeEnum = p14.assetTypeEnum
	local list = { constantsModule.FOLDER_NAMES.R15ArtistIntent }
	
	if requireAllFolders then
		table.insert(list, constantsModule.FOLDER_NAMES.R15Fixed)
		table.insert(list, constantsModule.FOLDER_NAMES.R6)
	end
	if not areTopLevelFoldersCorrect(instances, list) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_TopLevelFolders, nil, p14)
		
		return false, {
			"Incorrect hierarchy for asset with the following missing folders: " .. table.concat(list, ", ")
		}
	end
	for i, v in list do
		local var28
		for i_1, v_1 in pairs(instances) do
			if v_1.Name == v then
				var28 = v_1
				local i_1, var31
				local var29 = nil
				local _ = nil
				
				if v == constantsModule.FOLDER_NAMES.R6 then
					var30, i_1 = validateR6Folder(var28, assetTypeEnum, p14)
					var29 = var30
					var31 = i_1
				else
					var32, i_1 = validateMeshPartBodyPartModule(var28, createLimbsAndTorsoSchemaModule(assetTypeEnum, v, p14), p14)
					var29 = var32
					var31 = i_1
				end
				if not var29 then
					return var29, var31
				end
			end
		end
		var28 = nil
	end
	return validateFolderAssetIdsMatch(instances, list, p14)
end