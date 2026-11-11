local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ConstantsModule = require(WhatsNew.Constants)
local EnumsModule = require(WhatsNew.Enums)
local _ = require(WhatsNew.Types)
local ScopeActionsModule = require(script.Parent.ScopeActions)

local function _(List, p1, p2)
	table.insert(List, `{p1}:{p2}`)
end

local _ = function(List, p1, p2)
	table.insert(List, `{p1}:{p2}`)
end

local _ = function(p1): boolean
	return p1 ~= nil and p1 ~= ""
end

local _ = function(p1, WhatsNew)
	-- upvalues: EnumsModule (copy)
	return if WhatsNew == EnumsModule.TourType.WhatsNew then p1.whatsNew else p1.onboarding
end

local function validateConstants(p1, List)
	-- upvalues: ConstantsModule (copy)
	local Constants = p1.constants
	
	for i, value in {
		textMaxLength = Constants.textMaxLength,
		updateEntryDuration = Constants.updateEntryDuration,
		maxTourTips = Constants.maxTourTips,
		maxEntriesPerMenu = Constants.maxEntriesPerMenu,
		maxOptOutCount = Constants.maxOptOutCount
	} do
		if typeof(value) ~= "number" or value <= 0 then
			table.insert(List, `{ConstantsModule.ErrorCodes.INVALID_CONSTANTS}:{`{i}`}`)
		end
	end
end

local function validateScopeKeys(p2, List)
	-- upvalues: ConstantsModule (copy)
	for i, scopeTour in p2.scopeTours do
		if scopeTour.id ~= i then
			table.insert(List, `{ConstantsModule.ErrorCodes.SCOPE_KEY_MISMATCH}:{`{i}->{scopeTour.id}`}`)
		end
	end
end

local function validateEntryScopes(p3, List)
	-- upvalues: ConstantsModule (copy), EnumsModule (copy)
	local function validateEntries(WhatsNew, WhatsNew1)
		-- upvalues: p3 (copy), List (copy), ConstantsModule (upval)
		for _, value in WhatsNew do
			if p3.scopeTours[value.scopeId] == nil then
				table.insert(List, `{ConstantsModule.ErrorCodes.UNKNOWN_SCOPE}:{`{value.id} ({WhatsNew1})`}`)
			end
			if p3.constants.textMaxLength < #value.text then
				table.insert(List, `{ConstantsModule.ErrorCodes.TEXT_TOO_LONG}:{`{value.id} ({WhatsNew1})`}`)
			end
		end
	end
	
	for _, value in EnumsModule.TourTypeList do
		validateEntries(if value == EnumsModule.TourType.WhatsNew then p3.whatsNew else p3.onboarding, value)
	end
end

local function scopeHasEntries(ScopeId, p4): boolean
	-- upvalues: EnumsModule (copy)
	for _, value in EnumsModule.TourTypeList do
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
			if value1.scopeId == ScopeId then
				return true
			end
		end
	end
	return false
end

local function validateNestedScopeActions(p5, List)
	-- upvalues: scopeHasEntries (copy), ConstantsModule (copy)
	for i, scopeTour in p5.scopeTours do
		if scopeTour.parentScopeId ~= nil and scopeHasEntries(i, p5) then
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

local function validateKnownActionKeys(p6, ScopeActions, List)
	-- upvalues: ScopeActionsModule (copy), ConstantsModule (copy)
	if ScopeActions == nil then return end
	for _, value in ScopeActionsModule.collectRegistryActionKeys(p6) do
		if not ScopeActions:has(value) then
			table.insert(List, `{ConstantsModule.ErrorCodes.UNKNOWN_ACTION_KEY}:{value}`)
		end
	end
end

local function validateMenuGroupDeferred(WhatsNew, WhatsNew1, List1)
	-- upvalues: ConstantsModule (copy)
	local t = {}
	
	for i, value in WhatsNew do
		if value.enabled then
			local Text: string = `{value.scopeId}:{value.anchorId}`
			local List = t[Text]
			
			if List == nil then
				List = {}
				t[Text] = List
			end
			table.insert(List, value.id)
		end
	end
	for i, value1 in t do
		if #value1 >= 2 then
			table.insert(List1, `{ConstantsModule.WarningCodes.MENU_GROUP_DEFERRED}:{`{WhatsNew1}:{i}`}`)
		end
	end
end

return function(p7, p8)
	-- upvalues: validateConstants (copy), validateScopeKeys (copy), validateEntryScopes (copy), validateNestedScopeActions (copy), validateKnownActionKeys (copy), EnumsModule (copy), validateMenuGroupDeferred (copy)
	local Errors = {}
	local Warnings = {}
	local P20 = p8 or {}
	validateConstants(p7, Errors)
	validateScopeKeys(p7, Errors)
	validateEntryScopes(p7, Errors)
	validateNestedScopeActions(p7, Errors)
	validateKnownActionKeys(p7, P20.scopeActions, Errors)
	
	for _, value in EnumsModule.TourTypeList do
		validateMenuGroupDeferred(if value == EnumsModule.TourType.WhatsNew then p7.whatsNew else p7.onboarding, value, Warnings)
	end
	return { errors = Errors, warnings = Warnings }
end