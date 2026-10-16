local Parent = script.Parent.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local VisitFunction = require(Parent.GraphQL).visit
local ApolloLink = require(script.Parent.Parent.core).ApolloLink
local Observable = require(script.Parent.Parent.Parent.utilities).Observable
local SerializeFetchParameterFunction = require(script.Parent.serializeFetchParameter).serializeFetchParameter
local SelectURIFunction = require(script.Parent.selectURI).selectURI
local ParseAndCheckHttpResponseFunction = require(script.Parent.parseAndCheckHttpResponse).parseAndCheckHttpResponse
local CheckFetcherFunction = require(script.Parent.checkFetcher).checkFetcher
local SelectHttpOptionsAndBodyModule = require(script.Parent.selectHttpOptionsAndBody)
local SelectHttpOptionsAndBodyFunction = SelectHttpOptionsAndBodyModule.selectHttpOptionsAndBody
local FallbackHttpConfig = SelectHttpOptionsAndBodyModule.fallbackHttpConfig
local CreateSignalIfSupportedFunction = require(script.Parent.createSignalIfSupported).createSignalIfSupported
local RewriteURIForGETFunction = require(script.Parent.rewriteURIForGET).rewriteURIForGET
local FromErrorFunction = require(script.Parent.Parent.utils).fromError

return {
	createHttpLink = function(p1) --[[ Line: 41 ]]
		-- upvalues: Object (copy), CheckFetcherFunction (copy), Boolean (copy), ApolloLink (copy), SelectURIFunction (copy), SelectHttpOptionsAndBodyFunction (copy), FallbackHttpConfig (copy), Set (copy), VisitFunction (copy), CreateSignalIfSupportedFunction (copy), Array (copy), RewriteURIForGETFunction (copy), FromErrorFunction (copy), SerializeFetchParameterFunction (copy), Observable (copy), ParseAndCheckHttpResponseFunction (copy)
		local v1 = p1
		
		if v1 == nil then
			v1 = {}
		end
		local Graphql = if v1.uri == nil then "/graphql" else v1.uri or "/graphql"
		local FetchFunction = v1.fetch
		local IncludeExtensions = v1.includeExtensions
		local UseGETForQueries = v1.useGETForQueries
		local IncludeUnusedVariables = v1.includeUnusedVariables ~= nil and (v1.includeUnusedVariables or false)
		local AssignResult = Object.assign({}, v1, {
			uri = Object.None,
			fetch = Object.None,
			includeExtensions = Object.None,
			useGETForQueries = Object.None,
			includeUnusedVariables = Object.None
		})
		CheckFetcherFunction(FetchFunction)
		
		if not Boolean.toJSBoolean(FetchFunction) then
			FetchFunction = _G.fetch
		end
		local config = {
			http = { includeExtensions = IncludeExtensions },
			options = AssignResult.fetchOptions,
			credentials = AssignResult.credentials,
			headers = AssignResult.headers
		}
		
		return ApolloLink.new(function(_, p2) --[[ Line: 78 ]]
			-- upvalues: SelectURIFunction (upval), Graphql (copy), Boolean (upval), Object (upval), SelectHttpOptionsAndBodyFunction (upval), FallbackHttpConfig (upval), config (copy), IncludeUnusedVariables (copy), Set (upval), VisitFunction (upval), CreateSignalIfSupportedFunction (upval), UseGETForQueries (copy), Array (upval), RewriteURIForGETFunction (upval), FromErrorFunction (upval), SerializeFetchParameterFunction (upval), Observable (upval), FetchFunction (ref), ParseAndCheckHttpResponseFunction (upval)
			local SelectURIResult = SelectURIFunction(p2, Graphql)
			local Context = p2:getContext()
			local t = {}
			
			if Boolean.toJSBoolean(Context.clientAwareness) then
				local Name = Context.clientAwareness.name
				local Version = Context.clientAwareness.version
				
				if Boolean.toJSBoolean(Name) then
					t["apollographql-client-name"] = Name
				end
				if Boolean.toJSBoolean(Version) then
					t["apollographql-client-version"] = Version
				end
			end
			local SelectHttpOptionsAndBodyResult = SelectHttpOptionsAndBodyFunction(p2, FallbackHttpConfig, config, {
				http = Context.http,
				options = Context.fetchOptions,
				credentials = Context.credentials,
				headers = Object.assign({}, t, Context.headers)
			})
			local Options = SelectHttpOptionsAndBodyResult.options
			local Body = SelectHttpOptionsAndBodyResult.body
			
			if Body.variables ~= nil and not IncludeUnusedVariables then
				local NewSet = Set.new(Object.keys(Body.variables))
				VisitFunction(p2.query, {
					Variable = function(_, p3, _, p4) --[[ Line: 122 ]]
						-- upvalues: Boolean (upval), NewSet (copy)
						if Boolean.toJSBoolean(p4) and p4.kind ~= "VariableDefinition" then
							NewSet:delete(p3.name.value)
						end
					end
				})
				
				if Boolean.toJSBoolean(NewSet.size) then
					Body.variables = Object.assign({}, Body.variables)
					NewSet:forEach(function(p3) --[[ Line: 139 ]]
						-- upvalues: Body (copy)
						Body.variables[p3] = nil
					end)
				end
			end
			local Controller = nil
			
			if not Boolean.toJSBoolean(Options.signal) then
				local SignalIfSupported = CreateSignalIfSupportedFunction()
				local Signal = SignalIfSupported.signal
				Controller = SignalIfSupported.controller
				
				if Boolean.toJSBoolean(Controller) then
					Options.signal = Signal
				end
			end
			local function definitionIsMutation(p3): boolean --[[ Line: 156 ]]
				return p3.kind == "OperationDefinition" and p3.operation == "mutation"
			end
			
			if Boolean.toJSBoolean(UseGETForQueries) and not Array.some(p2.query.definitions, definitionIsMutation) then
				Options.method = "GET"
			end
			if Options.method == "GET" then
				local RewriteURIForGETResult = RewriteURIForGETFunction(SelectURIResult, Body)
				local NewURI = RewriteURIForGETResult.newURI
				local ParseError = RewriteURIForGETResult.parseError
				
				if Boolean.toJSBoolean(ParseError) then
					return FromErrorFunction(ParseError)
				end
				SelectURIResult = NewURI
			else
				local Success, Result = pcall(function() --[[ Line: 174 ]]
					-- upvalues: Options (copy), SerializeFetchParameterFunction (upval), Body (copy)
					Options.body = SerializeFetchParameterFunction(Body, "Payload")
				end)
				
				if not Success then
					return FromErrorFunction(Result)
				end
			end
			return Observable.new(function(p3) --[[ Line: 181 ]]
				-- upvalues: FetchFunction (upval), SelectURIResult (ref), Options (copy), p2 (copy), ParseAndCheckHttpResponseFunction (upval), Boolean (upval), Controller (ref)
				FetchFunction(SelectURIResult, Options):andThen(function(Result) --[[ Line: 183 ]]
					-- upvalues: p2 (upval)
					p2:setContext({ response = Result })
					
					return Result
				end):andThen(ParseAndCheckHttpResponseFunction(p2)):andThen(function(Result) --[[ Line: 188 ]]
					-- upvalues: p3 (copy)
					p3:next(Result)
					p3:complete()
					
					return Result
				end):catch(function(Err) --[[ Line: 194 ]]
					-- upvalues: Boolean (upval), p3 (copy)
					if Err.name == "AbortError" then return end
					if Boolean.toJSBoolean(Err.result) and Boolean.toJSBoolean(Err.result.errors) and Boolean.toJSBoolean(Err.result.data) then
						p3:next(Err.result)
					end
					p3:error(Err)
				end)
				
				return function() --[[ Line: 241 ]]
					-- upvalues: Boolean (upval), Controller (upval)
					if Boolean.toJSBoolean(Controller) then
						Controller:abort()
					end
				end
			end)
		end)
	end
}