local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local ResultModule = require(Modules.LuaApp.Result)
local AutocompleteSuggestionModule = require(script.Parent.AutocompleteSuggestion)
local GetFIntLuaAppAutocompleteCacheValidityHoursModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAutocompleteCacheValidityHours)
local GetFFlagLuaAppFixAutocompleteEntryDupsModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixAutocompleteEntryDups)

local function _(p1, p2): string
	return tostring(p1.universeId or "_") .. (p1.canonicalTitle or "_") .. (p1.searchQuery or "_") .. "_" .. tostring(p2) .. "_" .. tostring(p1.type)
end

local AutocompleteSuggestionTableModule = {
	new = function()
		return {}
	end
}

function AutocompleteSuggestionTableModule.fromJsonData(p1)
	-- upvalues: GetFFlagLuaAppFixAutocompleteEntryDupsModule (copy), AutocompleteSuggestionTableModule (copy), ResultModule (copy), GetFIntLuaAppAutocompleteCacheValidityHoursModule (copy), AutocompleteSuggestionModule (copy), CryoModule (copy)
	local FFlagLuaAppFixAutocompleteEntryDupsModule = GetFFlagLuaAppFixAutocompleteEntryDupsModule()
	local NewAutocompleteSuggestionTable = AutocompleteSuggestionTableModule.new()
	local AlgorithmName = p1.algorithmName
	local Entries = p1.entries
	
	if type(AlgorithmName) ~= "string" then
		return ResultModule.error("AutocompleteSuggestionTable expects algorithmName to be a string")
	end
	if type(Entries) ~= "table" then
		return ResultModule.error("AutocompleteSuggestionTable expects entries to be a table")
	end
	local NewCurrentTime = tick() + GetFIntLuaAppAutocompleteCacheValidityHoursModule() * 60 * 60
	
	for i = 1, #Entries do
		local Entry = Entries[i]
		local MatchedPrefixes = Entry.matchedPrefixes
		
		if MatchedPrefixes and #MatchedPrefixes > 0 then
			if type(Entry.type) ~= "number" then
				return ResultModule.error("AutocompleteSuggestionTable expects dataEntry.type to be a number")
			end
			local Config = nil
			
			if Entry.type == AutocompleteSuggestionModule.EntryType.Keyword then
				if type(Entry.searchQuery) ~= "string" then
					return ResultModule.error("AutocompleteSuggestionTable expects dataEntry.searchQuery to be a string")
				end
				Config = { type = Entry.type, searchQuery = Entry.searchQuery }
			else
				if Entry.type ~= AutocompleteSuggestionModule.EntryType.Rich then
					return ResultModule.error("AutocompleteSuggestionTable dataEntry.type is unknown")
				end
				if type(Entry.universeId) ~= "number" and type(Entry.universeId) ~= "string" then
					return ResultModule.error("AutocompleteSuggestionTable expects dataEntry.universeId to be a number or string")
				end
				if type(Entry.canonicalTitle) ~= "string" then
					return ResultModule.error("AutocompleteSuggestionTable expects dataEntry.canonicalTitle to be a string")
				end
				Config = {
					type = Entry.type,
					universeId = tostring(Entry.universeId),
					canonicalTitle = Entry.canonicalTitle
				}
			end
			for i1 = 1, #MatchedPrefixes do
				local MatchedPrefix = MatchedPrefixes[i1]
				
				if type(MatchedPrefix.prefix) ~= "string" then
					return ResultModule.error("AutocompleteSuggestionTable expects prefixEntry.prefix to be a string")
				end
				if type(MatchedPrefix.position) ~= "number" then
					return ResultModule.error("AutocompleteSuggestionTable expects prefixEntry.position to be a number")
				end
				local NewAutocompleteSuggestion = NewAutocompleteSuggestionTable[MatchedPrefix.prefix]
				
				if NewAutocompleteSuggestion == nil then
					NewAutocompleteSuggestion = {
						preloadedCache = true,
						prefix = MatchedPrefix.prefix,
						algorithmName = AlgorithmName,
						expirationTime = NewCurrentTime,
						entries = {}
					}
					NewAutocompleteSuggestionTable[MatchedPrefix.prefix] = NewAutocompleteSuggestion
				end
				table.insert(NewAutocompleteSuggestion.entries, if FFlagLuaAppFixAutocompleteEntryDupsModule then CryoModule.Dictionary.join(Config, {
					position = MatchedPrefix.position,
					hash = tostring(Config.universeId or "_") .. (Config.canonicalTitle or "_") .. (Config.searchQuery or "_") .. "_" .. tostring(MatchedPrefix.position) .. "_" .. tostring(Config.type)
				}) else CryoModule.Dictionary.join(Config, { position = MatchedPrefix.position }))
			end
		end
	end
	return ResultModule.success(NewAutocompleteSuggestionTable)
end

return AutocompleteSuggestionTableModule