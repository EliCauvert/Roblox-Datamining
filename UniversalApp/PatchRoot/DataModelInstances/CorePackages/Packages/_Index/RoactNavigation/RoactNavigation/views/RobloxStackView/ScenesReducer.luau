local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local TableUtilitiesModule = require(Parent.utils.TableUtilities)
local InvariantModule = require(Parent.utils.invariant)

local function compareScenes(A, B): boolean --[[ Line: 12 ]]
	if A.index == B.index then
		local v1 = #A.key - #B.key
		
		return if v1 == 0 then A.key < B.key else v1 < 0
	else
		return A.index < B.index
	end
end

local function _(p1, p2) --[[ Line: 27 | Named "routesAreShallowEqual" ]]
	-- upvalues: TableUtilitiesModule (copy)
	return if p1 and p2 then p1.key == p2.key and TableUtilitiesModule.ShallowEqual(p1, p2) else p1 == p2
end

local _ = function(p1, p2) --[[ Line: 39 | Named "scenesAreShallowEqual" ]]
	-- upvalues: TableUtilitiesModule (copy)
	local Flag = false
	
	if p1.key == p2.key then
		Flag = false
		
		if p1.index == p2.index then
			Flag = false
			
			if p1.isStale == p2.isStale then
				Flag = false
				
				if p1.isActive == p2.isActive then
					if not p1 or not p2 then
						return p1 == p2
					end
					if p1.key ~= p2.key then
						return false
					end
					Flag = TableUtilitiesModule.ShallowEqual(p1, p2)
				end
			end
		end
	end
	return Flag
end

return function(List, p1, p2, p3) --[[ Line: 48 ]]
	-- upvalues: Array (copy), InvariantModule (copy), TableUtilitiesModule (copy), compareScenes (copy), Object (copy)
	for _, value in List do
		local Route = value.route
		
		if p3 and p3[Route.key] then
			value.descriptor = p3[Route.key]
		end
	end
	if p2 == p1 then
		return List
	end
	local t = {}
	local t1 = {}
	local t2 = {}
	
	for _, value1 in List do
		local Key = value1.key
		
		if value1.isStale then
			t2[Key] = value1
		end
		t[Key] = value1
	end
	local t3 = {}
	local Routes = p1.routes
	
	if p1.index < #Routes then
		print("Warning: StackRouter provided invalid state. Index should always be the top route")
		Routes = Array.slice(Routes, 1, p1.index)
	end
	for Index, route in Routes do
		local Text = "scene_" .. route.key
		local config = {
			isActive = false,
			isStale = false,
			index = Index,
			key = Text,
			route = route,
			descriptor = if p3 then p3[route.key] else nil
		}
		InvariantModule(not t3[Text], "navigation.state.routes[%d].key '%s' conflicts with another route!", Index, Text)
		t3[Text] = true
		
		if t2[Text] then
			t2[Text] = nil
		end
		t1[Text] = config
	end
	if p2 then
		local Routes1 = p2.routes
		
		if p2.index < #Routes1 then
			print("StackRouter provided invalid state. Index should always be the top route.")
			Routes1 = Array.slice(Routes1, 1, p2.index)
		end
		local v1 = nil
		for Index1, route1 in Routes1 do
			local Text = "scene_" .. route1.key
			
			if not t1[Text] then
				v1 = nil
				
				for _, value2 in List do
					if value2.route.key == route1.key then
						v1 = value2
						break
					end
				end
				local Descriptor = if v1 then v1.descriptor else p3[route1.key]
				
				if Descriptor then
					t2[Text] = {
						isActive = false,
						isStale = true,
						index = Index1,
						key = Text,
						route = route1,
						descriptor = Descriptor
					}
				end
			end
		end
	end
	local List1 = {}
	
	local function _(p4) --[[ Line: 155 | Named "mergeScene" ]]
		-- upvalues: t (copy), TableUtilitiesModule (upval), List1 (copy)
		local Entry = t[p4.key] or nil
		
		if Entry and (Entry.key == p4.key and (Entry.index == p4.index and (Entry.isStale == p4.isStale and (Entry.isActive == p4.isActive and (if Entry and p4 then Entry.key == p4.key and TableUtilitiesModule.ShallowEqual(Entry, p4) else Entry == p4))))) then
			table.insert(List1, Entry)
			
			return
		else
			table.insert(List1, p4)
		end
	end
	
	for _, value3 in t2 do
		local Entry = t[value3.key] or nil
		
		if Entry and (Entry.key == value3.key and (Entry.index == value3.index and (Entry.isStale == value3.isStale and (Entry.isActive == value3.isActive and (if Entry and value3 then Entry.key == value3.key and TableUtilitiesModule.ShallowEqual(Entry, value3) else Entry == value3))))) then
			table.insert(List1, Entry)
		else
			table.insert(List1, value3)
		end
	end
	for _, value5 in t1 do
		local Entry1 = t[value5.key] or nil
		
		if Entry1 and (Entry1.key == value5.key and (Entry1.index == value5.index and (Entry1.isStale == value5.isStale and (Entry1.isActive == value5.isActive and (if Entry1 and value5 then Entry1.key == value5.key and TableUtilitiesModule.ShallowEqual(Entry1, value5) else Entry1 == value5))))) then
			table.insert(List1, Entry1)
		else
			table.insert(List1, value5)
		end
	end
	table.sort(List1, compareScenes)
	local Count = 0
	
	for i, value4 in List1 do
		local IsIndexMatch: boolean = not value4.isStale and value4.index == p1.index
		
		if IsIndexMatch ~= value4.isActive then
			List1[i] = Object.assign(table.clone(value4), { isActive = IsIndexMatch })
		end
		if IsIndexMatch then
			Count += 1
		end
	end
	InvariantModule(Count == 1, "There should only be one active scene, not %d", Count)
	
	if #List1 ~= #List then
		return List1
	end
	for i1, value6 in List1 do
		local Entry = List[i1]
		
		if Entry.key ~= value6.key or (Entry.index ~= value6.index or (Entry.isStale ~= value6.isStale or (Entry.isActive ~= value6.isActive or not (if Entry and value6 then Entry.key == value6.key and TableUtilitiesModule.ShallowEqual(Entry, value6) else Entry == value6)))) then
			return List1
		end
	end
	return List
end