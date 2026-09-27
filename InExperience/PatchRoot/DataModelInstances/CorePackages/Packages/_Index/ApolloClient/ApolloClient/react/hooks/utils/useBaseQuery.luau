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
	local var6 = nil
	local current = var5.current
	
	if not current then
		var5.current = queryData.new({
			options = var4,
			context = var1,
			onNewData = function(_)
				-- upvalues: boolean (copy), var6 (write), promiseModule (copy), var5 (ref), var3 (ref)
				if boolean.toJSBoolean(var6:ssrInitiated()) then
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
		current = var5.current
	end
	var6 = current
	var6:setOptions(var4)
	var6.context = var1
	local var7 = useDeepMemo(function()
		-- upvalues: p3 (write), var6 (write)
		return if p3 then var6:executeLazy() else var6:execute()
	end, {
		options = object.assign({}, var4, { onError = object.None, onCompleted = object.None }),
		context = var1,
		tick = var2
	})
	local var8 = if p3 then var7[2] else var7
	
	if _G.__DEV__ then
		useAfterFastRefresh(var3)
	end
	useEffect(function()
		-- upvalues: var6 (write), var5 (ref)
		return function()
			-- upvalues: var6 (copy), var5 (copy)
			var6:cleanup()
			var5.current = nil
		end
	end, {})
	useEffect(function()
		-- upvalues: var6 (write), p3 (write)
		return var6:afterExecute({ lazy = p3 })
	end, {
		if var8.loading ~= nil then var8.loading else t_1,
		if var8.networkStatus ~= nil then var8.networkStatus else t_1,
		if var8.error ~= nil then var8.error else t_1,
		if var8.data ~= nil then var8.data else t_1
	})
	
	return var7
end

return t