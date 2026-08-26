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

local function normalize(p1)
	-- upvalues: string (ref)
	return string.trim(p1:gsub(",+%s+", " "))
end

local function _(p1)
	-- upvalues: normalize (ref)
	return normalize(p1.source.body:sub(p1.start, p1._end))
end

local function processFragments(p1)
	-- upvalues: set (ref), string (ref), var2 (ref), var3 (write), console (ref), object (ref)
	local var5
	local var6 = set.new(nil)
	local t = {}
	
	for i = 1, #p1.definitions do
		var5 = p1.definitions[i]
		
		if var5.kind ~= "FragmentDefinition" then
			table.insert(t, var5)
			continue
		end
		local value = var5.name.value
		local loc = var5.loc
		local var7 = string.trim(loc.source.body:sub(loc.start, loc._end):gsub(",+%s+", " "))
		loc = var2:get(value)
		
		if loc and not loc:has(var7) then
			if var3 then
				console.warn("Warning: fragment with name " .. value .. " already exists.\n" .. "graphql-tag enforces all fragment names across your application to be unique; read more about\n" .. "this in the docs: http://dev.apollodata.com/core/fragments.html#unique-names")
			end
		elseif not loc then
			loc = set.new()
			var2:set(value, loc)
		end
		loc:add(var7)
		
		if not var6:has(var7) then
			var6:add(var7)
			table.insert(t, var5)
		end
	end
	return object.assign({}, p1, { definitions = t })
end

local function stripLoc(p2)
	-- upvalues: set (ref), object (ref), array (ref)
	local var8 = set.new(nil)
	
	for i_1 = 1, #var8 do
		local var9 = var8[i_1]
		
		if var9.loc then
			var8:delete(var9.loc)
		end
		for i = 1, #object.keys(var9) do
			local var10 = var9[tostring(object.keys(var9)[i])]
			
			if var10 and typeof(var10) == "table" and not array.isArray(var10) then
				var8:add(var10)
			end
		end
	end
	local loc = p2.loc
	
	if loc then
		loc.startToken = nil
		loc.endToken = nil
	end
	return p2
end

local function parseDocument(p3)
	-- upvalues: string (ref), var1 (ref), parse (ref), var4 (write), stripLoc (ref), processFragments (ref)
	local var11 = string.trim(p3:gsub(",+%s+", " "))
	
	if not var1:has(var11) then
		local var12 = parse(p3, { experimentalFragmentVariables = var4 })
		
		if not var12 or var12.kind ~= "Document" then
			error("Not a valid GraphQL document.")
		end
		var1:set(var11, stripLoc(processFragments(var12)))
	end
	return var1:get(var11)
end

local function gql(p3)
	-- upvalues: parseDocument (ref)
	if typeof(p3) == "string" then
		return parseDocument(p3)
	elseif typeof(p3) == "table" and p3.kind == "Document" then
		return p3
	end
	error("graphql-tag-lua does not currently support non-strings or Fragments. Please file an issue or PR if you need this feature added.")
end

function resetCaches()
	-- upvalues: var1 (ref), var2 (ref)
	var1:clear()
	var2:clear()
end

function disableFragmentWarnings()
	-- upvalues: var3 (write)
	var3 = false
end

function enableExperimentalFragmentVariables()
	-- upvalues: var4 (write)
	var4 = true
end

function disableExperimentalFragmentVariables()
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