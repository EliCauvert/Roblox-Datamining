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

local function _(p1, p2)
	for i, v in pairs(p1) do
		if v.Name == p2 then
			return v
		end
	end
	return nil
end

local function areTopLevelFoldersCorrect(p1, p2)
	if #p1 ~= #p2 then
		return false
	end
	for i, v in p2 do
		local var1
		for i_1, v_1 in pairs(p1) do
			if v_1.Name == v then
				var1 = v_1
				if not var1 or var1.ClassName ~= "Folder" then
					return false
				end
			end
		end
		var1 = nil
	end
	return true
end

local _ = function(p1, p2)
	local fullName = p1:GetFullName()
	local matchIndex, matchIndex_1 = string.find(fullName, p2 .. "%.")
	assert(matchIndex and matchIndex_1)
	
	return string.sub(fullName, matchIndex_1 + 1, #fullName)
end

local function compareFolderInfo(p1, p2, p3)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var1 = failureReasonsAccumulatorModule.new()
	
	for i, v in p1 do
		if p2[i] == nil or p2[i] ~= v then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_FolderInfoMismatch, nil, p3)
			var1:updateReasons(false, {
				`Attribute {i} has different values in different children folders. You need to use the same value in all folders.`
			})
		end
	end
	return var1:getFinalResults()
end

local function validateFolderAssetIdsMatch(value, p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), compareFolderInfo (ref)
	if #p1 == 1 then
		return true
	end
	local var1 = nil
	local var2 = failureReasonsAccumulatorModule.new()
	
	for i, v in p1 do
		if v ~= constantsModule.FOLDER_NAMES.R6 then
			local var3
			for i_1, v_1 in pairs(value) do
				if v_1.Name == v then
					var3 = v_1
					assert(var3)
					local t = {}
					
					for v_1, v_2 in var3:GetDescendants() do
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
					if var1 then
						var2:updateReasons(compareFolderInfo(var1, t, p2))
						var2:updateReasons(compareFolderInfo(t, var1, p2))
					else
						var1 = t
					end
				end
			end
			var3 = nil
		end
	end
	return var2:getFinalResults()
end

local function validateR6Folder(p1, p2, p3)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref), validateTagsModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validatePropertyRequirementsModule (ref), validateAttributesModule (ref)
	local var1 = failureReasonsAccumulatorModule.new()
	
	if #p1:GetChildren() > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_R6FolderHasChildren, nil, p3)
		var1:updateReasons(false, {
			string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", p2.Name)
		})
	end
	var1:updateReasons(validateTagsModule(p1, p3))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var1:updateReasons(validatePropertyRequirementsModule(p1, p2, p3))
		var1:updateReasons(validateAttributesModule(p1, p3))
	end
	return var1:getFinalResults()
end

return function(p1)
	-- upvalues: constantsModule (ref), areTopLevelFoldersCorrect (ref), analyticsModule (ref), validateR6Folder (ref), validateMeshPartBodyPartModule (ref), createLimbsAndTorsoSchemaModule (ref), validateFolderAssetIdsMatch (ref)
	assert(p1.instances ~= nil, "instances required in validationContext for validateLimbsAndTorso")
	local instances = p1.instances
	assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateLimbsAndTorso")
	local requireAllFolders = p1.requireAllFolders
	local assetTypeEnum = p1.assetTypeEnum
	local list = { constantsModule.FOLDER_NAMES.R15ArtistIntent }
	
	if requireAllFolders then
		table.insert(list, constantsModule.FOLDER_NAMES.R15Fixed)
		table.insert(list, constantsModule.FOLDER_NAMES.R6)
	end
	if not areTopLevelFoldersCorrect(instances, list) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_TopLevelFolders, nil, p1)
		
		return false, {
			"Incorrect hierarchy for asset with the following missing folders: " .. table.concat(list, ", ")
		}
	end
	for i, v in list do
		local var1
		for i_1, v_1 in pairs(instances) do
			if v_1.Name == v then
				var1 = v_1
				local i_1, var2
				local var3 = nil
				local _ = nil
				
				if v == constantsModule.FOLDER_NAMES.R6 then
					var29, i_1 = validateR6Folder(var1, assetTypeEnum, p1)
					var3 = var29
					var2 = i_1
				else
					var31, i_1 = validateMeshPartBodyPartModule(var1, createLimbsAndTorsoSchemaModule(assetTypeEnum, v, p1), p1)
					var3 = var31
					var2 = i_1
				end
				if not var3 then
					return var3, var2
				end
			end
		end
		var1 = nil
	end
	return validateFolderAssetIdsMatch(instances, list, p1)
end