local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Enums.PopoverAlign)
local _ = require(foundation.Enums.PopoverSide)
local reactModule = require(parent.React)
local positioningModule = require(script.Parent.positioning)
local _ = require(foundation.Components.Types)

local function useConnectSignals(value, p0, p1) --[[ line: 26 ]]
	-- upvalues: reactModule (ref)
	local var4 = reactModule.useRef({})
	reactModule.useLayoutEffect(function() --[[ line: 33 ]]
		-- upvalues: value (ref), p0 (ref), var4 (ref), p1 (ref)
		if value ~= nil then
			for i, v in p0 do
				var4.current[v] = (if typeof(value) == "Instance" then value:GetPropertyChangedSignal(v) else value:GetPropertyChangedSignal(v)):Connect(if type(p1) == "table" then function() --[[ line: 42 ]]
					-- upvalues: p1 (copy)
					p1.current()
				end else p1)
			end
		end
		return function() --[[ line: 50 ]]
			-- upvalues: var4 (copy)
			for i, v in var4.current do
				v:Disconnect()
			end
		end
	end, { value, p1 })
end

return function(p2, p3, p4, p5, p6, p7, p8) --[[ line: 58 | named "useFloating" ]]
	-- upvalues: reactModule (ref), positioningModule (ref), useConnectSignals (ref)
	local var5, var6 = reactModule.useBinding(Vector2.new())
	local var7, var8 = reactModule.useBinding(true)
	local var9, var10 = reactModule.useBinding(UDim2.new())
	local var11, var12 = reactModule.useBinding(Vector2.new())
	local var13, var14 = reactModule.useBinding(Vector2.new())
	local var15, var16 = reactModule.useBinding(Vector2.new(0, 0))
	local var17 = reactModule.useRef(function() --[[ line: 73 ]] end)
	local var18 = reactModule.useRef({})
	local var19 = reactModule.useRef(false)
	local var20 = reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: p2 (ref), p3 (ref), p4 (ref), p5 (ref), var8 (ref), positioningModule (copy), var18 (ref), p6 (ref), p7 (ref), p8 (ref), var10 (ref), var12 (ref), var14 (ref), var6 (ref), var16 (ref)
		if not p2 or not p3 or (not p4 or not p5) then
			var8(false)
			
			return
		end
		local absolutePosition = p3.AbsolutePosition
		local absoluteSize = p3.AbsoluteSize
		local absoluteSize_1 = p4.AbsoluteSize
		local absoluteSize_2 = p5.AbsoluteSize
		local absolutePosition_1 = p5.AbsolutePosition
		local rect = Rect.new(absolutePosition, absolutePosition + absoluteSize)
		local rect_1 = Rect.new(absolutePosition_1, absolutePosition_1 + absoluteSize_2)
		
		if not positioningModule.isOnScreen(rect, rect_1) then
			var8(false)
			
			return
		end
		local var23 = nil
		
		for i, v in var18.current do
			local rect_2 = Rect.new(v.AbsolutePosition, v.AbsolutePosition + v.AbsoluteSize)
			var23 = if var23 == nil then rect_2 else Rect.new(Vector2.new(math.max(var23.Min.X, rect_2.Min.X), math.max(var23.Min.Y, rect_2.Min.Y)), Vector2.new(math.min(var23.Max.X, rect_2.Max.X), math.min(var23.Max.Y, rect_2.Max.Y)))
		end
		if var23 and not positioningModule.isOnScreen(rect, var23) then
			var8(false)
			
			return
		end
		local var24 = if type(p6) == "table" then p6.position else p6
		local var25 = if type(p6) == "table" then p6.offset else 0
		local var26 = p7
		local var27 = 0
		
		if type(p7) == "table" then
			var26 = p7.position
			var27 = p7.offset
		end
		local p8_1 = p8 or 0
		local var29, var30, var31 = positioningModule.calculatePositions(positioningModule.calculateSide(var24, rect, rect_1, positioningModule.calculatePopoverBounds(var24, var25, var27, p8_1, absoluteSize_1)), var25, var26, var27, rect, rect_1, p8_1, absoluteSize_1)
		var10(UDim2.fromOffset(absoluteSize_1.X, absoluteSize_1.Y))
		var12(absoluteSize_2)
		var14(var30 + var29)
		var6(var29)
		var16(var31)
		var8(true)
		local _ = p4.AbsolutePosition
	end, {
		p2, p3, p4, p5, p6, p7, p8
	})
	
	function var17.current() --[[ line: 165 ]]
		-- upvalues: var19 (ref), var20 (ref)
		if var19.current then
			return
		end
		var19.current = true
		task.defer(function() --[[ line: 170 ]]
			-- upvalues: var19 (copy), var20 (copy)
			var19.current = false
			var20()
		end)
	end
	
	useConnectSignals(p3, { "AbsolutePosition", "AbsoluteSize" }, var17)
	useConnectSignals(p4, { "AbsoluteSize" }, var17)
	useConnectSignals(p5, { "AbsoluteSize" }, var17)
	reactModule.useLayoutEffect(function() --[[ line: 178 ]]
		-- upvalues: p2 (ref), p3 (ref), var18 (ref), var17 (ref)
		if not p2 then return end
		if typeof(p3) == "Instance" and p3:IsA("GuiObject") then
			local t = {}
			
			local function rebuild() --[[ line: 189 ]]
				-- upvalues: t (ref), p3 (ref), var17 (copy), var18 (ref)
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				local t_1 = {}
				local parent = p3.Parent
				while parent and parent:IsA("GuiObject") do
					if parent.ClipsDescendants then
						table.insert(t_1, parent)
						table.insert(t, parent:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 203 ]]
							-- upvalues: var17 (copy)
							var17.current()
						end))
						table.insert(t, parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 209 ]]
							-- upvalues: var17 (copy)
							var17.current()
						end))
					end
					parent = parent.Parent
				end
				var18.current = t_1
				
				if #t_1 > 0 then
					var17.current()
				end
			end
			
			rebuild()
			local ancestryChangedConnection = p3.AncestryChanged:Connect(rebuild)
			
			return function() --[[ line: 227 ]]
				-- upvalues: ancestryChangedConnection (ref), t (ref), var18 (ref)
				ancestryChangedConnection:Disconnect()
				
				for i, v in t do
					v:Disconnect()
				end
				var18.current = {}
			end
		end
	end, { p3, p2 })
	reactModule.useLayoutEffect(function() --[[ line: 236 ]]
		-- upvalues: var20 (ref)
		var20()
	end, { var20 })
	
	return var5, var7, var9, var13, var11, var15
end