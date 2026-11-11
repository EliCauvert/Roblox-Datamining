local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local _ = require(Parent.GraphQL)
local GetArgumentValuesFunction = require(script.Parent.getArgumentValues).getArgumentValues

local function getDirectivesInExtensions(p1, p2)
	-- upvalues: Array (copy), Object (copy)
	return (Array.reduce(if p2 == nil then { "directives" } else p2, function(None, p3)
		-- upvalues: Object (upval)
		return if None == Object.None or None == nil then nil else None[p3]
	end, if typeof(p1) == "table" and p1.extensions then p1.extensions else Object.None))
end

local function _getDirectiveInExtensions(ReduceResult, Name)
	-- upvalues: Array (copy)
	local FilterResult = Array.filter(ReduceResult, function(p1): boolean
		-- upvalues: Name (copy)
		return p1.name == Name
	end)
	
	return if #FilterResult == 0 then nil else Array.map(FilterResult, function(p1)
		return if p1.args == nil then {} else p1.args
	end)
end

local function getDirectiveInExtensions(p1, p2, p3)
	-- upvalues: Array (copy), Object (copy), Boolean (copy), _getDirectiveInExtensions (copy)
	local ReduceResult = Array.reduce(if p3 == nil then { "directives" } else p3, function(None, p4)
		-- upvalues: Object (upval)
		return if None == Object.None or None == nil then nil else None[p4]
	end, if typeof(p1) == "table" and p1.extensions then p1.extensions else Object.None)
	
	if ReduceResult == nil then
		return nil
	end
	if Boolean.toJSBoolean(Array.isArray(ReduceResult)) then
		return (_getDirectiveInExtensions(ReduceResult, p2))
	end
	local List = {}
	
	for _, value in Object.entries(ReduceResult) do
		local Unpacked, Unpacked2 = table.unpack(value, 1, 2)
		
		if not Boolean.toJSBoolean(Array.isArray(Unpacked2)) then
			table.insert(List, { name = Unpacked, args = Unpacked2 })
			continue
		end
		for _, Args in Unpacked2 do
			table.insert(List, { name = Unpacked, args = Args })
		end
	end
	return (_getDirectiveInExtensions(List, p2))
end

return {
	getDirectivesInExtensions = getDirectivesInExtensions,
	getDirectiveInExtensions = getDirectiveInExtensions,
	getDirectives = function(p4, p5, p6)
		-- upvalues: getDirectivesInExtensions (copy), Boolean (copy), Array (copy), Object (copy), GetArgumentValuesFunction (copy)
		local DirectivesInExtensions = getDirectivesInExtensions(p5, if p6 == nil then { "directives" } else p6)
		
		if DirectivesInExtensions ~= nil and #DirectivesInExtensions > 0 then
			return DirectivesInExtensions
		end
		local ToJSBooleanFunction = Boolean.toJSBoolean
		local GetDirectives = if Boolean.toJSBoolean(p4) then p4.getDirectives else p4
		local ReduceResult = Array.reduce(if ToJSBooleanFunction(GetDirectives) then p4:getDirectives() else {}, function(p7, p8)
			p7[tostring(p8.name)] = p8
			
			return p7
		end, {})
		local ConcatResult = {}
		
		if Boolean.toJSBoolean(p5.astNode) then
			table.insert(ConcatResult, p5.astNode)
		end
		if Array.indexOf(Object.keys(p5), "extensionASTNodes") ~= -1 and Boolean.toJSBoolean(p5.extensionASTNodes) then
			ConcatResult = Array.concat({}, ConcatResult, p5.extensionASTNodes)
		end
		local List = {}
		
		for _, value in ConcatResult do
			if Boolean.toJSBoolean(value.directives) then
				for _, directive in value.directives do
					local ReduceResultEntry = ReduceResult[tostring(directive.name.value)]
					
					if Boolean.toJSBoolean(ReduceResultEntry) then
						table.insert(List, {
							name = directive.name.value,
							args = GetArgumentValuesFunction(ReduceResultEntry, directive)
						})
					end
				end
			end
		end
		return List
	end,
	getDirective = function(p7, p8, p9, p10)
		-- upvalues: getDirectiveInExtensions (copy), Boolean (copy), Array (copy), Object (copy), GetArgumentValuesFunction (copy)
		local DirectiveInExtensions = getDirectiveInExtensions(p8, p9, if p10 == nil then { "directives" } else p10)
		
		if DirectiveInExtensions ~= nil then
			return DirectiveInExtensions
		end
		local ToJSBooleanFunction = Boolean.toJSBoolean
		local GetDirective = if Boolean.toJSBoolean(p7) then p7.getDirective else p7
		local Directive = if ToJSBooleanFunction(GetDirective) then p7:getDirective(p9) else nil
		
		if Directive == nil then
			return nil
		end
		local ConcatResult = {}
		
		if Boolean.toJSBoolean(p8.astNode) then
			table.insert(ConcatResult, p8.astNode)
		end
		if Array.indexOf(Object.keys(p8), "extensionASTNodes") ~= -1 and Boolean.toJSBoolean(p8.extensionASTNodes) then
			ConcatResult = Array.concat({}, ConcatResult, p8.extensionASTNodes)
		end
		local List = {}
		
		for _, value in ConcatResult do
			if Boolean.toJSBoolean(value.directives) then
				for _, directive in value.directives do
					if directive.name.value == p9 then
						table.insert(List, GetArgumentValuesFunction(Directive, directive))
					end
				end
			end
		end
		return if Boolean.toJSBoolean(#List) then List else nil
	end
}