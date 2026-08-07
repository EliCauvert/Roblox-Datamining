-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

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

function t.useBaseQuery(p0, p1, p2) --[[ line: 48 ]]
	-- upvalues: useContext (ref), getApolloContext (ref), useReducer (ref), boolean (ref), object (ref), useRef (ref), queryData (ref), promiseModule (ref), useDeepMemo (ref), useAfterFastRefresh (ref), useEffect (ref), t_1 (ref)
	if p2 == nil then
		p2 = false
	end
	local var5 = useContext(getApolloContext())
	local var6, var7 = useReducer(function(p3) --[[ line: 58 ]]
		return p3 + 1
	end, 0)
	local var8 = boolean.toJSBoolean(p1) and object.assign({}, p1, { query = p0 }) or { query = p0 }
	local var9 = useRef(nil)
	local current = nil
	current = var9.current or (function() --[[ line: 66 ]]
		-- upvalues: var9 (ref), queryData (copy), var8 (ref), var5 (ref), boolean (copy), current (write), promiseModule (copy), var7 (ref)
		var9.current = queryData.new({
			options = var8,
			context = var5,
			onNewData = function(_) --[[ line: 70 ]]
				-- upvalues: boolean (copy), current (copy), promiseModule (copy), var9 (copy), var7 (copy)
				if boolean.toJSBoolean(current:ssrInitiated()) then
					var7(nil)
					
					return
				end
				promiseModule.delay(0):andThen(function() --[[ line: 78 ]]
					-- upvalues: var9 (copy), var7 (copy)
					if var9.current == nil or not var9.current.isMounted then
						return
					end
					return var7(nil)
				end)
			end
		})
		
		return var9.current
	end)()
	current:setOptions(var8)
	current.context = var5
	local var11 = useDeepMemo(function() --[[ line: 114 ]]
		-- upvalues: p2 (write), current (write)
		return if p2 then current:executeLazy() else current:execute()
	end, {
		options = object.assign({}, var8, { onError = object.None, onCompleted = object.None }),
		context = var5,
		tick = var6
	})
	local var12 = if p2 then var11[2] else var11
	
	if _G.__DEV__ then
		useAfterFastRefresh(var7)
	end
	useEffect(function() --[[ line: 131 ]]
		-- upvalues: current (write), var9 (ref)
		return function() --[[ line: 132 ]]
			-- upvalues: current (copy), var9 (copy)
			current:cleanup()
			var9.current = nil
		end
	end, {})
	useEffect(function() --[[ line: 140 ]]
		-- upvalues: current (write), p2 (write)
		return current:afterExecute({ lazy = p2 })
	end, {
		if var12.loading ~= nil then var12.loading else t_1,
		if var12.networkStatus ~= nil then var12.networkStatus else t_1,
		if var12.error ~= nil then var12.error else t_1,
		if var12.data ~= nil then var12.data else t_1
	})
	
	return var11
end

return t