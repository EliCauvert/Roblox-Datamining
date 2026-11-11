local Parent = script.Parent.Parent
local ParseFunction = require(Parent.GraphQL).parse
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Map = LuauPolyfillModule.Map
local Set = LuauPolyfillModule.Set
local String = LuauPolyfillModule.String
local Object = LuauPolyfillModule.Object
local Array = LuauPolyfillModule.Array
local Console = LuauPolyfillModule.console
local NewMap = Map.new(nil)
local NewMap1 = Map.new(nil)
local Flag = true
local ExperimentalFragmentVariables = false

local function normalize(Text: string)
	-- upvalues: String (copy)
	return String.trim((Text:gsub(",+%s+", " ")))
end

local function _(p1)
	-- upvalues: normalize (copy)
	return normalize(p1.source.body:sub(p1.start, p1._end))
end

local function processFragments(p1)
	-- upvalues: Set (copy), String (copy), NewMap1 (copy), Flag (ref), Console (copy), Object (copy)
	local NewSet = Set.new(nil)
	local Definitions = {}
	
	for i = 1, #p1.definitions do
		local Definition = p1.definitions[i]
		
		if Definition.kind ~= "FragmentDefinition" then
			table.insert(Definitions, Definition)
			continue
		end
		local Value = Definition.name.value
		local Loc = Definition.loc
		local TrimResult = String.trim((Loc.source.body:sub(Loc.start, Loc._end):gsub(",+%s+", " ")))
		local GetResult = NewMap1:get(Value)
		
		if GetResult and not GetResult:has(TrimResult) then
			if Flag then
				Console.warn("Warning: fragment with name " .. Value .. " already exists.\n" .. "graphql-tag enforces all fragment names across your application to be unique; read more about\n" .. "this in the docs: http://dev.apollodata.com/core/fragments.html#unique-names")
			end
		elseif not GetResult then
			GetResult = Set.new()
			NewMap1:set(Value, GetResult)
		end
		GetResult:add(TrimResult)
		
		if not NewSet:has(TrimResult) then
			NewSet:add(TrimResult)
			table.insert(Definitions, Definition)
		end
	end
	return Object.assign({}, p1, { definitions = Definitions })
end

local function stripLoc(p2)
	-- upvalues: Set (copy), Object (copy), Array (copy)
	local NewSet = Set.new(nil)
	
	for i = 1, #NewSet do
		local NewSetEntry = NewSet[i]
		
		if NewSetEntry.loc then
			NewSet:delete(NewSetEntry.loc)
		end
		for i1 = 1, #Object.keys(NewSetEntry) do
			local NewSetEntry1 = NewSetEntry[tostring(Object.keys(NewSetEntry)[i1])]
			
			if NewSetEntry1 and typeof(NewSetEntry1) == "table" and not Array.isArray(NewSetEntry1) then
				NewSet:add(NewSetEntry1)
			end
		end
	end
	local Loc = p2.loc
	
	if Loc then
		Loc.startToken = nil
		Loc.endToken = nil
	end
	return p2
end

local function parseDocument(Text: string)
	-- upvalues: String (copy), NewMap (copy), ParseFunction (copy), ExperimentalFragmentVariables (ref), stripLoc (copy), processFragments (copy)
	local TrimResult = String.trim((Text:gsub(",+%s+", " ")))
	
	if not NewMap:has(TrimResult) then
		local ParseResult = ParseFunction(Text, {
			experimentalFragmentVariables = ExperimentalFragmentVariables
		})
		
		if not ParseResult or ParseResult.kind ~= "Document" then
			error("Not a valid GraphQL document.")
		end
		NewMap:set(TrimResult, (stripLoc(processFragments(ParseResult))))
	end
	return (NewMap:get(TrimResult))
end

local function gql(p3)
	-- upvalues: parseDocument (copy)
	if typeof(p3) == "string" then
		return (parseDocument(p3))
	elseif typeof(p3) == "table" and p3.kind == "Document" then
		return p3
	else
		error("graphql-tag-lua does not currently support non-strings or Fragments. Please file an issue or PR if you need this feature added.")
	end
end

function resetCaches()
	-- upvalues: NewMap (copy), NewMap1 (copy)
	NewMap:clear()
	NewMap1:clear()
end

function disableFragmentWarnings()
	-- upvalues: Flag (ref)
	Flag = false
end

function enableExperimentalFragmentVariables()
	-- upvalues: ExperimentalFragmentVariables (ref)
	ExperimentalFragmentVariables = true
end

function disableExperimentalFragmentVariables()
	-- upvalues: ExperimentalFragmentVariables (ref)
	ExperimentalFragmentVariables = false
end

local config = {
	gql = gql,
	resetCaches = resetCaches,
	disableFragmentWarnings = disableFragmentWarnings,
	enableExperimentalFragmentVariables = enableExperimentalFragmentVariables,
	disableExperimentalFragmentVariables = disableExperimentalFragmentVariables
}

return {
	default = gql,
	gql = gql,
	resetCaches = config.resetCaches,
	disableFragmentWarnings = config.disableFragmentWarnings,
	enableExperimentalFragmentVariables = config.enableExperimentalFragmentVariables,
	disableExperimentalFragmentVariables = config.disableExperimentalFragmentVariables
}