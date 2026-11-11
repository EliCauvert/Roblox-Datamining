local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local AddAutocompleteSuggestionModule = require(Modules.LuaApp.Actions.AddAutocompleteSuggestion)
local AddAutocompleteSuggestionTableModule = require(Modules.LuaApp.Actions.AddAutocompleteSuggestionTable)
local GetFFlagLuaAppFixAutocompleteEntryDupsModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixAutocompleteEntryDups)

local function comparePositions(A, B): boolean
	return A.position < B.position
end

local function mergeEntries(Entries, Entries1)
	local t = {}
	local List = {}
	
	for _, entry in ipairs(Entries) do
		t[entry.hash] = entry
	end
	for _, value in ipairs(Entries1) do
		t[value.hash] = value
	end
	for _, value1 in pairs(t) do
		table.insert(List, value1)
	end
	return List
end

return function(p1, p2)
	-- upvalues: AddAutocompleteSuggestionModule (copy), CryoModule (copy), AddAutocompleteSuggestionTableModule (copy), GetFFlagLuaAppFixAutocompleteEntryDupsModule (copy), mergeEntries (copy), comparePositions (copy)
	local P4 = p1 or {}
	
	if p2.type == AddAutocompleteSuggestionModule.name then
		P4 = CryoModule.Dictionary.join(P4, { [p2.prefix] = p2.autocompleteSuggestion })
		
		return P4
	end
	if p2.type == AddAutocompleteSuggestionTableModule.name then
		local t = {}
		
		for i, value in pairs(p2.suggestionTable) do
			local Entry = P4[i]
			
			if not Entry then
				table.sort(value.entries, comparePositions)
				t[i] = value
			elseif Entry.preloadedCache then
				local MergeEntriesResult = if GetFFlagLuaAppFixAutocompleteEntryDupsModule() then mergeEntries(Entry.entries, value.entries) else CryoModule.List.join(Entry.entries, value.entries)
				table.sort(MergeEntriesResult, comparePositions)
				Entry.entries = MergeEntriesResult
				t[i] = Entry
			end
		end
		P4 = CryoModule.Dictionary.join(P4, t)
	end
	return P4
end