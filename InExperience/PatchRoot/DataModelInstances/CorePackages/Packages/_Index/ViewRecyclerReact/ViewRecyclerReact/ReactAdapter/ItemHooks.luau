local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local reactModule = require(viewRecyclerReact.Parent.React)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local t = {
	useItemValue = function(p1)
		-- upvalues: signalsReactModule (ref)
		return signalsReactModule.useSignalState(p1)
	end
}

local function _(p1)
	return if type(p1) == "function" then p1() else p1
end

local function useRecyclingToken(p1)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local _, var1 = reactModule.useState(0)
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef({})
	local var4 = #var2.current ~= #p1
	local list = table.create(#p1)
	
	for i, v in p1 do
		local var5 = v(false)
		list[i] = var5
		
		if var2.current[i] ~= var5 then
			var4 = true
		end
	end
	if var4 then
		var2.current = list
		var3.current = {}
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: signalsModule (copy), p1 (ref), var2 (ref), var3 (ref), var1 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), var2 (copy), var3 (copy), var1 (copy)
			local list = table.create(#p1)
			local var6 = #var2.current ~= #p1
			
			for i, v in p1 do
				local var7 = v(p2)
				list[i] = var7
				
				if var2.current[i] ~= var7 then
					var6 = true
				end
			end
			if var6 then
				var2.current = list
				var3.current = {}
				var1(function(p3)
					return p3 + 1
				end)
			end
		end)
	end, p1)
	
	return var3.current
end

function t.useRecyclingState(p2, p3, p4)
	-- upvalues: useRecyclingToken (ref), reactModule (ref)
	local var6 = useRecyclingToken(p3)
	local var7, var8 = reactModule.useState(function()
		-- upvalues: var6 (ref), p2 (ref)
		return {
			token = var6,
			value = if type(p2) == "function" then p2() else p2
		}
	end)
	local var9 = if var7.token ~= var6 then nil else {
		token = var6,
		value = if type(p2) == "function" then p2() else p2
	}
	
	if var9 ~= nil then
		var8(var9)
	end
	local var10 = var9 or var7
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useRef(p4)
	var12.current = p4
	reactModule.useLayoutEffect(function()
		-- upvalues: var11 (ref), var12 (ref)
		if var11.current then
			local current = var12.current
			
			if current == nil then
				return
			else
				current()
				
				return
			end
		else
			var11.current = true
		end
	end, { var6 })
	
	return var10.value, reactModule.useCallback(function(p5)
		-- upvalues: var8 (ref), var6 (ref)
		var8(function(p6)
			-- upvalues: var6 (copy), p5 (ref)
			return if p6.token == var6 then {
				token = p6.token,
				value = if type(p5) == "function" then p5(p6.value) else p5
			} else p6
		end)
	end, { var6 })
end

function t.useRecyclingSignal(value, p2, p3)
	-- upvalues: useRecyclingToken (ref), reactModule (ref), signalsModule (ref)
	local var6 = useRecyclingToken(p2)
	local var7 = reactModule.useState(function()
		-- upvalues: signalsModule (copy), value (ref), var6 (ref)
		local var8, var9 = signalsModule.createSignal(if type(value) == "function" then value() else value)
		
		return { getter = var8, setter = var9, token = var6 }
	end)
	
	if var7.token ~= var6 then
		var7.token = var6
		var7.setter(if type(value) == "function" then value() else value)
	end
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useRef(p3)
	var9.current = p3
	reactModule.useLayoutEffect(function()
		-- upvalues: var8 (ref), var9 (ref)
		if var8.current then
			local current = var9.current
			
			if current == nil then
				return
			else
				current()
				
				return
			end
		else
			var8.current = true
		end
	end, { var6 })
	
	return var7.getter, reactModule.useCallback(function(p4)
		-- upvalues: var7 (ref), var6 (ref)
		if var7.token == var6 then
			var7.setter(p4)
		end
	end, { var6, var7 })
end

function t.useItemBinding(p2, p3)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var6, var7 = reactModule.useBinding(reactModule.useMemo(function()
		-- upvalues: p3 (ref), p2 (ref)
		return p3(p2(false), false)
	end, { p2, p3 }))
	reactModule.useLayoutEffect(function()
		-- upvalues: p3 (ref), p2 (ref), var6 (ref), var7 (ref), signalsModule (copy)
		local var8 = p3(p2(false), false)
		
		if var8 ~= var6:getValue() then
			var7(var8)
		end
		return signalsModule.createEffect(function(p4)
			-- upvalues: p3 (copy), p2 (copy), var8 (write), var7 (copy)
			local var9 = p3(p2(p4), p4)
			
			if var9 ~= var8 then
				var8 = var9
				var7(var9)
			end
		end)
	end, { var6, p2, p3, var7 })
	
	return var6
end

return table.freeze(t)