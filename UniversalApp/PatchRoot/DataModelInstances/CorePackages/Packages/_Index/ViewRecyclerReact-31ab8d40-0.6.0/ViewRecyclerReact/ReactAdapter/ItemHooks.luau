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
	end,
	useRecyclingIndex = function()
		-- upvalues: reactModule (ref), recyclableViewContextModule (ref)
		local var1 = reactModule.useContext(recyclableViewContextModule)
		assert(type(var1) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return var1.indexSignal
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

local _ = function(p1, p2)
	if #p1 ~= #p2 then
		return false
	end
	for i, v in p2 do
		if p1[i] ~= v then
			return false
		end
	end
	return true
end

local function useRecyclingToken(p3)
	-- upvalues: reactModule (ref), recyclableViewContextModule (ref), signalsModule (ref)
	local var1 = reactModule.useContext(recyclableViewContextModule)
	assert(type(var1) == "table", "Recycling hooks must be called within a Recyclable view")
	local itemKeySignal = var1.itemKeySignal
	local list = table.create(#(p3 or {}) + 1)
	list[1] = itemKeySignal
	
	if p3 ~= nil then
		for i, v in p3 do
			table.insert(list, v)
		end
	end
	local list_1 = table.create(#list)
	
	for i, v in list do
		list_1[i] = v(false)
	end
	local var2
	local var3, var4 = reactModule.useState(function()
		-- upvalues: list_1 (ref)
		return { token = {}, values = list_1 }
	end)
	local values = var3.values
	
	if #values == #list_1 then
		for i_1, v_1 in list_1 do
			if values[i_1] ~= v_1 then
				var2 = false
			end
		end
		var2 = true
	else
		var2 = false
	end
	if not var2 then
		var3 = { token = {}, values = list_1 }
		var4(var3)
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: signalsModule (copy), list (ref), var4 (ref)
		return signalsModule.createEffect(function(p4)
			-- upvalues: list (copy), var4 (copy)
			local list_1 = table.create(#list)
			
			for i, v in list do
				list_1[i] = v(p4)
			end
			var4(function(p5)
				-- upvalues: list_1 (ref)
				local var5
				local values = p5.values
				
				if #values == #list_1 then
					for i, v in list_1 do
						if values[i] ~= v then
							var5 = false
						end
					end
					var5 = true
				else
					var5 = false
				end
				return if var5 then p5 else { token = {}, values = list_1 }
			end)
		end)
	end, list)
	
	return var3.token
end

function t.useRecyclingState(p4, p5, p6)
	-- upvalues: useRecyclingToken (ref), reactModule (ref)
	local var5 = useRecyclingToken(p5)
	local var6, var7 = reactModule.useState(function()
		-- upvalues: var5 (ref), p4 (ref)
		return {
			token = var5,
			value = if type(p4) == "function" then p4() else p4
		}
	end)
	
	if var6.token ~= var5 then
		var6 = {
			token = var5,
			value = if type(p4) == "function" then p4() else p4
		}
		var7(var6)
	end
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useRef(p6)
	reactModule.useLayoutEffect(function()
		-- upvalues: var9 (ref), p6 (ref)
		var9.current = p6
	end, { p6 })
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
	end, { var5 })
	
	return var6.value, reactModule.useCallback(function(p7)
		-- upvalues: var7 (ref), var5 (ref)
		var7(function(p8)
			-- upvalues: var5 (copy), p7 (ref)
			return if p8.token == var5 then {
				token = p8.token,
				value = if type(p7) == "function" then p7(p8.value) else p7
			} else p8
		end)
	end, { var5 })
end

function t.useRecyclingSignal(value, p4, p5)
	-- upvalues: useRecyclingToken (ref), reactModule (ref), signalsModule (ref)
	local var5 = useRecyclingToken(p4)
	local var6 = reactModule.useState(function()
		-- upvalues: signalsModule (copy), value (ref), var5 (ref)
		local var7, var8 = signalsModule.createSignal(if type(value) == "function" then value() else value)
		
		return { getter = var7, setter = var8, committedToken = var5 }
	end)
	local var7 = reactModule.useRef(false)
	reactModule.useLayoutEffect(function()
		-- upvalues: var7 (ref), var6 (ref), var5 (ref), value (ref), p5 (ref)
		if var7.current then
			var6.committedToken = var5
			local var8 = value
			var6.setter(if type(var8) == "function" then var8() else var8)
			
			if p5 == nil then
				return
			else
				p5()
				
				return
			end
		else
			var7.current = true
		end
	end, { var5 })
	
	return var6.getter, reactModule.useCallback(function(p6)
		-- upvalues: var6 (ref), var5 (ref)
		if var6.committedToken == var5 then
			var6.setter(p6)
		end
	end, { var5, var6 })
end

return table.freeze(t)