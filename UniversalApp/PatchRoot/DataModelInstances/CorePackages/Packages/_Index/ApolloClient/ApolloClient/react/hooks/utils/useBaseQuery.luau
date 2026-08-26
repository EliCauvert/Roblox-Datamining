local t = {}
local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local promiseModule = require(parent_1.Promise)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local reactModule = require(parent_1.React)
local useContext = reactModule.useContext
local useEffect = reactModule.useEffect
local useReducer = reactModule.useReducer
local useRef = reactModule.useRef
local _ = require(parent_1.GraphQL)
local _ = require(parent.jsutils.typedDocumentNode)
local _ = require(script.Parent.Parent.Parent.types.types)
local queryData = require(script.Parent.Parent.Parent.data).QueryData
local useDeepMemo = require(script.Parent.useDeepMemo).useDeepMemo
local _ = require(script.Parent.Parent.Parent.Parent.core)
local getApolloContext = require(script.Parent.Parent.Parent.context).getApolloContext
local useAfterFastRefresh = require(script.Parent.useAfterFastRefresh).useAfterFastRefresh
local t_1 = { __value = "nil placeholder" }

function t.useBaseQuery(p1, p2, p3)
	-- upvalues: useContext (ref), getApolloContext (ref), useReducer (ref), boolean (ref), object (ref), useRef (ref), queryData (ref), promiseModule (ref), useDeepMemo (ref), useAfterFastRefresh (ref), useEffect (ref), t_1 (ref)
	if p3 == nil then
		p3 = false
	end
	local var1 = useContext(getApolloContext())
	local var2, var3 = useReducer(function(p4)
		return p4 + 1
	end, 0)
	local var4 = boolean.toJSBoolean(p2) and object.assign({}, p2, { query = p1 }) or { query = p1 }
	local var5 = useRef(nil)
	local current = nil
	current = var5.current or (function()
		-- upvalues: var5 (ref), queryData (copy), var4 (ref), var1 (ref), boolean (copy), current (write), promiseModule (copy), var3 (ref)
		var5.current = queryData.new({
			options = var4,
			context = var1,
			onNewData = function(_)
				-- upvalues: boolean (copy), current (copy), promiseModule (copy), var5 (copy), var3 (copy)
				if boolean.toJSBoolean(current:ssrInitiated()) then
					var3(nil)
					
					return
				end
				promiseModule.delay(0):andThen(function()
					-- upvalues: var5 (copy), var3 (copy)
					if var5.current == nil or not var5.current.isMounted then
						return
					end
					return var3(nil)
				end)
			end
		})
		
		return var5.current
	end)()
	current:setOptions(var4)
	current.context = var1
	local var6 = useDeepMemo(function()
		-- upvalues: p3 (write), current (write)
		return if p3 then current:executeLazy() else current:execute()
	end, {
		options = object.assign({}, var4, { onError = object.None, onCompleted = object.None }),
		context = var1,
		tick = var2
	})
	local var7 = if p3 then var6[2] else var6
	
	if _G.__DEV__ then
		useAfterFastRefresh(var3)
	end
	useEffect(function()
		-- upvalues: current (write), var5 (ref)
		return function()
			-- upvalues: current (copy), var5 (copy)
			current:cleanup()
			var5.current = nil
		end
	end, {})
	useEffect(function()
		-- upvalues: current (write), p3 (write)
		return current:afterExecute({ lazy = p3 })
	end, {
		if var7.loading ~= nil then var7.loading else t_1,
		if var7.networkStatus ~= nil then var7.networkStatus else t_1,
		if var7.error ~= nil then var7.error else t_1,
		if var7.data ~= nil then var7.data else t_1
	})
	
	return var6
end

return t