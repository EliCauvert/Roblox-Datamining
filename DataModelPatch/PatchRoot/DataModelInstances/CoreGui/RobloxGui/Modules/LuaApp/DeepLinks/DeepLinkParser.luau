local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local ParseQueryModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.StringUtilities.ParseQuery)
local PreserveCasePathsModule = require(script.Parent.PreserveCasePaths)

local function matchPath(Pattern, Text: string)
	local List = { string.find(Text, Pattern) }
	
	if #List > 0 then
		table.remove(List, 1)
		table.remove(List, 1)
		
		return List
	else
		return nil
	end
end

local function findMatch(p1, Mappings)
	-- upvalues: matchPath (copy)
	local Iterator = ipairs
	local Mappings1 = Mappings or {}
	local Unpacked2 = nil
	local MatchPathResult = nil
	for _, value in Iterator(Mappings1) do
		local Unpacked
		Unpacked, Unpacked2 = unpack(value)
		MatchPathResult = matchPath(Unpacked, p1)
		
		if MatchPathResult then
			return Unpacked2, MatchPathResult
		end
	end
	return nil
end

local function defaultListKeyMapper(Text): string
	return Text .. "[]"
end

local function resolveUrl(p2, Mappings, Keymapper, Text: string)
	-- upvalues: ArgCheckModule (copy), findMatch (copy), ParseQueryModule (copy)
	ArgCheckModule.isType(Text, "string", "url")
	local Unpacked, Unpacked2 = unpack(string.split(Text, "?"))
	local Match, Match2 = findMatch(Unpacked, Mappings)
	
	if type(Match) == "function" then
		table.insert(Match2, (ParseQueryModule(Unpacked2, Keymapper)))
		table.insert(Match2, p2)
		
		return Match(unpack(Match2))
	else
		warn("DeepLinkParser: URL not supported: " .. Unpacked)
		
		return {}
	end
end

function preserveCase(Text: string): boolean
	-- upvalues: PreserveCasePathsModule (copy)
	local Unpacked, _ = unpack(string.split(Text, "?"))
	
	for _, value in pairs(PreserveCasePathsModule) do
		if Unpacked == value then
			return true
		end
	end
	return false
end

local DeepLinkParserModule = {}
DeepLinkParserModule.__index = DeepLinkParserModule

function DeepLinkParserModule.new(p2, p3)
	-- upvalues: defaultListKeyMapper (copy), DeepLinkParserModule (copy)
	local config = {
		mappings = p2 or {},
		keymapper = p3 or defaultListKeyMapper
	}
	setmetatable(config, DeepLinkParserModule)
	
	return config
end

function DeepLinkParserModule:resolve(Text: string, p2)
	-- upvalues: resolveUrl (copy)
	if not preserveCase(Text) then
		Text = string.lower(Text)
	end
	return resolveUrl(p2, self.mappings, self.keymapper, Text)
end

function DeepLinkParserModule:matches(Text: string): boolean
	-- upvalues: findMatch (copy)
	return type((findMatch(unpack(string.split(string.lower(Text), "?")), self.mappings))) == "function"
end

return DeepLinkParserModule