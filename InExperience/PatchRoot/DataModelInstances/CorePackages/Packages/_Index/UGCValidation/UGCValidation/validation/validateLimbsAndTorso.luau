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

local function areTopLevelFoldersCorrect(p3, p4)
	if #p3 ~= #p4 then
		return false
	end
	for i, v in p4 do
		local var1
		for i_1, v_1 in pairs(p3) do
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

local _ = function(p5, p6)
	local fullName = p5:GetFullName()
	local matchIndex, matchIndex_1 = string.find(fullName, p6 .. "%.")
	assert(matchIndex and matchIndex_1)
	
	return string.sub(fullName, matchIndex_1 + 1, #fullName)
end

local function compareFolderInfo(p5, p6, p7)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local var2 = failureReasonsAccumulatorModule.new()
	
	for i, v in p5 do
		if p6[i] == nil or p6[i] ~= v then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_FolderInfoMismatch, nil, p7)
			var2:updateReasons(false, {
				`Attribute {i} has different values in different children folders. You need to use the same value in all folders.`
			})
		end
	end
	return var2:getFinalResults()
end

local function validateFolderAssetIdsMatch(value, p8, p9)
	-- upvalues: failureReasonsAccumulatorModule (ref), constantsModule (ref), compareFolderInfo (ref)
	if #p8 == 1 then
		return true
	end
	local var3 = nil
	local var4 = failureReasonsAccumulatorModule.new()
	
	for i, v in p8 do
		if v ~= constantsModule.FOLDER_NAMES.R6 then
			local var5
			for i_1, v_1 in pairs(value) do
				if v_1.Name == v then
					var5 = v_1
					assert(var5)
					local t = {}
					
					for v_1, v_2 in var5:GetDescendants() do
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
					if var3 then
						var4:updateReasons(compareFolderInfo(var3, t, p9))
						var4:updateReasons(compareFolderInfo(t, var3, p9))
					else
						var3 = t
					end
				end
			end
			var5 = nil
		end
	end
	return var4:getFinalResults()
end

local function validateR6Folder(p10, p11, p12)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref), validateTagsModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validatePropertyRequirementsModule (ref), validateAttributesModule (ref)
	local var6 = failureReasonsAccumulatorModule.new()
	
	if #p10:GetChildren() > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_R6FolderHasChildren, nil, p12)
		var6:updateReasons(false, {
			string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", p11.Name)
		})
	end
	var6:updateReasons(validateTagsModule(p10, p12))
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var6:updateReasons(validatePropertyRequirementsModule(p10, p11, p12))
		var6:updateReasons(validateAttributesModule(p10, p12))
	end
	return var6:getFinalResults()
end

return function(p10)
	-- upvalues: constantsModule (ref), areTopLevelFoldersCorrect (ref), analyticsModule (ref), validateR6Folder (ref), validateMeshPartBodyPartModule (ref), createLimbsAndTorsoSchemaModule (ref), validateFolderAssetIdsMatch (ref)
	assert(p10.instances ~= nil, "instances required in validationContext for validateLimbsAndTorso")
	local instances = p10.instances
	assert(p10.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateLimbsAndTorso")
	local requireAllFolders = p10.requireAllFolders
	local assetTypeEnum = p10.assetTypeEnum
	local list = { constantsModule.FOLDER_NAMES.R15ArtistIntent }
	
	if requireAllFolders then
		table.insert(list, constantsModule.FOLDER_NAMES.R15Fixed)
		table.insert(list, constantsModule.FOLDER_NAMES.R6)
	end
	if not areTopLevelFoldersCorrect(instances, list) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateLimbsAndTorso_TopLevelFolders, nil, p10)
		
		return false, {
			"Incorrect hierarchy for asset with the following missing folders: " .. table.concat(list, ", ")
		}
	end
	for i, v in list do
		local var6
		for i_1, v_1 in pairs(instances) do
			if v_1.Name == v then
				var6 = v_1
				local i_1, var7
				local var8 = nil
				local _ = nil
				
				if v == constantsModule.FOLDER_NAMES.R6 then
					var29, i_1 = validateR6Folder(var6, assetTypeEnum, p10)
					var8 = var29
					var7 = i_1
				else
					var31, i_1 = validateMeshPartBodyPartModule(var6, createLimbsAndTorsoSchemaModule(assetTypeEnum, v, p10), p10)
					var8 = var31
					var7 = i_1
				end
				if not var8 then
					return var8, var7
				end
			end
		end
		var6 = nil
	end
	return validateFolderAssetIdsMatch(instances, list, p10)
end