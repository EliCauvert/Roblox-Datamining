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

local function _(p0, p1)
	for i, v in pairs(p0) do
		if v.Name == p1 then
			return v
		end
	end
	return nil
end

local function areTopLevelFoldersCorrect(p2, p3)
	if #p2 ~= #p3 then
		return false
	end
	for i, v in p3 do
		local var13
		for i_1, v_1 in pairs(p2) do
			if v_1.Name == v then
				var13 = v_1
				if not var13 or var13.ClassName ~= "Folder" then
					return false
				end
			end
		end
		var13 = nil
	end
	return true
end

local _ = function(p4, p5)
	local fullName = p4:GetFullName()
	local matchIndex, matchIndex_1 = string.find(fullName, p5 .. "%.")
	assert(matchIndex and matchIndex_1)
	
	return string.sub(fullName, matchIndex_1 + 1, #fullName)
end

local function compareFolderInfo(p6, p7, p8)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var17 = failureReasonsAccumulatorModule.new()
	
	for i, v in p6 do
		if p7[i] == nil or p7[i] ~= v then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_FolderInfoMismatch, nil, p8)
			var17:updateReasons(false, {
				`Attribute {i} has different values in different children folders. You need to use the same value in all folders.`
			})
		end
	end
	return var17:getFinalResults()
end

local function validateFolderAssetIdsMatch(value, p9, p10)
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), compareFolderInfo (ref)
	if #p9 == 1 then
		return true
	end
	local var18 = nil
	local var19 = failureReasonsAccumulatorModule.new()
	
	for i, v in p9 do
		if v ~= constantsModule.FOLDER_NAMES.R6 then
			local var20
			for i_1, v_1 in pairs(value) do
				if v_1.Name == v then
					var20 = v_1
					assert(var20)
					local t = {}
					
					for v_1, v_2 in var20:GetDescendants() do
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
					if var18 then
						var19:updateReasons(compareFolderInfo(var18, t, p10))
						var19:updateReasons(compareFolderInfo(t, var18, p10))
					else
						var18 = t
					end
				end
			end
			var20 = nil
		end
	end
	return var19:getFinalResults()
end

local function validateR6Folder(p11, p12, p13)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref), validateTagsModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validatePropertyRequirementsModule (ref), validateAttributesModule (ref)
	local var25 = failureReasonsAccumulatorModule.new()
	
	if #p11:GetChildren() > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_R6FolderHasChildren, nil, p13)
		var25:updateReasons(false, {
			string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", p12.Name)
		})
	end
	var25:updateReasons(validateTagsModule(p11, p13))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var25:updateReasons(validatePropertyRequirementsModule(p11, p12, p13))
		var25:updateReasons(validateAttributesModule(p11, p13))
	end
	return var25:getFinalResults()
end

return function(p14)
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
		local var27
		for i_1, v_1 in pairs(instances) do
			if v_1.Name == v then
				var27 = v_1
				local i_1, var30
				local var28 = nil
				local _ = nil
				
				if v == constantsModule.FOLDER_NAMES.R6 then
					var29, i_1 = validateR6Folder(var27, assetTypeEnum, p14)
					var28 = var29
					var30 = i_1
				else
					var31, i_1 = validateMeshPartBodyPartModule(var27, createLimbsAndTorsoSchemaModule(assetTypeEnum, v, p14), p14)
					var28 = var31
					var30 = i_1
				end
				if not var28 then
					return var28, var30
				end
			end
		end
		var27 = nil
	end
	return validateFolderAssetIdsMatch(instances, list, p14)
end