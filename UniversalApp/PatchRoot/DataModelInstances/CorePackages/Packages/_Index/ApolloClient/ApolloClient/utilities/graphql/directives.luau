local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local array = require(parent_1.LuauPolyfill).Array
local visit = require(parent_1.GraphQL).visit
local invariant = require(parent.jsutils.invariant).invariant
local var1 = nil

function t.shouldInclude(p0, p1) --[[ line: 40 ]]
	-- upvalues: array (ref), var1 (write), invariant (ref)
	local directives = p0.directives
	
	return if directives and #directives ~= 0 then array.every(var1(directives), function(p2) --[[ line: 47 ]]
		-- upvalues: p1 (ref), invariant (copy)
		local var3
		local directive = p2.directive
		local ifArgument = p2.ifArgument
		local _ = false
		
		if ifArgument.value.kind == "Variable" then
			var3 = p1 ~= nil and p1[ifArgument.value.name.value]
			invariant(var3 ~= nil, ("Invalid variable referenced in @%s directive."):format(directive.name.value))
		else
			var3 = ifArgument.value.value
		end
		return if directive.name.value == "skip" then not var3 else var3
	end) else true
end

local function getDirectiveNames(p3) --[[ line: 68 ]]
	-- upvalues: visit (ref)
	local t = {}
	visit(p3, {
		Directive = function(_, p4) --[[ line: 72 ]]
			-- upvalues: t (ref)
			table.insert(t, p4.name.value)
		end
	})
	
	return t
end

t.getDirectiveNames = getDirectiveNames

function t.hasDirectives(p5, p6) --[[ line: 81 ]]
	-- upvalues: array (ref), getDirectiveNames (ref)
	return array.some(getDirectiveNames(p6), function(p7) --[[ line: 82 ]]
		-- upvalues: array (copy), p5 (ref)
		return array.indexOf(p5, p7) > -1
	end)
end

function t.hasClientExports(p8) --[[ line: 88 ]]
	-- upvalues: array (ref), getDirectiveNames (ref)
	local var5 = false
	
	if p8 ~= nil then
		local list = { "client" }
		var5 = array.some(getDirectiveNames(p8), function(p9) --[[ line: 82 ]]
			-- upvalues: array (copy), list (ref)
			return array.indexOf(list, p9) > -1
		end)
		
		if var5 then
			local list_1 = { "export" }
			var5 = array.some(getDirectiveNames(p8), function(p10) --[[ line: 82 ]]
				-- upvalues: array (copy), list_1 (ref)
				return array.indexOf(list_1, p10) > -1
			end)
		end
	end
	return var5
end

local function _(p11) --[[ line: 97 | named "isInclusionDirective" ]]
	local value = p11.name.value
	
	return if value ~= "skip" then value == "include" else true
end

function t.getInclusionDirectives(p12) --[[ line: 102 ]]
	-- upvalues: array (ref), invariant (ref)
	local t = {}
	
	if p12 and #p12 > 0 then
		array.forEach(p12, function(p13) --[[ line: 108 ]]
			-- upvalues: invariant (copy), t (ref)
			local value = p13.name.value
			
			if not (if value ~= "skip" then value == "include" else true) then return end
			local arguments = p13.arguments
			local value_1 = p13.name.value
			
			if not arguments or #arguments ~= 1 then
				invariant(false, ("Incorrect number of arguments for the @%s directive."):format(value_1))
			end
			local var9 = arguments[1]
			
			if not var9.name or var9.name.value ~= "if" then
				invariant(false, ("Invalid argument for the @%s directive."):format(value_1))
			end
			local value_2 = var9.value
			
			if not value_2 or value_2.kind ~= "Variable" and value_2.kind ~= "BooleanValue" then
				invariant(false, ("Argument for the @%s directive must be a variable or a boolean value."):format(value_1))
			end
			table.insert(t, { directive = p13, ifArgument = var9 })
		end)
	end
	return t
end

return t