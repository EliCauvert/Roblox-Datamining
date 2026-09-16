local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local createUGCBodyPartFoldersModule = require(parent.util.createUGCBodyPartFolders)
local fixUpPreValidationModule = require(parent.util.fixUpPreValidation)
local httpService = game:GetService("HttpService")
local t = {
	getAssetQualityService = function()
		return game:GetService("AssetQualityService")
	end,
	buildSettings = function(value)
		-- upvalues: httpService (ref)
		local t = { ConsumerName = value.source }
		
		if value.intendedBundleType then
			t.IntendedBundleTypeId = tostring(value.intendedBundleType.Value)
		end
		if value.validateSingleAssetsInBundle then
			t.ValidateSingleAssetsInBundle = "true"
		end
		if value.backendConfigs then
			t.LegacyValidationConfigs = httpService:JSONEncode({
				allowedCreators = value.backendConfigs.restrictedUserIds,
				universeId = value.backendConfigs.universeId,
				isUserInTrustedCreatorProgram = value.backendConfigs.isUserInTrustedCreatorProgram,
				isEmissiveAllowed = value.backendConfigs.isEmissiveAllowed
			})
		end
		local t_1 = { postQualitySteps = { "validation" }, options = t }
		
		if value.mode then
			t_1.mode = value.mode
		end
		return t_1
	end,
	createSingleAssetInput = function(value, p1)
		-- upvalues: fixUpPreValidationModule (ref)
		local ok, status = pcall(fixUpPreValidationModule, value)
		
		if not ok then
			error(status, 0)
		end
		local model = Instance.new("Model")
		model.Name = value.Name
		status.Parent = model
		
		return { model = model, assetType = p1 }
	end,
	createBodyInputs = function(p1, p2, p3)
		-- upvalues: fixUpPreValidationModule (ref), createUGCBodyPartFoldersModule (ref)
		local var1 = fixUpPreValidationModule(p1)
		local t = {}
		local ok, status = pcall(function()
			-- upvalues: createUGCBodyPartFoldersModule (copy), var1 (ref), p2 (ref), p3 (ref), t (ref)
			for i, v in createUGCBodyPartFoldersModule(var1, p2, p3, true) do
				local model = Instance.new("Model")
				
				for i_1, v_1 in v do
					v_1.Parent = model
				end
				table.insert(t, { model = model, assetType = i })
			end
		end)
		var1:Destroy()
		
		if not ok then
			for i, v in t do
				v.model:Destroy()
			end
			error(status, 0)
		end
		return t
	end
}

function t.fetch(p4, p5)
	-- upvalues: t (ref), httpService (ref)
	local assetQualityService = t.getAssetQualityService()
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p4 do
		table.insert(t_1, v.model)
		table.insert(t_2, v.assetType.Value)
	end
	local ok, status = pcall(function()
		-- upvalues: assetQualityService (ref), t_1 (ref), t_2 (ref), t (copy), p5 (ref), httpService (copy)
		local var2 = assetQualityService:FetchAssetQualityValidationRawFromModelsAsync(t_1, t_2, t.buildSettings(p5))
		
		if typeof(var2) == "table" and typeof(var2.error) == "string" then
			local var3 = if typeof(var2.taskId) == "string" then var2.taskId else nil
			error(if var3 then `{var2.error} (taskId: {var3})` else var2.error, 0)
		end
		local var4 = if typeof(var2) == "table" then var2.validationRawJson else nil
		
		if typeof(var4) ~= "string" then
			error("AssetQualityService returned no validationRawJson", 0)
		end
		local ok, status = pcall(httpService.JSONDecode, httpService, var4)
		
		if not ok or typeof(status) ~= "table" then
			error("Failed to decode validationRawJson from AssetQualityService", 0)
		end
		return status
	end)
	
	for i_1, v_1 in p4 do
		v_1.model:Destroy()
	end
	if not ok then
		error(status, 0)
	end
	local var2 = if #p4 ~= 1 then p5.validateSingleAssetsInBundle == true else true
	local t_3 = {}
	
	for i_2, v_2 in status do
		table.insert(t_3, {
			validationData = v_2,
			assetType = if var2 and p4[i_2] then p4[i_2].assetType else nil
		})
	end
	return t_3
end

return t