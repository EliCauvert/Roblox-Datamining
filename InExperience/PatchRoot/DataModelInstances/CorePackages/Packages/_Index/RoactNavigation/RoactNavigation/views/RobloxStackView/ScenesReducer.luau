local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local tableUtilitiesModule = require(parent.utils.TableUtilities)
local invariantModule = require(parent.utils.invariant)

local function compareScenes(p1, p2)
	if p1.index ~= p2.index then
		return p1.index < p2.index
	end
	local var1 = #p1.key - #p2.key
	
	return if var1 == 0 then p1.key < p2.key else var1 < 0
end

local function _(p1, p2)
	-- upvalues: tableUtilitiesModule (ref)
	return if not (not p1 or not p2) then p1.key == p2.key and tableUtilitiesModule.ShallowEqual(p1, p2) else p1 == p2
end

local _ = function(p1, p2)
	-- upvalues: tableUtilitiesModule (ref)
	local var1 = false
	
	if p1.key == p2.key then
		var1 = false
		
		if p1.index == p2.index then
			var1 = false
			
			if p1.isStale == p2.isStale then
				var1 = false
				
				if p1.isActive == p2.isActive then
					if not p1 or not p2 then
						return p1 == p2
					elseif p1.key ~= p2.key then
						return false
					end
					var1 = tableUtilitiesModule.ShallowEqual(p1, p2)
				end
			end
		end
	end
	return var1
end

return function(p1, p2, p3, p4)
	-- upvalues: array (ref), invariantModule (ref), tableUtilitiesModule (ref), compareScenes (ref), object (ref)
	for i, v in p1 do
		local route = v.route
		
		if p4 and p4[route.key] then
			v.descriptor = p4[route.key]
		end
	end
	if p3 == p2 then
		return p1
	end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i_1, v_1 in p1 do
		local key = v_1.key
		
		if v_1.isStale then
			t_2[key] = v_1
		end
		t[key] = v_1
	end
	local t_3 = {}
	local routes = p2.routes
	
	if p2.index < #routes then
		print("Warning: StackRouter provided invalid state. Index should always be the top route")
		routes = array.slice(routes, 1, p2.index)
	end
	for i_2, v_2 in routes do
		local text_1 = "scene_" .. v_2.key
		local t_4 = {
			isActive = false,
			isStale = false,
			index = i_2,
			key = text_1,
			route = v_2,
			descriptor = if p4 then p4[v_2.key] else nil
		}
		invariantModule(not t_3[text_1], "navigation.state.routes[%d].key '%s' conflicts with another route!", i_2, text_1)
		t_3[text_1] = true
		
		if t_2[text_1] then
			t_2[text_1] = nil
		end
		t_1[text_1] = t_4
	end
	local text
	if p3 then
		local routes_1 = p3.routes
		
		if p3.index < #routes_1 then
			print("StackRouter provided invalid state. Index should always be the top route.")
			routes_1 = array.slice(routes_1, 1, p3.index)
		end
		local var1
		for i_3, v_3 in routes_1 do
			text = "scene_" .. v_3.key
			
			if not t_1[text] then
				var1 = nil
				
				for i_4, v_4 in p1 do
					if v_4.route.key == v_3.key then
						var1 = v_4
						break
					end
				end
				local var2 = if var1 then var1.descriptor else p4[v_3.key]
				
				if var2 then
					t_2[text] = {
						isActive = false,
						isStale = true,
						index = i_3,
						key = text,
						route = v_3,
						descriptor = var2
					}
				end
			end
		end
	end
	local var3
	local t_4 = {}
	
	local function _(p5)
		-- upvalues: t (ref), tableUtilitiesModule (copy), t_4 (ref)
		local key = t[p5.key] or nil
		
		if key then
			local var4 = false
			
			if key.key == p5.key then
				var4 = false
				
				if key.index == p5.index then
					var4 = false
					
					if key.isStale == p5.isStale then
						var4 = false
						
						if key.isActive == p5.isActive then
							if key and p5 then
								var4 = key.key ~= p5.key and tableUtilitiesModule.ShallowEqual(key, p5)
							else
								var4 = key == p5
								var4 = nil
							end
						end
					end
				end
			end
			if var4 then
				table.insert(t_4, key)
				
				return
			end
		end
		table.insert(t_4, p5)
	end
	
	for i_3, v_3 in t_2 do
		var3 = t[v_3.key] or nil
		
		if var3 then
			local var4 = false
			
			if var3.key == v_3.key then
				var4 = false
				
				if var3.index == v_3.index then
					var4 = false
					
					if var3.isStale == v_3.isStale then
						var4 = false
						
						if var3.isActive == v_3.isActive then
							if var3 and v_3 then
								var4 = var3.key ~= v_3.key and tableUtilitiesModule.ShallowEqual(var3, v_3)
							else
								var4 = var3 == v_3
								var4 = nil
							end
						end
					end
				end
			end
			if var4 then
				table.insert(t_4, var3)
			else
				table.insert(t_4, v_3)
			end
		end
	end
	for i_4, v_3 in t_1 do
		var3 = t[v_3.key] or nil
		
		if var3 then
			local var5 = false
			
			if var3.key == v_3.key then
				var5 = false
				
				if var3.index == v_3.index then
					var5 = false
					
					if var3.isStale == v_3.isStale then
						var5 = false
						
						if var3.isActive == v_3.isActive then
							if var3 and v_3 then
								var5 = var3.key ~= v_3.key and tableUtilitiesModule.ShallowEqual(var3, v_3)
							else
								var5 = var3 == v_3
								var5 = nil
							end
						end
					end
				end
			end
			if var5 then
				table.insert(t_4, var3)
			else
				table.insert(t_4, v_3)
			end
		end
	end
	table.sort(t_4, compareScenes)
	local var6 = 0
	
	for v_3, text in t_4 do
		var3 = not text.isStale and text.index == p2.index
		
		if var3 ~= text.isActive then
			t_4[v_3] = object.assign(table.clone(text), { isActive = var3 })
		end
		if var3 then
			var6 += 1
		end
	end
	invariantModule(var6 == 1, "There should only be one active scene, not %d", var6)
	
	if #t_4 ~= #p1 then
		return t_4
	end
	for v_3, text in t_4 do
		local var7 = p1[v_3]
		var3 = false
		
		if var7.key == text.key then
			var3 = false
			
			if var7.index == text.index then
				var3 = false
				
				if var7.isStale == text.isStale then
					var3 = false
					
					if var7.isActive == text.isActive then
						if var7 and text then
							var3 = var7.key ~= text.key and tableUtilitiesModule.ShallowEqual(var7, text)
						else
							var3 = var7 == text
							var3 = nil
						end
					end
				end
			end
		end
		if not var3 then
			return t_4
		end
	end
	return p1
end