-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local tableUtilitiesModule = require(parent.utils.TableUtilities)
local invariantModule = require(parent.utils.invariant)

local function compareScenes(p0, p1) --[[ line: 12 ]]
	if p0.index ~= p1.index then
		return p0.index < p1.index
	end
	local var4 = #p0.key - #p1.key
	
	return if var4 == 0 then p0.key < p1.key else var4 < 0
end

local function _(p2, p3) --[[ line: 27 | named "routesAreShallowEqual" ]]
	-- upvalues: tableUtilitiesModule (ref)
	return if not (not p2 or not p3) then p2.key == p3.key and tableUtilitiesModule.ShallowEqual(p2, p3) else p2 == p3
end

local _ = function(p4, p5) --[[ line: 39 | named "scenesAreShallowEqual" ]]
	-- upvalues: tableUtilitiesModule (ref)
	local var5 = false
	
	if p4.key == p5.key then
		var5 = false
		
		if p4.index == p5.index then
			var5 = false
			
			if p4.isStale == p5.isStale then
				var5 = false
				
				if p4.isActive == p5.isActive then
					if not p4 or not p5 then
						return p4 == p5
					elseif p4.key ~= p5.key then
						return false
					end
					var5 = tableUtilitiesModule.ShallowEqual(p4, p5)
				end
			end
		end
	end
	return var5
end

return function(p6, p7, p8, p9) --[[ line: 48 ]]
	-- upvalues: array (ref), invariantModule (ref), tableUtilitiesModule (ref), compareScenes (ref), object (ref)
	for i, v in p6 do
		local route = v.route
		
		if p9 and p9[route.key] then
			v.descriptor = p9[route.key]
		end
	end
	if p8 == p7 then
		return p6
	end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i_1, v_1 in p6 do
		local key = v_1.key
		
		if v_1.isStale then
			t_2[key] = v_1
		end
		t[key] = v_1
	end
	local t_3 = {}
	local routes = p7.routes
	
	if p7.index < #routes then
		print("Warning: StackRouter provided invalid state. Index should always be the top route")
		routes = array.slice(routes, 1, p7.index)
	end
	for i_2, v_2 in routes do
		local text_1 = "scene_" .. v_2.key
		local t_4 = {
			isActive = false,
			isStale = false,
			index = i_2,
			key = text_1,
			route = v_2,
			descriptor = if p9 then p9[v_2.key] else nil
		}
		invariantModule(not t_3[text_1], "navigation.state.routes[%d].key '%s' conflicts with another route!", i_2, text_1)
		t_3[text_1] = true
		
		if t_2[text_1] then
			t_2[text_1] = nil
		end
		t_1[text_1] = t_4
	end
	local text
	if p8 then
		local routes_1 = p8.routes
		
		if p8.index < #routes_1 then
			print("StackRouter provided invalid state. Index should always be the top route.")
			routes_1 = array.slice(routes_1, 1, p8.index)
		end
		local var11
		for i_3, v_3 in routes_1 do
			text = "scene_" .. v_3.key
			
			if not t_1[text] then
				var11 = nil
				
				for i_4, v_4 in p6 do
					if v_4.route.key == v_3.key then
						var11 = v_4
						break
					end
				end
				local var12 = if var11 then var11.descriptor else p9[v_3.key]
				
				if var12 then
					t_2[text] = {
						isActive = false,
						isStale = true,
						index = i_3,
						key = text,
						route = v_3,
						descriptor = var12
					}
				end
			end
		end
	end
	local var16
	local t_4 = {}
	
	local function _(p10) --[[ line: 155 | named "mergeScene" ]]
		-- upvalues: t (ref), tableUtilitiesModule (copy), t_4 (ref)
		local key = t[p10.key] or nil
		
		if key then
			local var22 = false
			
			if key.key == p10.key then
				var22 = false
				
				if key.index == p10.index then
					var22 = false
					
					if key.isStale == p10.isStale then
						var22 = false
						
						if key.isActive == p10.isActive then
							if key and p10 then
								var22 = key.key ~= p10.key and tableUtilitiesModule.ShallowEqual(key, p10)
							else
								var22 = key == p10
								var22 = nil
							end
						end
					end
				end
			end
			if var22 then
				table.insert(t_4, key)
				
				return
			end
		end
		table.insert(t_4, p10)
	end
	
	for i_3, v_3 in t_2 do
		var16 = t[v_3.key] or nil
		
		if var16 then
			local var18 = false
			
			if var16.key == v_3.key then
				var18 = false
				
				if var16.index == v_3.index then
					var18 = false
					
					if var16.isStale == v_3.isStale then
						var18 = false
						
						if var16.isActive == v_3.isActive then
							if var16 and v_3 then
								var18 = var16.key ~= v_3.key and tableUtilitiesModule.ShallowEqual(var16, v_3)
							else
								var18 = var16 == v_3
								var18 = nil
							end
						end
					end
				end
			end
			if var18 then
				table.insert(t_4, var16)
			else
				table.insert(t_4, v_3)
			end
		end
	end
	for i_4, v_3 in t_1 do
		var16 = t[v_3.key] or nil
		
		if var16 then
			local var17 = false
			
			if var16.key == v_3.key then
				var17 = false
				
				if var16.index == v_3.index then
					var17 = false
					
					if var16.isStale == v_3.isStale then
						var17 = false
						
						if var16.isActive == v_3.isActive then
							if var16 and v_3 then
								var17 = var16.key ~= v_3.key and tableUtilitiesModule.ShallowEqual(var16, v_3)
							else
								var17 = var16 == v_3
								var17 = nil
							end
						end
					end
				end
			end
			if var17 then
				table.insert(t_4, var16)
			else
				table.insert(t_4, v_3)
			end
		end
	end
	table.sort(t_4, compareScenes)
	local var14 = 0
	
	for v_3, text in t_4 do
		var16 = not text.isStale and text.index == p7.index
		
		if var16 ~= text.isActive then
			t_4[v_3] = object.assign(table.clone(text), { isActive = var16 })
		end
		if var16 then
			var14 += 1
		end
	end
	invariantModule(var14 == 1, "There should only be one active scene, not %d", var14)
	
	if #t_4 ~= #p6 then
		return t_4
	end
	for v_3, text in t_4 do
		local var15 = p6[v_3]
		var16 = false
		
		if var15.key == text.key then
			var16 = false
			
			if var15.index == text.index then
				var16 = false
				
				if var15.isStale == text.isStale then
					var16 = false
					
					if var15.isActive == text.isActive then
						if var15 and text then
							var16 = var15.key ~= text.key and tableUtilitiesModule.ShallowEqual(var15, text)
						else
							var16 = var15 == text
							var16 = nil
						end
					end
				end
			end
		end
		if not var16 then
			return t_4
		end
	end
	return p6
end