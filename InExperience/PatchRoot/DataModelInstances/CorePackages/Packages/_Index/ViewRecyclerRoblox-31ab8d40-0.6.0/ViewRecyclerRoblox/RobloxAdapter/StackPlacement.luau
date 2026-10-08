local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local canvasItemPlacerModule = require(viewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local hostPresentationPhaseModule = require(viewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local transparentFrameModule = require(viewRecyclerRoblox.RobloxAdapter.transparentFrame)
local axis = viewRecyclerModule.Axis
local t = {
	isPlacedFromLayoutOffsets = function(value)
		return value.index ~= nil and value.canvasPlacement.mainAxisOffset == nil
	end
}
local uDim2 = UDim2.new()

local function createStackFrame(p1, p2, p3, p4)
	-- upvalues: transparentFrameModule (ref)
	local var1 = transparentFrameModule(p1)
	var1.Size = if p2 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1)
	var1.AutomaticSize = if p2 then Enum.AutomaticSize.Y else Enum.AutomaticSize.X
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.FillDirection = if p2 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	UIListLayout.Padding = UDim.new(0, p3)
	UIListLayout.Parent = var1
	var1.Parent = p4
	
	return var1
end

function t.new(p1, p2, p3, p4)
	-- upvalues: axis (ref), transparentFrameModule (ref), createStackFrame (ref), t (ref), viewRecyclerModule (ref), hostPresentationPhaseModule (ref), canvasItemPlacerModule (ref), uDim2 (ref)
	local var1 = p2 == axis.Y
	local var2 = transparentFrameModule("ViewRecyclerStack")
	var2.Size = UDim2.fromScale(1, 1)
	local var3 = createStackFrame("Leading", var1, p3, var2)
	var3.AnchorPoint = if var1 then Vector2.yAxis else Vector2.xAxis
	local var4 = createStackFrame("Trailing", var1, p3, var2)
	var2.Parent = p1
	local UIListLayout = var3:FindFirstChildOfClass("UIListLayout")
	local UIListLayout_1 = var4:FindFirstChildOfClass("UIListLayout")
	local var5 = 1
	local var6 = 0
	local var7 = 1
	local t_1 = {}
	local t_2 = {}
	local var8 = 0
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local t_7 = {}
	local var9 = false
	local var10 = true
	local var11 = nil
	
	local function _(p5)
		-- upvalues: var7 (write), var3 (ref), var4 (ref)
		return if p5 < var7 then var3 else var4
	end
	
	local _ = function(p5)
		-- upvalues: var5 (write), var6 (write)
		return var5 <= p5 and p5 <= var6
	end
	
	local _ = function(p5)
		-- upvalues: t_5 (ref), t_6 (ref)
		local var12 = t_5[p5]
		
		if var12 ~= nil then
			t_5[p5] = nil
			var12.Parent = nil
			table.insert(t_6, var12)
		end
	end
	
	local function refresh(p5)
		-- upvalues: var5 (write), var6 (write), t_4 (ref), t_5 (ref), t_6 (ref), transparentFrameModule (copy), t_2 (ref), t_1 (write), var1 (ref), var7 (write), var3 (ref), var4 (ref)
		if (var5 <= p5 and p5 <= var6) and (t_4[p5] or 0) <= 0 then
			local var12 = t_5[p5]
			
			if var12 == nil then
				var12 = table.remove(t_6)
				
				if var12 == nil then
					var12 = transparentFrameModule("Placeholder")
				end
				t_5[p5] = var12
			end
			local var13 = t_2[p5] or 0
			local var14 = math.round(var13 + (t_1[p5] or 0)) - math.round(var13)
			local var15 = if var1 then UDim2.new(1, 0, 0, var14) else UDim2.new(0, var14, 1, 0)
			
			if var12.Size ~= var15 then
				var12.Size = var15
			end
			if var12.LayoutOrder ~= p5 then
				var12.LayoutOrder = p5
			end
			local var16 = if p5 < var7 then var3 else var4
			
			if var12.Parent ~= var16 then
				var12.Parent = var16
			end
			return
		else
			local var17 = t_5[p5]
			
			if var17 ~= nil then
				t_5[p5] = nil
				var17.Parent = nil
				table.insert(t_6, var17)
			end
		end
	end
	
	local _ = function(value, p5)
		-- upvalues: var8 (write), var1 (ref)
		local rounded = math.round(p5 + var8)
		local var12 = if var1 then UDim2.fromOffset(0, rounded) else UDim2.fromOffset(rounded, 0)
		
		if value.Position ~= var12 then
			value.Position = var12
		end
	end
	
	local _ = function()
		-- upvalues: t_2 (ref), var7 (write), var3 (ref), p3 (ref), var8 (write), var1 (ref), var4 (ref)
		local var12 = t_2[var7] or 0
		local rounded = math.round(var12 - p3 + var8)
		local var13 = if var1 then UDim2.fromOffset(0, rounded) else UDim2.fromOffset(rounded, 0)
		
		if var3.Position ~= var13 then
			var3.Position = var13
		end
		local rounded_1 = math.round(var12 + var8)
		local var14 = if var1 then UDim2.fromOffset(0, rounded_1) else UDim2.fromOffset(rounded_1, 0)
		
		if var4.Position ~= var14 then
			var4.Position = var14
		end
	end
	
	local _ = function(value, p5)
		-- upvalues: t_4 (ref), t_7 (ref)
		if p5 == value then return end
		if p5 ~= nil then
			t_4[p5] -= 1
			
			if t_4[p5] == 0 then
				t_4[p5] = nil
			end
			t_7[p5] = true
		end
		if value ~= nil then
			t_4[value] = (t_4[value] or 0) + 1
			t_7[value] = true
		end
	end
	
	return {
		matches = function(p5, p6, p7, p8)
			-- upvalues: var2 (ref), p2 (ref), p3 (ref), p4 (ref)
			return var2.Parent == p5 and (p6 == p2 and (p7 == p3 and p8 == p4))
		end,
		setWindow = function(value, p5)
			-- upvalues: t (copy), viewRecyclerModule (copy), var5 (write), var6 (write), t_1 (write), var7 (write), t_2 (ref), p3 (ref), var8 (write), var9 (write), var10 (write), var3 (ref), var1 (ref), var4 (ref)
			local i_1
			local var12 = 1e999
			local var13 = -1e999
			local var14 = 0
			local t_3 = {}
			local mountedRange = value.mountedRange
			
			for i, v in value.mountedViews do
				i_1 = v.state
				local index = i_1.index
				
				if index ~= nil and (t.isPlacedFromLayoutOffsets(i_1) or mountedRange.firstIndex <= index and index <= mountedRange.lastIndex) then
					t_3[index] = i_1.itemLayout.length
					
					if index < var12 then
						var12 = index
						var14 = i_1.itemLayout.startOffset + i_1.contentStartOffset
					end
					var13 = math.max(var13, index)
				end
			end
			if var13 < var12 then
				var12 = 1
				var13 = 0
				var14 = 0
			end
			local scrollAnchor = value.scrollAnchor
			local var15 = if scrollAnchor == nil then var12 elseif scrollAnchor.alignment == viewRecyclerModule.ScrollAlignment.End then scrollAnchor.index + 1 else scrollAnchor.index
			var5 = var12
			var6 = var13
			t_1 = t_3
			var7 = math.clamp(var15, var12, math.max(var12, var13 + 1))
			table.clear(t_2)
			local var16 = var14
			
			for i_1 = var12, var13 + 1 do
				t_2[i_1] = var16
				var16 += (t_3[i_1] or 0) + p3
			end
			var8 = p5
			var9 = true
			var10 = true
			local var17 = t_2[var7] or 0
			local rounded = math.round(var17 - p3 + var8)
			local var18 = if var1 then UDim2.fromOffset(0, rounded) else UDim2.fromOffset(rounded, 0)
			
			if var3.Position ~= var18 then
				var3.Position = var18
			end
			i_1 = math.round(var17 + var8)
			local var19 = if var1 then UDim2.fromOffset(0, i_1) else UDim2.fromOffset(i_1, 0)
			
			if var4.Position ~= var19 then
				var4.Position = var19
			end
		end,
		setOriginOffset = function(value)
			-- upvalues: var8 (write), t_2 (ref), var7 (write), var3 (ref), p3 (ref), var1 (ref), var4 (ref)
			if value ~= var8 then
				var8 = value
				local var20 = t_2[var7] or 0
				local rounded = math.round(var20 - p3 + var8)
				local var21 = if var1 then UDim2.fromOffset(0, rounded) else UDim2.fromOffset(rounded, 0)
				
				if var3.Position ~= var21 then
					var3.Position = var21
				end
				local var22 = var4
				local rounded_1 = math.round(var20 + var8)
				local var23 = if var1 then UDim2.fromOffset(0, rounded_1) else UDim2.fromOffset(rounded_1, 0)
				
				if var22.Position ~= var23 then
					var22.Position = var23
				end
			end
		end,
		place = function(p6, p7, p8, p9)
			-- upvalues: t_3 (ref), hostPresentationPhaseModule (copy), var5 (write), var6 (write), canvasItemPlacerModule (copy), p2 (ref), p4 (ref), uDim2 (copy), var7 (write), var3 (ref), var4 (ref), t_4 (ref), t_7 (ref), var10 (write)
			local index = p8.index
			local var20 = t_3[p6]
			
			if var20 == nil then
				var20 = {
					inWindow = false,
					visible = false,
					index = index,
					geometry = {},
					restoreLayoutOrder = p6.LayoutOrder
				}
				t_3[p6] = var20
			end
			local var21 = p9 == hostPresentationPhaseModule.Presented and (var5 <= index and index <= var6)
			local geometry = canvasItemPlacerModule.getGeometry(p8.itemLayout, p8.canvasPlacement, p2, p4, 0, var20.geometry)
			geometry.position = uDim2
			canvasItemPlacerModule.place(p6, if index < var7 then var3 else var4, geometry, p7, var21)
			local var22 = if var21 then index else nil
			local var23 = if var20.visible then var20.index else nil
			
			if var23 ~= var22 then
				if var23 ~= nil then
					t_4[var23] -= 1
					
					if t_4[var23] == 0 then
						t_4[var23] = nil
					end
					t_7[var23] = true
				end
				if var22 ~= nil then
					t_4[var22] = (t_4[var22] or 0) + 1
					t_7[var22] = true
				end
			end
			var20.index = index
			var20.inWindow = var5 <= index and index <= var6
			var20.visible = var21
			
			if p6.LayoutOrder ~= index then
				p6.LayoutOrder = index
			end
			var10 = true
			
			return var21
		end,
		remove = function(p6)
			-- upvalues: t_3 (ref), t_4 (ref), t_7 (ref), var10 (write)
			local var20 = t_3[p6]
			
			if var20 == nil then return end
			t_3[p6] = nil
			local var21 = if var20.visible then var20.index else nil
			
			if var21 ~= nil and var21 ~= nil then
				t_4[var21] -= 1
				
				if t_4[var21] == 0 then
					t_4[var21] = nil
				end
				t_7[var21] = true
			end
			p6.LayoutOrder = var20.restoreLayoutOrder
			var10 = true
		end,
		isStacked = function(p6)
			-- upvalues: t_3 (ref)
			return t_3[p6] ~= nil
		end,
		getStaleHosts = function()
			-- upvalues: t_3 (ref), var5 (write), var6 (write), var7 (write), var3 (ref), var4 (ref)
			local t = {}
			
			for i, v in t_3 do
				local index = v.index
				
				if (var5 <= index and index <= var6) ~= v.inWindow or i.Parent ~= (if v.index < var7 then var3 else var4) then
					table.insert(t, i)
				end
			end
			return t
		end,
		takeChanged = function()
			-- upvalues: UIListLayout (ref), UIListLayout_1 (ref), var10 (write), var11 (write)
			local var20 = UIListLayout.AbsoluteContentSize + UIListLayout_1.AbsoluteContentSize
			local var21 = var10 or var20 ~= var11
			var10 = false
			var11 = var20
			
			return var21
		end,
		commit = function()
			-- upvalues: var9 (write), t_5 (ref), var5 (write), var6 (write), t_6 (ref), refresh (ref), t_7 (ref)
			if var9 then
				var9 = false
				
				for i in t_5 do
					if not (var5 <= i and i <= var6) then
						local var20 = t_5[i]
						
						if var20 ~= nil then
							t_5[i] = nil
							var20.Parent = nil
							table.insert(t_6, var20)
						end
					end
				end
				for i_1 = var5, var6 do
					refresh(i_1)
				end
				table.clear(t_7)
				
				return
			else
				for i in t_7 do
					refresh(i)
				end
				table.clear(t_7)
			end
		end,
		destroy = function()
			-- upvalues: t_3 (ref), t_4 (ref), t_5 (ref), t_6 (ref), t_7 (ref), var2 (ref)
			for i, v in t_3 do
				i.LayoutOrder = v.restoreLayoutOrder
			end
			table.clear(t_3)
			table.clear(t_4)
			table.clear(t_5)
			table.clear(t_6)
			table.clear(t_7)
			var2:Destroy()
		end
	}
end

return t