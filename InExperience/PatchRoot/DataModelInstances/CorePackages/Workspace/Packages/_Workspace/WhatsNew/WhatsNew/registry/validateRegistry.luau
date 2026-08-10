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

local _ = function(p4) --[[ line: 29 | named "isoDateToUnix" ]]
	local dateTime = DateTime.fromIsoDate(p4)
	
	return if dateTime then dateTime.UnixTimestamp else nil
end

local _ = function(p5, p6) --[[ line: 34 | named "getRegistryEntries" ]]
	-- upvalues: enumsModule (ref)
	return if p6 == enumsModule.TourType.WhatsNew then p5.whatsNew else p5.onboarding
end

local function validateConstants(p7, p8) --[[ line: 41 ]]
	-- upvalues: constantsModule (ref)
	local constants = p7.constants
	
	for i, v in {
		textMaxLength = constants.textMaxLength,
		maxTourTips = constants.maxTourTips,
		maxOptOutCount = constants.maxOptOutCount
	} do
		if typeof(v) ~= "number" or v <= 0 then
			table.insert(p8, `{constantsModule.ErrorCodes.INVALID_CONSTANTS}:{`{i}`}`)
		end
	end
end

local function validateScopeKeys(p9, p10) --[[ line: 56 ]]
	-- upvalues: constantsModule (ref)
	for i, v in p9.scopeTours do
		if v.id ~= i then
			table.insert(p10, `{constantsModule.ErrorCodes.SCOPE_KEY_MISMATCH}:{`{i}->{v.id}`}`)
		end
	end
end

local function validateEntrySchedule(p11, p12, p13) --[[ line: 64 ]]
	-- upvalues: constantsModule (ref), enumsModule (ref)
	local id = `{p11.id} ({p12})`
	local var14 = nil
	local var15 = nil
	local publishedTime = p11.publishedTime
	
	if publishedTime ~= nil and publishedTime ~= "" then
		local dateTime = DateTime.fromIsoDate(p11.publishedTime)
		var14 = if dateTime then dateTime.UnixTimestamp else nil
		
		if var14 == nil then
			table.insert(p13, `{constantsModule.ErrorCodes.INVALID_PUBLISHED_TIME}:{id}`)
		end
	else
		table.insert(p13, `{constantsModule.ErrorCodes.MISSING_PUBLISHED_TIME}:{id}`)
	end
	if p12 == enumsModule.TourType.WhatsNew then
		local disabledTime = p11.disabledTime
		
		if disabledTime ~= nil and disabledTime ~= "" then
			local dateTime = DateTime.fromIsoDate(p11.disabledTime)
			var15 = if dateTime then dateTime.UnixTimestamp else nil
			
			if var15 == nil then
				table.insert(p13, `{constantsModule.ErrorCodes.INVALID_DISABLED_TIME}:{id}`)
			end
		else
			table.insert(p13, `{constantsModule.ErrorCodes.MISSING_DISABLED_TIME}:{id}`)
		end
	else
		local disabledTime = p11.disabledTime
		
		if disabledTime ~= nil and disabledTime ~= "" then
			local dateTime = DateTime.fromIsoDate(p11.disabledTime)
			var15 = if dateTime then dateTime.UnixTimestamp else nil
			
			if var15 == nil then
				table.insert(p13, `{constantsModule.ErrorCodes.INVALID_DISABLED_TIME}:{id}`)
			end
		end
	end
	if var14 ~= nil and var15 ~= nil and var15 <= var14 then
		table.insert(p13, `{constantsModule.ErrorCodes.INVALID_SCHEDULE_WINDOW}:{id}`)
	end
end

local function validateEntryScopes(p14, p15) --[[ line: 99 ]]
	-- upvalues: constantsModule (ref), validateEntrySchedule (ref), enumsModule (ref)
	local function validateEntries(p16, p17) --[[ line: 100 ]]
		-- upvalues: p14 (ref), p15 (ref), constantsModule (copy), validateEntrySchedule (copy)
		for i, v in p16 do
			if p14.scopeTours[v.scopeId] == nil then
				table.insert(p15, `{constantsModule.ErrorCodes.UNKNOWN_SCOPE}:{`{v.id} ({p17})`}`)
			end
			if p14.constants.textMaxLength < #v.text then
				table.insert(p15, `{constantsModule.ErrorCodes.TEXT_TOO_LONG}:{`{v.id} ({p17})`}`)
			end
			local title = v.title
			local var20 = title ~= nil and title ~= ""
			
			if not var20 then
				local text = v.text
				var20 = text ~= nil and text ~= ""
				
				if not var20 then
					table.insert(p15, `{constantsModule.ErrorCodes.EMPTY_ENTRY_LABELS}:{`{v.id} ({p17})`}`)
				end
			end
			validateEntrySchedule(v, p17, p15)
		end
	end
	
	for i, v in enumsModule.TourTypeList do
		validateEntries(if v == enumsModule.TourType.WhatsNew then p14.whatsNew else p14.onboarding, v)
	end
end

local function validateUniqueEntryIds(p18, p19) --[[ line: 123 ]]
	-- upvalues: enumsModule (ref), constantsModule (ref)
	for i, v in enumsModule.TourTypeList do
		local whatsNew, var22, var23
		local t = {}
		
		if v == enumsModule.TourType.WhatsNew then
			whatsNew = p18.whatsNew
			var22 = nil
			var23 = nil
		else
			whatsNew = p18.onboarding
			var22 = nil
			var23 = nil
		end
		for i_1, v_1 in whatsNew, var22, var23 do
			if t[v_1.id] then
				table.insert(p19, `{constantsModule.ErrorCodes.DUPLICATE_ENTRY_ID}:{`{v_1.id} ({v})`}`)
			else
				t[v_1.id] = true
			end
		end
	end
end

local function scopeHasEntries(p20, p21) --[[ line: 136 ]]
	-- upvalues: enumsModule (ref)
	for i, v in enumsModule.TourTypeList do
		local whatsNew, var24, var25
		if v == enumsModule.TourType.WhatsNew then
			whatsNew = p21.whatsNew
			var24 = nil
			var25 = nil
		else
			whatsNew = p21.onboarding
			var24 = nil
			var25 = nil
		end
		for i_1, v_1 in whatsNew, var24, var25 do
			if v_1.scopeId == p20 then
				return true
			end
		end
	end
	return false
end

local function validateNestedScopeActions(p22, p23) --[[ line: 148 ]]
	-- upvalues: scopeHasEntries (ref), constantsModule (ref)
	for i, v in p22.scopeTours do
		if v.parentScopeId ~= nil and scopeHasEntries(i, p22) then
			local openActionKey = v.openActionKey
			local var26 = openActionKey ~= nil and openActionKey ~= ""
			
			if var26 then
				local closeActionKey = v.closeActionKey
				var26 = closeActionKey ~= nil and closeActionKey ~= ""
				
				if not var26 then
					table.insert(p23, `{constantsModule.ErrorCodes.NESTED_MISSING_ACTION}:{i}`)
				end
			end
		end
	end
end

local function validateKnownActionKeys(p24, p25, p26) --[[ line: 164 ]]
	-- upvalues: scopeActionsModule (ref), constantsModule (ref)
	if p25 == nil then return end
	for i, v in scopeActionsModule.collectRegistryActionKeys(p24) do
		if not p25:has(v) then
			table.insert(p26, `{constantsModule.ErrorCodes.UNKNOWN_ACTION_KEY}:{v}`)
		end
	end
end

return function(p27, p28) --[[ line: 180 | named "validateRegistry" ]]
	-- upvalues: validateConstants (ref), validateScopeKeys (ref), validateEntryScopes (ref), validateUniqueEntryIds (ref), validateNestedScopeActions (ref), validateKnownActionKeys (ref)
	local t = {}
	local t_1 = {}
	p28 = p28 or {}
	validateConstants(p27, t)
	validateScopeKeys(p27, t)
	validateEntryScopes(p27, t)
	validateUniqueEntryIds(p27, t)
	validateNestedScopeActions(p27, t)
	validateKnownActionKeys(p27, p28.scopeActions, t)
	
	return { errors = t, warnings = t_1 }
end