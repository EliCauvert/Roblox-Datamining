local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ResultModule = require(Modules.LuaApp.Result)
local GetFIntLuaAppAutocompleteCacheValidityHoursModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAutocompleteCacheValidityHours)
local AutocompleteSuggestionModule = {
	EntryType = { Rich = 0, Keyword = 1 },
	new = function()
		return { expirationTime = 0 }
	end
}

function AutocompleteSuggestionModule.fromJsonData(p1)
	-- upvalues: ResultModule (copy), AutocompleteSuggestionModule (copy), GetFIntLuaAppAutocompleteCacheValidityHoursModule (copy)
	if type(p1.prefix) ~= "string" then
		return ResultModule.error("AutocompleteSuggestion.fromJsonData expects prefix to be a string")
	end
	if type(p1.algorithmName) ~= "string" then
		return ResultModule.error("AutocompleteSuggestion.fromJsonData expects algorithmName to be a string")
	end
	local NewAutocompleteSuggestion = AutocompleteSuggestionModule.new()
	NewAutocompleteSuggestion.prefix = p1.prefix
	NewAutocompleteSuggestion.algorithmName = p1.algorithmName
	NewAutocompleteSuggestion.entries = {}
	
	for i = 1, #p1.entries do
		local Entry = p1.entries[i]
		
		if type(Entry.type) ~= "number" then
			return ResultModule.error("AutocompleteSuggestion.entries expects entry.type to be a number")
		end
		if Entry.type == AutocompleteSuggestionModule.EntryType.Keyword then
			if type(Entry.searchQuery) ~= "string" then
				return ResultModule.error("AutocompleteSuggestion.entries expects entry.searchQuery to be a string")
			end
			table.insert(NewAutocompleteSuggestion.entries, { type = Entry.type, searchQuery = Entry.searchQuery })
		elseif Entry.type == AutocompleteSuggestionModule.EntryType.Rich then
			if type(Entry.universeId) ~= "number" and type(Entry.universeId) ~= "string" then
				return ResultModule.error("AutocompleteSuggestion.entries expects entry.universeId to be a number or string")
			end
			if type(Entry.canonicalTitle) ~= "string" then
				return ResultModule.error("AutocompleteSuggestion.entries expects entry.canonicalTitle to be a string")
			end
			table.insert(NewAutocompleteSuggestion.entries, {
				type = Entry.type,
				universeId = tostring(Entry.universeId),
				canonicalTitle = Entry.canonicalTitle
			})
		end
	end
	NewAutocompleteSuggestion.expirationTime = tick() + GetFIntLuaAppAutocompleteCacheValidityHoursModule() * 60 * 60
	
	return ResultModule.success(NewAutocompleteSuggestion)
end

function AutocompleteSuggestionModule.fromJsonDataAvatar(p2)
	-- upvalues: ResultModule (copy), AutocompleteSuggestionModule (copy), GetFIntLuaAppAutocompleteCacheValidityHoursModule (copy)
	if type(p2.Args.Prefix) ~= "string" then
		return ResultModule.error("AutocompleteSuggestion.fromJsonDataAvatar expects prefix to be a string")
	end
	if p2.Args.Algo ~= nil and type(p2.Args.Algo) ~= "string" then
		return ResultModule.error("AutocompleteSuggestion.fromJsonDataAvatar expects algorithmName to be a string")
	end
	local NewAutocompleteSuggestion = AutocompleteSuggestionModule.new()
	NewAutocompleteSuggestion.prefix = p2.Args.Prefix
	NewAutocompleteSuggestion.algorithmName = p2.Args.Algo
	NewAutocompleteSuggestion.entries = {}
	
	for i = 1, #p2.Data do
		local Entry = p2.Data[i]
		
		if type(Entry.Query) ~= "string" then
			return ResultModule.error("AutocompleteSuggestion.fromJsonDataAvatar expects entry.Query to be a string")
		end
		table.insert(NewAutocompleteSuggestion.entries, {
			type = AutocompleteSuggestionModule.EntryType.Keyword,
			searchQuery = Entry.Query
		})
	end
	NewAutocompleteSuggestion.expirationTime = tick() + GetFIntLuaAppAutocompleteCacheValidityHoursModule() * 60 * 60
	
	return ResultModule.success(NewAutocompleteSuggestion)
end

return AutocompleteSuggestionModule