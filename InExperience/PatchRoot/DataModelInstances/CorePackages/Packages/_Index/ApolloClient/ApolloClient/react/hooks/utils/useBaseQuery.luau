local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local PromiseModule = require(Parent1.Promise)
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local ReactModule = require(Parent1.React)
local UseContextFunction = ReactModule.useContext
local UseEffectFunction = ReactModule.useEffect
local UseReducerFunction = ReactModule.useReducer
local UseRefFunction = ReactModule.useRef
local _ = require(Parent1.GraphQL)
local _ = require(Parent.jsutils.typedDocumentNode)
local _ = require(script.Parent.Parent.Parent.types.types)
local QueryData = require(script.Parent.Parent.Parent.data).QueryData
local UseDeepMemoFunction = require(script.Parent.useDeepMemo).useDeepMemo
local _ = require(script.Parent.Parent.Parent.Parent.core)
local GetApolloContextFunction = require(script.Parent.Parent.Parent.context).getApolloContext
local UseAfterFastRefreshFunction = require(script.Parent.useAfterFastRefresh).useAfterFastRefresh
local config = { __value = "nil placeholder" }

return {
	useBaseQuery = function(Query, p1, Lazy: boolean)
		-- upvalues: UseContextFunction (copy), GetApolloContextFunction (copy), UseReducerFunction (copy), Boolean (copy), Object (copy), UseRefFunction (copy), QueryData (copy), PromiseModule (copy), UseDeepMemoFunction (copy), UseAfterFastRefreshFunction (copy), UseEffectFunction (copy), config (copy)
		if Lazy == nil then
			Lazy = false
		end
		local UseContextResult = UseContextFunction(GetApolloContextFunction())
		local UseReducerResult, UseReducerResult2 = UseReducerFunction(function(p2: number): number
			return p2 + 1
		end, 0)
		local AssignResult = Boolean.toJSBoolean(p1) and Object.assign({}, p1, { query = Query }) or { query = Query }
		local UseRefResult = UseRefFunction(nil)
		local v1 = nil
		local Current = UseRefResult.current
		
		if not Current then
			UseRefResult.current = QueryData.new({
				options = AssignResult,
				context = UseContextResult,
				onNewData = function(_)
					-- upvalues: Boolean (upval), v1 (ref), PromiseModule (upval), UseRefResult (copy), UseReducerResult2 (copy)
					if Boolean.toJSBoolean(v1:ssrInitiated()) then
						UseReducerResult2(nil)
						
						return
					else
						PromiseModule.delay(0):andThen(function()
							-- upvalues: UseRefResult (upval), UseReducerResult2 (upval)
							if UseRefResult.current == nil or not UseRefResult.current.isMounted then return end
							return UseReducerResult2(nil)
						end)
					end
				end
			})
			Current = UseRefResult.current
		end
		v1 = Current
		v1:setOptions(AssignResult)
		v1.context = UseContextResult
		local UseDeepMemoResult = UseDeepMemoFunction(function()
			-- upvalues: Lazy (ref), v1 (ref)
			return if Lazy then v1:executeLazy() else v1:execute()
		end, {
			options = Object.assign({}, AssignResult, { onError = Object.None, onCompleted = Object.None }),
			context = UseContextResult,
			tick = UseReducerResult
		})
		local UseDeepMemoResultEntry = if Lazy then UseDeepMemoResult[2] else UseDeepMemoResult
		
		if _G.__DEV__ then
			UseAfterFastRefreshFunction(UseReducerResult2)
		end
		UseEffectFunction(function()
			-- upvalues: v1 (ref), UseRefResult (copy)
			return function()
				-- upvalues: v1 (upval), UseRefResult (upval)
				v1:cleanup()
				UseRefResult.current = nil
			end
		end, {})
		UseEffectFunction(function()
			-- upvalues: v1 (ref), Lazy (ref)
			return v1:afterExecute({ lazy = Lazy })
		end, {
			if UseDeepMemoResultEntry.loading == nil then config else UseDeepMemoResultEntry.loading or config,
			if UseDeepMemoResultEntry.networkStatus == nil then config else UseDeepMemoResultEntry.networkStatus or config,
			if UseDeepMemoResultEntry.error == nil then config else UseDeepMemoResultEntry.error or config,
			if UseDeepMemoResultEntry.data == nil then config else UseDeepMemoResultEntry.data or config
		})
		
		return UseDeepMemoResult
	end
}