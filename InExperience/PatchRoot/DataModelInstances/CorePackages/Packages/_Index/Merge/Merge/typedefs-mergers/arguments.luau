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

function t.mergeArguments(p0, p1, p2)
	-- upvalues: deduplicateArguments (write), array (ref), isSome (ref), compareNodes (ref)
	local var4 = deduplicateArguments(array.filter(array.concat({}, p1, p0), isSome))
	
	if p2 and p2.sort then
		array.sort(var4, compareNodes)
	end
	return var4
end

deduplicateArguments = function(p3)
	-- upvalues: array (ref), boolean (ref)
	return array.reduce(p3, function(p4, p5)
		-- upvalues: array (copy), boolean (copy)
		return if boolean.toJSBoolean(array.find(p4, function(p6)
			-- upvalues: p5 (ref)
			return p6.name.value == p5.name.value
		end)) then p4 else array.concat(p4, { p5 })
	end, {})
end

return t