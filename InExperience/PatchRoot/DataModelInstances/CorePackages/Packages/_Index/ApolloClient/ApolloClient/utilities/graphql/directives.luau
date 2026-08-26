local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local array = require(parent_1.LuauPolyfill).Array
local visit = require(parent_1.GraphQL).visit
local invariant = require(parent.jsutils.invariant).invariant
local var1 = nil

function t.shouldInclude(p1, p2)
	-- upvalues: array (ref), var1 (write), invariant (ref)
	local directives = p1.directives
	
	return if directives and #directives ~= 0 then array.every(var1(directives), function(p3)
		-- upvalues: p2 (ref), invariant (copy)
		local var2
		local directive = p3.directive
		local ifArgument = p3.ifArgument
		local _ = false
		
		if ifArgument.value.kind == "Variable" then
			var2 = p2 ~= nil and p2[ifArgument.value.name.value]
			invariant(var2 ~= nil, ("Invalid variable referenced in @%s directive."):format(directive.name.value))
		else
			var2 = ifArgument.value.value
		end
		return if directive.name.value == "skip" then not var2 else var2
	end) else true
end

local function getDirectiveNames(p1)
	-- upvalues: visit (ref)
	local t = {}
	visit(p1, {
		Directive = function(_, p2)
			-- upvalues: t (ref)
			table.insert(t, p2.name.value)
		end
	})
	
	return t
end

t.getDirectiveNames = getDirectiveNames

function t.hasDirectives(p1, p2)
	-- upvalues: array (ref), getDirectiveNames (ref)
	return array.some(getDirectiveNames(p2), function(p3)
		-- upvalues: array (copy), p1 (ref)
		return array.indexOf(p1, p3) > -1
	end)
end

function t.hasClientExports(p1)
	-- upvalues: array (ref), getDirectiveNames (ref)
	local var2 = false
	
	if p1 ~= nil then
		local list = { "client" }
		var2 = array.some(getDirectiveNames(p1), function(p2)
			-- upvalues: array (copy), list (ref)
			return array.indexOf(list, p2) > -1
		end)
		
		if var2 then
			local list_1 = { "export" }
			var2 = array.some(getDirectiveNames(p1), function(p2)
				-- upvalues: array (copy), list_1 (ref)
				return array.indexOf(list_1, p2) > -1
			end)
		end
	end
	return var2
end

local function _(p1)
	local value = p1.name.value
	
	return if value ~= "skip" then value == "include" else true
end

function t.getInclusionDirectives(p1)
	-- upvalues: array (ref), invariant (ref)
	local t = {}
	
	if p1 and #p1 > 0 then
		array.forEach(p1, function(p2)
			-- upvalues: invariant (copy), t (ref)
			local value = p2.name.value
			
			if not (if value ~= "skip" then value == "include" else true) then return end
			local arguments = p2.arguments
			local value_1 = p2.name.value
			
			if not arguments or #arguments ~= 1 then
				invariant(false, ("Incorrect number of arguments for the @%s directive."):format(value_1))
			end
			local var2 = arguments[1]
			
			if not var2.name or var2.name.value ~= "if" then
				invariant(false, ("Invalid argument for the @%s directive."):format(value_1))
			end
			local value_2 = var2.value
			
			if not value_2 or value_2.kind ~= "Variable" and value_2.kind ~= "BooleanValue" then
				invariant(false, ("Argument for the @%s directive must be a variable or a boolean value."):format(value_1))
			end
			table.insert(t, { directive = p2, ifArgument = var2 })
		end)
	end
	return t
end

return t