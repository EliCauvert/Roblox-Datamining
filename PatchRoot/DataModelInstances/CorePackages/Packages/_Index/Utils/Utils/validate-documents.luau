-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

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
local var4 = nil

function t.validateGraphQlDocuments(p0, p1, p2) --[[ line: 66 ]]
	-- upvalues: var4 (write), promiseModule (ref), map (ref), kind (ref), array (ref), concatAST (ref), validate (ref)
	local var5 = if p2 ~= nil then var4() else p2
	
	return promiseModule.resolve():andThen(function() --[[ line: 74 ]]
		-- upvalues: map (copy), p1 (ref), kind (copy), array (copy), promiseModule (copy), concatAST (copy), validate (copy), p0 (ref), var5 (ref)
		local var6 = map.new()
		local t = {}
		
		for i, v in p1 do
			if v.document then
				local t_1 = {}
				
				for i_1, v_1 in v.document.definitions do
					if v_1.kind == kind.FRAGMENT_DEFINITION then
						var6:set(v_1.name.value, v_1)
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
			definitions = array.concat({}, var6:values())
		}
		promiseModule.all(array.map(t, function(p3) --[[ line: 104 ]]
			-- upvalues: promiseModule (copy), concatAST (copy), t_2 (ref), validate (copy), p0 (copy), var5 (copy), t_1 (ref)
			return promiseModule.resolve():andThen(function() --[[ line: 105 ]]
				-- upvalues: concatAST (copy), t_2 (copy), p3 (ref), validate (copy), p0 (copy), var5 (copy), t_1 (copy)
				local var11 = validate(p0, concatAST({ t_2, p3.document }), var5)
				
				if #var11 > 0 then
					table.insert(t_1, { filePath = p3.location, errors = var11 })
				end
			end)
		end)):expect()
		
		return t_1
	end)
end

function t.checkValidationErrors(p4) --[[ line: 123 ]]
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
		error(aggregateError.new(t, ("GraphQL Document Validation failed with %s errors;\n  %s"):format(tostring(#t), tostring(array.join(array.map(t, function(p5, p6) --[[ line: 170 ]]
			return ("Error %s: %s"):format(tostring(p6), tostring(p5.stack))
		end), "\n\n")))))
	end
end

function t.createDefaultRules() --[[ line: 185 ]]
	-- upvalues: versionInfo (ref), array (ref), specifiedRules (ref)
	local list = {
		"NoUnusedFragmentsRule",
		"NoUnusedVariablesRule",
		"KnownDirectivesRule"
	}
	
	if versionInfo.major < 15 then
		list = array.map(list, function(p7) --[[ line: 192 ]]
			return p7:gsub("Rule$", "", 1)
		end)
	end
	return array.filter(specifiedRules, function(p8) --[[ line: 200 ]]
		-- upvalues: array (copy), list (write)
		return not array.includes(list, debug.info(p8, "n"))
	end)
end

return t