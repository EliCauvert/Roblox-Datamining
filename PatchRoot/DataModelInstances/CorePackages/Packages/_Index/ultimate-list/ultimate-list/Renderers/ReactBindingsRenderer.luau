-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local var0 = script:FindFirstAncestor("ultimate-list")
local _ = require(var0.Dimensions)
local dimensionsMethodsModule = require(var0.Dimensions.DimensionsMethods)
local reactModule = require(var0.Parent.React)
local adjustPositionToScrollAxisModule = require(var0.Dimensions.adjustPositionToScrollAxis)
local createDebugLoggerModule = require(var0.Util.createDebugLogger)
local _ = require(var0.createVirtualizedListController)
local joinAndMapBindingsModule = require(var0.Util.joinAndMapBindings)
local createElement = reactModule.createElement
local var6 = createDebugLoggerModule("ReactBindingsRenderer")

local function getKeyDefault(_, p0) --[[ line: 15 ]]
	return tostring(p0)
end

return reactModule.memo(function(p1) --[[ line: 35 | named "ReactBindingsRenderer" ]]
	-- upvalues: reactModule (ref), dimensionsMethodsModule (ref), getKeyDefault (ref), var6 (ref), createElement (ref), joinAndMapBindingsModule (ref), adjustPositionToScrollAxisModule (ref)
	local var8, var9 = reactModule.useState(function() --[[ line: 48 ]]
		-- upvalues: dimensionsMethodsModule (copy), p1 (ref), reactModule (copy)
		local t = {}
		local var14 = dimensionsMethodsModule.elementsDisplayedHint(p1.dimensions, p1.virtualizedListController.getWindowSize(), p1.direction)
		
		if var14 == nil then
			return t
		end
		for _ = 1, var14 do
			local var15, var16 = reactModule.createBinding({ contents = { type = "vacant" } })
			table.insert(t, { binding = var15, set = var16 })
		end
		return t
	end)
	local getKey = p1.getKey or getKeyDefault
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: p1 (ref), getKey (ref), var8 (ref), var6 (copy), reactModule (copy), var9 (ref)
		return p1.virtualizedListController.bindToUpdate(function() --[[ line: 80 ]]
			-- upvalues: p1 (copy), getKey (copy), var8 (copy), var6 (copy), reactModule (copy), var9 (copy)
			local var17 = p1.virtualizedListController.get()
			local range = p1.virtualizedListController.getRange()
			local t = {}
			
			for i, v in var17 do
				t[getKey(v, i + (range.X - 1))] = i
			end
			local t_1 = {}
			local t_2 = {}
			local t_3 = {}
			
			for i_1, v_1 in var8 do
				local value = v_1.binding:getValue()
				
				if value.contents.type == "vacant" then
					table.insert(t_2, v_1.set)
				else
					local key = value.contents.key
					local var29 = t[key]
					
					if var29 == nil then
						var6("%s is now dead", key)
						table.insert(t_1, v_1.set)
					else
						t[key] = nil
						local var30 = var17[var29]
						
						if value.contents.value ~= var30 then
							var6("%s existed, but changed", key)
							v_1.set({
								contents = {
									type = "full",
									index = var29 + (range.X - 1),
									key = key,
									value = var30
								}
							})
						end
					end
				end
			end
			var6("%d total setters, %d dead setters, %d vacant setters", #var8, #t_1, #t_2)
			
			for i_2, v_2 in t do
				assert(v_2 ~= nil, "Luau")
				local t_4 = {
					contents = {
						type = "full",
						index = v_2 + (range.X - 1),
						key = i_2,
						value = var17[v_2]
					}
				}
				local removed = table.remove(t_1)
				
				if removed == nil then
					local removed_1 = table.remove(t_2)
					
					if removed_1 == nil then
						local var26, var27 = reactModule.createBinding(t_4)
						table.insert(t_3, { binding = var26, set = var27 })
					else
						var6("%s is filling vacant spot", i_2)
						removed_1(t_4)
					end
				else
					var6("%s is filling dead spot", i_2)
					removed(t_4)
				end
			end
			if #t_3 > 0 then
				var6("Needed to create %d more bindings to fit, there will be %d setters", #t_3, #t_3 + #var8)
				var9(function(p2) --[[ line: 177 ]]
					-- upvalues: t_3 (ref)
					local cloned = table.clone(p2)
					table.move(t_3, 1, #t_3, #cloned + 1, cloned)
					
					return cloned
				end)
			end
			for i_3, v_3 in t_1 do
				v_3({ contents = { type = "vacant" } })
			end
		end)
	end, { p1.virtualizedListController, getKey, var8 })
	local t = {}
	
	for i, v in var8 do
		local binding = v.binding
		local var12 = binding:map(function(p3) --[[ line: 199 ]]
			-- upvalues: dimensionsMethodsModule (copy), p1 (ref)
			return if p3.contents.type == "vacant" then { size = UDim2.new(), position = UDim2.new() } else dimensionsMethodsModule.getUDimRect(p1.dimensions, p3.contents.value, p3.contents.index, p1.virtualizedListController.getWindowSize(), p1.direction)
		end)
		t[`Item{i}`] = createElement("Frame", {
			BackgroundTransparency = 1,
			Position = joinAndMapBindingsModule(function(p4, p5) --[[ line: 219 ]]
				-- upvalues: adjustPositionToScrollAxisModule (copy), p1 (ref)
				return adjustPositionToScrollAxisModule(p4.position, p5, p1.direction)
			end, var12, p1.scrollAxisBinding),
			Size = var12:map(function(p6) --[[ line: 223 ]]
				return p6.size
			end),
			Visible = binding:map(function(p7) --[[ line: 227 ]]
				return p7.contents.type == "full"
			end)
		}, {
			Content = p1.callback(binding:map(function(p8) --[[ line: 231 ]]
				return if p8.contents.type == "full" then p8.contents.value else nil
			end))
		})
	end
	return createElement(reactModule.Fragment, {}, t)
end)