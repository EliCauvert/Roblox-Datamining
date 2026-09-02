local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local t = {
	useRecyclingItem = function()
		-- upvalues: reactModule (ref), recyclableViewContextModule (ref)
		local var1 = reactModule.useContext(recyclableViewContextModule)
		assert(type(var1) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return var1.itemSignal
	end,
	useRecyclingAssignment = function()
		-- upvalues: reactModule (ref), recyclableViewContextModule (ref)
		local var1 = reactModule.useContext(recyclableViewContextModule)
		assert(type(var1) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return var1.assignmentSignal
	end
}

local function _(p1)
	return if type(p1) == "function" then p1() else p1
end

local _ = function()
	-- upvalues: reactModule (ref), recyclableViewContextModule (ref)
	local var1 = reactModule.useContext(recyclableViewContextModule)
	assert(type(var1) == "table", "Recycling hooks must be called within a Recyclable view")
	
	return var1
end

local function useRecyclingToken(p1)
	-- upvalues: reactModule (ref), recyclableViewContextModule (ref), signalsModule (ref)
	local var1 = reactModule.useContext(recyclableViewContextModule)
	assert(type(var1) == "table", "Recycling hooks must be called within a Recyclable view")
	local itemKeySignal = var1.itemKeySignal
	local list = table.create(#(p1 or {}) + 1)
	list[1] = itemKeySignal
	
	if p1 ~= nil then
		for i, v in p1 do
			table.insert(list, v)
		end
	end
	local _, var2 = reactModule.useState(0)
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef({})
	local var5 = #var3.current ~= #list
	local list_1 = table.create(#list)
	
	for i, v in list do
		local var6 = v(false)
		list_1[i] = var6
		
		if var3.current[i] ~= var6 then
			var5 = true
		end
	end
	if var5 then
		var3.current = list_1
		var4.current = {}
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: signalsModule (copy), list (ref), var3 (ref), var4 (ref), var2 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: list (copy), var3 (copy), var4 (copy), var2 (copy)
			local list_1 = table.create(#list)
			local var7 = #var3.current ~= #list
			
			for i, v in list do
				local var8 = v(p2)
				list_1[i] = var8
				
				if var3.current[i] ~= var8 then
					var7 = true
				end
			end
			if var7 then
				var3.current = list_1
				var4.current = {}
				var2(function(p3)
					return p3 + 1
				end)
			end
		end)
	end, list)
	
	return var4.current
end

function t.useRecyclingState(p2, p3, p4)
	-- upvalues: useRecyclingToken (ref), reactModule (ref)
	local var7 = useRecyclingToken(p3)
	local var8, var9 = reactModule.useState(function()
		-- upvalues: var7 (ref), p2 (ref)
		return {
			token = var7,
			value = if type(p2) == "function" then p2() else p2
		}
	end)
	local var10 = if var8.token ~= var7 then nil else {
		token = var7,
		value = if type(p2) == "function" then p2() else p2
	}
	
	if var10 ~= nil then
		var9(var10)
	end
	local var11 = var10 or var8
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(p4)
	var13.current = p4
	reactModule.useLayoutEffect(function()
		-- upvalues: var12 (ref), var13 (ref)
		if var12.current then
			local current = var13.current
			
			if current == nil then
				return
			else
				current()
				
				return
			end
		else
			var12.current = true
		end
	end, { var7 })
	
	return var11.value, reactModule.useCallback(function(p5)
		-- upvalues: var9 (ref), var7 (ref)
		var9(function(p6)
			-- upvalues: var7 (copy), p5 (ref)
			return if p6.token == var7 then {
				token = p6.token,
				value = if type(p5) == "function" then p5(p6.value) else p5
			} else p6
		end)
	end, { var7 })
end

function t.useRecyclingSignal(value, p2, p3)
	-- upvalues: useRecyclingToken (ref), reactModule (ref), signalsModule (ref)
	local var7 = useRecyclingToken(p2)
	local var8 = reactModule.useState(function()
		-- upvalues: signalsModule (copy), value (ref), var7 (ref)
		local var9, var10 = signalsModule.createSignal(if type(value) == "function" then value() else value)
		
		return { getter = var9, setter = var10, token = var7 }
	end)
	
	if var8.token ~= var7 then
		var8.token = var7
		var8.setter(if type(value) == "function" then value() else value)
	end
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(p3)
	var10.current = p3
	reactModule.useLayoutEffect(function()
		-- upvalues: var9 (ref), var10 (ref)
		if var9.current then
			local current = var10.current
			
			if current == nil then
				return
			else
				current()
				
				return
			end
		else
			var9.current = true
		end
	end, { var7 })
	
	return var8.getter, reactModule.useCallback(function(p4)
		-- upvalues: var8 (ref), var7 (ref)
		if var8.token == var7 then
			var8.setter(p4)
		end
	end, { var7, var8 })
end

return table.freeze(t)