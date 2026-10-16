local Parent = script.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local DevAssertFunction = require(Parent1.jsutils.devAssert).devAssert
local GraphQLError = require(Parent1.error.GraphQLError).GraphQLError
local _ = require(Parent1.language.ast)
local _ = require(Parent1.type.schema)
local VisitorModule = require(Parent1.language.visitor)
local VisitFunction = VisitorModule.visit
local VisitInParallelFunction = VisitorModule.visitInParallel
local AssertValidSchemaFunction = require(Parent1.type.validate).assertValidSchema
local TypeInfoModule = require(Parent1.utilities.TypeInfo)
local TypeInfo = TypeInfoModule.TypeInfo
local VisitWithTypeInfoFunction = TypeInfoModule.visitWithTypeInfo
local SpecifiedRulesModule = require(Parent.specifiedRules)
local SpecifiedRules = SpecifiedRulesModule.specifiedRules
local SpecifiedSDLRules = SpecifiedRulesModule.specifiedSDLRules
local ValidationContextModule = require(Parent.ValidationContext)
local SDLValidationContext = ValidationContextModule.SDLValidationContext
local ValidationContext = ValidationContextModule.ValidationContext
local ValidateModule = {
	validate = function(p1, p2, p3, p4, p5) --[[ Line: 64 ]]
		-- upvalues: SpecifiedRules (copy), TypeInfo (copy), DevAssertFunction (copy), AssertValidSchemaFunction (copy), ValidationContext (copy), GraphQLError (copy), VisitInParallelFunction (copy), Array (copy), VisitFunction (copy), VisitWithTypeInfoFunction (copy)
		local SpecifiedRules1 = if p3 then p3 else SpecifiedRules
		local Config = if p4 then p4 else { maxErrors = nil }
		local NewTypeInfo = if p5 then p5 else TypeInfo.new(p1)
		DevAssertFunction(p2, "Must provide document.")
		AssertValidSchemaFunction(p1)
		local t = {}
		local List = {}
		local NewValidationContext = ValidationContext.new(p1, p2, NewTypeInfo, function(p6) --[[ Line: 82 ]]
			-- upvalues: Config (copy), List (copy), GraphQLError (upval), t (copy)
			if Config.maxErrors ~= nil and Config.maxErrors <= #List then
				table.insert(List, GraphQLError.new("Too many validation errors, error limit reached. Validation aborted."))
				error(t)
			end
			table.insert(List, p6)
		end)
		local VisitInParallelResult = VisitInParallelFunction(Array.map(SpecifiedRules1, function(Callback) --[[ Line: 98 ]]
			-- upvalues: NewValidationContext (copy)
			return Callback(NewValidationContext)
		end))
		local Success, Result = pcall(function() --[[ Line: 103 ]]
			-- upvalues: VisitFunction (upval), p2 (copy), VisitWithTypeInfoFunction (upval), NewTypeInfo (copy), VisitInParallelResult (copy)
			VisitFunction(p2, VisitWithTypeInfoFunction(NewTypeInfo, VisitInParallelResult))
		end)
		
		if not Success and Result ~= t then
			error(Result)
		end
		return List
	end,
	validateSDL = function(p1, p2, p3) --[[ Line: 118 ]]
		-- upvalues: SpecifiedSDLRules (copy), SDLValidationContext (copy), Array (copy), VisitFunction (copy), VisitInParallelFunction (copy)
		local List = {}
		local NewSDLValidationContext = SDLValidationContext.new(p1, p2, function(p4) --[[ Line: 126 ]]
			-- upvalues: List (copy)
			table.insert(List, p4)
		end)
		VisitFunction(p1, VisitInParallelFunction((Array.map(if p3 then p3 else SpecifiedSDLRules, function(Callback) --[[ Line: 129 ]]
			-- upvalues: NewSDLValidationContext (copy)
			return Callback(NewSDLValidationContext)
		end))))
		
		return List
	end
}

function ValidateModule.assertValidSDL(p1) --[[ Line: 142 ]]
	-- upvalues: ValidateModule (copy), Error1 (copy), Array (copy)
	local ValidateSDLResult = ValidateModule.validateSDL(p1)
	
	if #ValidateSDLResult ~= 0 then
		error(Error1.new(table.concat(Array.map(ValidateSDLResult, function(p2) --[[ Line: 146 ]]
			return p2.message
		end), "\n\n")))
	end
end

function ValidateModule.assertValidSDLExtension(p1, p2) --[[ Line: 160 ]]
	-- upvalues: ValidateModule (copy), Error1 (copy), Array (copy)
	local ValidateSDLResult = ValidateModule.validateSDL(p1, p2)
	
	if #ValidateSDLResult ~= 0 then
		error(Error1.new(table.concat(Array.map(ValidateSDLResult, function(p3) --[[ Line: 164 ]]
			return if typeof(p3) == "string" then p3 else p3.message
		end), "\n\n")))
	end
end

return ValidateModule