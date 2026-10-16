local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ValidateMeshPartBodyPartModule = require(Parent.validation.validateMeshPartBodyPart)
local ValidateTagsModule = require(Parent.validation.validateTags)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local CreateLimbsAndTorsoSchemaModule = require(Parent.util.createLimbsAndTorsoSchema)
local _ = require(Parent.util.Types)

local function _(List, Name) --[[ Line: 13 | Named "getInstance" ]]
	for _, value in pairs(List) do
		if value.Name == Name then
			return value
		end
	end
	return nil
end

local function areTopLevelFoldersCorrect(Instances, List): boolean --[[ Line: 22 ]]
	if #Instances ~= #List then
		return false
	end
	local Folder = nil
	for _, value in List do
		Folder = nil
		
		for _, instance in pairs(Instances) do
			if instance.Name == value then
				Folder = instance
				break
			end
		end
		if not Folder or Folder.ClassName ~= "Folder" then
			return false
		end
	end
	return true
end

local _ = function(Object, Text): string --[[ Line: 36 | Named "getFullNameWithoutRootFolder" ]]
	local FullName: string = Object:GetFullName()
	local StartIndex, EndIndex = string.find(FullName, Text .. "%.")
	assert(StartIndex and EndIndex)
	
	return (string.sub(FullName, EndIndex + 1, #FullName))
end

local function compareFolderInfo(List, p1, p2) --[[ Line: 43 ]]
	-- upvalues: FailureReasonsAccumulatorModule (copy), AnalyticsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for i, value in List do
		if p1[i] == nil or p1[i] ~= value then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLimbsAndTorso_FolderInfoMismatch, nil, p2)
			NewFailureReasonsAccumulator:updateReasons(false, {
				`Attribute {i} has different values in different children folders. You need to use the same value in all folders.`
			})
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

local function validateFolderAssetIdsMatch(Instances, List, p3) --[[ Line: 65 ]]
	-- upvalues: FailureReasonsAccumulatorModule (copy), ConstantsModule (copy), compareFolderInfo (copy)
	if #List == 1 then
		return true
	end
	local v1 = nil
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local Object = nil
	
	for _, value in List do
		if value ~= ConstantsModule.FOLDER_NAMES.R6 then
			Object = nil
			
			for _, instance in pairs(Instances) do
				if instance.Name == value then
					Object = instance
					break
				end
			end
			assert(Object)
			local t = {}
			
			for _, descendant in Object:GetDescendants() do
				local CONTENTIDFIELD = ConstantsModule.CONTENT_ID_FIELDS[descendant.ClassName]
				
				if CONTENTIDFIELD then
					for _, value1 in CONTENTIDFIELD do
						local FullName: string = descendant:GetFullName()
						local StartIndex, EndIndex = string.find(FullName, value .. "%.")
						assert(StartIndex and EndIndex)
						t[string.sub(FullName, EndIndex + 1, #FullName) .. "." .. value1] = descendant[value1]
					end
				end
			end
			if v1 then
				NewFailureReasonsAccumulator:updateReasons(compareFolderInfo(v1, t, p3))
				NewFailureReasonsAccumulator:updateReasons(compareFolderInfo(t, v1, p3))
			else
				v1 = t
			end
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

local function validateR6Folder(Object, AssetTypeEnum, p4) --[[ Line: 108 ]]
	-- upvalues: FailureReasonsAccumulatorModule (copy), AnalyticsModule (copy), ValidateTagsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if #Object:GetChildren() > 0 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLimbsAndTorso_R6FolderHasChildren, nil, p4)
		NewFailureReasonsAccumulator:updateReasons(false, {
			string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", AssetTypeEnum.Name)
		})
	end
	NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(Object, p4))
	
	return NewFailureReasonsAccumulator:getFinalResults()
end

return function(p4) --[[ Line: 130 | Named "validateLimbsAndTorso" ]]
	-- upvalues: ConstantsModule (copy), areTopLevelFoldersCorrect (copy), AnalyticsModule (copy), validateR6Folder (copy), ValidateMeshPartBodyPartModule (copy), CreateLimbsAndTorsoSchemaModule (copy), validateFolderAssetIdsMatch (copy)
	assert(p4.instances ~= nil, "instances required in validationContext for validateLimbsAndTorso")
	local Instances = p4.instances
	assert(p4.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateLimbsAndTorso")
	local AssetTypeEnum = p4.assetTypeEnum
	local List = { ConstantsModule.FOLDER_NAMES.R15ArtistIntent }
	
	if p4.requireAllFolders then
		table.insert(List, ConstantsModule.FOLDER_NAMES.R15Fixed)
		table.insert(List, ConstantsModule.FOLDER_NAMES.R6)
	end
	if not areTopLevelFoldersCorrect(Instances, List) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateLimbsAndTorso_TopLevelFolders, nil, p4)
		
		return false, {
			"Incorrect hierarchy for asset with the following missing folders: " .. table.concat(List, ", ")
		}
	end
	local ValidateR6FolderResult = nil
	local ValidateR6FolderResult2 = nil
	local v2 = nil
	for _, value in List do
		v2 = nil
		
		for _, instance in pairs(Instances) do
			if instance.Name == value then
				v2 = instance
				break
			end
		end
		if value == ConstantsModule.FOLDER_NAMES.R6 then
			ValidateR6FolderResult, ValidateR6FolderResult2 = validateR6Folder(v2, AssetTypeEnum, p4)
		else
			ValidateR6FolderResult, ValidateR6FolderResult2 = ValidateMeshPartBodyPartModule(v2, CreateLimbsAndTorsoSchemaModule(AssetTypeEnum, value, p4), p4)
		end
		if not ValidateR6FolderResult then
			return ValidateR6FolderResult, ValidateR6FolderResult2
		end
	end
	return validateFolderAssetIdsMatch(Instances, List, p4)
end