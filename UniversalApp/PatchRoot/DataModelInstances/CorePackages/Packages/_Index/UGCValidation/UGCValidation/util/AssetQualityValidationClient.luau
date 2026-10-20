local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local CreateUGCBodyPartFoldersModule = require(Parent.util.createUGCBodyPartFolders)
local FixUpPreValidationModule = require(Parent.util.fixUpPreValidation)
local HttpService = game:GetService("HttpService")
local AssetQualityValidationClientModule = {
	getAssetQualityService = function()
		return game:GetService("AssetQualityService")
	end,
	buildSettings = function(p1)
		-- upvalues: HttpService (copy)
		local Options = { ConsumerName = p1.source }
		
		if p1.intendedBundleType then
			Options.IntendedBundleTypeId = tostring(p1.intendedBundleType.Value)
		end
		if p1.validateSingleAssetsInBundle then
			Options.ValidateSingleAssetsInBundle = "true"
		end
		if p1.backendConfigs then
			Options.LegacyValidationConfigs = HttpService:JSONEncode({
				allowedCreators = p1.backendConfigs.restrictedUserIds,
				universeId = p1.backendConfigs.universeId,
				isUserInTrustedCreatorProgram = p1.backendConfigs.isUserInTrustedCreatorProgram,
				isEmissiveAllowed = p1.backendConfigs.isEmissiveAllowed
			})
		end
		local config = { postQualitySteps = { "validation" }, options = Options }
		
		if p1.mode then
			config.mode = p1.mode
		end
		return config
	end,
	createSingleAssetInput = function(p1, AssetType)
		-- upvalues: FixUpPreValidationModule (copy)
		local Success, Result = pcall(FixUpPreValidationModule, p1)
		
		if not Success then
			error(Result, 0)
		end
		local Model = Instance.new("Model")
		Model.Name = p1.Name
		Result.Parent = Model
		
		return { model = Model, assetType = AssetType }
	end,
	createBodyInputs = function(p1, p2, p3)
		-- upvalues: FixUpPreValidationModule (copy), CreateUGCBodyPartFoldersModule (copy)
		local FixUpPreValidationModuleResult = FixUpPreValidationModule(p1)
		local List = {}
		local Success, Result = pcall(function()
			-- upvalues: CreateUGCBodyPartFoldersModule (upval), FixUpPreValidationModuleResult (copy), p2 (copy), p3 (copy), List (copy)
			for AssetType, value in CreateUGCBodyPartFoldersModule(FixUpPreValidationModuleResult, p2, p3, true) do
				local Model = Instance.new("Model")
				
				for _, value1 in value do
					value1.Parent = Model
				end
				table.insert(List, { model = Model, assetType = AssetType })
			end
		end)
		FixUpPreValidationModuleResult:Destroy()
		
		if not Success then
			for _, value in List do
				value.model:Destroy()
			end
			error(Result, 0)
		end
		return List
	end
}

function AssetQualityValidationClientModule.fetch(List, p4)
	-- upvalues: AssetQualityValidationClientModule (copy), HttpService (copy)
	local AssetQualityService = AssetQualityValidationClientModule.getAssetQualityService()
	local List1 = {}
	local List2 = {}
	
	for _, SingleAssetInput in List do
		table.insert(List1, SingleAssetInput.model)
		table.insert(List2, SingleAssetInput.assetType.Value)
	end
	local Success, Result = pcall(function()
		-- upvalues: AssetQualityService (copy), List1 (copy), List2 (copy), AssetQualityValidationClientModule (upval), p4 (copy), HttpService (upval)
		local AssetQualityValidationRawFromModelsAsync = AssetQualityService:FetchAssetQualityValidationRawFromModelsAsync(List1, List2, AssetQualityValidationClientModule.buildSettings(p4))
		
		if typeof(AssetQualityValidationRawFromModelsAsync) == "table" and typeof(AssetQualityValidationRawFromModelsAsync.error) == "string" then
			local TaskId = if typeof(AssetQualityValidationRawFromModelsAsync.taskId) == "string" then AssetQualityValidationRawFromModelsAsync.taskId else nil
			error(if TaskId then `{AssetQualityValidationRawFromModelsAsync.error} (taskId: {TaskId})` else AssetQualityValidationRawFromModelsAsync.error, 0)
		end
		local ValidationRawJson = if typeof(AssetQualityValidationRawFromModelsAsync) == "table" then AssetQualityValidationRawFromModelsAsync.validationRawJson else nil
		
		if typeof(ValidationRawJson) ~= "string" then
			error("AssetQualityService returned no validationRawJson", 0)
		end
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, ValidationRawJson)
		
		if not Success or typeof(Result) ~= "table" then
			error("Failed to decode validationRawJson from AssetQualityService", 0)
		end
		return Result
	end)
	
	for _, value in List do
		value.model:Destroy()
	end
	if not Success then
		error(Result, 0)
	end
	local v1: boolean = #List == 1 or p4.validateSingleAssetsInBundle == true
	local List3 = {}
	
	for i, ValidationData in Result do
		table.insert(List3, {
			validationData = ValidationData,
			assetType = if v1 and List[i] then List[i].assetType else nil
		})
	end
	return List3
end

return AssetQualityValidationClientModule