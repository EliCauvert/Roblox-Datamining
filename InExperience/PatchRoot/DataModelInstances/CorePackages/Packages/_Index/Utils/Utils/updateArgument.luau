local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local astFromType = require(script.Parent.astFromType).astFromType

function t.updateArgument(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: kind (ref), astFromType (ref), array (ref), object (ref)
	p0[tostring(p3)] = {
		kind = kind.ARGUMENT,
		name = { kind = kind.NAME, value = p3 },
		value = {
			kind = kind.VARIABLE,
			name = { kind = kind.NAME, value = p4 }
		}
	}
	p1[tostring(p4)] = {
		kind = kind.VARIABLE_DEFINITION,
		variable = {
			kind = kind.VARIABLE,
			name = { kind = kind.NAME, value = p4 }
		},
		type = astFromType(p5)
	}
	
	if p6 ~= nil then
		p2[tostring(p4)] = p6
		
		return
	elseif array.indexOf(object.keys(p2), tostring(p4)) ~= -1 then
		p2[tostring(p4)] = nil
	end
end

function t.createVariableNameGenerator(p7)
	-- upvalues: array (ref), object (ref)
	local var2 = 0
	
	return function(p8)
		-- upvalues: var2 (write), array (copy), object (copy), p7 (ref)
		local var3
		local _ = nil
		repeat
			var3 = ("_v%s_%s"):format(tostring(var2), p8)
			var2 += 1
		until array.indexOf(object.keys(p7), tostring(var3)) == -1
		return var3
	end
end

return t