local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationManagerModule = require(parent.validationSystem.ValidationManager)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	LegacyValidator = "LegacyValidator",
	getPrecomputedEditables = function(p0, p1)
		local list = { {}, {} }
		
		for i, v in { p0, p1 } do
			for i_1, v_1 in v do
				for i_2, v_2 in v_1 do
					pcall(function()
						-- upvalues: i_1 (ref), i_2 (ref), list (ref), i (ref), v_2 (ref)
						local var6 = i_1[i_2]
						
						if var6 ~= nil and var6 ~= "" then
							list[i][var6] = v_2.instance
						end
					end)
				end
			end
		end
		return list[1], list[2]
	end
}

local function fallbackLocalizationFunction(p2, p3)
	-- upvalues: errorSourceStringsModule (ref)
	local var7 = if p3 then p3[p2.key] else nil
	
	if var7 == nil then
		local var8 = p2.key:split(".")
		var7 = errorSourceStringsModule.Values[var8[#var8]]
	end
	if var7 == nil then
		return p2.key
	end
	local t = {}
	local t_1 = nil
	
	for i = 1, #var7 do
		local substring = string.sub(var7, i, i)
		
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

local function fetchString(p4, p5, p6)
	-- upvalues: t (ref), fallbackLocalizationFunction (ref)
	if p5.key == t.LegacyValidator then
		return p5.params.Message or ""
	end
	local var13 = nil
	local var14 = nil
	
	if p4 then
		local ok, status = pcall(function()
			-- upvalues: p4 (ref), p5 (ref)
			return p4(p5)
		end)
		var13 = ok
		var14 = status
	end
	return if var13 and var14 ~= p5.key then var14 else fallbackLocalizationFunction(p5, p6)
end

function t.combineResultsIntoLegacy(p7, p8, p9, p10)
	-- upvalues: fetchString (ref), errorSourceStringsModule (ref)
	local var15 = p8
	local pass = p7 and p9.pass
	
	if next(p9.failureMap) ~= nil then
		if var15 == nil then
			var15 = {}
		end
		for i, v in p9.failureMap do
			for i_1, v_1 in v do
				table.insert(var15, fetchString(p10, {
					key = v_1.failureStringKey,
					params = v_1.failureStringParams
				}, p9.relevantSourceStrings))
			end
		end
	end
	if not pass and (var15 == nil or #var15 == 0) then
		if var15 == nil then
			var15 = {}
		end
		table.insert(var15, fetchString(p10, {
			key = errorSourceStringsModule.Keys.InternalError,
			params = { ValidationJobId = p9.validationJobId }
		}, p9.relevantSourceStrings))
	end
	return pass, var15
end

function t.mergeLegacyIntoModern(p11, p12, p13)
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

function t.studioRFUAssetValidation(value, p14, p15, p16)
	-- upvalues: t (ref), validationManagerModule (ref)
	local var18 = "Toolbox"
	local var19 = if value.bypassFlags then value.bypassFlags.enforceShadowValidations else false
	
	if value.bypassFlags and value.bypassFlags.studioPluginName then
		var18 = value.bypassFlags.studioPluginName
	end
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(value.editableMeshes or {}, value.editableImages or {})
	
	return t.combineResultsIntoLegacy(p15, p16, validationManagerModule.ValidateAsset(value.instances, value.assetTypeEnum, {
		source = var18,
		enforceR15FolderStructure = value.requireAllFolders or false,
		enforceShadowValidations = var19,
		telemetryBundleId = p14,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if value.restrictedUserIds then { restrictedUserIds = value.restrictedUserIds } else nil,
		iecConfigs = if value.token then { token = value.token, universeId = value.universeId } else nil
	}), if value.bypassFlags ~= nil then nil else value.bypassFlags.localizationCallback)
end

function t.studioRFUBundleValidation(p17, p18, p19, p20, p21, p22)
	-- upvalues: t (ref), validationManagerModule (ref)
	local var22 = if p19.bypassFlags and p19.bypassFlags.studioPluginName then p19.bypassFlags.studioPluginName else "Toolbox"
	local var23 = if p19.bypassFlags then p19.bypassFlags.enforceShadowValidations else false
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(p19.editableMeshes or {}, p19.editableImages or {})
	local var26 = validationManagerModule.ValidateFinalizedBundle(p17, p18, {
		source = var22,
		enforceR15FolderStructure = p19.requireAllFolders or false,
		enforceShadowValidations = var23,
		telemetryBundleId = p20,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if p19.restrictedUserIds then { restrictedUserIds = p19.restrictedUserIds } else nil,
		iecConfigs = if p19.token then { token = p19.token, universeId = p19.universeId } else nil
	})
	assert(p19.bypassFlags)
	assert(p19.bypassFlags.localizationCallback)
	
	return t.combineResultsIntoLegacy(p21, p22, var26, if p19.bypassFlags ~= nil then nil else p19.bypassFlags.localizationCallback)
end

return t