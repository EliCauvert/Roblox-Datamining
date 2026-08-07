-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parse = require(parent.GraphQL).parse
local luauPolyfillModule = require(parent.LuauPolyfill)
local map = luauPolyfillModule.Map
local set = luauPolyfillModule.Set
local string = luauPolyfillModule.String
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array
local console = luauPolyfillModule.console
local var1 = map.new(nil)
local var2 = map.new(nil)
local var3 = true
local var4 = false

local function normalize(p0) --[[ line: 30 ]]
	-- upvalues: string (ref)
	return string.trim(p0:gsub(",+%s+", " "))
end

local function _(p1) --[[ line: 35 | named "cacheKeyFromLoc" ]]
	-- upvalues: normalize (ref)
	return normalize(p1.source.body:sub(p1.start, p1._end))
end

local function processFragments(p2) --[[ line: 39 ]]
	-- upvalues: set (ref), string (ref), var2 (ref), var3 (write), console (ref), object (ref)
	local var13
	local var11 = set.new(nil)
	local t = {}
	
	for i = 1, #p2.definitions do
		var13 = p2.definitions[i]
		
		if var13.kind ~= "FragmentDefinition" then
			table.insert(t, var13)
			continue
		end
		local value = var13.name.value
		local loc = var13.loc
		local var14 = string.trim(loc.source.body:sub(loc.start, loc._end):gsub(",+%s+", " "))
		loc = var2:get(value)
		
		if loc and not loc:has(var14) then
			if var3 then
				console.warn("Warning: fragment with name " .. value .. " already exists.\n" .. "graphql-tag enforces all fragment names across your application to be unique; read more about\n" .. "this in the docs: http://dev.apollodata.com/core/fragments.html#unique-names")
			end
		elseif not loc then
			loc = set.new()
			var2:set(value, loc)
		end
		loc:add(var14)
		
		if not var11:has(var14) then
			var11:add(var14)
			table.insert(t, var13)
		end
	end
	return object.assign({}, p2, { definitions = t })
end

local function stripLoc(p3) --[[ line: 83 ]]
	-- upvalues: set (ref), object (ref), array (ref)
	local var15 = set.new(nil)
	
	for i_1 = 1, #var15 do
		local var16 = var15[i_1]
		
		if var16.loc then
			var15:delete(var16.loc)
		end
		for i = 1, #object.keys(var16) do
			local var17 = var16[tostring(object.keys(var16)[i])]
			
			if var17 and typeof(var17) == "table" and not array.isArray(var17) then
				var15:add(var17)
			end
		end
	end
	local loc = p3.loc
	
	if loc then
		loc.startToken = nil
		loc.endToken = nil
	end
	return p3
end

local function parseDocument(p4) --[[ line: 107 ]]
	-- upvalues: string (ref), var1 (ref), parse (ref), var4 (write), stripLoc (ref), processFragments (ref)
	local var18 = string.trim(p4:gsub(",+%s+", " "))
	
	if not var1:has(var18) then
		local var19 = parse(p4, { experimentalFragmentVariables = var4 })
		
		if not var19 or var19.kind ~= "Document" then
			error("Not a valid GraphQL document.")
		end
		var1:set(var18, stripLoc(processFragments(var19)))
	end
	return var1:get(var18)
end

local function gql(p5) --[[ line: 130 ]]
	-- upvalues: parseDocument (ref)
	if typeof(p5) == "string" then
		return parseDocument(p5)
	elseif typeof(p5) == "table" and p5.kind == "Document" then
		return p5
	end
	error("graphql-tag-lua does not currently support non-strings or Fragments. Please file an issue or PR if you need this feature added.")
end

function resetCaches() --[[ line: 159 ]]
	-- upvalues: var1 (ref), var2 (ref)
	var1:clear()
	var2:clear()
end

function disableFragmentWarnings() --[[ line: 164 ]]
	-- upvalues: var3 (write)
	var3 = false
end

function enableExperimentalFragmentVariables() --[[ line: 168 ]]
	-- upvalues: var4 (write)
	var4 = true
end

function disableExperimentalFragmentVariables() --[[ line: 172 ]]
	-- upvalues: var4 (write)
	var4 = false
end

local t = {
	gql = gql,
	resetCaches = resetCaches,
	disableFragmentWarnings = disableFragmentWarnings,
	enableExperimentalFragmentVariables = enableExperimentalFragmentVariables,
	disableExperimentalFragmentVariables = disableExperimentalFragmentVariables
}

return {
	default = gql,
	gql = gql,
	resetCaches = t.resetCaches,
	disableFragmentWarnings = t.disableFragmentWarnings,
	enableExperimentalFragmentVariables = t.enableExperimentalFragmentVariables,
	disableExperimentalFragmentVariables = t.disableExperimentalFragmentVariables
}