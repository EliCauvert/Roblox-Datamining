local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local enumsModule = require(whatsNew.Enums)
local _ = require(whatsNew.Types)
local scopeActionsModule = require(script.Parent.ScopeActions)

local function _(p0, p1, p2) --[[ line: 21 | named "appendError" ]]
	table.insert(p0, `{p1}:{p2}`)
end

local _ = function(p3) --[[ line: 25 | named "isNonEmptyString" ]]
	return p3 ~= nil and p3 ~= ""
end

local _ = function(p4, p5) --[[ line: 29 | named "getRegistryEntries" ]]
	-- upvalues: enumsModule (ref)
	return if p5 == enumsModule.TourType.WhatsNew then p4.whatsNew else p4.onboarding
end

local function validateConstants(p6, p7) --[[ line: 36 ]]
	-- upvalues: constantsModule (ref)
	local constants = p6.constants
	
	for i, v in {
		textMaxLength = constants.textMaxLength,
		updateEntryDuration = constants.updateEntryDuration,
		maxTourTips = constants.maxTourTips,
		maxOptOutCount = constants.maxOptOutCount
	} do
		if typeof(v) ~= "number" or v <= 0 then
			table.insert(p7, `{constantsModule.ErrorCodes.INVALID_CONSTANTS}:{`{i}`}`)
		end
	end
end

local function validateScopeKeys(p8, p9) --[[ line: 52 ]]
	-- upvalues: constantsModule (ref)
	for i, v in p8.scopeTours do
		if v.id ~= i then
			table.insert(p9, `{constantsModule.ErrorCodes.SCOPE_KEY_MISMATCH}:{`{i}->{v.id}`}`)
		end
	end
end

local function validateEntryScopes(p10, p11) --[[ line: 60 ]]
	-- upvalues: constantsModule (ref), enumsModule (ref)
	local function validateEntries(p12, p13) --[[ line: 61 ]]
		-- upvalues: p10 (ref), p11 (ref), constantsModule (copy)
		for i, v in p12 do
			if p10.scopeTours[v.scopeId] == nil then
				table.insert(p11, `{constantsModule.ErrorCodes.UNKNOWN_SCOPE}:{`{v.id} ({p13})`}`)
			end
			if p10.constants.textMaxLength < #v.text then
				table.insert(p11, `{constantsModule.ErrorCodes.TEXT_TOO_LONG}:{`{v.id} ({p13})`}`)
			end
			local title = v.title
			local var12 = title ~= nil and title ~= ""
			
			if not var12 then
				local text = v.text
				var12 = text ~= nil and text ~= ""
				
				if not var12 then
					table.insert(p11, `{constantsModule.ErrorCodes.EMPTY_ENTRY_LABELS}:{`{v.id} ({p13})`}`)
				end
			end
		end
	end
	
	for i, v in enumsModule.TourTypeList do
		validateEntries(if v == enumsModule.TourType.WhatsNew then p10.whatsNew else p10.onboarding, v)
	end
end

local function validateUniqueEntryIds(p14, p15) --[[ line: 82 ]]
	-- upvalues: enumsModule (ref), constantsModule (ref)
	for i, v in enumsModule.TourTypeList do
		local whatsNew, var14, var15
		local t = {}
		
		if v == enumsModule.TourType.WhatsNew then
			whatsNew = p14.whatsNew
			var14 = nil
			var15 = nil
		else
			whatsNew = p14.onboarding
			var14 = nil
			var15 = nil
		end
		for i_1, v_1 in whatsNew, var14, var15 do
			if t[v_1.id] then
				table.insert(p15, `{constantsModule.ErrorCodes.DUPLICATE_ENTRY_ID}:{`{v_1.id} ({v})`}`)
			else
				t[v_1.id] = true
			end
		end
	end
end

local function scopeHasEntries(p16, p17) --[[ line: 95 ]]
	-- upvalues: enumsModule (ref)
	for i, v in enumsModule.TourTypeList do
		local whatsNew, var16, var17
		if v == enumsModule.TourType.WhatsNew then
			whatsNew = p17.whatsNew
			var16 = nil
			var17 = nil
		else
			whatsNew = p17.onboarding
			var16 = nil
			var17 = nil
		end
		for i_1, v_1 in whatsNew, var16, var17 do
			if v_1.scopeId == p16 then
				return true
			end
		end
	end
	return false
end

local function validateNestedScopeActions(p18, p19) --[[ line: 107 ]]
	-- upvalues: scopeHasEntries (ref), constantsModule (ref)
	for i, v in p18.scopeTours do
		if v.parentScopeId ~= nil and scopeHasEntries(i, p18) then
			local openActionKey = v.openActionKey
			local var18 = openActionKey ~= nil and openActionKey ~= ""
			
			if var18 then
				local closeActionKey = v.closeActionKey
				var18 = closeActionKey ~= nil and closeActionKey ~= ""
				
				if not var18 then
					table.insert(p19, `{constantsModule.ErrorCodes.NESTED_MISSING_ACTION}:{i}`)
				end
			end
		end
	end
end

local function validateKnownActionKeys(p20, p21, p22) --[[ line: 123 ]]
	-- upvalues: scopeActionsModule (ref), constantsModule (ref)
	if p21 == nil then return end
	for i, v in scopeActionsModule.collectRegistryActionKeys(p20) do
		if not p21:has(v) then
			table.insert(p22, `{constantsModule.ErrorCodes.UNKNOWN_ACTION_KEY}:{v}`)
		end
	end
end

return function(p23, p24) --[[ line: 139 | named "validateRegistry" ]]
	-- upvalues: validateConstants (ref), validateScopeKeys (ref), validateEntryScopes (ref), validateUniqueEntryIds (ref), validateNestedScopeActions (ref), validateKnownActionKeys (ref)
	local t = {}
	local t_1 = {}
	p24 = p24 or {}
	validateConstants(p23, t)
	validateScopeKeys(p23, t)
	validateEntryScopes(p23, t)
	validateUniqueEntryIds(p23, t)
	validateNestedScopeActions(p23, t)
	validateKnownActionKeys(p23, p24.scopeActions, t)
	
	return { errors = t, warnings = t_1 }
end