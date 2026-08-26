local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Enums.PopoverAlign)
local _ = require(foundation.Enums.PopoverSide)
local reactModule = require(parent.React)
local positioningModule = require(script.Parent.positioning)
local _ = require(foundation.Components.Types)

local function useConnectSignals(value, p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	reactModule.useLayoutEffect(function()
		-- upvalues: value (ref), p1 (ref), var1 (ref), p2 (ref)
		if value ~= nil then
			for i, v in p1 do
				var1.current[v] = (if typeof(value) == "Instance" then value:GetPropertyChangedSignal(v) else value:GetPropertyChangedSignal(v)):Connect(if type(p2) == "table" then function()
					-- upvalues: p2 (copy)
					p2.current()
				end else p2)
			end
		end
		return function()
			-- upvalues: var1 (copy)
			for i, v in var1.current do
				v:Disconnect()
			end
		end
	end, { value, p2 })
end

return function(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: reactModule (ref), positioningModule (ref), useConnectSignals (ref)
	local var2, var3 = reactModule.useBinding(Vector2.new())
	local var4, var5 = reactModule.useBinding(true)
	local var6, var7 = reactModule.useBinding(UDim2.new())
	local var8, var9 = reactModule.useBinding(Vector2.new())
	local var10, var11 = reactModule.useBinding(Vector2.new())
	local var12, var13 = reactModule.useBinding(Vector2.new(0, 0))
	local var14 = reactModule.useRef(function() end)
	local var15 = reactModule.useRef({})
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), p4 (ref), p5 (ref), p6 (ref), var5 (ref), positioningModule (copy), var15 (ref), p7 (ref), p8 (ref), p9 (ref), var7 (ref), var9 (ref), var11 (ref), var3 (ref), var13 (ref)
		if not p3 or not p4 or (not p5 or not p6) then
			var5(false)
			
			return
		end
		local absolutePosition = p4.AbsolutePosition
		local absoluteSize = p4.AbsoluteSize
		local absoluteSize_1 = p5.AbsoluteSize
		local absoluteSize_2 = p6.AbsoluteSize
		local absolutePosition_1 = p6.AbsolutePosition
		local rect = Rect.new(absolutePosition, absolutePosition + absoluteSize)
		local rect_1 = Rect.new(absolutePosition_1, absolutePosition_1 + absoluteSize_2)
		
		if not positioningModule.isOnScreen(rect, rect_1) then
			var5(false)
			
			return
		end
		local var18 = nil
		
		for i, v in var15.current do
			local rect_2 = Rect.new(v.AbsolutePosition, v.AbsolutePosition + v.AbsoluteSize)
			var18 = if var18 == nil then rect_2 else Rect.new(Vector2.new(math.max(var18.Min.X, rect_2.Min.X), math.max(var18.Min.Y, rect_2.Min.Y)), Vector2.new(math.min(var18.Max.X, rect_2.Max.X), math.min(var18.Max.Y, rect_2.Max.Y)))
		end
		if var18 and not positioningModule.isOnScreen(rect, var18) then
			var5(false)
			
			return
		end
		local var19 = if type(p7) == "table" then p7.position else p7
		local var20 = if type(p7) == "table" then p7.offset else 0
		local var21 = p8
		local var22 = 0
		
		if type(p8) == "table" then
			var21 = p8.position
			var22 = p8.offset
		end
		local p10 = p9 or 0
		local var23, var24, var25 = positioningModule.calculatePositions(positioningModule.calculateSide(var19, rect, rect_1, positioningModule.calculatePopoverBounds(var19, var20, var22, p10, absoluteSize_1)), var20, var21, var22, rect, rect_1, p10, absoluteSize_1)
		var7(UDim2.fromOffset(absoluteSize_1.X, absoluteSize_1.Y))
		var9(absoluteSize_2)
		var11(var24 + var23)
		var3(var23)
		var13(var25)
		var5(true)
		local _ = p5.AbsolutePosition
	end, {
		p3, p4, p5, p6, p7, p8, p9
	})
	
	function var17.current()
		-- upvalues: var16 (ref), var17 (ref)
		if var16.current then
			return
		end
		var16.current = true
		task.defer(function()
			-- upvalues: var16 (copy), var17 (copy)
			var16.current = false
			var17()
		end)
	end
	
	useConnectSignals(p4, { "AbsolutePosition", "AbsoluteSize" }, var14)
	useConnectSignals(p5, { "AbsoluteSize" }, var14)
	useConnectSignals(p6, { "AbsoluteSize" }, var14)
	reactModule.useLayoutEffect(function()
		-- upvalues: p3 (ref), p4 (ref), var15 (ref), var14 (ref)
		if not p3 then return end
		if typeof(p4) == "Instance" and p4:IsA("GuiObject") then
			local t = {}
			
			local function rebuild()
				-- upvalues: t (ref), p4 (ref), var14 (copy), var15 (ref)
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				local t_1 = {}
				local parent = p4.Parent
				while parent and parent:IsA("GuiObject") do
					if parent.ClipsDescendants then
						table.insert(t_1, parent)
						table.insert(t, parent:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
							-- upvalues: var14 (copy)
							var14.current()
						end))
						table.insert(t, parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							-- upvalues: var14 (copy)
							var14.current()
						end))
					end
					parent = parent.Parent
				end
				var15.current = t_1
				
				if #t_1 > 0 then
					var14.current()
				end
			end
			
			rebuild()
			local ancestryChangedConnection = p4.AncestryChanged:Connect(rebuild)
			
			return function()
				-- upvalues: ancestryChangedConnection (ref), t (ref), var15 (ref)
				ancestryChangedConnection:Disconnect()
				
				for i, v in t do
					v:Disconnect()
				end
				var15.current = {}
			end
		end
	end, { p4, p3 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var17 (ref)
		var17()
	end, { var17 })
	
	return var2, var4, var6, var10, var8, var12
end