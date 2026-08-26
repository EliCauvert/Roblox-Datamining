local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validationManagerModule = require(parent.validationSystem.ValidationManager)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	LegacyValidator = "LegacyValidator",
	getPrecomputedEditables = function(p1, p2)
		local list = { {}, {} }
		
		for i, v in { p1, p2 } do
			for i_1, v_1 in v do
				for i_2, v_2 in v_1 do
					pcall(function()
						-- upvalues: i_1 (ref), i_2 (ref), list (ref), i (ref), v_2 (ref)
						local var1 = i_1[i_2]
						
						if var1 ~= nil and var1 ~= "" then
							list[i][var1] = v_2.instance
						end
					end)
				end
			end
		end
		return list[1], list[2]
	end
}

local function fallbackLocalizationFunction(p3, p4)
	-- upvalues: errorSourceStringsModule (ref)
	local var1 = if p4 then p4[p3.key] else nil
	
	if var1 == nil then
		local var2 = p3.key:split(".")
		var1 = errorSourceStringsModule.Values[var2[#var2]]
	end
	if var1 == nil then
		return p3.key
	end
	local t = {}
	local t_1 = nil
	
	for i = 1, #var1 do
		local substring = string.sub(var1, i, i)
		
		if substring == "{" then
			t_1 = {}
			continue
		end
		if substring == "}" then
			if t_1 ~= nil then
				local joined = table.concat(t_1)
				
				if p3.params[joined] ~= nil then
					table.insert(t, tostring(p3.params[joined]))
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

local function fetchString(p5, p6, p7)
	-- upvalues: t (ref), fallbackLocalizationFunction (ref)
	if p6.key == t.LegacyValidator then
		return p6.params.Message or ""
	end
	local var3 = nil
	local var4 = nil
	
	if p5 then
		local ok, status = pcall(function()
			-- upvalues: p5 (ref), p6 (ref)
			return p5(p6)
		end)
		var3 = ok
		var4 = status
	end
	return if var3 and var4 ~= p6.key then var4 else fallbackLocalizationFunction(p6, p7)
end

function t.combineResultsIntoLegacy(p5, p6, p7, p8)
	-- upvalues: fetchString (ref), errorSourceStringsModule (ref)
	local var3 = p6
	local pass = p5 and p7.pass
	
	if next(p7.failureMap) ~= nil then
		if var3 == nil then
			var3 = {}
		end
		for i, v in p7.failureMap do
			for i_1, v_1 in v do
				table.insert(var3, fetchString(p8, {
					key = v_1.failureStringKey,
					params = v_1.failureStringParams
				}, p7.relevantSourceStrings))
			end
		end
	end
	if not pass and (var3 == nil or #var3 == 0) then
		if var3 == nil then
			var3 = {}
		end
		table.insert(var3, fetchString(p8, {
			key = errorSourceStringsModule.Keys.InternalError,
			params = { ValidationJobId = p7.validationJobId }
		}, p7.relevantSourceStrings))
	end
	return pass, var3
end

function t.mergeLegacyIntoModern(p9, p10, p11)
	-- upvalues: t (ref)
	p11.pass = p11.pass and p9
	
	if p10 and #p10 > 0 then
		local t_1 = {}
		
		for i, v in p10 do
			if v ~= "" then
				table.insert(t_1, {
					instancePath = "",
					failureStringKey = t.LegacyValidator,
					failureStringParams = { Message = v }
				})
			end
		end
		if #t_1 > 0 then
			p11.failureMap[t.LegacyValidator] = t_1
			p11.numFailures += #t_1
		end
	end
end

function t.studioRFUAssetValidation(value, p12, p13, p14)
	-- upvalues: t (ref), validationManagerModule (ref)
	local var4 = "Toolbox"
	local var5 = if value.bypassFlags then value.bypassFlags.enforceShadowValidations else false
	
	if value.bypassFlags and value.bypassFlags.studioPluginName then
		var4 = value.bypassFlags.studioPluginName
	end
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(value.editableMeshes or {}, value.editableImages or {})
	
	return t.combineResultsIntoLegacy(p13, p14, validationManagerModule.ValidateAsset(value.instances, value.assetTypeEnum, {
		source = var4,
		enforceR15FolderStructure = value.requireAllFolders or false,
		enforceShadowValidations = var5,
		telemetryBundleId = p12,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if value.restrictedUserIds then { restrictedUserIds = value.restrictedUserIds } else nil,
		iecConfigs = if value.token then { token = value.token, universeId = value.universeId } else nil
	}), if value.bypassFlags ~= nil then nil else value.bypassFlags.localizationCallback)
end

function t.studioRFUBundleValidation(p12, p13, p14, p15, p16, p17)
	-- upvalues: t (ref), validationManagerModule (ref)
	local var4 = if p14.bypassFlags and p14.bypassFlags.studioPluginName then p14.bypassFlags.studioPluginName else "Toolbox"
	local var5 = if p14.bypassFlags then p14.bypassFlags.enforceShadowValidations else false
	local precomputedEditables, precomputedEditables_1 = t.getPrecomputedEditables(p14.editableMeshes or {}, p14.editableImages or {})
	local var6 = validationManagerModule.ValidateFinalizedBundle(p12, p13, {
		source = var4,
		enforceR15FolderStructure = p14.requireAllFolders or false,
		enforceShadowValidations = var5,
		telemetryBundleId = p15,
		preloadedEditableMeshes = precomputedEditables,
		preloadedEditableImages = precomputedEditables_1,
		backendConfigs = if p14.restrictedUserIds then { restrictedUserIds = p14.restrictedUserIds } else nil,
		iecConfigs = if p14.token then { token = p14.token, universeId = p14.universeId } else nil
	})
	assert(p14.bypassFlags)
	assert(p14.bypassFlags.localizationCallback)
	
	return t.combineResultsIntoLegacy(p16, p17, var6, if p14.bypassFlags ~= nil then nil else p14.bypassFlags.localizationCallback)
end

return t