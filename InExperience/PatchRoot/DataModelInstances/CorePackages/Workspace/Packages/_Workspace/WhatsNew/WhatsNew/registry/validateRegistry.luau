local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local enumsModule = require(whatsNew.Enums)
local _ = require(whatsNew.Types)
local scopeActionsModule = require(script.Parent.ScopeActions)

local function _(p1, p2, p3)
	table.insert(p1, `{p2}:{p3}`)
end

local _ = function(p1)
	return p1 ~= nil and p1 ~= ""
end

local _ = function(p1)
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime then dateTime.UnixTimestamp else nil
end

local _ = function(p1, p2)
	-- upvalues: enumsModule (ref)
	return if p2 == enumsModule.TourType.WhatsNew then p1.whatsNew else p1.onboarding
end

local function validateConstants(p1, p2)
	-- upvalues: constantsModule (ref)
	local constants = p1.constants
	
	for i, v in {
		textMaxLength = constants.textMaxLength,
		maxTourTips = constants.maxTourTips,
		maxOptOutCount = constants.maxOptOutCount
	} do
		if typeof(v) ~= "number" or v <= 0 then
			table.insert(p2, `{constantsModule.ErrorCodes.INVALID_CONSTANTS}:{`{i}`}`)
		end
	end
end

local function validateScopeKeys(p3, p4)
	-- upvalues: constantsModule (ref)
	for i, v in p3.scopeTours do
		if v.id ~= i then
			table.insert(p4, `{constantsModule.ErrorCodes.SCOPE_KEY_MISMATCH}:{`{i}->{v.id}`}`)
		end
	end
end

local function validateEntrySchedule(p5, p6, p7)
	-- upvalues: constantsModule (ref), enumsModule (ref)
	local id = `{p5.id} ({p6})`
	local var1 = nil
	local var2 = nil
	local publishedTime = p5.publishedTime
	
	if publishedTime ~= nil and publishedTime ~= "" then
		local dateTime = DateTime.fromIsoDate(p5.publishedTime)
		var1 = if dateTime then dateTime.UnixTimestamp else nil
		
		if var1 == nil then
			table.insert(p7, `{constantsModule.ErrorCodes.INVALID_PUBLISHED_TIME}:{id}`)
		end
	else
		table.insert(p7, `{constantsModule.ErrorCodes.MISSING_PUBLISHED_TIME}:{id}`)
	end
	if p6 == enumsModule.TourType.WhatsNew then
		local disabledTime = p5.disabledTime
		
		if disabledTime ~= nil and disabledTime ~= "" then
			local dateTime = DateTime.fromIsoDate(p5.disabledTime)
			var2 = if dateTime then dateTime.UnixTimestamp else nil
			
			if var2 == nil then
				table.insert(p7, `{constantsModule.ErrorCodes.INVALID_DISABLED_TIME}:{id}`)
			end
		else
			table.insert(p7, `{constantsModule.ErrorCodes.MISSING_DISABLED_TIME}:{id}`)
		end
	else
		local disabledTime = p5.disabledTime
		
		if disabledTime ~= nil and disabledTime ~= "" then
			local dateTime = DateTime.fromIsoDate(p5.disabledTime)
			var2 = if dateTime then dateTime.UnixTimestamp else nil
			
			if var2 == nil then
				table.insert(p7, `{constantsModule.ErrorCodes.INVALID_DISABLED_TIME}:{id}`)
			end
		end
	end
	if var1 ~= nil and var2 ~= nil and var2 <= var1 then
		table.insert(p7, `{constantsModule.ErrorCodes.INVALID_SCHEDULE_WINDOW}:{id}`)
	end
end

local function validateEntryScopes(p5, p6)
	-- upvalues: constantsModule (ref), validateEntrySchedule (ref), enumsModule (ref)
	local function validateEntries(p7, p8)
		-- upvalues: p5 (ref), p6 (ref), constantsModule (copy), validateEntrySchedule (copy)
		for i, v in p7 do
			if p5.scopeTours[v.scopeId] == nil then
				table.insert(p6, `{constantsModule.ErrorCodes.UNKNOWN_SCOPE}:{`{v.id} ({p8})`}`)
			end
			if p5.constants.textMaxLength < #v.text then
				table.insert(p6, `{constantsModule.ErrorCodes.TEXT_TOO_LONG}:{`{v.id} ({p8})`}`)
			end
			local title = v.title
			local var1 = title ~= nil and title ~= ""
			
			if not var1 then
				local text = v.text
				var1 = text ~= nil and text ~= ""
				
				if not var1 then
					table.insert(p6, `{constantsModule.ErrorCodes.EMPTY_ENTRY_LABELS}:{`{v.id} ({p8})`}`)
				end
			end
			validateEntrySchedule(v, p8, p6)
		end
	end
	
	for i, v in enumsModule.TourTypeList do
		validateEntries(if v == enumsModule.TourType.WhatsNew then p5.whatsNew else p5.onboarding, v)
	end
end

local function validateUniqueEntryIds(p9, p10)
	-- upvalues: enumsModule (ref), constantsModule (ref)
	for i, v in enumsModule.TourTypeList do
		local whatsNew, var2, var3
		local t = {}
		
		if v == enumsModule.TourType.WhatsNew then
			whatsNew = p9.whatsNew
			var2 = nil
			var3 = nil
		else
			whatsNew = p9.onboarding
			var2 = nil
			var3 = nil
		end
		for i_1, v_1 in whatsNew, var2, var3 do
			if t[v_1.id] then
				table.insert(p10, `{constantsModule.ErrorCodes.DUPLICATE_ENTRY_ID}:{`{v_1.id} ({v})`}`)
			else
				t[v_1.id] = true
			end
		end
	end
end

local function scopeHasEntries(p11, p12)
	-- upvalues: enumsModule (ref)
	for i, v in enumsModule.TourTypeList do
		local whatsNew, var4, var5
		if v == enumsModule.TourType.WhatsNew then
			whatsNew = p12.whatsNew
			var4 = nil
			var5 = nil
		else
			whatsNew = p12.onboarding
			var4 = nil
			var5 = nil
		end
		for i_1, v_1 in whatsNew, var4, var5 do
			if v_1.scopeId == p11 then
				return true
			end
		end
	end
	return false
end

local function validateNestedScopeActions(p13, p14)
	-- upvalues: scopeHasEntries (ref), constantsModule (ref)
	for i, v in p13.scopeTours do
		if v.parentScopeId ~= nil and scopeHasEntries(i, p13) then
			local openActionKey = v.openActionKey
			local var6 = openActionKey ~= nil and openActionKey ~= ""
			
			if var6 then
				local closeActionKey = v.closeActionKey
				var6 = closeActionKey ~= nil and closeActionKey ~= ""
				
				if not var6 then
					table.insert(p14, `{constantsModule.ErrorCodes.NESTED_MISSING_ACTION}:{i}`)
				end
			end
		end
	end
end

local function validateKnownActionKeys(p15, p16, p17)
	-- upvalues: scopeActionsModule (ref), constantsModule (ref)
	if p16 == nil then return end
	for i, v in scopeActionsModule.collectRegistryActionKeys(p15) do
		if not p16:has(v) then
			table.insert(p17, `{constantsModule.ErrorCodes.UNKNOWN_ACTION_KEY}:{v}`)
		end
	end
end

return function(p18, p19)
	-- upvalues: validateConstants (ref), validateScopeKeys (ref), validateEntryScopes (ref), validateUniqueEntryIds (ref), validateNestedScopeActions (ref), validateKnownActionKeys (ref)
	local t = {}
	local t_1 = {}
	p19 = p19 or {}
	validateConstants(p18, t)
	validateScopeKeys(p18, t)
	validateEntryScopes(p18, t)
	validateUniqueEntryIds(p18, t)
	validateNestedScopeActions(p18, t)
	validateKnownActionKeys(p18, p19.scopeActions, t)
	
	return { errors = t, warnings = t_1 }
end