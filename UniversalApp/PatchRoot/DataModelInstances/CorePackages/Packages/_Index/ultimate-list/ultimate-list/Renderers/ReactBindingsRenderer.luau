local var1 = script:FindFirstAncestor("ultimate-list")
local _ = require(var1.Dimensions)
local dimensionsMethodsModule = require(var1.Dimensions.DimensionsMethods)
local reactModule = require(var1.Parent.React)
local adjustPositionToScrollAxisModule = require(var1.Dimensions.adjustPositionToScrollAxis)
local createDebugLoggerModule = require(var1.Util.createDebugLogger)
local _ = require(var1.createVirtualizedListController)
local joinAndMapBindingsModule = require(var1.Util.joinAndMapBindings)
local createElement = reactModule.createElement
local var2 = createDebugLoggerModule("ReactBindingsRenderer")

local function getKeyDefault(_, p1)
	return tostring(p1)
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), dimensionsMethodsModule (ref), getKeyDefault (ref), var2 (ref), createElement (ref), joinAndMapBindingsModule (ref), adjustPositionToScrollAxisModule (ref)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: dimensionsMethodsModule (copy), p1 (ref), reactModule (copy)
		local t = {}
		local var5 = dimensionsMethodsModule.elementsDisplayedHint(p1.dimensions, p1.virtualizedListController.getWindowSize(), p1.direction)
		
		if var5 == nil then
			return t
		end
		for _ = 1, var5 do
			local var6, var7 = reactModule.createBinding({ contents = { type = "vacant" } })
			table.insert(t, { binding = var6, set = var7 })
		end
		return t
	end)
	local getKey = p1.getKey or getKeyDefault
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), getKey (ref), var5 (ref), var6 (copy), reactModule (copy), var6 (ref)
		return p1.virtualizedListController.bindToUpdate(function()
			-- upvalues: p1 (copy), getKey (copy), var5 (copy), var6 (copy), reactModule (copy), var6 (copy)
			local var8 = p1.virtualizedListController.get()
			local range = p1.virtualizedListController.getRange()
			local t = {}
			
			for i, v in var8 do
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
					local var9 = t[key]
					
					if var9 == nil then
						var9("%s is now dead", key)
						table.insert(t_1, v_1.set)
					else
						t[key] = nil
						local var10 = var8[var9]
						
						if value.contents.value ~= var10 then
							var9("%s existed, but changed", key)
							v_1.set({
								contents = {
									type = "full",
									index = var9 + (range.X - 1),
									key = key,
									value = var10
								}
							})
						end
					end
				end
			end
			var9("%d total setters, %d dead setters, %d vacant setters", #var8, #t_1, #t_2)
			
			for i_2, v_2 in t do
				assert(v_2 ~= nil, "Luau")
				local t_4 = {
					contents = {
						type = "full",
						index = v_2 + (range.X - 1),
						key = i_2,
						value = var8[v_2]
					}
				}
				local removed = table.remove(t_1)
				
				if removed == nil then
					local removed_1 = table.remove(t_2)
					
					if removed_1 == nil then
						local var11, var12 = reactModule.createBinding(t_4)
						table.insert(t_3, { binding = var11, set = var12 })
					else
						var9("%s is filling vacant spot", i_2)
						removed_1(t_4)
					end
				else
					var9("%s is filling dead spot", i_2)
					removed(t_4)
				end
			end
			if #t_3 > 0 then
				var9("Needed to create %d more bindings to fit, there will be %d setters", #t_3, #t_3 + #var8)
				var9(function(p2)
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
		local var13 = binding:map(function(p2)
			-- upvalues: dimensionsMethodsModule (copy), p2 (ref)
			return if p2.contents.type == "vacant" then { size = UDim2.new(), position = UDim2.new() } else dimensionsMethodsModule.getUDimRect(p2.dimensions, p2.contents.value, p2.contents.index, p2.virtualizedListController.getWindowSize(), p2.direction)
		end)
		t[`Item{i}`] = createElement("Frame", {
			BackgroundTransparency = 1,
			Position = joinAndMapBindingsModule(function(p2, p3)
				-- upvalues: adjustPositionToScrollAxisModule (copy), p2 (ref)
				return adjustPositionToScrollAxisModule(p2.position, p3, p2.direction)
			end, var13, p1.scrollAxisBinding),
			Size = var13:map(function(p2)
				return p2.size
			end),
			Visible = binding:map(function(p2)
				return p2.contents.type == "full"
			end)
		}, {
			Content = p1.callback(binding:map(function(p2)
				return if p2.contents.type == "full" then p2.contents.value else nil
			end))
		})
	end
	return createElement(reactModule.Fragment, {}, t)
end)