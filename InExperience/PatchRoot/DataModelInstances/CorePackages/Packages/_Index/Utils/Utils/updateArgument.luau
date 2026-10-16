local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local Kind = require(Parent.GraphQL).Kind
local AstFromTypeFunction = require(script.Parent.astFromType).astFromType

return {
	updateArgument = function(p1, p2, p3, Value, Value1, p4, p5) --[[ Line: 22 ]]
		-- upvalues: Kind (copy), AstFromTypeFunction (copy), Array (copy), Object (copy)
		p1[tostring(Value)] = {
			kind = Kind.ARGUMENT,
			name = { kind = Kind.NAME, value = Value },
			value = {
				kind = Kind.VARIABLE,
				name = { kind = Kind.NAME, value = Value1 }
			}
		}
		p2[tostring(Value1)] = {
			kind = Kind.VARIABLE_DEFINITION,
			variable = {
				kind = Kind.VARIABLE,
				name = { kind = Kind.NAME, value = Value1 }
			},
			type = AstFromTypeFunction(p4)
		}
		
		if p5 ~= nil then
			p3[tostring(Value1)] = p5
			
			return
		end
		if Array.indexOf(Object.keys(p3), (tostring(Value1))) ~= -1 then
			p3[tostring(Value1)] = nil
		end
	end,
	createVariableNameGenerator = function(p1) --[[ Line: 55 ]]
		-- upvalues: Array (copy), Object (copy)
		local Count = 0
		
		return function(p2): string --[[ Line: 59 ]]
			-- upvalues: Count (ref), Array (upval), Object (upval), p1 (copy)
			local Text = nil
			repeat
				Text = ("_v%s_%s"):format(tostring(Count), p2)
				Count += 1
			until Array.indexOf(Object.keys(p1), (tostring(Text))) == -1
			return Text
		end
	end
}