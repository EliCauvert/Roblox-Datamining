local parent = script.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local devAssert = require(parent_1.jsutils.devAssert).devAssert
local graphQLError = require(parent_1.error.GraphQLError).GraphQLError
local _ = require(parent_1.language.ast)
local _ = require(parent_1.type.schema)
local visitorModule = require(parent_1.language.visitor)
local visit = visitorModule.visit
local visitInParallel = visitorModule.visitInParallel
local assertValidSchema = require(parent_1.type.validate).assertValidSchema
local typeInfoModule = require(parent_1.utilities.TypeInfo)
local typeInfo = typeInfoModule.TypeInfo
local visitWithTypeInfo = typeInfoModule.visitWithTypeInfo
local specifiedRulesModule = require(parent.specifiedRules)
local specifiedRules = specifiedRulesModule.specifiedRules
local specifiedSDLRules = specifiedRulesModule.specifiedSDLRules
local validationContextModule = require(parent.ValidationContext)
local SDLValidationContext = validationContextModule.SDLValidationContext
local validationContext = validationContextModule.ValidationContext
local t = {
	validate = function(p1, p2, p3, p4, p5)
		-- upvalues: specifiedRules (ref), typeInfo (ref), devAssert (ref), assertValidSchema (ref), validationContext (ref), graphQLError (ref), visitInParallel (ref), array (ref), visit (ref), visitWithTypeInfo (ref)
		local var1 = p3 or specifiedRules
		local var2 = p4 or { maxErrors = nil }
		local var3 = p5 or typeInfo.new(p1)
		devAssert(p2, "Must provide document.")
		assertValidSchema(p1)
		local t = {}
		local t_1 = {}
		local var4 = validationContext.new(p1, p2, var3, function(p6)
			-- upvalues: var2 (ref), t_1 (ref), graphQLError (copy), t (ref)
			if var2.maxErrors ~= nil and var2.maxErrors <= #t_1 then
				table.insert(t_1, graphQLError.new("Too many validation errors, error limit reached. Validation aborted."))
				error(t)
			end
			table.insert(t_1, p6)
		end)
		local var5 = visitInParallel(array.map(var1, function(p6)
			-- upvalues: var4 (ref)
			return p6(var4)
		end))
		local ok, status = pcall(function()
			-- upvalues: visit (copy), p2 (ref), visitWithTypeInfo (copy), var3 (ref), var5 (ref)
			visit(p2, visitWithTypeInfo(var3, var5))
		end)
		
		if not ok and status ~= t then
			error(status)
		end
		return t_1
	end,
	validateSDL = function(p1, p2, p3)
		-- upvalues: specifiedSDLRules (ref), SDLValidationContext (ref), array (ref), visit (ref), visitInParallel (ref)
		local var1 = p3 or specifiedSDLRules
		local t = {}
		local var2 = SDLValidationContext.new(p1, p2, function(p4)
			-- upvalues: t (ref)
			table.insert(t, p4)
		end)
		visit(p1, visitInParallel(array.map(var1, function(p4)
			-- upvalues: var2 (ref)
			return p4(var2)
		end)))
		
		return t
	end
}

function t.assertValidSDL(p1)
	-- upvalues: t (ref), error (ref), array (ref)
	local var1 = t.validateSDL(p1)
	
	if #var1 ~= 0 then
		error(error.new(table.concat(array.map(var1, function(p2)
			return p2.message
		end), "\n\n")))
	end
end

function t.assertValidSDLExtension(p1, p2)
	-- upvalues: t (ref), error (ref), array (ref)
	local var1 = t.validateSDL(p1, p2)
	
	if #var1 ~= 0 then
		error(error.new(table.concat(array.map(var1, function(p3)
			return if typeof(p3) == "string" then p3 else p3.message
		end), "\n\n")))
	end
end

return t