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

function t.createHttpLink(p1)
	-- upvalues: object (ref), checkFetcher (ref), boolean (ref), apolloLink (ref), selectURI (ref), selectHttpOptionsAndBody (ref), fallbackHttpConfig (ref), set (ref), visit (ref), createSignalIfSupported (ref), array (ref), rewriteURIForGET (ref), fromError (ref), serializeFetchParameter (ref), observable (ref), parseAndCheckHttpResponse (ref)
	local var1 = p1
	
	if var1 == nil then
		var1 = {}
	end
	local var2 = if var1.uri ~= nil then var1.uri else "/graphql"
	local fetch = var1.fetch
	local includeExtensions = var1.includeExtensions
	local useGETForQueries = var1.useGETForQueries
	local var3 = var1.includeUnusedVariables ~= nil and var1.includeUnusedVariables
	local var4 = object.assign({}, var1, {
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
		options = var4.fetchOptions,
		credentials = var4.credentials,
		headers = var4.headers
	}
	
	return apolloLink.new(function(_, p2)
		-- upvalues: selectURI (copy), var2 (ref), boolean (copy), object (copy), selectHttpOptionsAndBody (copy), fallbackHttpConfig (copy), t (ref), var3 (ref), set (copy), visit (copy), createSignalIfSupported (copy), useGETForQueries (ref), array (copy), rewriteURIForGET (copy), fromError (copy), serializeFetchParameter (copy), observable (copy), fetch (write), parseAndCheckHttpResponse (copy)
		local var5 = selectURI(p2, var2)
		local context = p2:getContext()
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
		local var6 = selectHttpOptionsAndBody(p2, fallbackHttpConfig, t, {
			http = context.http,
			options = context.fetchOptions,
			credentials = context.credentials,
			headers = object.assign({}, t_1, context.headers)
		})
		local options = var6.options
		local body = var6.body
		
		if body.variables ~= nil and not var3 then
			local var7 = set.new(object.keys(body.variables))
			visit(p2.query, {
				Variable = function(_, p3, _, p4)
					-- upvalues: boolean (copy), var7 (ref)
					if boolean.toJSBoolean(p4) and p4.kind ~= "VariableDefinition" then
						var7:delete(p3.name.value)
					end
				end
			})
			
			if boolean.toJSBoolean(var7.size) then
				body.variables = object.assign({}, body.variables)
				var7:forEach(function(p3)
					-- upvalues: body (ref)
					body.variables[p3] = nil
				end)
			end
		end
		local controller = nil
		
		if not boolean.toJSBoolean(options.signal) then
			local var8 = createSignalIfSupported()
			local signal = var8.signal
			controller = var8.controller
			
			if boolean.toJSBoolean(controller) then
				options.signal = signal
			end
		end
		if boolean.toJSBoolean(useGETForQueries) and not array.some(p2.query.definitions, function(p3)
			return p3.kind == "OperationDefinition" and p3.operation == "mutation"
		end) then
			options.method = "GET"
		end
		if options.method == "GET" then
			local var9 = rewriteURIForGET(var5, body)
			local newURI = var9.newURI
			local parseError = var9.parseError
			
			if boolean.toJSBoolean(parseError) then
				return fromError(parseError)
			end
		else
			local ok, status = pcall(function()
				-- upvalues: options (ref), serializeFetchParameter (copy), body (ref)
				options.body = serializeFetchParameter(body, "Payload")
			end)
			
			return if ok then observable.new(function(p3)
				-- upvalues: fetch (copy), var5 (write), options (ref), p2 (ref), parseAndCheckHttpResponse (copy), boolean (copy), controller (write)
				fetch(var5, options):andThen(function(p4)
					-- upvalues: p2 (copy)
					p2:setContext({ response = p4 })
					
					return p4
				end):andThen(parseAndCheckHttpResponse(p2)):andThen(function(p4)
					-- upvalues: p3 (ref)
					p3:next(p4)
					p3:complete()
					
					return p4
				end):catch(function(p4)
					-- upvalues: boolean (copy), p3 (ref)
					if p4.name == "AbortError" then return end
					if boolean.toJSBoolean(p4.result) and boolean.toJSBoolean(p4.result.errors) and boolean.toJSBoolean(p4.result.data) then
						p3:next(p4.result)
					end
					p3:error(p4)
				end)
				
				return function()
					-- upvalues: boolean (copy), controller (copy)
					if boolean.toJSBoolean(controller) then
						controller:abort()
					end
				end
			end) else fromError(status)
		end
		var5 = newURI
	end)
end

return t