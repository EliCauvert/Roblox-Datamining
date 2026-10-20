local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationManagerModule = require(Parent.validationSystem.ValidationManager)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function fallbackLocalizationFunction(p1, p2)
	-- upvalues: ErrorSourceStringsModule (copy)
	local Text = if p2 then p2[p1.key] else nil
	
	if Text == nil then
		local v1 = p1.key:split(".")
		Text = ErrorSourceStringsModule.Values[v1[#v1]]
	end
	if Text == nil then
		return p1.key
	end
	local List1 = {}
	local List = nil
	
	for i = 1, #Text do
		local Segment = string.sub(Text, i, i)
		
		if Segment == "{" then
			List = {}
		elseif Segment == "}" then
			if List ~= nil then
				local Joined = table.concat(List)
				
				if p1.params[Joined] ~= nil then
					table.insert(List1, (tostring(p1.params[Joined])))
				end
				List = nil
			end
		elseif List == nil then
			table.insert(List1, Segment)
		else
			table.insert(List, Segment)
		end
	end
	return table.concat(List1)
end

local LegacyValidationAdapterModule = {
	LegacyValidator = "LegacyValidator",
	getPrecomputedEditables = function(EditableMeshes, EditableImages)
		local list = { {}, {} }
		
		for i, value in { EditableMeshes, EditableImages } do
			for i1, value1 in value do
				for i2, value2 in value1 do
					pcall(function()
						-- upvalues: i1 (copy), i2 (copy), list (copy), i (copy), value2 (copy)
						local Entry = i1[i2]
						
						if Entry ~= nil and Entry ~= "" then
							list[i][Entry] = value2.instance
						end
					end)
				end
			end
		end
		return list[1], list[2]
	end
}

local function fetchString(Callback, p3, RelevantSourceStrings)
	-- upvalues: LegacyValidationAdapterModule (copy), fallbackLocalizationFunction (copy)
	if p3.key == LegacyValidationAdapterModule.LegacyValidator then
		return p3.params.Message or ""
	end
	local v2 = nil
	local Key = nil
	
	if Callback then
		v2, Key = pcall(function()
			-- upvalues: Callback (copy), p3 (copy)
			return Callback(p3)
		end)
	end
	return if v2 and Key ~= p3.key then Key else fallbackLocalizationFunction(p3, RelevantSourceStrings)
end

function LegacyValidationAdapterModule.combineResultsIntoLegacy(p3, p4, ValidateAssetResult, LocalizationCallback)
	-- upvalues: fetchString (copy), ErrorSourceStringsModule (copy)
	local List = p4
	local Pass = p3 and ValidateAssetResult.pass
	
	if next(ValidateAssetResult.failureMap) ~= nil then
		if List == nil then
			List = {}
		end
		for _, value in ValidateAssetResult.failureMap do
			for _, value1 in value do
				table.insert(List, fetchString(LocalizationCallback, {
					key = value1.failureStringKey,
					params = value1.failureStringParams
				}, ValidateAssetResult.relevantSourceStrings))
			end
		end
	end
	if not Pass and (List == nil or #List == 0) then
		if List == nil then
			List = {}
		end
		table.insert(List, fetchString(LocalizationCallback, {
			key = ErrorSourceStringsModule.Keys.InternalError,
			params = { ValidationJobId = ValidateAssetResult.validationJobId }
		}, ValidateAssetResult.relevantSourceStrings))
	end
	return Pass, List
end

function LegacyValidationAdapterModule.mergeLegacyIntoModern(p5, List, p6)
	-- upvalues: LegacyValidationAdapterModule (copy)
	p6.pass = p6.pass and p5
	
	if List and #List > 0 then
		local List1 = {}
		
		for _, Message in List do
			if Message ~= "" then
				table.insert(List1, {
					instancePath = "",
					failureStringKey = LegacyValidationAdapterModule.LegacyValidator,
					failureStringParams = { Message = Message }
				})
			end
		end
		if #List1 > 0 then
			p6.failureMap[LegacyValidationAdapterModule.LegacyValidator] = List1
			p6.numFailures += #List1
		end
	end
end

function LegacyValidationAdapterModule.studioRFUAssetValidation(p7, TelemetryBundleId, p8, p9)
	-- upvalues: LegacyValidationAdapterModule (copy), ValidationManagerModule (copy)
	local StudioPluginName = "Toolbox"
	local EnforceShadowValidations = p7.bypassFlags and p7.bypassFlags.enforceShadowValidations or false
	
	if p7.bypassFlags and p7.bypassFlags.studioPluginName then
		StudioPluginName = p7.bypassFlags.studioPluginName
	end
	local PrecomputedEditables, PrecomputedEditables2 = LegacyValidationAdapterModule.getPrecomputedEditables(p7.editableMeshes or {}, p7.editableImages or {})
	
	return LegacyValidationAdapterModule.combineResultsIntoLegacy(p8, p9, ValidationManagerModule.ValidateAsset(p7.instances, p7.assetTypeEnum, {
		source = StudioPluginName,
		enforceR15FolderStructure = p7.requireAllFolders or false,
		enforceShadowValidations = EnforceShadowValidations,
		telemetryBundleId = TelemetryBundleId,
		preloadedEditableMeshes = PrecomputedEditables,
		preloadedEditableImages = PrecomputedEditables2,
		backendConfigs = if p7.restrictedUserIds then { restrictedUserIds = p7.restrictedUserIds } else nil,
		iecConfigs = if p7.token then { token = p7.token, universeId = p7.universeId } else nil
	}), if p7.bypassFlags == nil then nil else p7.bypassFlags.localizationCallback)
end

function LegacyValidationAdapterModule.studioRFUBundleValidation(p7, p8, p9, TelemetryBundleId, p10, p11)
	-- upvalues: LegacyValidationAdapterModule (copy), ValidationManagerModule (copy)
	local StudioPluginName = if p9.bypassFlags and p9.bypassFlags.studioPluginName then p9.bypassFlags.studioPluginName else "Toolbox"
	local EnforceShadowValidations = p9.bypassFlags and p9.bypassFlags.enforceShadowValidations or false
	local PrecomputedEditables, PrecomputedEditables2 = LegacyValidationAdapterModule.getPrecomputedEditables(p9.editableMeshes or {}, p9.editableImages or {})
	local ValidateFinalizedBundleResult = ValidationManagerModule.ValidateFinalizedBundle(p7, p8, {
		source = StudioPluginName,
		enforceR15FolderStructure = p9.requireAllFolders or false,
		enforceShadowValidations = EnforceShadowValidations,
		telemetryBundleId = TelemetryBundleId,
		preloadedEditableMeshes = PrecomputedEditables,
		preloadedEditableImages = PrecomputedEditables2,
		backendConfigs = if p9.restrictedUserIds then { restrictedUserIds = p9.restrictedUserIds } else nil,
		iecConfigs = if p9.token then { token = p9.token, universeId = p9.universeId } else nil
	})
	assert(p9.bypassFlags)
	assert(p9.bypassFlags.localizationCallback)
	
	return LegacyValidationAdapterModule.combineResultsIntoLegacy(p10, p11, ValidateFinalizedBundleResult, if p9.bypassFlags == nil then nil else p9.bypassFlags.localizationCallback)
end

return LegacyValidationAdapterModule