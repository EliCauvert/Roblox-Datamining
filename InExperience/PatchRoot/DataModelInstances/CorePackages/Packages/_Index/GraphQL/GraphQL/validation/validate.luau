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
	validate = function(p0, p1, p2, p3, p4)
		-- upvalues: specifiedRules (ref), typeInfo (ref), devAssert (ref), assertValidSchema (ref), validationContext (ref), graphQLError (ref), visitInParallel (ref), array (ref), visit (ref), visitWithTypeInfo (ref)
		local var6 = p2 or specifiedRules
		local var7 = p3 or { maxErrors = nil }
		local var8 = p4 or typeInfo.new(p0)
		devAssert(p1, "Must provide document.")
		assertValidSchema(p0)
		local t = {}
		local t_1 = {}
		local var11 = validationContext.new(p0, p1, var8, function(p5)
			-- upvalues: var7 (ref), t_1 (ref), graphQLError (copy), t (ref)
			if var7.maxErrors ~= nil and var7.maxErrors <= #t_1 then
				table.insert(t_1, graphQLError.new("Too many validation errors, error limit reached. Validation aborted."))
				error(t)
			end
			table.insert(t_1, p5)
		end)
		local var12 = visitInParallel(array.map(var6, function(p6)
			-- upvalues: var11 (ref)
			return p6(var11)
		end))
		local ok, status = pcall(function()
			-- upvalues: visit (copy), p1 (ref), visitWithTypeInfo (copy), var8 (ref), var12 (ref)
			visit(p1, visitWithTypeInfo(var8, var12))
		end)
		
		if not ok and status ~= t then
			error(status)
		end
		return t_1
	end,
	validateSDL = function(p7, p8, p9)
		-- upvalues: specifiedSDLRules (ref), SDLValidationContext (ref), array (ref), visit (ref), visitInParallel (ref)
		local var13 = p9 or specifiedSDLRules
		local t = {}
		local var15 = SDLValidationContext.new(p7, p8, function(p10)
			-- upvalues: t (ref)
			table.insert(t, p10)
		end)
		visit(p7, visitInParallel(array.map(var13, function(p11)
			-- upvalues: var15 (ref)
			return p11(var15)
		end)))
		
		return t
	end
}

function t.assertValidSDL(p12)
	-- upvalues: t (ref), error (ref), array (ref)
	local var16 = t.validateSDL(p12)
	
	if #var16 ~= 0 then
		error(error.new(table.concat(array.map(var16, function(p13)
			return p13.message
		end), "\n\n")))
	end
end

function t.assertValidSDLExtension(p14, p15)
	-- upvalues: t (ref), error (ref), array (ref)
	local var17 = t.validateSDL(p14, p15)
	
	if #var17 ~= 0 then
		error(error.new(table.concat(array.map(var17, function(p16)
			return if typeof(p16) == "string" then p16 else p16.message
		end), "\n\n")))
	end
end

return t