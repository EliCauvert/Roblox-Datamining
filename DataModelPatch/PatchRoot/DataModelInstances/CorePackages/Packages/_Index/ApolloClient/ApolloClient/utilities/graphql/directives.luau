local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Array = require(Parent1.LuauPolyfill).Array
local VisitFunction = require(Parent1.GraphQL).visit
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local Callback = nil

local function shouldInclude(p1, p2)
	-- upvalues: Array (copy), Callback (ref), InvariantFunction (copy)
	local Directives = p1.directives
	
	return not Directives or #Directives == 0 or Array.every(Callback(Directives), function(p3)
		-- upvalues: p2 (copy), InvariantFunction (upval)
		local Directive = p3.directive
		local IfArgument = p3.ifArgument
		local v1 = nil
		
		if IfArgument.value.kind == "Variable" then
			v1 = p2 ~= nil and p2[IfArgument.value.name.value]
			InvariantFunction(v1 ~= nil, ("Invalid variable referenced in @%s directive."):format(Directive.name.value))
		else
			v1 = IfArgument.value.value
		end
		return if Directive.name.value == "skip" then not v1 else v1
	end)
end

local function getDirectiveNames(p1)
	-- upvalues: VisitFunction (copy)
	local List = {}
	VisitFunction(p1, {
		Directive = function(_, p2)
			-- upvalues: List (copy)
			table.insert(List, p2.name.value)
		end
	})
	
	return List
end

local function _(p1): boolean
	local Value = p1.name.value
	
	return Value == "skip" or Value == "include"
end

Callback = function(Directives)
	-- upvalues: Array (copy), InvariantFunction (copy)
	local List = {}
	
	if Directives and #Directives > 0 then
		Array.forEach(Directives, function(Directive)
			-- upvalues: InvariantFunction (upval), List (copy)
			local Value = Directive.name.value
			
			if Value ~= "skip" and Value ~= "include" then return end
			local Arguments = Directive.arguments
			local Value1 = Directive.name.value
			
			if not Arguments or #Arguments ~= 1 then
				InvariantFunction(false, ("Incorrect number of arguments for the @%s directive."):format(Value1))
			end
			local Argument = Arguments[1]
			
			if not Argument.name or Argument.name.value ~= "if" then
				InvariantFunction(false, ("Invalid argument for the @%s directive."):format(Value1))
			end
			local Value11 = Argument.value
			
			if not Value11 or Value11.kind ~= "Variable" and Value11.kind ~= "BooleanValue" then
				InvariantFunction(false, ("Argument for the @%s directive must be a variable or a boolean value."):format(Value1))
			end
			table.insert(List, { directive = Directive, ifArgument = Argument })
		end)
	end
	return List
end

return {
	shouldInclude = shouldInclude,
	getDirectiveNames = getDirectiveNames,
	hasDirectives = function(p1, p2)
		-- upvalues: Array (copy), getDirectiveNames (copy)
		return Array.some(getDirectiveNames(p2), function(p3): boolean
			-- upvalues: Array (upval), p1 (copy)
			return Array.indexOf(p1, p3) > -1
		end)
	end,
	hasClientExports = function(p1)
		-- upvalues: Array (copy), getDirectiveNames (copy)
		local SomeResult = false
		
		if p1 ~= nil then
			local list = { "client" }
			SomeResult = Array.some(getDirectiveNames(p1), function(p2): boolean
				-- upvalues: Array (upval), list (copy)
				return Array.indexOf(list, p2) > -1
			end)
			
			if SomeResult then
				local list1 = { "export" }
				SomeResult = Array.some(getDirectiveNames(p1), function(p2): boolean
					-- upvalues: Array (upval), list1 (copy)
					return Array.indexOf(list1, p2) > -1
				end)
			end
		end
		return SomeResult
	end,
	getInclusionDirectives = Callback
}