local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local t = {}
local _ = require(parent.GraphQL)
local _ = require(script.Parent["merge-typedefs_types"])
local utilsModule = require(parent.Utils)
local compareNodes = utilsModule.compareNodes
local isSome = utilsModule.isSome
local deduplicateArguments = nil

function t.mergeArguments(p1, p2, p3)
	-- upvalues: deduplicateArguments (write), array (ref), isSome (ref), compareNodes (ref)
	local var1 = deduplicateArguments(array.filter(array.concat({}, p2, p1), isSome))
	
	if p3 and p3.sort then
		array.sort(var1, compareNodes)
	end
	return var1
end

deduplicateArguments = function(p1)
	-- upvalues: array (ref), boolean (ref)
	return array.reduce(p1, function(p2, p3)
		-- upvalues: array (copy), boolean (copy)
		return if boolean.toJSBoolean(array.find(p2, function(p4)
			-- upvalues: p3 (ref)
			return p4.name.value == p3.name.value
		end)) then p2 else array.concat(p2, { p3 })
	end, {})
end

return t