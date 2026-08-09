local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationManagerModule = require(parent.validationSystem.ValidationManager)
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	LegacyValidator = "LegacyValidator",
	getPrecomputedEditables = function(p0, p1) --[[ line: 59 ]]
		local list = { {}, {} }
		
		for i, v in { p0, p1 } do
			for i_1, v_1 in v do
				for i_2, v_2 in v_1 do
					pcall(function() --[[ line: 68 ]]
						-- upvalues: i_1 (ref), i_2 (ref), list (ref), i (ref), v_2 (ref)
						local var8 = i_1[i_2]
						
						if var8 ~= nil and var8 ~= "" then
							list[i][var8] = v_2.instance
						end
					end)
				end
			end
		end
		return list[1], list[2]
	end
}

local function fallbackLocalizationFunction(p2, p3) --[[ line: 15 ]]
	-- upvalues: errorSourceStringsModule (ref)
	local var9 = if p3 then p3[p2.key] else nil
	
	if var9 == nil then
		local var10 = p2.key:split(".")
		var9 = errorSourceStringsModule.Values[var10[#var10]]
	end
	if var9 == nil then
		return p2.key
	end
	local t = {}
	local t_1 = nil
	
	for i = 1, #var9 do
		local substring = string.sub(var9, i, i)
		
		if substring == "{" then
			t_1 = {}
			continue
		end
		if substring == "}" then
			if t_1 ~= nil then
				local joined = table.concat(t_1)
				
				if p2.params[joined] ~= nil then
					table.insert(t, tostring(p2.params[joined]))
				end
				t_1 = nil
			end
		elseif t_1 == nil then
			table.insert(t, substring)
		else
			table.insert(t_1, substring)
		end
	end
	return table.concat(t)
end

local function fetchString(p4, p5, p6) --[[ line: 81 ]]
	-- upvalues: t (ref), fallbackLocalizationFunction (ref)
	if p5.key == t.LegacyValidator then
		return p5.params.Message or ""
	end
	local var15 = nil
	local var16 = nil
	
	if p4 then
		local ok, status = pcall(function() --[[ line: 92 ]]
			-- upvalues: p4 (ref), p5 (ref)
			return p4(p5)
		end)
		var15 = ok
		var16 = status
	end
	return if var15 and var16 ~= p5.key then var16 else fallbackLocalizationFunction(p5, p6)
end

function t.combineResultsIntoLegacy(p7, p8, p9, p10) --[[ line: 105 ]]
	-- upvalues: getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), fetchString (ref), errorSourceStringsModule (ref)
	local var17 = p8
	local pass = p7 and p9.pass
	
	if not getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
		local errorTranslationContexts = p9.errorTranslationContexts
		
		if errorTranslationContexts and #errorTranslationContexts > 0 then
			if var17 == nil then
				var17 = {}
			end
			for i, v in errorTranslationContexts do
				table.insert(var17, fetchString(p10, v))
			end
		end
	elseif next(p9.failureMap) ~= nil then
		if var17 == nil then
			var17 = {}
		end
		for i, v in p9.failureMap do
			for i_1, v_1 in v do
				table.insert(var17, fetchString(p10, {
					key = v_1.failureStringKey,
					params = v_1.failureStringParams
				}, p9.relevantSourceStrings))
			end
		end
	end
	if not pass and (var17 == nil or #var17 == 0) then
		if var17 == nil then
			var17 = {}
		end
		if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
			table.insert(var17, fetchString(p10, {
				key = errorSourceStringsModule.Keys.InternalError,
				params = { ValidationJobId = p9.validationJobId }
			}, p9.relevantSourceStrings))
			
			return pass, var17
		end
		table.insert(var17, fetchString(p10, {
			key = errorSourceStringsModule.Keys.FailureWithoutReason,
			params = {}
		}))
	end
	return pass, var17
end

function t.mergeLegacyIntoModern(p11, p12, p13) --[[ line: 172 ]]
	-- upvalues: getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), t (ref)
	assert(getEngineFeatureEngineUGCValidationExpandReturnSchemaModule(), "mergeLegacyIntoModern requires EngineUGCValidationExpandReturnSchema")
	p13.pass = p13.pass and p11
	
	if p12 and #p12 > 0 then
		local t_1 = {}
		
		for i, v in p12 do
			if v ~= "" then
				table.insert(t_1, {
					instancePath = "",
					failureStringKey = t.LegacyValidator,
					failureStringParams = { Message = v }
				})
			end
		end
		if #t_1 > 0 then
			p13.failureMap[t.LegacyValidator] = t_1
			p13.numFailures += #t_1
		end
	end
end

function t.studioRFUAssetValidation(value, p14, p15, p16) --[[ line: 204 ]]
	-- upvalues: t (ref), validationManagerModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref)
	local var20 = "Toolbox"
	local var21 = if value.bypassFlags then value.bypassFlags.enforceShadowValidations else false
	
	if value.bypassFlags and value.bypassFlags.studioPluginName then
		var20 = value.bypassFlags.studioPluginName
	end
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(value.editableMeshes or {}, value.editableImages or {})
	local var24 = validationManagerModule.ValidateAsset(value.instances, value.assetTypeEnum, {
		source = var20,
		enforceR15FolderStructure = value.requireAllFolders or false,
		enforceShadowValidations = var21,
		telemetryBundleId = p14,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if value.restrictedUserIds then { restrictedUserIds = value.restrictedUserIds } else nil,
		iecConfigs = if value.token then { token = value.token, universeId = value.universeId } else nil
	})
	
	if getFFlagUGCValidationCombineEntrypointResultsModule() then
		return t.combineResultsIntoLegacy(p15, p16, var24, if value.bypassFlags ~= nil then nil else value.bypassFlags.localizationCallback)
	end
	return p15, p16
end

function t.studioRFUBundleValidation(p17, p18, p19, p20, p21, p22) --[[ line: 257 ]]
	-- upvalues: t (ref), validationManagerModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref)
	local var25 = if p19.bypassFlags and p19.bypassFlags.studioPluginName then p19.bypassFlags.studioPluginName else "Toolbox"
	local var26 = if p19.bypassFlags then p19.bypassFlags.enforceShadowValidations else false
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(p19.editableMeshes or {}, p19.editableImages or {})
	local var29 = validationManagerModule.ValidateFinalizedBundle(p17, p18, {
		source = var25,
		enforceR15FolderStructure = p19.requireAllFolders or false,
		enforceShadowValidations = var26,
		telemetryBundleId = p20,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if p19.restrictedUserIds then { restrictedUserIds = p19.restrictedUserIds } else nil,
		iecConfigs = if p19.token then { token = p19.token, universeId = p19.universeId } else nil
	})
	
	if getFFlagUGCValidationCombineEntrypointResultsModule() then
		assert(p19.bypassFlags)
		assert(p19.bypassFlags.localizationCallback)
		
		return t.combineResultsIntoLegacy(p21, p22, var29, if p19.bypassFlags ~= nil then nil else p19.bypassFlags.localizationCallback)
	end
	return p21, p22
end

return t