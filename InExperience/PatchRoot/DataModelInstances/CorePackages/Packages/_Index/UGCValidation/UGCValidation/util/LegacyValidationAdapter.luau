local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationManagerModule = require(parent.validationSystem.ValidationManager)
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	LegacyValidator = "LegacyValidator",
	getPrecomputedEditables = function(p0, p1) --[[ line: 57 ]]
		local list = { {}, {} }
		
		for i, v in { p0, p1 } do
			for i_1, v_1 in v do
				for i_2, v_2 in v_1 do
					pcall(function() --[[ line: 66 ]]
						-- upvalues: i_1 (ref), i_2 (ref), list (ref), i (ref), v_2 (ref)
						local var7 = i_1[i_2]
						
						if var7 ~= nil and var7 ~= "" then
							list[i][var7] = v_2.instance
						end
					end)
				end
			end
		end
		return list[1], list[2]
	end
}

local function fallbackLocalizationFunction(p2, p3) --[[ line: 13 ]]
	-- upvalues: errorSourceStringsModule (ref)
	local var8 = if p3 then p3[p2.key] else nil
	
	if var8 == nil then
		local var9 = p2.key:split(".")
		var8 = errorSourceStringsModule.Values[var9[#var9]]
	end
	if var8 == nil then
		return p2.key
	end
	local t = {}
	local t_1 = nil
	
	for i = 1, #var8 do
		local substring = string.sub(var8, i, i)
		
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

local function fetchString(p4, p5, p6) --[[ line: 79 ]]
	-- upvalues: t (ref), fallbackLocalizationFunction (ref)
	if p5.key == t.LegacyValidator then
		return p5.params.Message or ""
	end
	local var14 = nil
	local var15 = nil
	
	if p4 then
		local ok, status = pcall(function() --[[ line: 90 ]]
			-- upvalues: p4 (ref), p5 (ref)
			return p4(p5)
		end)
		var14 = ok
		var15 = status
	end
	return if var14 and var15 ~= p5.key then var15 else fallbackLocalizationFunction(p5, p6)
end

function t.combineResultsIntoLegacy(p7, p8, p9, p10) --[[ line: 103 ]]
	-- upvalues: fetchString (ref), errorSourceStringsModule (ref)
	local var16 = p8
	local pass = p7 and p9.pass
	
	if next(p9.failureMap) ~= nil then
		if var16 == nil then
			var16 = {}
		end
		for i, v in p9.failureMap do
			for i_1, v_1 in v do
				table.insert(var16, fetchString(p10, {
					key = v_1.failureStringKey,
					params = v_1.failureStringParams
				}, p9.relevantSourceStrings))
			end
		end
	end
	if not pass and (var16 == nil or #var16 == 0) then
		if var16 == nil then
			var16 = {}
		end
		table.insert(var16, fetchString(p10, {
			key = errorSourceStringsModule.Keys.InternalError,
			params = { ValidationJobId = p9.validationJobId }
		}, p9.relevantSourceStrings))
	end
	return pass, var16
end

function t.mergeLegacyIntoModern(p11, p12, p13) --[[ line: 147 ]]
	-- upvalues: t (ref)
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

function t.studioRFUAssetValidation(value, p14, p15, p16) --[[ line: 174 ]]
	-- upvalues: t (ref), validationManagerModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref)
	local var19 = "Toolbox"
	local var20 = if value.bypassFlags then value.bypassFlags.enforceShadowValidations else false
	
	if value.bypassFlags and value.bypassFlags.studioPluginName then
		var19 = value.bypassFlags.studioPluginName
	end
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(value.editableMeshes or {}, value.editableImages or {})
	local var23 = validationManagerModule.ValidateAsset(value.instances, value.assetTypeEnum, {
		source = var19,
		enforceR15FolderStructure = value.requireAllFolders or false,
		enforceShadowValidations = var20,
		telemetryBundleId = p14,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if value.restrictedUserIds then { restrictedUserIds = value.restrictedUserIds } else nil,
		iecConfigs = if value.token then { token = value.token, universeId = value.universeId } else nil
	})
	
	if getFFlagUGCValidationCombineEntrypointResultsModule() then
		return t.combineResultsIntoLegacy(p15, p16, var23, if value.bypassFlags ~= nil then nil else value.bypassFlags.localizationCallback)
	end
	return p15, p16
end

function t.studioRFUBundleValidation(p17, p18, p19, p20, p21, p22) --[[ line: 227 ]]
	-- upvalues: t (ref), validationManagerModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref)
	local var24 = if p19.bypassFlags and p19.bypassFlags.studioPluginName then p19.bypassFlags.studioPluginName else "Toolbox"
	local var25 = if p19.bypassFlags then p19.bypassFlags.enforceShadowValidations else false
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(p19.editableMeshes or {}, p19.editableImages or {})
	local var28 = validationManagerModule.ValidateFinalizedBundle(p17, p18, {
		source = var24,
		enforceR15FolderStructure = p19.requireAllFolders or false,
		enforceShadowValidations = var25,
		telemetryBundleId = p20,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if p19.restrictedUserIds then { restrictedUserIds = p19.restrictedUserIds } else nil,
		iecConfigs = if p19.token then { token = p19.token, universeId = p19.universeId } else nil
	})
	
	if getFFlagUGCValidationCombineEntrypointResultsModule() then
		assert(p19.bypassFlags)
		assert(p19.bypassFlags.localizationCallback)
		
		return t.combineResultsIntoLegacy(p21, p22, var28, if p19.bypassFlags ~= nil then nil else p19.bypassFlags.localizationCallback)
	end
	return p21, p22
end

return t