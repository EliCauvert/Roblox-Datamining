local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ConstantsModule = require(WhatsNew.Constants)
local EnumsModule = require(WhatsNew.Enums)
local _ = require(WhatsNew.Types)
local ScopeActionsModule = require(script.Parent.ScopeActions)

local function _(List, p1, p2) --[[ Line: 21 | Named "appendError" ]]
	table.insert(List, `{p1}:{p2}`)
end

local _ = function(p1): boolean --[[ Line: 25 | Named "isNonEmptyString" ]]
	return p1 ~= nil and p1 ~= ""
end

local _ = function(p1) --[[ Line: 29 | Named "isoDateToUnix" ]]
	local _DateTime = DateTime.fromIsoDate(p1)
	
	return _DateTime and _DateTime.UnixTimestamp or nil
end

local _ = function(p1, WhatsNew) --[[ Line: 34 | Named "getRegistryEntries" ]]
	-- upvalues: EnumsModule (copy)
	return if WhatsNew == EnumsModule.TourType.WhatsNew then p1.whatsNew else p1.onboarding
end

local function validateConstants(p1, List) --[[ Line: 41 ]]
	-- upvalues: ConstantsModule (copy)
	local Constants = p1.constants
	
	for i, value in {
		textMaxLength = Constants.textMaxLength,
		maxTourTips = Constants.maxTourTips,
		maxOptOutCount = Constants.maxOptOutCount
	} do
		if typeof(value) ~= "number" or value <= 0 then
			table.insert(List, `{ConstantsModule.ErrorCodes.INVALID_CONSTANTS}:{`{i}`}`)
		end
	end
end

local function validateScopeKeys(p2, List) --[[ Line: 56 ]]
	-- upvalues: ConstantsModule (copy)
	for i, scopeTour in p2.scopeTours do
		if scopeTour.id ~= i then
			table.insert(List, `{ConstantsModule.ErrorCodes.SCOPE_KEY_MISMATCH}:{`{i}->{scopeTour.id}`}`)
		end
	end
end

local function validateEntrySchedule(p3, WhatsNew, List) --[[ Line: 64 ]]
	-- upvalues: ConstantsModule (copy), EnumsModule (copy)
	local Text: string = `{p3.id} ({WhatsNew})`
	local UnixTimestamp = nil
	local UnixTimestamp1 = nil
	local PublishedTime = p3.publishedTime
	
	if PublishedTime ~= nil and PublishedTime ~= "" then
		local _DateTime = DateTime.fromIsoDate(p3.publishedTime)
		UnixTimestamp = _DateTime and _DateTime.UnixTimestamp or nil
		
		if UnixTimestamp == nil then
			table.insert(List, `{ConstantsModule.ErrorCodes.INVALID_PUBLISHED_TIME}:{Text}`)
		end
	else
		table.insert(List, `{ConstantsModule.ErrorCodes.MISSING_PUBLISHED_TIME}:{Text}`)
	end
	if WhatsNew == EnumsModule.TourType.WhatsNew then
		local DisabledTime = p3.disabledTime
		
		if DisabledTime ~= nil and DisabledTime ~= "" then
			local _DateTime = DateTime.fromIsoDate(p3.disabledTime)
			UnixTimestamp1 = _DateTime and _DateTime.UnixTimestamp or nil
			
			if UnixTimestamp1 == nil then
				table.insert(List, `{ConstantsModule.ErrorCodes.INVALID_DISABLED_TIME}:{Text}`)
			end
		else
			table.insert(List, `{ConstantsModule.ErrorCodes.MISSING_DISABLED_TIME}:{Text}`)
		end
	else
		local DisabledTime = p3.disabledTime
		
		if DisabledTime ~= nil and DisabledTime ~= "" then
			local _DateTime = DateTime.fromIsoDate(p3.disabledTime)
			UnixTimestamp1 = _DateTime and _DateTime.UnixTimestamp or nil
			
			if UnixTimestamp1 == nil then
				table.insert(List, `{ConstantsModule.ErrorCodes.INVALID_DISABLED_TIME}:{Text}`)
			end
		end
	end
	if UnixTimestamp ~= nil and UnixTimestamp1 ~= nil and UnixTimestamp1 <= UnixTimestamp then
		table.insert(List, `{ConstantsModule.ErrorCodes.INVALID_SCHEDULE_WINDOW}:{Text}`)
	end
end

local function validateEntryScopes(p3, List) --[[ Line: 99 ]]
	-- upvalues: ConstantsModule (copy), validateEntrySchedule (copy), EnumsModule (copy)
	local function validateEntries(WhatsNew, WhatsNew1) --[[ Line: 100 ]]
		-- upvalues: p3 (copy), List (copy), ConstantsModule (upval), validateEntrySchedule (upval)
		for _, value in WhatsNew do
			if p3.scopeTours[value.scopeId] == nil then
				table.insert(List, `{ConstantsModule.ErrorCodes.UNKNOWN_SCOPE}:{`{value.id} ({WhatsNew1})`}`)
			end
			if p3.constants.textMaxLength < #value.text then
				table.insert(List, `{ConstantsModule.ErrorCodes.TEXT_TOO_LONG}:{`{value.id} ({WhatsNew1})`}`)
			end
			local Title = value.title
			local IsNotTitleMatch: boolean = Title ~= nil and Title ~= ""
			
			if not IsNotTitleMatch then
				local Text = value.text
				IsNotTitleMatch = Text ~= nil and Text ~= ""
			end
			if not IsNotTitleMatch then
				table.insert(List, `{ConstantsModule.ErrorCodes.EMPTY_ENTRY_LABELS}:{`{value.id} ({WhatsNew1})`}`)
			end
			validateEntrySchedule(value, WhatsNew1, List)
		end
	end
	
	for _, value in EnumsModule.TourTypeList do
		validateEntries(if value == EnumsModule.TourType.WhatsNew then p3.whatsNew else p3.onboarding, value)
	end
end

local function validateUniqueEntryIds(p4, List) --[[ Line: 123 ]]
	-- upvalues: EnumsModule (copy), ConstantsModule (copy)
	for _, value in EnumsModule.TourTypeList do
		local t = {}
		local WhatsNew = nil
		local v1 = nil
		local v2 = nil
		
		if value == EnumsModule.TourType.WhatsNew then
			WhatsNew = p4.whatsNew
			v1 = nil
			v2 = nil
		else
			WhatsNew = p4.onboarding
			v1 = nil
			v2 = nil
		end
		for _, value1 in WhatsNew, v1, v2 do
			if t[value1.id] then
				table.insert(List, `{ConstantsModule.ErrorCodes.DUPLICATE_ENTRY_ID}:{`{value1.id} ({value})`}`)
			else
				t[value1.id] = true
			end
		end
	end
end

local function scopeHasEntries(ScopeId, p5): boolean --[[ Line: 136 ]]
	-- upvalues: EnumsModule (copy)
	for _, value in EnumsModule.TourTypeList do
		local WhatsNew = nil
		local v3 = nil
		local v4 = nil
		if value == EnumsModule.TourType.WhatsNew then
			WhatsNew = p5.whatsNew
			v3 = nil
			v4 = nil
		else
			WhatsNew = p5.onboarding
			v3 = nil
			v4 = nil
		end
		for _, value1 in WhatsNew, v3, v4 do
			if value1.scopeId == ScopeId then
				return true
			end
		end
	end
	return false
end

local function validateNestedScopeActions(p6, List) --[[ Line: 148 ]]
	-- upvalues: scopeHasEntries (copy), ConstantsModule (copy)
	for i, scopeTour in p6.scopeTours do
		if scopeTour.parentScopeId ~= nil and scopeHasEntries(i, p6) then
			local OpenActionKey = scopeTour.openActionKey
			
			if OpenActionKey ~= nil and OpenActionKey ~= "" then
				local CloseActionKey = scopeTour.closeActionKey
				
				if CloseActionKey ~= nil and CloseActionKey ~= "" then
					continue
				end
			end
			table.insert(List, `{ConstantsModule.ErrorCodes.NESTED_MISSING_ACTION}:{i}`)
		end
	end
end

local function validateKnownActionKeys(p7, ScopeActions, List) --[[ Line: 164 ]]
	-- upvalues: ScopeActionsModule (copy), ConstantsModule (copy)
	if ScopeActions == nil then return end
	for _, value in ScopeActionsModule.collectRegistryActionKeys(p7) do
		if not ScopeActions:has(value) then
			table.insert(List, `{ConstantsModule.ErrorCodes.UNKNOWN_ACTION_KEY}:{value}`)
		end
	end
end

return function(p8, p9) --[[ Line: 180 | Named "validateRegistry" ]]
	-- upvalues: validateConstants (copy), validateScopeKeys (copy), validateEntryScopes (copy), validateUniqueEntryIds (copy), validateNestedScopeActions (copy), validateKnownActionKeys (copy)
	local Errors = {}
	local Warnings = {}
	local P20 = p9 or {}
	validateConstants(p8, Errors)
	validateScopeKeys(p8, Errors)
	validateEntryScopes(p8, Errors)
	validateUniqueEntryIds(p8, Errors)
	validateNestedScopeActions(p8, Errors)
	validateKnownActionKeys(p8, P20.scopeActions, Errors)
	
	return { errors = Errors, warnings = Warnings }
end