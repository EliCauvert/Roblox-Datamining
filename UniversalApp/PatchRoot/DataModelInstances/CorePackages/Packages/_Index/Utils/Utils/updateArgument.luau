local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local astFromType = require(script.Parent.astFromType).astFromType

function t.updateArgument(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: kind (ref), astFromType (ref), array (ref), object (ref)
	p1[tostring(p4)] = {
		kind = kind.ARGUMENT,
		name = { kind = kind.NAME, value = p4 },
		value = {
			kind = kind.VARIABLE,
			name = { kind = kind.NAME, value = p5 }
		}
	}
	p2[tostring(p5)] = {
		kind = kind.VARIABLE_DEFINITION,
		variable = {
			kind = kind.VARIABLE,
			name = { kind = kind.NAME, value = p5 }
		},
		type = astFromType(p6)
	}
	
	if p7 ~= nil then
		p3[tostring(p5)] = p7
		
		return
	elseif array.indexOf(object.keys(p3), tostring(p5)) ~= -1 then
		p3[tostring(p5)] = nil
	end
end

function t.createVariableNameGenerator(p1)
	-- upvalues: array (ref), object (ref)
	local var1 = 0
	
	return function(p2)
		-- upvalues: var1 (write), array (copy), object (copy), p1 (ref)
		local var2
		local _ = nil
		repeat
			var2 = ("_v%s_%s"):format(tostring(var1), p2)
			var1 += 1
		until array.indexOf(object.keys(p1), tostring(var2)) == -1
		return var2
	end
end

return t