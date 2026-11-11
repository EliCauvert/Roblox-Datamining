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
		local Current = nil
		Current = UseRefResult.current or (function()
			-- upvalues: UseRefResult (copy), QueryData (upval), AssignResult (copy), UseContextResult (copy), Boolean (upval), Current (ref), PromiseModule (upval), UseReducerResult2 (copy)
			UseRefResult.current = QueryData.new({
				options = AssignResult,
				context = UseContextResult,
				onNewData = function(_)
					-- upvalues: Boolean (upval), Current (upval), PromiseModule (upval), UseRefResult (upval), UseReducerResult2 (upval)
					if Boolean.toJSBoolean(Current:ssrInitiated()) then
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
			
			return UseRefResult.current
		end)()
		Current:setOptions(AssignResult)
		Current.context = UseContextResult
		local UseDeepMemoResult = UseDeepMemoFunction(function()
			-- upvalues: Lazy (ref), Current (ref)
			return if Lazy then Current:executeLazy() else Current:execute()
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
			-- upvalues: Current (ref), UseRefResult (copy)
			return function()
				-- upvalues: Current (upval), UseRefResult (upval)
				Current:cleanup()
				UseRefResult.current = nil
			end
		end, {})
		UseEffectFunction(function()
			-- upvalues: Current (ref), Lazy (ref)
			return Current:afterExecute({ lazy = Lazy })
		end, {
			if UseDeepMemoResultEntry.loading == nil then config else UseDeepMemoResultEntry.loading or config,
			if UseDeepMemoResultEntry.networkStatus == nil then config else UseDeepMemoResultEntry.networkStatus or config,
			if UseDeepMemoResultEntry.error == nil then config else UseDeepMemoResultEntry.error or config,
			if UseDeepMemoResultEntry.data == nil then config else UseDeepMemoResultEntry.data or config
		})
		
		return UseDeepMemoResult
	end
}