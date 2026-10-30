local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local CanvasItemPlacerModule = require(ViewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local HostPresentationPhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local TransparentFrameModule = require(ViewRecyclerRoblox.RobloxAdapter.transparentFrame)
local Axis = ViewRecyclerModule.Axis
local StackPlacementModule = {
	isPlacedFromLayoutOffsets = function(State): boolean
		return State.index ~= nil and State.canvasPlacement.mainAxisOffset == nil
	end
}
local _UDim2 = UDim2.new()

local function createStackFrame(p1, IsYMatch, Offset, ViewRecyclerStack)
	-- upvalues: TransparentFrameModule (copy)
	local TransparentFrameModuleResult = TransparentFrameModule(p1)
	TransparentFrameModuleResult.Size = if IsYMatch then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1)
	TransparentFrameModuleResult.AutomaticSize = if IsYMatch then Enum.AutomaticSize.Y else Enum.AutomaticSize.X
	local ListLayout = Instance.new("UIListLayout")
	ListLayout.FillDirection = if IsYMatch then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	ListLayout.Padding = UDim.new(0, Offset)
	ListLayout.Parent = TransparentFrameModuleResult
	TransparentFrameModuleResult.Parent = ViewRecyclerStack
	
	return TransparentFrameModuleResult
end

function StackPlacementModule.new(Parent, Y, p1, p2)
	-- upvalues: Axis (copy), TransparentFrameModule (copy), createStackFrame (copy), StackPlacementModule (copy), ViewRecyclerModule (copy), HostPresentationPhaseModule (copy), CanvasItemPlacerModule (copy), _UDim2 (copy)
	local IsYMatch = Y == Axis.Y
	local ViewRecyclerStack = TransparentFrameModule("ViewRecyclerStack")
	ViewRecyclerStack.Size = UDim2.fromScale(1, 1)
	local Leading = createStackFrame("Leading", IsYMatch, p1, ViewRecyclerStack)
	Leading.AnchorPoint = if IsYMatch then Vector2.yAxis else Vector2.xAxis
	local Trailing = createStackFrame("Trailing", IsYMatch, p1, ViewRecyclerStack)
	ViewRecyclerStack.Parent = Parent
	local UIListLayout = Leading:FindFirstChildOfClass("UIListLayout")
	local UIListLayout1 = Trailing:FindFirstChildOfClass("UIListLayout")
	local v1 = 1
	local v2 = 0
	local ClampedValue = 1
	local t = {}
	local NewStartOffsets = {}
	local OriginOffset = 0
	local Tbl = {}
	local Tbl1 = {}
	local Placeholders = {}
	local List = {}
	local Tbl2 = {}
	local Flag = false
	local Flag1 = true
	local NewAbsoluteContentSize = nil
	
	local function _(p3)
		-- upvalues: ClampedValue (ref), Leading (copy), Trailing (copy)
		return if p3 < ClampedValue then Leading else Trailing
	end
	
	local _ = function(p3): boolean
		-- upvalues: v1 (ref), v2 (ref)
		return v1 <= p3 and p3 <= v2
	end
	
	local _ = function(Key)
		-- upvalues: Placeholders (copy), List (copy)
		local Placeholder = Placeholders[Key]
		
		if Placeholder ~= nil then
			Placeholders[Key] = nil
			Placeholder.Parent = nil
			table.insert(List, Placeholder)
		end
	end
	
	local function refresh(LayoutOrder)
		-- upvalues: v1 (ref), v2 (ref), Tbl1 (copy), Placeholders (copy), List (copy), TransparentFrameModule (upval), NewStartOffsets (copy), t (ref), IsYMatch (copy), ClampedValue (ref), Leading (copy), Trailing (copy)
		if v1 <= LayoutOrder and LayoutOrder <= v2 and (Tbl1[LayoutOrder] or 0) <= 0 then
			local Placeholder1 = Placeholders[LayoutOrder]
			
			if Placeholder1 == nil then
				Placeholder1 = table.remove(List)
				
				if Placeholder1 == nil then
					Placeholder1 = TransparentFrameModule("Placeholder")
				end
				Placeholders[LayoutOrder] = Placeholder1
			end
			local NewStartOffset = NewStartOffsets[LayoutOrder] or 0
			local RoundedDelta = math.round(NewStartOffset + (t[LayoutOrder] or 0)) - math.round(NewStartOffset)
			local _UDim2: UDim2 = if IsYMatch then UDim2.new(1, 0, 0, RoundedDelta) else UDim2.new(0, RoundedDelta, 1, 0)
			
			if Placeholder1.Size ~= _UDim2 then
				Placeholder1.Size = _UDim2
			end
			if Placeholder1.LayoutOrder ~= LayoutOrder then
				Placeholder1.LayoutOrder = LayoutOrder
			end
			local Leading1 = if LayoutOrder < ClampedValue then Leading else Trailing
			
			if Placeholder1.Parent ~= Leading1 then
				Placeholder1.Parent = Leading1
			end
			return
		else
			local Placeholder = Placeholders[LayoutOrder]
			
			if Placeholder ~= nil then
				Placeholders[LayoutOrder] = nil
				Placeholder.Parent = nil
				table.insert(List, Placeholder)
			end
		end
	end
	
	local _ = function(p3, p4)
		-- upvalues: OriginOffset (ref), IsYMatch (copy)
		local Rounded = math.round(p4 + OriginOffset)
		local _UDim2: UDim2 = if IsYMatch then UDim2.fromOffset(0, Rounded) else UDim2.fromOffset(Rounded, 0)
		
		if p3.Position ~= _UDim2 then
			p3.Position = _UDim2
		end
	end
	
	local _ = function()
		-- upvalues: NewStartOffsets (copy), ClampedValue (ref), Leading (copy), p1 (copy), OriginOffset (ref), IsYMatch (copy), Trailing (copy)
		local NewStartOffset = NewStartOffsets[ClampedValue] or 0
		local Rounded = math.round(NewStartOffset - p1 + OriginOffset)
		local _UDim2: UDim2 = if IsYMatch then UDim2.fromOffset(0, Rounded) else UDim2.fromOffset(Rounded, 0)
		
		if Leading.Position ~= _UDim2 then
			Leading.Position = _UDim2
		end
		local Rounded1 = math.round(NewStartOffset + OriginOffset)
		local _UDim21: UDim2 = if IsYMatch then UDim2.fromOffset(0, Rounded1) else UDim2.fromOffset(Rounded1, 0)
		
		if Trailing.Position ~= _UDim21 then
			Trailing.Position = _UDim21
		end
	end
	
	local _ = function(Key, Key1)
		-- upvalues: Tbl1 (copy), Tbl2 (copy)
		if Key1 == Key then return end
		if Key1 ~= nil then
			Tbl1[Key1] -= 1
			
			if Tbl1[Key1] == 0 then
				Tbl1[Key1] = nil
			end
			Tbl2[Key1] = true
		end
		if Key ~= nil then
			Tbl1[Key] = (Tbl1[Key] or 0) + 1
			Tbl2[Key] = true
		end
	end
	
	return {
		matches = function(Parent, Y1, p3, p4): boolean
			-- upvalues: ViewRecyclerStack (copy), Y (copy), p1 (copy), p2 (copy)
			return ViewRecyclerStack.Parent == Parent and (Y1 == Y and p3 == p1) and p4 == p2
		end,
		setWindow = function(p3, Value)
			-- upvalues: StackPlacementModule (upval), ViewRecyclerModule (upval), v1 (ref), v2 (ref), t (ref), ClampedValue (ref), NewStartOffsets (copy), p1 (copy), OriginOffset (ref), Flag (ref), Flag1 (ref), Leading (copy), IsYMatch (copy), Trailing (copy)
			local MinValue = 1e999
			local Largest = -1e999
			local NewStartOffset = 0
			local Lengths = {}
			local MountedRange = p3.mountedRange
			
			for _, mountedView in p3.mountedViews do
				local State = mountedView.state
				local Index: number = State.index
				
				if Index ~= nil and (StackPlacementModule.isPlacedFromLayoutOffsets(State) or MountedRange.firstIndex <= Index and Index <= MountedRange.lastIndex) then
					Lengths[Index] = State.itemLayout.length
					
					if Index < MinValue then
						MinValue = Index
						NewStartOffset = State.itemLayout.startOffset + State.contentStartOffset
					end
					Largest = math.max(Largest, Index)
				end
			end
			if Largest < MinValue then
				MinValue = 1
				Largest = 0
				NewStartOffset = 0
			end
			local ScrollAnchor = p3.scrollAnchor
			v1 = MinValue
			v2 = Largest
			t = Lengths
			ClampedValue = math.clamp(if ScrollAnchor == nil then MinValue elseif ScrollAnchor.alignment == ViewRecyclerModule.ScrollAlignment.End then ScrollAnchor.index + 1 else ScrollAnchor.index, MinValue, (math.max(MinValue, Largest + 1)))
			table.clear(NewStartOffsets)
			local NewStartOffset1: number = NewStartOffset
			
			for i = MinValue, Largest + 1 do
				NewStartOffsets[i] = NewStartOffset1
				NewStartOffset1 += (Lengths[i] or 0) + p1
			end
			OriginOffset = Value
			Flag = true
			Flag1 = true
			local NewStartOffset2 = NewStartOffsets[ClampedValue] or 0
			local Rounded = math.round(NewStartOffset2 - p1 + OriginOffset)
			local _UDim2: UDim2 = if IsYMatch then UDim2.fromOffset(0, Rounded) else UDim2.fromOffset(Rounded, 0)
			
			if Leading.Position ~= _UDim2 then
				Leading.Position = _UDim2
			end
			local Rounded1 = math.round(NewStartOffset2 + OriginOffset)
			local _UDim21: UDim2 = if IsYMatch then UDim2.fromOffset(0, Rounded1) else UDim2.fromOffset(Rounded1, 0)
			
			if Trailing.Position ~= _UDim21 then
				Trailing.Position = _UDim21
			end
		end,
		setOriginOffset = function(Value)
			-- upvalues: OriginOffset (ref), NewStartOffsets (copy), ClampedValue (ref), Leading (copy), p1 (copy), IsYMatch (copy), Trailing (copy)
			if Value ~= OriginOffset then
				OriginOffset = Value
				local NewStartOffset = NewStartOffsets[ClampedValue] or 0
				local Rounded = math.round(NewStartOffset - p1 + OriginOffset)
				local _UDim2: UDim2 = if IsYMatch then UDim2.fromOffset(0, Rounded) else UDim2.fromOffset(Rounded, 0)
				
				if Leading.Position ~= _UDim2 then
					Leading.Position = _UDim2
				end
				local Rounded1 = math.round(NewStartOffset + OriginOffset)
				local _UDim21: UDim2 = if IsYMatch then UDim2.fromOffset(0, Rounded1) else UDim2.fromOffset(Rounded1, 0)
				
				if Trailing.Position ~= _UDim21 then
					Trailing.Position = _UDim21
				end
			end
		end,
		place = function(Frame: Frame, p4, Geometry, Presented): boolean
			-- upvalues: Tbl (copy), HostPresentationPhaseModule (upval), v1 (ref), v2 (ref), CanvasItemPlacerModule (upval), Y (copy), p2 (copy), _UDim2 (upval), ClampedValue (ref), Leading (copy), Trailing (copy), Tbl1 (copy), Tbl2 (copy), Flag1 (ref)
			local Index = Geometry.index
			local Entry = Tbl[Frame]
			
			if Entry == nil then
				Entry = {
					inWindow = false,
					visible = false,
					index = Index,
					geometry = {},
					restoreLayoutOrder = Frame.LayoutOrder
				}
				Tbl[Frame] = Entry
			end
			local IsIndexBelow: boolean = Presented == HostPresentationPhaseModule.Presented and v1 <= Index and Index <= v2
			local Geometry1 = CanvasItemPlacerModule.getGeometry(Geometry.itemLayout, Geometry.canvasPlacement, Y, p2, 0, Entry.geometry)
			Geometry1.position = _UDim2
			CanvasItemPlacerModule.place(Frame, if Index < ClampedValue then Leading else Trailing, Geometry1, p4, IsIndexBelow)
			local Index1 = if IsIndexBelow then Index else nil
			local Index2 = if Entry.visible then Entry.index else nil
			
			if Index2 ~= Index1 then
				if Index2 ~= nil then
					Tbl1[Index2] -= 1
					
					if Tbl1[Index2] == 0 then
						Tbl1[Index2] = nil
					end
					Tbl2[Index2] = true
				end
				if Index1 ~= nil then
					Tbl1[Index1] = (Tbl1[Index1] or 0) + 1
					Tbl2[Index1] = true
				end
			end
			Entry.index = Index
			Entry.inWindow = v1 <= Index and Index <= v2
			Entry.visible = IsIndexBelow
			
			if Frame.LayoutOrder ~= Index then
				Frame.LayoutOrder = Index
			end
			Flag1 = true
			
			return IsIndexBelow
		end,
		remove = function(Key)
			-- upvalues: Tbl (copy), Tbl1 (copy), Tbl2 (copy), Flag1 (ref)
			local Entry = Tbl[Key]
			
			if Entry == nil then return end
			Tbl[Key] = nil
			local Index = if Entry.visible then Entry.index else nil
			
			if Index ~= nil and Index ~= nil then
				Tbl1[Index] -= 1
				
				if Tbl1[Index] == 0 then
					Tbl1[Index] = nil
				end
				Tbl2[Index] = true
			end
			Key.LayoutOrder = Entry.restoreLayoutOrder
			Flag1 = true
		end,
		isStacked = function(p4): boolean
			-- upvalues: Tbl (copy)
			return Tbl[p4] ~= nil
		end,
		getStaleHosts = function()
			-- upvalues: Tbl (copy), v1 (ref), v2 (ref), ClampedValue (ref), Leading (copy), Trailing (copy)
			local List = {}
			
			for i, value in Tbl do
				local Index = value.index
				
				if (v1 <= Index and Index <= v2) ~= value.inWindow or i.Parent ~= (if value.index < ClampedValue then Leading else Trailing) then
					table.insert(List, i)
				end
			end
			return List
		end,
		takeChanged = function()
			-- upvalues: UIListLayout (copy), UIListLayout1 (copy), Flag1 (ref), NewAbsoluteContentSize (ref)
			local NewAbsoluteContentSize1 = UIListLayout.AbsoluteContentSize + UIListLayout1.AbsoluteContentSize
			local Flag1_1 = Flag1 or NewAbsoluteContentSize1 ~= NewAbsoluteContentSize
			Flag1 = false
			NewAbsoluteContentSize = NewAbsoluteContentSize1
			
			return Flag1_1
		end,
		commit = function()
			-- upvalues: Flag (ref), Placeholders (copy), v1 (ref), v2 (ref), List (copy), refresh (copy), Tbl2 (copy)
			if Flag then
				Flag = false
				
				for placeholder in Placeholders do
					local v3: boolean = v1 <= placeholder and placeholder <= v2
					local Placeholder = nil
					
					if not v3 then
						Placeholder = Placeholders[placeholder]
						v3 = Placeholder == nil
					end
					if not v3 then
						Placeholders[placeholder] = nil
						Placeholder.Parent = nil
						table.insert(List, Placeholder)
					end
				end
				for i = v1, v2 do
					refresh(i)
				end
				table.clear(Tbl2)
				
				return
			else
				for i1 in Tbl2 do
					refresh(i1)
				end
				table.clear(Tbl2)
			end
		end,
		destroy = function()
			-- upvalues: Tbl (copy), Tbl1 (copy), Placeholders (copy), List (copy), Tbl2 (copy), ViewRecyclerStack (copy)
			for i, value in Tbl do
				i.LayoutOrder = value.restoreLayoutOrder
			end
			table.clear(Tbl)
			table.clear(Tbl1)
			table.clear(Placeholders)
			table.clear(List)
			table.clear(Tbl2)
			ViewRecyclerStack:Destroy()
		end
	}
end

return StackPlacementModule