local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local _ = require(Parent.Navigation)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local StateUtils = {
	get = function(p1, Key)
		for _, route in p1.routes do
			if route.key == Key then
				return route
			end
		end
		return nil
	end,
	indexOf = function(p2, Key)
		for i, route in p2.routes do
			if route.key == Key then
				return i
			end
		end
		return nil
	end,
	has = function(p3, Key): boolean
		for _, route in p3.routes do
			if route.key == Key then
				return true
			end
		end
		return false
	end
}

function StateUtils.push(Tbl, p4)
	-- upvalues: StateUtils (copy), Array (copy), Object (copy)
	assert(StateUtils.indexOf(Tbl, p4.key) == nil, ("should not push route with duplicated key %s"):format(p4.key))
	local ConcatResult = Array.concat(Tbl.routes, { p4 })
	
	return Object.assign(table.clone(Tbl), { index = #ConcatResult, routes = ConcatResult })
end

function StateUtils.pop(Tbl)
	-- upvalues: Object (copy)
	if Tbl.index <= 1 then
		return Tbl
	else
		local Copy = table.clone(Tbl.routes)
		table.remove(Copy, #Copy)
		
		return Object.assign(table.clone(Tbl), { index = #Copy, routes = Copy })
	end
end

function StateUtils.jumpToIndex(Tbl, Index)
	-- upvalues: Object (copy)
	if Index == Tbl.index then
		return Tbl
	else
		assert(Tbl.routes[Index] ~= nil, ("invalid index %d to jump to"):format(Index))
		
		return Object.assign(table.clone(Tbl), { index = Index })
	end
end

function StateUtils.jumpTo(p4, p5)
	-- upvalues: StateUtils (copy)
	local IndexOfResult = StateUtils.indexOf(p4, p5)
	assert(IndexOfResult ~= nil, ("attempt to jump to unknown key \"%s\""):format(p5))
	
	return StateUtils.jumpToIndex(p4, IndexOfResult)
end

function StateUtils.back(p4)
	-- upvalues: StateUtils (copy)
	local IndexDelta = p4.index - 1
	
	return if p4.routes[IndexDelta] then StateUtils.jumpToIndex(p4, IndexDelta) else p4
end

function StateUtils.forward(p4)
	-- upvalues: StateUtils (copy)
	local NewIndex = p4.index + 1
	
	return if p4.routes[NewIndex] then StateUtils.jumpToIndex(p4, NewIndex) else p4
end

function StateUtils.replaceAndPrune(p4, p5, p6)
	-- upvalues: StateUtils (copy), Object (copy)
	local IndexOfResult = StateUtils.indexOf(p4, p5)
	local ReplaceAtIndexResult = StateUtils.replaceAtIndex(p4, IndexOfResult, p6)
	
	return Object.assign(table.clone(ReplaceAtIndexResult), {
		routes = { unpack(ReplaceAtIndexResult.routes, 1, IndexOfResult) }
	})
end

function StateUtils.replaceAt(p4, p5, p6, p7)
	-- upvalues: StateUtils (copy)
	local IndexOfResult = StateUtils.indexOf(p4, p5)
	local ReplaceAtIndexResult = StateUtils.replaceAtIndex(p4, IndexOfResult, p6)
	ReplaceAtIndexResult.index = if p7 then p4.index else IndexOfResult
	
	return ReplaceAtIndexResult
end

function StateUtils.replaceAtIndex(Tbl, Index, Route)
	-- upvalues: Object (copy)
	assert(Tbl.routes[Index] ~= nil, ("invalid index %d for replacing route %s"):format(Index, Route.key))
	
	if Tbl.routes[Index] == Route and Index == Tbl.index then
		return Tbl
	else
		local Copy = table.clone(Tbl.routes)
		Copy[Index] = Route
		
		return Object.assign(table.clone(Tbl), { index = Index, routes = Copy })
	end
end

function StateUtils.reset(Tbl, Routes, p4)
	-- upvalues: Object (copy)
	assert(type(Routes) == "table" and #Routes > 0, "invalid routes to replace")
	local CountRoutes = if p4 then p4 else #Routes
	
	if #Tbl.routes == #Routes and Tbl.index == CountRoutes then
		local Flag = true
		
		for i = 1, #Routes do
			if Tbl.routes[i] == Routes[i] then
				continue
			end
			Flag = false
			break
		end
		if Flag then
			return Tbl
		end
	end
	assert(Routes[CountRoutes] ~= nil, ("invalid index %d to reset"):format(CountRoutes))
	
	return Object.assign(table.clone(Tbl), { index = CountRoutes, routes = Routes })
end

return StateUtils