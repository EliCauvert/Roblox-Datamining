local parent = script.Parent.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local t = {}
local visit = require(parent.GraphQL).visit
local apolloLink = require(script.Parent.Parent.core).ApolloLink
local observable = require(script.Parent.Parent.Parent.utilities).Observable
local serializeFetchParameter = require(script.Parent.serializeFetchParameter).serializeFetchParameter
local selectURI = require(script.Parent.selectURI).selectURI
local parseAndCheckHttpResponse = require(script.Parent.parseAndCheckHttpResponse).parseAndCheckHttpResponse
local checkFetcher = require(script.Parent.checkFetcher).checkFetcher
local selectHttpOptionsAndBodyModule = require(script.Parent.selectHttpOptionsAndBody)
local selectHttpOptionsAndBody = selectHttpOptionsAndBodyModule.selectHttpOptionsAndBody
local fallbackHttpConfig = selectHttpOptionsAndBodyModule.fallbackHttpConfig
local createSignalIfSupported = require(script.Parent.createSignalIfSupported).createSignalIfSupported
local rewriteURIForGET = require(script.Parent.rewriteURIForGET).rewriteURIForGET
local fromError = require(script.Parent.Parent.utils).fromError

function t.createHttpLink(p0) --[[ line: 41 ]]
	-- upvalues: object (ref), checkFetcher (ref), boolean (ref), apolloLink (ref), selectURI (ref), selectHttpOptionsAndBody (ref), fallbackHttpConfig (ref), set (ref), visit (ref), createSignalIfSupported (ref), array (ref), rewriteURIForGET (ref), fromError (ref), serializeFetchParameter (ref), observable (ref), parseAndCheckHttpResponse (ref)
	local var3 = p0
	
	if var3 == nil then
		var3 = {}
	end
	local var4 = if var3.uri ~= nil then var3.uri else "/graphql"
	local fetch = var3.fetch
	local includeExtensions = var3.includeExtensions
	local useGETForQueries = var3.useGETForQueries
	local var5 = var3.includeUnusedVariables ~= nil and var3.includeUnusedVariables
	local var6 = object.assign({}, var3, {
		uri = object.None,
		fetch = object.None,
		includeExtensions = object.None,
		useGETForQueries = object.None,
		includeUnusedVariables = object.None
	})
	checkFetcher(fetch)
	
	if not boolean.toJSBoolean(fetch) then
		fetch = _G.fetch
	end
	local t = {
		http = { includeExtensions = includeExtensions },
		options = var6.fetchOptions,
		credentials = var6.credentials,
		headers = var6.headers
	}
	
	return apolloLink.new(function(_, p1) --[[ line: 78 ]]
		-- upvalues: selectURI (copy), var4 (ref), boolean (copy), object (copy), selectHttpOptionsAndBody (copy), fallbackHttpConfig (copy), t (ref), var5 (ref), set (copy), visit (copy), createSignalIfSupported (copy), useGETForQueries (ref), array (copy), rewriteURIForGET (copy), fromError (copy), serializeFetchParameter (copy), observable (copy), fetch (write), parseAndCheckHttpResponse (copy)
		local var8 = selectURI(p1, var4)
		local context = p1:getContext()
		local t_1 = {}
		
		if boolean.toJSBoolean(context.clientAwareness) then
			local name = context.clientAwareness.name
			local version = context.clientAwareness.version
			
			if boolean.toJSBoolean(name) then
				t_1["apollographql-client-name"] = name
			end
			if boolean.toJSBoolean(version) then
				t_1["apollographql-client-version"] = version
			end
		end
		local var11 = selectHttpOptionsAndBody(p1, fallbackHttpConfig, t, {
			http = context.http,
			options = context.fetchOptions,
			credentials = context.credentials,
			headers = object.assign({}, t_1, context.headers)
		})
		local options = var11.options
		local body = var11.body
		
		if body.variables ~= nil and not var5 then
			local var12 = set.new(object.keys(body.variables))
			visit(p1.query, {
				Variable = function(_, p2, _, p3) --[[ line: 122 ]]
					-- upvalues: boolean (copy), var12 (ref)
					if boolean.toJSBoolean(p3) and p3.kind ~= "VariableDefinition" then
						var12:delete(p2.name.value)
					end
				end
			})
			
			if boolean.toJSBoolean(var12.size) then
				body.variables = object.assign({}, body.variables)
				var12:forEach(function(p4) --[[ line: 139 ]]
					-- upvalues: body (ref)
					body.variables[p4] = nil
				end)
			end
		end
		local controller = nil
		
		if not boolean.toJSBoolean(options.signal) then
			local var13 = createSignalIfSupported()
			local signal = var13.signal
			controller = var13.controller
			
			if boolean.toJSBoolean(controller) then
				options.signal = signal
			end
		end
		if boolean.toJSBoolean(useGETForQueries) and not array.some(p1.query.definitions, function(p5) --[[ line: 156 | named "definitionIsMutation" ]]
			return p5.kind == "OperationDefinition" and p5.operation == "mutation"
		end) then
			options.method = "GET"
		end
		if options.method == "GET" then
			local var14 = rewriteURIForGET(var8, body)
			local newURI = var14.newURI
			local parseError = var14.parseError
			
			if boolean.toJSBoolean(parseError) then
				return fromError(parseError)
			end
		else
			local ok, status = pcall(function() --[[ line: 174 ]]
				-- upvalues: options (ref), serializeFetchParameter (copy), body (ref)
				options.body = serializeFetchParameter(body, "Payload")
			end)
			
			return if ok then observable.new(function(p6) --[[ line: 181 ]]
				-- upvalues: fetch (copy), var8 (write), options (ref), p1 (ref), parseAndCheckHttpResponse (copy), boolean (copy), controller (write)
				fetch(var8, options):andThen(function(p9) --[[ line: 183 ]]
					-- upvalues: p1 (copy)
					p1:setContext({ response = p9 })
					
					return p9
				end):andThen(parseAndCheckHttpResponse(p1)):andThen(function(p8) --[[ line: 188 ]]
					-- upvalues: p6 (ref)
					p6:next(p8)
					p6:complete()
					
					return p8
				end):catch(function(p7) --[[ line: 194 ]]
					-- upvalues: boolean (copy), p6 (ref)
					if p7.name == "AbortError" then return end
					if boolean.toJSBoolean(p7.result) and boolean.toJSBoolean(p7.result.errors) and boolean.toJSBoolean(p7.result.data) then
						p6:next(p7.result)
					end
					p6:error(p7)
				end)
				
				return function() --[[ line: 241 ]]
					-- upvalues: boolean (copy), controller (copy)
					if boolean.toJSBoolean(controller) then
						controller:abort()
					end
				end
			end) else fromError(status)
		end
		var8 = newURI
	end)
end

return t