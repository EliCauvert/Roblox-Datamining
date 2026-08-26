local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local promiseModule = require(parent.Promise)
local t = {}
local graphQLModule = require(parent.GraphQL)
local kind = graphQLModule.Kind
local validate = graphQLModule.validate
local specifiedRules = graphQLModule.specifiedRules
local concatAST = graphQLModule.concatAST
local versionInfo = graphQLModule.versionInfo
local _ = require(script.Parent.loaders)
local aggregateError = require(script.Parent.AggregateError).AggregateError
local var1 = nil

function t.validateGraphQlDocuments(p1, p2, p3)
	-- upvalues: var1 (write), promiseModule (ref), map (ref), kind (ref), array (ref), concatAST (ref), validate (ref)
	local var2 = if p3 ~= nil then var1() else p3
	
	return promiseModule.resolve():andThen(function()
		-- upvalues: map (copy), p2 (ref), kind (copy), array (copy), promiseModule (copy), concatAST (copy), validate (copy), p1 (ref), var2 (ref)
		local var3 = map.new()
		local t = {}
		
		for i, v in p2 do
			if v.document then
				local t_1 = {}
				
				for i_1, v_1 in v.document.definitions do
					if v_1.kind == kind.FRAGMENT_DEFINITION then
						var3:set(v_1.name.value, v_1)
					else
						table.insert(t_1, v_1)
					end
				end
				table.insert(t, {
					location = v.location,
					document = { kind = kind.DOCUMENT, definitions = t_1 }
				})
			end
		end
		local t_1 = {}
		local t_2 = {
			kind = kind.DOCUMENT,
			definitions = array.concat({}, var3:values())
		}
		promiseModule.all(array.map(t, function(p4)
			-- upvalues: promiseModule (copy), concatAST (copy), t_2 (ref), validate (copy), p1 (copy), var2 (copy), t_1 (ref)
			return promiseModule.resolve():andThen(function()
				-- upvalues: concatAST (copy), t_2 (copy), p4 (ref), validate (copy), p1 (copy), var2 (copy), t_1 (copy)
				local var4 = validate(p1, concatAST({ t_2, p4.document }), var2)
				
				if #var4 > 0 then
					table.insert(t_1, { filePath = p4.location, errors = var4 })
				end
			end)
		end)):expect()
		
		return t_1
	end)
end

function t.checkValidationErrors(p4)
	-- upvalues: error (ref), aggregateError (ref), array (ref)
	if #p4 > 0 then
		local t = {}
		
		for i, v in p4 do
			for i_1, v_1 in v.errors do
				local graphQLDocumentError = error.new()
				graphQLDocumentError.name = "GraphQLDocumentError"
				graphQLDocumentError.message = ("%s: %s"):format(tostring(graphQLDocumentError.name), tostring(v_1.message))
				graphQLDocumentError.stack = graphQLDocumentError.message
				
				if v_1.locations then
					for i_2, v_2 in v_1.locations do
						graphQLDocumentError.stack = tostring(graphQLDocumentError.stack) .. ("\n    at %s:%s:%s"):format(tostring(v.filePath), tostring(v_2.line), tostring(v_2.column))
					end
				end
				table.insert(t, graphQLDocumentError)
			end
		end
		error(aggregateError.new(t, ("GraphQL Document Validation failed with %s errors;\n  %s"):format(tostring(#t), tostring(array.join(array.map(t, function(p5, p6)
			return ("Error %s: %s"):format(tostring(p6), tostring(p5.stack))
		end), "\n\n")))))
	end
end

function t.createDefaultRules()
	-- upvalues: versionInfo (ref), array (ref), specifiedRules (ref)
	local list = {
		"NoUnusedFragmentsRule",
		"NoUnusedVariablesRule",
		"KnownDirectivesRule"
	}
	
	if versionInfo.major < 15 then
		list = array.map(list, function(p5)
			return p5:gsub("Rule$", "", 1)
		end)
	end
	return array.filter(specifiedRules, function(p5)
		-- upvalues: array (copy), list (write)
		return not array.includes(list, debug.info(p5, "n"))
	end)
end

return t