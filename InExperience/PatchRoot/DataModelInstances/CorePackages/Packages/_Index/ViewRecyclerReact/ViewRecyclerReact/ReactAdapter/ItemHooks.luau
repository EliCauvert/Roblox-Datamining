local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local reactModule = require(viewRecyclerReact.Parent.React)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local t = {
	useItemValue = function(p0) --[[ line: 68 ]]
		-- upvalues: signalsReactModule (ref)
		return signalsReactModule.useSignalState(p0)
	end
}

local function _(p1) --[[ line: 20 | named "initialize" ]]
	return if type(p1) == "function" then p1() else p1
end

local function useRecyclingToken(p2) --[[ line: 24 ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	local _, var6 = reactModule.useState(0)
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useRef({})
	local var9 = #var7.current ~= #p2
	local list = table.create(#p2)
	
	for i, v in p2 do
		local var11 = v(false)
		list[i] = var11
		
		if var7.current[i] ~= var11 then
			var9 = true
		end
	end
	if var9 then
		var7.current = list
		var8.current = {}
	end
	reactModule.useLayoutEffect(function() --[[ line: 42 ]]
		-- upvalues: signalsModule (copy), p2 (ref), var7 (ref), var8 (ref), var6 (ref)
		return signalsModule.createEffect(function(p3) --[[ line: 43 ]]
			-- upvalues: p2 (copy), var7 (copy), var8 (copy), var6 (copy)
			local list = table.create(#p2)
			local var13 = #var7.current ~= #p2
			
			for i, v in p2 do
				local var14 = v(p3)
				list[i] = var14
				
				if var7.current[i] ~= var14 then
					var13 = true
				end
			end
			if var13 then
				var7.current = list
				var8.current = {}
				var6(function(p4) --[[ line: 56 ]]
					return p4 + 1
				end)
			end
		end)
	end, p2)
	
	return var8.current
end

function t.useRecyclingState(p5, p6, p7) --[[ line: 74 ]]
	-- upvalues: useRecyclingToken (ref), reactModule (ref)
	local var15 = useRecyclingToken(p6)
	local var16, var17 = reactModule.useState(function() --[[ line: 80 ]]
		-- upvalues: var15 (ref), p5 (ref)
		return {
			token = var15,
			value = if type(p5) == "function" then p5() else p5
		}
	end)
	local var18 = if var16.token ~= var15 then nil else {
		token = var15,
		value = if type(p5) == "function" then p5() else p5
	}
	
	if var18 ~= nil then
		var17(var18)
	end
	local var18_1 = var18 or var16
	local var20 = reactModule.useRef(false)
	local var21 = reactModule.useRef(p7)
	var21.current = p7
	reactModule.useLayoutEffect(function() --[[ line: 99 ]]
		-- upvalues: var20 (ref), var21 (ref)
		if var20.current then
			local current = var21.current
			
			if current == nil then
				return
			else
				current()
				
				return
			end
		else
			var20.current = true
		end
	end, { var15 })
	
	return var18_1.value, reactModule.useCallback(function(p8) --[[ line: 111 ]]
		-- upvalues: var17 (ref), var15 (ref)
		var17(function(p9) --[[ line: 112 ]]
			-- upvalues: var15 (copy), p8 (ref)
			return if p9.token == var15 then {
				token = p9.token,
				value = if type(p8) == "function" then p8(p9.value) else p8
			} else p9
		end)
	end, { var15 })
end

function t.useRecyclingSignal(value, p10, p11) --[[ line: 126 ]]
	-- upvalues: useRecyclingToken (ref), reactModule (ref), signalsModule (ref)
	local var22 = useRecyclingToken(p10)
	local var23 = reactModule.useState(function() --[[ line: 132 ]]
		-- upvalues: signalsModule (copy), value (ref), var22 (ref)
		local var26, var27 = signalsModule.createSignal(if type(value) == "function" then value() else value)
		
		return { getter = var26, setter = var27, token = var22 }
	end)
	
	if var23.token ~= var22 then
		var23.token = var22
		var23.setter(if type(value) == "function" then value() else value)
	end
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useRef(p11)
	var25.current = p11
	reactModule.useLayoutEffect(function() --[[ line: 148 ]]
		-- upvalues: var24 (ref), var25 (ref)
		if var24.current then
			local current = var25.current
			
			if current == nil then
				return
			else
				current()
				
				return
			end
		else
			var24.current = true
		end
	end, { var22 })
	
	return var23.getter, reactModule.useCallback(function(p12) --[[ line: 160 ]]
		-- upvalues: var23 (ref), var22 (ref)
		if var23.token == var22 then
			var23.setter(p12)
		end
	end, { var22, var23 })
end

function t.useItemBinding(p13, p14) --[[ line: 170 ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var28, var29 = reactModule.useBinding(reactModule.useMemo(function() --[[ line: 171 ]]
		-- upvalues: p14 (ref), p13 (ref)
		return p14(p13(false), false)
	end, { p13, p14 }))
	reactModule.useLayoutEffect(function() --[[ line: 176 ]]
		-- upvalues: p14 (ref), p13 (ref), var28 (ref), var29 (ref), signalsModule (copy)
		local var30 = p14(p13(false), false)
		
		if var30 ~= var28:getValue() then
			var29(var30)
		end
		return signalsModule.createEffect(function(p15) --[[ line: 182 ]]
			-- upvalues: p14 (copy), p13 (copy), var30 (write), var29 (copy)
			local var31 = p14(p13(p15), p15)
			
			if var31 ~= var30 then
				var30 = var31
				var29(var31)
			end
		end)
	end, { var28, p13, p14, var29 })
	
	return var28
end

return table.freeze(t)