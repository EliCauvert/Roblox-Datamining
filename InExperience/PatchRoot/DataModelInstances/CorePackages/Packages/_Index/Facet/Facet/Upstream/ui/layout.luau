local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./media_types")
local _ = require("./theme_types")
local _ = require("./environment_types")
local _ = require("./layout_types")
local LayoutKitModule = require("./layout_kit")
local ScrollLockModule = require("./scroll_lock")
local ScrollInitialModule = require("./scroll_initial")
local GlassModule = require("./glass")
local ArtGroundModule = require("./art_ground")
local _ = require("./control_types")
local _ = require("./layout_props")
local ThemeSupportModule = require("./theme_support")
local TextMeasureModule = require("./text_measure")
local t = {}

return function(p1, p2)
	-- upvalues: LayoutKitModule (copy), ArtGroundModule (copy), TextMeasureModule (copy), GlassModule (copy), CoreModule (copy), ThemeSupportModule (copy), ScrollLockModule (copy), ScrollInitialModule (copy), t (copy)
	local Host = p1.Host
	local ReadFunction = p1.read
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local OfResult = LayoutKitModule.of(p1)
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local P1 = p2 or {}
	local Tbl = {
		"gap", "padding", "align", "distribute", "wrap", "width", "height", "surface",
		"status", "corners", "ground"
	}
	table.freeze(Tbl)
	local config = {
		surface = "facet-surface",
		panel = "facet-panel",
		pane = "facet-pane"
	}
	
	local function fills(List): boolean
		for _, UIFlexItem in List do
			if typeof(UIFlexItem) == "Instance" and UIFlexItem:IsA("UIFlexItem") then
				return true
			end
		end
		return false
	end
	
	local function withoutAxis(XY, p3)
		-- upvalues: TypesEnum (copy)
		return if p3 == "x" then if XY == TypesEnum.AutomaticSize.XY then TypesEnum.AutomaticSize.Y elseif XY == TypesEnum.AutomaticSize.X then TypesEnum.AutomaticSize.None else XY elseif p3 == "y" then if XY == TypesEnum.AutomaticSize.XY then TypesEnum.AutomaticSize.X elseif XY == TypesEnum.AutomaticSize.Y then TypesEnum.AutomaticSize.None else XY else XY
	end
	
	local function fillRoom(StackResult, p3)
		-- upvalues: TypesEnum (copy), Runtime (copy), Compose (copy)
		local List = {}
		
		local function release()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
		end
		
		local function attach()
			-- upvalues: List (copy), StackResult (copy), p3 (copy), attach (copy), TypesEnum (upval)
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			local Parent = StackResult.Parent
			
			if Parent == nil or not Parent:IsA("GuiObject") or Parent:IsA("ScrollingFrame") then
				p3:set("none")
				
				return
			end
			local UIListLayout = Parent:FindFirstChildWhichIsA("UIListLayout")
			
			if UIListLayout == nil then
				table.insert(List, Parent.ChildAdded:Connect(attach))
				p3:set("none")
				
				return
			else
				local function update()
					-- upvalues: UIListLayout (copy), TypesEnum (upval), Parent (copy), p3 (upval)
					local X: string = if UIListLayout.FillDirection == TypesEnum.FillDirection.Horizontal then "x" else "y"
					local AutomaticSize = Parent.AutomaticSize
					local IsAutomaticSizeMatch: boolean = AutomaticSize == TypesEnum.AutomaticSize.XY or (X == "x" and AutomaticSize == TypesEnum.AutomaticSize.X or X == "y" and AutomaticSize == TypesEnum.AutomaticSize.Y)
					p3:set(if IsAutomaticSizeMatch then "none" else X)
				end
				
				table.insert(List, UIListLayout:GetPropertyChangedSignal("FillDirection"):Connect(update))
				table.insert(List, Parent:GetPropertyChangedSignal("AutomaticSize"):Connect(update))
				update()
			end
		end
		
		Runtime.connect(StackResult, "AncestryChanged", attach)
		Compose.cleanup(release)
		attach()
	end
	
	local function looseRoom(Frame: Frame, CellResult, CellResult1)
		-- upvalues: TypesEnum (copy), TypesVector2 (copy), Runtime (copy), Compose (copy)
		local List = {}
		
		local function release()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
		end
		
		local function _(p4, p5)
			-- upvalues: CellResult (copy), CellResult1 (copy)
			if CellResult:peek() ~= p4 then
				CellResult:set(p4)
			end
			if CellResult1:peek() ~= p5 then
				CellResult1:set(p5)
			end
		end
		
		local _ = function(ScrollingFrame): boolean
			-- upvalues: TypesEnum (upval)
			local AutomaticSize = ScrollingFrame.AutomaticSize
			
			return not ScrollingFrame:IsA("ScrollingFrame") and (AutomaticSize == TypesEnum.AutomaticSize.X or AutomaticSize == TypesEnum.AutomaticSize.XY)
		end
		
		local Callback = nil
		
		local function stretched(Parent): boolean
			-- upvalues: List (copy), Callback (ref), TypesEnum (upval)
			local Parent1 = Parent.Parent
			local UIListLayout = if Parent1 then Parent1:FindFirstChildWhichIsA("UIListLayout") else nil
			
			if UIListLayout == nil then
				return false
			end
			for _, PropertyName in { "FillDirection", "HorizontalFlex", "ItemLineAlignment" } do
				table.insert(List, UIListLayout:GetPropertyChangedSignal(PropertyName):Connect(Callback))
			end
			return if UIListLayout.FillDirection == TypesEnum.FillDirection.Horizontal then Parent:FindFirstChildWhichIsA("UIFlexItem") ~= nil else UIListLayout.HorizontalFlex ~= TypesEnum.UIFlexAlignment.None or UIListLayout.ItemLineAlignment == TypesEnum.ItemLineAlignment.Stretch
		end
		
		Callback = function()
			-- upvalues: List (copy), Frame (copy), TypesVector2 (upval), CellResult (copy), CellResult1 (copy), Callback (ref), TypesEnum (upval), stretched (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			
			if Frame.Size.X.Scale <= 0 then
				local Zero = TypesVector2.zero
				
				if CellResult:peek() ~= false then
					CellResult:set(false)
				end
				if CellResult1:peek() ~= Zero then
					CellResult1:set(Zero)
				end
				return
			else
				local Frame1 = Frame
				while true do
					local Parent2 = Frame1.Parent
					if Parent2 == nil or not Parent2:IsA("GuiObject") then break end
					table.insert(List, Parent2:GetPropertyChangedSignal("AutomaticSize"):Connect(Callback))
					local AutomaticSize = Parent2.AutomaticSize
					
					if Parent2:IsA("ScrollingFrame") or AutomaticSize ~= TypesEnum.AutomaticSize.X and AutomaticSize ~= TypesEnum.AutomaticSize.XY then
						local Zero = TypesVector2.zero
						
						if CellResult:peek() ~= false then
							CellResult:set(false)
						end
						if CellResult1:peek() ~= Zero then
							CellResult1:set(Zero)
						end
						return
					end
					if stretched(Parent2) then
						Frame1 = Parent2
						continue
					end
				end
				local NewOffset = 0
				local Parent = Frame.Parent
				local Parent1 = if Parent then Parent.Parent else nil
				local v1 = nil
				while Parent1 ~= nil do
					if Parent1:IsA("LayerCollector") then
						v1 = Parent1
						break
					end
					if not Parent1:IsA("GuiObject") then break end
					local UIPadding = Parent1:FindFirstChildWhichIsA("UIPadding")
					
					if UIPadding then
						NewOffset += UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset
					end
					local AutomaticSize = Parent1.AutomaticSize
					
					if not Parent1:IsA("ScrollingFrame") and (AutomaticSize == TypesEnum.AutomaticSize.X or AutomaticSize == TypesEnum.AutomaticSize.XY) then
						Parent1 = Parent1.Parent
						continue
					end
					v1 = Parent1
					break
				end
				local Frame2 = v1
				
				if Frame2 == nil or Parent == nil or not Parent:IsA("GuiObject") then
					local NewTypesVector = TypesVector2.new(1e999, NewOffset)
					
					if CellResult:peek() ~= true then
						CellResult:set(true)
					end
					if CellResult1:peek() ~= NewTypesVector then
						CellResult1:set(NewTypesVector)
					end
					return
				else
					local function measure()
						-- upvalues: Frame (upval), Parent (copy), TypesVector2 (upval), Frame2 (copy), NewOffset (ref), CellResult (upval), CellResult1 (upval)
						local X: number = Frame.AbsoluteSize.X
						local NewTypesVector = TypesVector2.new(Frame2.AbsoluteSize.X - (if X > 0 then math.max(0, Parent.AbsoluteSize.X - X) else 0), NewOffset)
						
						if CellResult:peek() ~= true then
							CellResult:set(true)
						end
						if CellResult1:peek() ~= NewTypesVector then
							CellResult1:set(NewTypesVector)
						end
					end
					
					for _, value in { Frame2, Parent, Frame } do
						table.insert(List, value:GetPropertyChangedSignal("AbsoluteSize"):Connect(measure))
					end
					local X: number = Frame.AbsoluteSize.X
					local NewTypesVector1 = TypesVector2.new(Frame2.AbsoluteSize.X - (if X > 0 then math.max(0, Parent.AbsoluteSize.X - X) else 0), NewOffset)
					
					if CellResult:peek() ~= true then
						CellResult:set(true)
					end
					if CellResult1:peek() ~= NewTypesVector1 then
						CellResult1:set(NewTypesVector1)
					end
				end
			end
		end
		
		Runtime.connect(Frame, "AncestryChanged", Callback)
		Compose.cleanup(release)
		Callback()
	end
	
	local function growth(GrowRatio: number)
		-- upvalues: Host (copy), TypesEnum (copy)
		assert(type(GrowRatio) == "number" and GrowRatio > 0 and GrowRatio < 1e999, "Facet grow must be a positive finite number")
		
		return Host.UIFlexItem({
			Name = "Grow",
			FlexMode = TypesEnum.UIFlexMode.Custom,
			GrowRatio = GrowRatio,
			ShrinkRatio = GrowRatio
		})
	end
	
	local function containerProps(Tbl, Tbl1)
		-- upvalues: containerProps (copy), growth (copy), p1 (copy), ReadFunction (copy), Host (copy), TypesVector2 (copy)
		if Tbl.grow ~= nil then
			local Copy = table.clone(Tbl)
			Copy.grow = nil
			local ContainerPropsResult, ContainerPropsResult2 = containerProps(Copy, Tbl1)
			ContainerPropsResult[#ContainerPropsResult + 1] = growth(Tbl.grow)
			
			return ContainerPropsResult, ContainerPropsResult2
		elseif Tbl.maxWidth == nil and Tbl.maxHeight == nil then
			return p1.props(Tbl, Tbl1), nil
		else
			local Copy = table.clone(Tbl1)
			table.insert(Copy, "maxWidth")
			table.insert(Copy, "maxHeight")
			local PropsResult = p1.props(Tbl, Copy)
			
			local function _(p4, p5, p6): number
				-- upvalues: ReadFunction (upval)
				if p4 == nil then
					return 1e999
				else
					local ReadResult: number = ReadFunction(p4, p6)
					assert(type(ReadResult) == "number" and ReadResult >= 0 and ReadResult < 1e999, `Facet {p5} must be a finite number of pixels, 0 or more`)
					
					return ReadResult
				end
			end
			
			local UISizeConstraintResult = Host.UISizeConstraint({
				MaxSize = function(p4)
					-- upvalues: TypesVector2 (upval), Tbl (copy), ReadFunction (upval)
					local NewFunction = TypesVector2.new
					local MaxWidth = Tbl.maxWidth
					local v2 = nil
					
					if MaxWidth == nil then
						v2 = 1e999
					else
						local ReadResult: number = ReadFunction(MaxWidth, p4)
						assert(type(ReadResult) == "number" and ReadResult >= 0 and ReadResult < 1e999, "Facet maxWidth must be a finite number of pixels, 0 or more")
						v2 = ReadResult
					end
					local MaxHeight = Tbl.maxHeight
					local v3 = nil
					
					if MaxHeight == nil then
						v3 = 1e999
					else
						local ReadResult: number = ReadFunction(MaxHeight, p4)
						assert(type(ReadResult) == "number" and ReadResult >= 0 and ReadResult < 1e999, "Facet maxHeight must be a finite number of pixels, 0 or more")
						v3 = ReadResult
					end
					return NewFunction(v2, v3)
				end
			})
			PropsResult[#PropsResult + 1] = UISizeConstraintResult
			
			return PropsResult, UISizeConstraintResult
		end
	end
	
	local function split(ScrollFrame, p4)
		-- upvalues: containerProps (copy)
		local t = {}
		local t1 = {}
		
		for i, value in ScrollFrame do
			if type(i) ~= "number" then
				t[i] = value
			end
		end
		for i1 = 1, #ScrollFrame do
			t1[i1] = ScrollFrame[i1]
		end
		local ContainerPropsResult, ContainerPropsResult2 = containerProps(t, p4)
		
		return ContainerPropsResult, t1, ContainerPropsResult2
	end
	
	local config1 = { surface = "radii.control", panel = "radii.panel" }
	local list = { "top", "right", "bottom", "left" }
	
	local function _(p5, p6)
		-- upvalues: ReadFunction (copy), list (copy), OfResult (copy)
		return function(p7)
			-- upvalues: ReadFunction (upval), p5 (copy), list (upval), OfResult (upval), p6 (copy)
			local Bottom = ReadFunction(p5, p7)
			local Bottom1 = if type(Bottom) == "table" then Bottom else {
				top = Bottom,
				right = Bottom,
				bottom = Bottom,
				left = Bottom
			}
			local Offsets = {}
			
			for _, value in list do
				local BottomEntry = Bottom1[value]
				
				if typeof(BottomEntry) ~= "UDim" then
					Offsets[value] = OfResult.spacing(BottomEntry, p7)
					continue
				end
				if BottomEntry.Scale ~= 0 then
					return Bottom
				end
				Offsets[value] = BottomEntry.Offset
			end
			local Value, v2 = p6(p7)
			local Copy = table.clone(Offsets)
			local Ceiled = math.ceil(Value)
			
			for _, value1 in {
				{ "top", "left" },
				{ "top", "right" },
				{ "bottom", "left" },
				{ "bottom", "right" }
			} do
				local v3 = value1[1]
				local v4 = value1[2]
				
				if (Offsets[v3] ~= 0 or Offsets[v4] ~= 0) and Offsets[v3] < Value and Offsets[v4] < Value then
					local IsOffsetBelow = if v2 == nil then Offsets[v3] <= Offsets[v4] else v2
					local v5 = if IsOffsetBelow then v4 else v3
					Copy[v5] = math.max(Copy[v5], Ceiled)
				end
			end
			return {
				top = Copy.top,
				right = Copy.right,
				bottom = Copy.bottom,
				left = Copy.left
			}
		end
	end
	
	local function cornerShape(Corners, p8, p9)
		-- upvalues: ReadFunction (copy), TypesUDim (copy), p1 (copy)
		local ReadResult: number = ReadFunction(Corners, p9)
		
		if ReadResult == "pill" then
			return TypesUDim.new(1, 0)
		elseif ReadResult == "square" then
			return TypesUDim.new(0, 0)
		elseif ReadResult == "control" or ReadResult == "panel" then
			return TypesUDim.new(0, p1.metric(if ReadResult == "panel" then "radii.panel" else "radii.control", p9))
		else
			assert(type(ReadResult) == "number" and ReadResult >= 0 and ReadResult < 1e999, `Facet {p8}: corners must be pill, square, control, panel or a finite number of pixels, 0 or more`)
			
			return TypesUDim.new(0, ReadResult)
		end
	end
	
	local function cornerNode(Corners, p8)
		-- upvalues: Host (copy), cornerShape (copy)
		local IsNotPanel: boolean = if type(Corners) == "string" then Corners ~= "control" and Corners ~= "panel" else type(Corners) == "number" and (Corners ~= "control" and Corners ~= "panel")
		
		return Host.UICorner({
			Name = "Corners",
			CornerRadius = if IsNotPanel then cornerShape(Corners, p8) else function(p9)
				-- upvalues: cornerShape (upval), Corners (copy), p8 (copy)
				return cornerShape(Corners, p8, p9)
			end
		})
	end
	
	local function stack(Tbl1, p8)
		-- upvalues: config (copy), split (copy), Tbl (copy), config1 (copy), cornerShape (copy), Compose (copy), TypesVector2 (copy), p1 (copy), Host (copy), ReadFunction (copy), list (copy), OfResult (copy), ArtGroundModule (upval), fills (copy), withoutAxis (copy), fillRoom (copy), TextMeasureModule (upval), looseRoom (copy)
		local Entry = config[Tbl1.surface or ""]
		assert(Tbl1.surface == nil or Entry ~= nil, "Facet stack: surface must be surface, panel or pane")
		local Corners = Tbl1.corners
		assert(Corners == nil or Entry ~= nil, "Facet stack: corners need a surface")
		local SplitResult, SplitResult2 = split(Tbl1, Tbl)
		local Entry1 = config1[Tbl1.surface or ""]
		
		local function shape(p9)
			-- upvalues: cornerShape (upval), Corners (copy)
			return cornerShape(Corners, "stack", p9)
		end
		
		local IsString: boolean = type(Corners) == "string" or type(Corners) == "number"
		local IsPill: boolean = Tbl1.padding ~= nil and (Corners == "pill" or Corners ~= nil and not IsString)
		local CellResult = if IsPill then Compose.cell(TypesVector2.zero) else nil
		
		local function bend(Callback)
			-- upvalues: Corners (copy), p1 (upval), Entry1 (copy), cornerShape (upval), CellResult (copy), TypesVector2 (upval)
			if Corners == nil then
				return p1.metric(assert(Entry1), Callback), nil
			end
			local Stack = cornerShape(Corners, "stack", Callback)
			
			if Stack.Scale == 0 then
				return Stack.Offset, nil
			else
				local CallbackResult = if CellResult then Callback(CellResult) else TypesVector2.zero
				
				return math.min(CallbackResult.X, CallbackResult.Y) / 2, CallbackResult.Y <= CallbackResult.X
			end
		end
		
		if Corners ~= nil then
			local IsNotPanel: boolean = IsString and (Corners ~= "control" and Corners ~= "panel")
			SplitResult[#SplitResult + 1] = Host.UICorner({
				CornerRadius = if IsNotPanel then cornerShape(Corners, "stack", nil) else shape
			})
		end
		local Tbl2 = Tbl1
		
		if (Entry1 ~= nil or Corners ~= nil) and Tbl1.padding ~= nil then
			Tbl2 = table.clone(Tbl1)
			local Padding = Tbl1.padding
			
			function Tbl2.padding(p9)
				-- upvalues: ReadFunction (upval), Padding (copy), list (upval), OfResult (upval), bend (copy)
				local Bottom = ReadFunction(Padding, p9)
				local Bottom1 = if type(Bottom) == "table" then Bottom else {
					top = Bottom,
					right = Bottom,
					bottom = Bottom,
					left = Bottom
				}
				local Offsets = {}
				
				for _, value in list do
					local BottomEntry = Bottom1[value]
					
					if typeof(BottomEntry) ~= "UDim" then
						Offsets[value] = OfResult.spacing(BottomEntry, p9)
						continue
					end
					if BottomEntry.Scale ~= 0 then
						return Bottom
					end
					Offsets[value] = BottomEntry.Offset
				end
				local Value, v6 = bend(p9)
				local Copy = table.clone(Offsets)
				local Ceiled = math.ceil(Value)
				
				for _, value1 in {
					{ "top", "left" },
					{ "top", "right" },
					{ "bottom", "left" },
					{ "bottom", "right" }
				} do
					local v7 = value1[1]
					local v8 = value1[2]
					
					if (Offsets[v7] ~= 0 or Offsets[v8] ~= 0) and Offsets[v7] < Value and Offsets[v8] < Value then
						local IsOffsetBelow = if v6 == nil then Offsets[v7] <= Offsets[v8] else v6
						local v9 = if IsOffsetBelow then v8 else v7
						Copy[v9] = math.max(Copy[v9], Ceiled)
					end
				end
				return {
					top = Copy.top,
					right = Copy.right,
					bottom = Copy.bottom,
					left = Copy.left
				}
			end
		end
		local Ground = Tbl1.ground
		assert(Ground == nil or typeof(Ground) == "Instance" and Ground:IsA("GuiObject"), "Facet stack: ground must be one GuiObject, such as a UI.Image")
		local MarginsResult = if Ground == nil then nil else ArtGroundModule.margins(p1)
		
		if MarginsResult then
			Tbl2 = table.clone(Tbl2)
			Tbl2.padding = ArtGroundModule.padding(p1, OfResult.spacing, Tbl2.padding, MarginsResult)
		end
		local v10 = nil
		
		if SplitResult.AutomaticSize == nil and fills(SplitResult2) then
			local None = Compose.cell("none")
			local _, Hug2 = OfResult.extent(Tbl2, "hug", "hug")
			
			function SplitResult.AutomaticSize(Callback)
				-- upvalues: withoutAxis (upval), ReadFunction (upval), Hug2 (copy), None (copy)
				return (withoutAxis(ReadFunction(Hug2, Callback), Callback(None)))
			end
			
			v10 = None
		end
		local StackResult = OfResult.stack(SplitResult2, SplitResult, Tbl2, p8)
		
		if v10 then
			fillRoom(StackResult, v10)
		end
		if Ground ~= nil and MarginsResult then
			ArtGroundModule.mount(p1, StackResult, Ground, MarginsResult)
		end
		local HasSize: boolean = if Tbl1.width == nil then SplitResult.Size ~= nil else Tbl1.width ~= "hug" or SplitResult.Size ~= nil
		local HasSize1: boolean = not p8 and (Tbl1.wrap == nil and HasSize)
		local UIListLayout = if HasSize1 then StackResult:FindFirstChildWhichIsA("UIListLayout") else nil
		
		if type(Tbl1.width) == "number" then
			StackResult:AddTag("facet-fixed-width")
		end
		if UIListLayout then
			StackResult:AddTag("facet-row-spills")
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(StackResult)
			local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(UIListLayout)
			local AbsoluteContentSizeResults = {}
			local HoldResults = {}
			local Flag = false
			local CellResult1 = Compose.cell(false)
			local CellResult2 = Compose.cell(TypesVector2.zero)
			local t = {}
			local BindOwnerResult = Compose.bindOwner(function(p10)
				-- upvalues: TextMeasureModule (upval), p1 (upval)
				return TextMeasureModule.natural(p1, p10)
			end)
			
			for _, Gui in StackResult:GetChildren() do
				if Gui:IsA("GuiObject") and Gui:FindFirstChildWhichIsA("UIFlexItem") then
					Flag = true
					HoldResults[Gui] = OfResult.hold(Gui)
					local UIListLayout1 = Gui:FindFirstChildWhichIsA("UIListLayout")
					
					if UIListLayout1 then
						table.insert(AbsoluteContentSizeResults, p1.observe.AbsoluteContentSize(UIListLayout1))
					end
				end
			end
			if Flag then
				looseRoom(StackResult, CellResult1, CellResult2)
			end
			Compose.watch(function(Callback)
				-- upvalues: AbsoluteSizeResult (copy), AbsoluteContentSizeResult (copy), AbsoluteContentSizeResults (copy), CellResult1 (copy), CellResult2 (copy), StackResult (copy), Flag (ref), t (copy), BindOwnerResult (copy), HoldResults (copy), OfResult (upval), UIListLayout (copy)
				local X: number = Callback(AbsoluteSizeResult).X
				local X1: number = Callback(AbsoluteContentSizeResult).X
				
				for _, absoluteContentSizeResult in AbsoluteContentSizeResults do
					Callback(absoluteContentSizeResult)
				end
				local CallbackResult = Callback(CellResult1)
				local CallbackResult1 = Callback(CellResult2)
				
				if X <= 0 and not CallbackResult then return end
				local ScaledScale = 1
				local Parent = StackResult
				while Parent and Parent:IsA("GuiObject") do
					local UIScale = Parent:FindFirstChildWhichIsA("UIScale")
					
					if UIScale then
						ScaledScale *= UIScale.Scale
					end
					Parent = Parent.Parent
				end
				local UIPadding = StackResult:FindFirstChildWhichIsA("UIPadding")
				local NewOffset = if UIPadding then (UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset) * ScaledScale + (UIPadding.PaddingLeft.Scale + UIPadding.PaddingRight.Scale) * X else 0
				local IsXBelow = nil
				
				if Flag then
					local Largest: number = if CallbackResult then math.max(0, (CallbackResult1.X - NewOffset) / ScaledScale - CallbackResult1.Y) else math.max(0, (X - NewOffset) / ScaledScale)
					local Total = 0
					local Count = 0
					local XRatios = {}
					local Largests = {}
					
					local function line(Key): number
						-- upvalues: t (upval), BindOwnerResult (upval), Callback (copy)
						local Entry = t[Key]
						
						if Entry == nil then
							Entry = BindOwnerResult(Key)
							t[Key] = Entry
						end
						local X: number = Callback(Entry).X
						
						return if X < 1e999 then X else 0
					end
					
					for _, Gui in StackResult:GetChildren() do
						if Gui:IsA("GuiObject") and Gui.Visible then
							local XRatio = Gui.AbsoluteSize.X / ScaledScale
							
							if HoldResults[Gui] then
								XRatio = OfResult.rigid(Gui, ScaledScale)
								XRatios[Gui] = XRatio
								
								if CallbackResult then
									Largests[Gui] = math.max(XRatio, OfResult.natural(Gui, ScaledScale, line))
								end
							end
							Total += XRatio
							Count += 1
						end
					end
					local NewTotal = Total + UIListLayout.Padding.Offset * math.max(Count - 1, 0)
					
					if CallbackResult then
						IsXBelow = Largest + 0.5 < NewTotal
						local Largest1 = math.max(0, Largest - NewTotal)
						local Total1 = 0
						
						for i1, largest in Largests do
							Total1 += largest - (XRatios[i1] or 0)
						end
						local Smallest: number = if Total1 > 0 then math.min(1, Largest1 / Total1) else 0
						for i2, holdResult1 in HoldResults do
							local XRatio = XRatios[i2] or 0
							holdResult1(math.min(XRatio + ((Largests[i2] or XRatio) - XRatio) * Smallest, Largest), true)
						end
					else
						IsXBelow = X + 0.5 < NewTotal * ScaledScale + NewOffset
						for i, holdResult in HoldResults do
							holdResult(if IsXBelow then math.min(XRatios[i] or 0, Largest) else 0, IsXBelow)
						end
					end
				else
					IsXBelow = if UIListLayout.Wraps then X + 0.5 < OfResult.intrinsic(StackResult, true, ScaledScale) * ScaledScale else X + 0.5 < X1 + NewOffset and X + 0.5 < OfResult.intrinsic(StackResult, true, ScaledScale) * ScaledScale
				end
				if UIListLayout.Wraps ~= IsXBelow then
					UIListLayout.Wraps = IsXBelow
				end
			end)
		end
		if CellResult then
			local CellResult3 = CellResult
			local LayoutSizeResult = p1.layoutSize(StackResult, p1.layoutUnit(StackResult, "CornerUnit"))
			Compose.watch(function(Callback)
				-- upvalues: CellResult3 (copy), LayoutSizeResult (copy)
				CellResult3:set(Callback(LayoutSizeResult))
			end)
		end
		if Entry then
			StackResult:AddTag(Entry)
		end
		if Corners ~= nil then
			Compose.watch(function(p10)
				-- upvalues: ReadFunction (upval), Corners (copy), StackResult (copy)
				if ReadFunction(Corners, p10) == "pill" then
					StackResult:AddTag("facet-stack-pill")
					
					return
				end
				if StackResult:HasTag("facet-stack-pill") then
					StackResult:RemoveTag("facet-stack-pill")
				end
			end)
		end
		if Tbl1.surface == "panel" then
			p1.skin(StackResult, "panel")
		end
		if Tbl1.status ~= nil then
			local Tag = nil
			Compose.watch(function(p10)
				-- upvalues: ReadFunction (upval), Tbl1 (copy), Tag (ref), StackResult (copy)
				local ReadResult = ReadFunction(Tbl1.status, p10)
				local Text = if ReadResult then "facet-status-" .. ReadResult else nil
				
				if Text == Tag then return end
				if Tag then
					StackResult:RemoveTag(Tag)
				end
				if Text then
					StackResult:AddTag(Text)
					StackResult:AddTag("facet-status-surface")
				else
					StackResult:RemoveTag("facet-status-surface")
				end
				Tag = Text
			end)
		end
		return StackResult
	end
	
	P1.VStack = p1.construct("VStack", function(p10)
		-- upvalues: stack (copy)
		return (stack(p10, true))
	end)
	P1.HStack = p1.construct("HStack", function(p10)
		-- upvalues: stack (copy)
		return (stack(p10, false))
	end)
	P1.Screen = p1.construct("Screen", function(p10)
		-- upvalues: split (copy), config (copy), Compose (copy), p1 (copy), ReadFunction (copy), OfResult (copy), GlassModule (upval), config1 (copy), CoreModule (upval), Runtime (copy)
		local SplitResult, SplitResult2 = split(p10, {
			"gap", "padding", "align", "distribute", "width", "height", "chrome",
			"surface", "ground"
		})
		local Chrome = p10.chrome or "device"
		assert(Chrome == "device" or (Chrome == "band" or Chrome == "edge"), "Facet UI.Screen: chrome must be device, band or edge")
		local Entry = config[p10.surface or ""]
		assert(p10.surface == nil or Entry ~= nil, "Facet UI.Screen: surface must be surface, panel or pane")
		local M = if p10.padding == nil then "m" else p10.padding
		local CellResult = Compose.cell(0)
		local CellResult1 = Compose.cell(0)
		local CellResult2 = Compose.cell(nil)
		local TenFootResult = p1.tenFoot()
		local OverscanInsets = p1.config.environment and p1.config.environment.overscanInsets
		local FormulaResult = Compose.formula(function(p11)
			-- upvalues: ReadFunction (upval), OverscanInsets (copy), Chrome (copy), TenFootResult (copy)
			local ReadResult = ReadFunction(OverscanInsets, p11)
			
			return Chrome ~= "edge" and (type(ReadResult) == "table" or ReadResult == nil and TenFootResult(p11))
		end)
		local config2 = {
			top = 0.05555555555555555,
			bottom = 0.05555555555555555,
			left = 0.046875,
			right = 0.046875
		}
		local Fill = OfResult.stack(SplitResult2, SplitResult, {
			gap = p10.gap,
			align = p10.align,
			distribute = p10.distribute,
			padding = function(Callback)
				-- upvalues: ReadFunction (upval), M (copy), OverscanInsets (copy), OfResult (upval), CellResult2 (copy), Chrome (copy), p1 (upval), TenFootResult (copy), config2 (copy), CellResult (copy), CellResult1 (copy)
				local ReadResult = ReadFunction(M, Callback)
				local ReadResult1 = if type(ReadResult) == "table" then ReadResult else {
					top = ReadResult,
					right = ReadResult,
					bottom = ReadResult,
					left = ReadResult
				}
				local ReadResult2 = ReadFunction(OverscanInsets, Callback)
				
				local function side(p11, p12)
					-- upvalues: OfResult (upval), ReadResult1 (copy), Callback (copy), CellResult2 (upval), Chrome (upval), p1 (upval), ReadResult2 (copy), TenFootResult (upval), config2 (upval)
					local NewSpacingResult = OfResult.spacing(ReadResult1[p11], Callback) + p12
					local CallbackResult = Callback(CellResult2)
					
					return if CallbackResult and Chrome ~= "edge" then p1.types.UDim.new(0, NewSpacingResult + CallbackResult[p11]) elseif type(ReadResult2) == "table" and Chrome ~= "edge" then p1.types.UDim.new(0, NewSpacingResult + (ReadResult2[p11] or 0)) else p1.types.UDim.new(if ReadResult2 == nil and Chrome ~= "edge" and TenFootResult(Callback) then config2[p11] else 0, NewSpacingResult)
				end
				
				return {
					top = side("top", if Chrome == "device" then Callback(CellResult) else 0),
					right = side("right", 0),
					bottom = side("bottom", if Chrome == "device" then Callback(CellResult1) else 0),
					left = side("left", 0)
				}
			end,
			width = p10.width,
			height = p10.height
		}, true, "fill", "fill")
		OfResult.underTopbar(Fill, CellResult)
		
		if Chrome == "device" then
			OfResult.touchClearance(Fill, CellResult1)
		end
		if Entry then
			GlassModule.backdrop(p1, Fill, Entry, config1[p10.surface or ""], p10.surface == "panel")
		end
		local Ground = p10.ground
		
		if Ground ~= nil then
			assert(typeof(Ground) == "Instance" and Ground:IsA("GuiObject"), "Facet UI.Screen: ground must be one GuiObject, such as a UI.Image")
			GlassModule.ground(p1, Fill, Ground)
		end
		local v11 = assert(Compose.currentOwner())
		local v12 = nil
		
		local function locate()
			-- upvalues: CoreModule (upval), v11 (copy), v12 (ref), p1 (upval), Fill (copy), FormulaResult (copy), CellResult2 (copy), Compose (upval), ReadFunction (upval), OverscanInsets (copy), TenFootResult (copy), config2 (copy)
			if CoreModule.owner.isDisposed(v11) then return end
			if v12 then
				CoreModule.owner.dispose(v12)
				v12 = nil
			end
			local OverlayParent = p1.config.overlayParent or Fill:FindFirstAncestorWhichIsA("LayerCollector")
			
			if OverlayParent == nil or not FormulaResult:peek() then
				CellResult2:set(nil)
				
				return
			else
				local Child = CoreModule.owner.createChild(v11)
				v12 = Child
				Compose.withOwner(Child, function()
					-- upvalues: p1 (upval), Fill (upval), OverlayParent (copy), Compose (upval), CellResult2 (upval), ReadFunction (upval), OverscanInsets (upval), TenFootResult (upval), config2 (upval)
					local AbsolutePositionResult = p1.observe.AbsolutePosition(Fill)
					local AbsoluteSizeResult = p1.observe.AbsoluteSize(Fill)
					local AbsolutePositionResult1 = p1.observe.AbsolutePosition(OverlayParent)
					local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(OverlayParent)
					local LayoutUnitResult = p1.layoutUnit(Fill)
					Compose.watch(function(Callback)
						-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsolutePositionResult1 (copy), AbsoluteSizeResult1 (copy), CellResult2 (upval), LayoutUnitResult (copy), ReadFunction (upval), OverscanInsets (upval), TenFootResult (upval), config2 (upval)
						local CallbackResult = Callback(AbsolutePositionResult)
						local CallbackResult1 = Callback(AbsoluteSizeResult)
						local CallbackResult2 = Callback(AbsolutePositionResult1)
						local CallbackResult3 = Callback(AbsoluteSizeResult1)
						
						if CallbackResult1.X <= 0 or CallbackResult1.Y <= 0 or CallbackResult3.X <= 0 or CallbackResult3.Y <= 0 then
							CellResult2:set(nil)
							
							return
						else
							local CallbackResult4 = Callback(LayoutUnitResult)
							local ReadResult = ReadFunction(OverscanInsets, Callback)
							
							local function _(p11, p12, p13: number)
								-- upvalues: ReadResult (copy), CallbackResult4 (copy), TenFootResult (upval), Callback (copy), config2 (upval)
								local ScaledCallbackResult = if type(ReadResult) == "table" then (ReadResult[p11] or 0) * CallbackResult4 elseif ReadResult == nil and TenFootResult(Callback) then p12 * config2[p11] else 0
								
								return if ScaledCallbackResult > 0 then math.max(0, ScaledCallbackResult - p13) / CallbackResult4 else 0
							end
							
							local config = {
								top = if ScaledCallbackResult > 0 then math.max(0, ScaledCallbackResult - YDelta) / CallbackResult4 else 0,
								left = if ScaledCallbackResult1 > 0 then math.max(0, ScaledCallbackResult1 - XDelta) / CallbackResult4 else 0,
								bottom = if ScaledCallbackResult2 > 0 then math.max(0, ScaledCallbackResult2 - YDelta1) / CallbackResult4 else 0,
								right = if ScaledCallbackResult3 > 0 then math.max(0, ScaledCallbackResult3 - XDelta1) / CallbackResult4 else 0
							}
							local Y = CallbackResult3.Y
							local YDelta = CallbackResult.Y - CallbackResult2.Y
							local ScaledCallbackResult = if type(ReadResult) == "table" then (ReadResult.top or 0) * CallbackResult4 elseif ReadResult == nil and TenFootResult(Callback) then Y * config2.top else 0
							local X = CallbackResult3.X
							local XDelta = CallbackResult.X - CallbackResult2.X
							local ScaledCallbackResult1 = if type(ReadResult) == "table" then (ReadResult.left or 0) * CallbackResult4 elseif ReadResult == nil and TenFootResult(Callback) then X * config2.left else 0
							local Y1 = CallbackResult3.Y
							local YDelta1 = CallbackResult2.Y + CallbackResult3.Y - CallbackResult.Y - CallbackResult1.Y
							local ScaledCallbackResult2 = if type(ReadResult) == "table" then (ReadResult.bottom or 0) * CallbackResult4 elseif ReadResult == nil and TenFootResult(Callback) then Y1 * config2.bottom else 0
							local X1 = CallbackResult3.X
							local XDelta1 = CallbackResult2.X + CallbackResult3.X - CallbackResult.X - CallbackResult1.X
							local ScaledCallbackResult3 = if type(ReadResult) == "table" then (ReadResult.right or 0) * CallbackResult4 elseif ReadResult == nil and TenFootResult(Callback) then X1 * config2.right else 0
							CellResult2:set(config)
						end
					end)
				end)
			end
		end
		
		Runtime.connect(Fill, "AncestryChanged", locate)
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: FormulaResult (copy), locate (copy)
			Callback(FormulaResult)
			locate()
		end)
		
		return Fill
	end)
	P1.Group = p1.construct("Group", function(p10)
		-- upvalues: split (copy), OfResult (copy), cornerNode (copy), Host (copy)
		local SplitResult, SplitResult2 = split(p10, {
			"groupTransparency",
			"width",
			"height",
			"padding",
			"corners"
		})
		local Hug, Hug2 = OfResult.extent(p10, "hug", "hug")
		
		if p10.corners ~= nil then
			SplitResult[#SplitResult + 1] = cornerNode(p10.corners, "Group")
		end
		return OfResult.plain(Host.CanvasGroup(OfResult.assemble({
			BorderSizePixel = 0,
			Size = Hug,
			AutomaticSize = Hug2,
			GroupTransparency = p10.groupTransparency
		}, SplitResult, { OfResult.insets(p10.padding) }, SplitResult2)), SplitResult)
	end)
	P1.ZStack = p1.construct("ZStack", function(p10)
		-- upvalues: split (copy), cornerNode (copy), OfResult (copy), ArtGroundModule (upval), p1 (copy), Compose (copy), Host (copy), ReadFunction (copy), TypesVector2 (copy), TypesUDim2 (copy)
		local SplitResult, SplitResult2 = split(p10, {
			"padding", "width", "height", "alignH", "alignV", "ground", "corners"
		})
		
		if p10.corners ~= nil then
			SplitResult[#SplitResult + 1] = cornerNode(p10.corners, "ZStack")
		end
		local Hug, Hug2 = OfResult.extent(p10, "hug", "hug")
		local Ground = p10.ground
		assert(Ground == nil or typeof(Ground) == "Instance" and Ground:IsA("GuiObject"), "Facet ZStack: ground must be one GuiObject, such as a UI.Image")
		local MarginsResult = if Ground == nil then nil else ArtGroundModule.margins(p1)
		local HasAlignH: boolean = p10.alignH ~= nil or p10.alignV ~= nil
		
		local function _(p11): number
			assert(p11 == nil or (p11 == "start" or (p11 == "center" or p11 == "end")), "Facet ZStack alignH and alignV must be start, center or end")
			
			return if p11 == "center" then 0.5 elseif p11 == "end" then 1 else 0
		end
		
		local self = setmetatable({}, { __mode = "k" })
		local CellResult = Compose.cell(0)
		
		local _ = function(p11): boolean
			return p11 == nil or p11 == "hug"
		end
		
		local PlainResult = OfResult.plain(Host.Frame(OfResult.assemble({ BorderSizePixel = 0, Size = Hug, AutomaticSize = Hug2 }, SplitResult, {
			OfResult.insets(if MarginsResult then ArtGroundModule.padding(p1, OfResult.spacing, p10.padding, MarginsResult) else p10.padding)
		}, SplitResult2, function(Key, ZIndex)
			-- upvalues: HasAlignH (copy), self (copy), p1 (upval), CellResult (copy)
			if Key.ZIndex == 1 then
				Key.ZIndex = ZIndex
			end
			if HasAlignH then
				Key:SetAttribute("FacetPlaced", true)
				self[Key] = p1.observe.AbsoluteSize(Key)
				CellResult:update(function(p11: number): number
					return p11 + 1
				end)
			end
		end)), SplitResult)
		
		if HasAlignH then
			Compose.watch(function(Callback)
				-- upvalues: CellResult (copy), ReadFunction (upval), p10 (copy), self (copy), PlainResult (copy), TypesVector2 (upval), TypesUDim2 (upval)
				Callback(CellResult)
				local ReadResult = ReadFunction(p10.alignH, Callback)
				assert(ReadResult == nil or (ReadResult == "start" or (ReadResult == "center" or ReadResult == "end")), "Facet ZStack alignH and alignV must be start, center or end")
				local v11: number = if ReadResult == "center" then 0.5 elseif ReadResult == "end" then 1 else 0
				local ReadResult1 = ReadFunction(p10.alignV, Callback)
				assert(ReadResult1 == nil or (ReadResult1 == "start" or (ReadResult1 == "center" or ReadResult1 == "end")), "Facet ZStack alignH and alignV must be start, center or end")
				local v12: number = if ReadResult1 == "center" then 0.5 elseif ReadResult1 == "end" then 1 else 0
				local ReadResult2 = ReadFunction(p10.width, Callback)
				local NoReadResult: boolean = ReadResult2 == nil or ReadResult2 == "hug"
				local ReadResult3 = ReadFunction(p10.height, Callback)
				local NoReadResult1: boolean = ReadResult3 == nil or ReadResult3 == "hug"
				local List = {}
				local Vectors = {}
				local Largest = 0
				local Largest1 = 0
				
				for i, value in self do
					if i.Parent == PlainResult then
						local CallbackResult = Callback(value)
						table.insert(List, i)
						Vectors[i] = CallbackResult
						Largest = math.max(Largest, CallbackResult.X)
						Largest1 = math.max(Largest1, CallbackResult.Y)
					end
				end
				for _, value1 in List do
					local Vector = Vectors[value1]
					value1.AnchorPoint = TypesVector2.new(if NoReadResult then 0 else v11, if NoReadResult1 then 0 else v12)
					value1.Position = TypesUDim2.new(if NoReadResult then 0 else v11, if NoReadResult then math.floor(v11 * (Largest - Vector.X) + 0.5) else 0, if NoReadResult1 then 0 else v12, if NoReadResult1 then math.floor(v12 * (Largest1 - Vector.Y) + 0.5) else 0)
				end
			end)
		end
		if Ground ~= nil and MarginsResult then
			ArtGroundModule.mount(p1, PlainResult, Ground, MarginsResult)
		end
		return PlainResult
	end)
	
	local function plateReach(p11)
		-- upvalues: ThemeSupportModule (upval), ReadFunction (copy), p1 (copy)
		return ThemeSupportModule.plateReach(ReadFunction(p1.config.theme, p11))
	end
	
	P1.ScrollView = p1.construct("ScrollView", function(ScrollFrame)
		-- upvalues: split (copy), OfResult (copy), TypesUDim2 (copy), TypesEnum (copy), ThemeSupportModule (upval), ReadFunction (copy), p1 (copy), Compose (copy), plateReach (copy), Host (copy), ScrollLockModule (upval), ScrollInitialModule (upval), Runtime (copy), TypesVector2 (copy)
		local SplitResult, SplitResult2, SplitResult3 = split(ScrollFrame, {
			"axis", "gap", "padding", "align", "distribute", "width", "height"
		})
		local Axis = ScrollFrame.axis or "y"
		assert(Axis == "x" or (Axis == "y" or Axis == "xy"), "Facet ScrollView axis must be x, y or xy")
		local Flag = false
		local Guis = {}
		
		for _, Gui in SplitResult2 do
			if typeof(Gui) == "Instance" and Gui:IsA("GuiObject") and Gui.Size.Y.Scale > 0 then
				Flag = true
				table.insert(Guis, Gui)
			end
		end
		local Fill, Fill2 = OfResult.extent(ScrollFrame, "fill", if Axis == "x" and not Flag then "hug" else "fill")
		local config = {
			Active = true,
			BorderSizePixel = 0,
			Size = Fill,
			AutomaticSize = Fill2,
			CanvasSize = TypesUDim2.new(),
			AutomaticCanvasSize = if Axis == "x" then TypesEnum.AutomaticSize.X elseif Axis == "y" then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY,
			ScrollingDirection = if Axis == "x" then TypesEnum.ScrollingDirection.X elseif Axis == "y" then TypesEnum.ScrollingDirection.Y else TypesEnum.ScrollingDirection.XY,
			VerticalScrollBarInset = if Axis == "x" then TypesEnum.ScrollBarInset.ScrollBar else TypesEnum.ScrollBarInset.Always
		}
		
		if Axis ~= "y" then
			config.HorizontalScrollBarInset = TypesEnum.ScrollBarInset.ScrollBar
		end
		local config1 = {
			gap = ScrollFrame.gap,
			align = ScrollFrame.align,
			distribute = ScrollFrame.distribute
		}
		local InsetsResult = nil
		
		if ScrollFrame.padding ~= nil or ThemeSupportModule.plateReach(ReadFunction(p1.config.theme, nil)) > 0 then
			local FormulaResult = Compose.formula(plateReach)
			InsetsResult = OfResult.insets(ScrollFrame.padding or 0, (Compose.formula(function(Callback)
				-- upvalues: FormulaResult (copy)
				local CallbackResult = Callback(FormulaResult)
				
				return {
					top = CallbackResult,
					right = CallbackResult,
					bottom = CallbackResult,
					left = CallbackResult
				}
			end)))
		end
		local ListResult = OfResult.list(config1, Axis ~= "x")
		local PlainResult = OfResult.plain(Host.ScrollingFrame(OfResult.assemble(config, SplitResult, { ListResult, InsetsResult }, SplitResult2)), SplitResult)
		ScrollLockModule.own(PlainResult, p1)
		ScrollInitialModule(p1, PlainResult, ScrollFrame.CanvasPosition)
		
		if SplitResult.Selectable == nil then
			local SchedulerResult = Runtime.scheduler()
			local Flag1 = false
			
			local function holds(Gui): boolean
				-- upvalues: holds (copy)
				for _, Gui1 in Gui:GetChildren() do
					if Gui1:IsA("GuiObject") then
						if Gui1.Visible and (Gui1.Selectable or holds(Gui1)) then
							return true
						end
					elseif holds(Gui1) then
						return true
					end
				end
				return false
			end
			
			local function refresh()
				-- upvalues: Flag1 (ref), PlainResult (copy), holds (copy)
				Flag1 = false
				PlainResult.Selectable = not holds(PlainResult)
			end
			
			local function queue()
				-- upvalues: Flag1 (ref), SchedulerResult (copy), refresh (copy)
				if not Flag1 then
					Flag1 = true
					SchedulerResult.after(0, refresh)
				end
			end
			
			Runtime.connect(PlainResult, "DescendantAdded", queue)
			Runtime.connect(PlainResult, "DescendantRemoving", queue)
			Compose.cleanup(assert(Runtime.host.observation).observeProperty(PlainResult, "AbsoluteCanvasSize", queue))
			Flag1 = false
			PlainResult.Selectable = not holds(PlainResult)
		end
		if Axis == "x" and SplitResult.CanvasSize == nil and SplitResult.AutomaticCanvasSize == nil then
			local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(ListResult)
			local LayoutUnitResult = p1.layoutUnit(PlainResult)
			local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(PlainResult)
			local Observe = p1.observe
			local PaddingLeftResult = if InsetsResult then Observe.PaddingLeft(InsetsResult) else nil
			local PaddingRightResult = if InsetsResult then Observe.PaddingRight(InsetsResult) else nil
			local AutomaticSizeResult = p1.observe.AutomaticSize(PlainResult)
			local ScrollBarThicknessResult = p1.observeStyled.ScrollBarThickness(PlainResult)
			
			if SplitResult3 ~= nil or PlainResult:FindFirstChildWhichIsA("UISizeConstraint") == nil then
				local function MinSize1(Callback)
					-- upvalues: AutomaticSizeResult (copy), TypesEnum (upval), LayoutUnitResult (copy), AbsoluteContentSizeResult (copy), AbsoluteWindowSizeResult (copy), ScrollBarThicknessResult (copy), ReadFunction (upval), ScrollFrame (copy), TypesVector2 (upval)
					local IsCallbackResultMatch: boolean = Callback(AutomaticSizeResult) == TypesEnum.AutomaticSize.Y or Callback(AutomaticSizeResult) == TypesEnum.AutomaticSize.XY
					local CallbackResult = Callback(LayoutUnitResult)
					local CallbackResult1 = Callback(AbsoluteContentSizeResult)
					local CallbackResult2 = Callback(AbsoluteWindowSizeResult)
					
					return TypesVector2.new(0, (math.min(if IsCallbackResultMatch and CallbackResult2.X < CallbackResult1.X and CallbackResult2.X > 0 then math.ceil(CallbackResult1.Y / CallbackResult) + Callback(ScrollBarThicknessResult) else 0, ReadFunction(ScrollFrame.maxHeight, Callback) or 1e999)))
				end
				
				if SplitResult3 then
					Runtime.decorate(SplitResult3, { MinSize = MinSize1 })
				else
					Runtime.mount(function()
						-- upvalues: Host (upval), MinSize1 (copy)
						return Host.UISizeConstraint("ScrollBarRoom")({ MinSize = MinSize1 })
					end, PlainResult)
				end
			end
			Runtime.decorate(PlainResult, {
				CanvasSize = function(Callback)
					-- upvalues: LayoutUnitResult (copy), AbsoluteContentSizeResult (copy), AbsoluteWindowSizeResult (copy), PaddingLeftResult (copy), PaddingRightResult (copy), TypesUDim2 (upval)
					local CallbackResult = Callback(LayoutUnitResult)
					local XRatio = Callback(AbsoluteContentSizeResult).X / CallbackResult
					local XRatio1 = Callback(AbsoluteWindowSizeResult).X / CallbackResult
					
					for _, value in { PaddingLeftResult, PaddingRightResult } do
						if value then
							local CallbackResult1 = Callback(value)
							XRatio += CallbackResult1.Offset + CallbackResult1.Scale * XRatio1
						end
					end
					return TypesUDim2.fromOffset(math.ceil(XRatio), 0)
				end
			})
		end
		if Axis ~= "x" and #Guis > 0 then
			local LayoutSizeResult = p1.layoutSize(PlainResult)
			local CellResult = Compose.cell(0)
			local CellResult1 = Compose.cell(0)
			
			if InsetsResult then
				local PaddingTopResult = p1.observe.PaddingTop(InsetsResult)
				local PaddingBottomResult = p1.observe.PaddingBottom(InsetsResult)
				Compose.watch(function(Callback)
					-- upvalues: CellResult (copy), PaddingTopResult (copy), CellResult1 (copy), PaddingBottomResult (copy)
					CellResult:set(Callback(PaddingTopResult).Offset)
					CellResult1:set(Callback(PaddingBottomResult).Offset)
				end)
			end
			local Frames = Runtime.host.frames
			
			for _, gui in Guis do
				local Size = gui.Size
				local AutomaticSize = gui.AutomaticSize
				local UIListLayout = gui:FindFirstChildWhichIsA("UIListLayout")
				
				if gui:IsA("Frame") and UIListLayout and UIListLayout.FillDirection == TypesEnum.FillDirection.Vertical then
					AutomaticSize = if AutomaticSize == TypesEnum.AutomaticSize.X or AutomaticSize == TypesEnum.AutomaticSize.XY then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y
					gui.AutomaticSize = AutomaticSize
					local UIFlexItem = gui:FindFirstChildWhichIsA("UIFlexItem")
					
					if UIFlexItem then
						if UIFlexItem.FlexMode == TypesEnum.UIFlexMode.Fill then
							UIFlexItem.FlexMode = TypesEnum.UIFlexMode.Grow
						elseif UIFlexItem.FlexMode == TypesEnum.UIFlexMode.Custom then
							UIFlexItem.ShrinkRatio = 0
						end
					end
				end
				local NewTypesUDim = TypesUDim2.new(Size.X.Scale, Size.X.Offset, 0, Size.Y.Offset)
				local NewResult = NewTypesUDim
				local Flag1 = false
				gui.Size = NewTypesUDim
				local FormulaResult1 = Compose.formula(function(Callback): number
					-- upvalues: LayoutSizeResult (copy), CellResult (copy), CellResult1 (copy), Size (copy)
					return (math.max(0, Size.Y.Scale * (Callback(LayoutSizeResult).Y - Callback(CellResult) - Callback(CellResult1)) + Size.Y.Offset))
				end)
				local UISizeConstraint = gui:FindFirstChildWhichIsA("UISizeConstraint")
				
				if UISizeConstraint then
					local MinSize = UISizeConstraint.MinSize
					Runtime.decorate(UISizeConstraint, {
						MinSize = function(Callback)
							-- upvalues: TypesVector2 (upval), MinSize (copy), FormulaResult1 (copy)
							return TypesVector2.new(MinSize.X, (math.max(MinSize.Y, Callback(FormulaResult1))))
						end
					})
				else
					Runtime.mount(function()
						-- upvalues: Host (upval), TypesVector2 (upval), FormulaResult1 (copy)
						return Host.UISizeConstraint({
							MinSize = function(Callback)
								-- upvalues: TypesVector2 (upval), FormulaResult1 (upval)
								return TypesVector2.new(0, Callback(FormulaResult1))
							end
						})
					end, gui)
				end
				local SizeResult = p1.observe.Size(gui)
				Compose.watch(function(Callback)
					-- upvalues: SizeResult (copy), NewResult (ref), Flag1 (ref)
					if Callback(SizeResult) ~= NewResult then
						Flag1 = true
					end
				end)
				
				if Frames and (AutomaticSize == TypesEnum.AutomaticSize.Y or AutomaticSize == TypesEnum.AutomaticSize.XY) then
					local v11 = 0
					local OnFrameResult = nil
					Compose.watch(function(Callback)
						-- upvalues: FormulaResult1 (copy), v11 (ref), OnFrameResult (ref), Flag1 (ref), PlainResult (copy), gui (copy), TypesEnum (upval), NewResult (ref), TypesUDim2 (upval), Size (copy), Frames (copy), NewTypesUDim (copy), AutomaticSize (ref)
						local CallbackResult = Callback(FormulaResult1)
						
						if CallbackResult < v11 and OnFrameResult == nil and not Flag1 then
							local CanvasPosition = PlainResult.CanvasPosition
							local Count = 0
							gui.AutomaticSize = TypesEnum.AutomaticSize.None
							NewResult = TypesUDim2.new(Size.X.Scale, Size.X.Offset, 0, CallbackResult)
							gui.Size = NewResult
							OnFrameResult = Frames.onFrame(function()
								-- upvalues: Count (ref), Flag1 (upval), NewResult (upval), NewTypesUDim (upval), gui (upval), AutomaticSize (upval), OnFrameResult (upval), PlainResult (upval), CanvasPosition (copy)
								Count += 1
								
								if Count ~= 1 then
									if OnFrameResult then
										OnFrameResult()
										OnFrameResult = nil
									end
									PlainResult.CanvasPosition = CanvasPosition
									
									return
								elseif not Flag1 then
									NewResult = NewTypesUDim
									gui.AutomaticSize = AutomaticSize
									gui.Size = NewTypesUDim
								end
							end)
						end
						v11 = CallbackResult
					end)
					Compose.cleanup(function()
						-- upvalues: OnFrameResult (ref)
						if OnFrameResult then
							OnFrameResult()
						end
					end)
				end
			end
		end
		return PlainResult
	end)
	P1.Grid = p1.construct("Grid", function(p11)
		-- upvalues: split (copy), OfResult (copy), Compose (copy), ReadFunction (copy), TypesEnum (copy), TypesUDim2 (copy), p1 (copy), Host (copy), Runtime (copy)
		local SplitResult, SplitResult2 = split(p11, {
			"columns", "flow", "gap", "rowGap", "cellHeight", "aspectRatio", "align",
			"padding", "width", "height"
		})
		local Fill, Fill2 = OfResult.extent(p11, "fill", "hug")
		local Flow = p11.flow or "row"
		assert(Flow == "row" or Flow == "column", "Facet Grid flow must be row or column")
		local CellResult = if Flow == "column" then Compose.cell(0) else nil
		local CellResult1 = if p11.aspectRatio == nil then nil else Compose.cell(0)
		
		local function _(p12): number
			-- upvalues: ReadFunction (upval), p11 (copy)
			local ReadResult: number = ReadFunction(p11.columns, p12)
			assert(type(ReadResult) == "number" and ReadResult >= 1 and ReadResult % 1 == 0, "Facet Grid columns must be a whole number, 1 or more")
			
			return ReadResult
		end
		
		local config = {
			SortOrder = TypesEnum.SortOrder.LayoutOrder,
			FillDirection = if Flow == "column" then TypesEnum.FillDirection.Vertical else TypesEnum.FillDirection.Horizontal,
			FillDirectionMaxCells = function(Callback): number
				-- upvalues: ReadFunction (upval), p11 (copy), CellResult (copy)
				local ReadResult: number = ReadFunction(p11.columns, Callback)
				assert(type(ReadResult) == "number" and ReadResult >= 1 and ReadResult % 1 == 0, "Facet Grid columns must be a whole number, 1 or more")
				
				return if CellResult then math.max(1, (math.ceil(Callback(CellResult) / ReadResult))) else ReadResult
			end,
			CellPadding = function(p12)
				-- upvalues: OfResult (upval), p11 (copy), TypesUDim2 (upval)
				local SpacingResult = OfResult.spacing(p11.gap, p12)
				
				return TypesUDim2.fromOffset(SpacingResult, if p11.rowGap == nil then SpacingResult else OfResult.spacing(p11.rowGap, p12))
			end,
			CellSize = function(Callback)
				-- upvalues: ReadFunction (upval), p11 (copy), OfResult (upval), CellResult1 (copy), TypesUDim2 (upval), p1 (upval)
				local ReadResult: number = ReadFunction(p11.columns, Callback)
				assert(type(ReadResult) == "number" and ReadResult >= 1 and ReadResult % 1 == 0, "Facet Grid columns must be a whole number, 1 or more")
				local Floored = if CellResult1 then math.floor(Callback(CellResult1) / assert(ReadFunction(p11.aspectRatio, Callback))) else ReadFunction(p11.cellHeight, Callback)
				
				return TypesUDim2.new(1 / ReadResult, -math.ceil(OfResult.spacing(p11.gap, Callback) * (ReadResult - 1) / ReadResult), 0, if Floored == nil then p1.controlSize(p1.config.controlSize, "height", Callback) else Floored)
			end
		}
		
		if p11.align ~= nil then
			function config.HorizontalAlignment(p12)
				-- upvalues: ReadFunction (upval), p11 (copy), TypesEnum (upval)
				local ReadResult = ReadFunction(p11.align, p12)
				assert(ReadResult == "start" or (ReadResult == "center" or ReadResult == "end"), "Facet Grid align must be start, center or end")
				
				return if ReadResult == "center" then TypesEnum.HorizontalAlignment.Center elseif ReadResult == "end" then TypesEnum.HorizontalAlignment.Right else TypesEnum.HorizontalAlignment.Left
			end
		end
		local PlainResult = OfResult.plain(Host.Frame(OfResult.assemble({ BorderSizePixel = 0, Size = Fill, AutomaticSize = Fill2 }, SplitResult, { Host.UIGridLayout(config), OfResult.insets(p11.padding) }, SplitResult2)), SplitResult)
		
		if CellResult1 then
			local v12 = assert(PlainResult:FindFirstChildWhichIsA("UIGridLayout"))
			local AbsoluteCellSizeResult = p1.observe.AbsoluteCellSize(v12)
			Compose.watch(function(Callback)
				-- upvalues: AbsoluteCellSizeResult (copy), v12 (copy), CellResult1 (copy)
				local CallbackResult = Callback(AbsoluteCellSizeResult)
				local Offset: number = v12.CellSize.Y.Offset
				CellResult1:set(CallbackResult.X / (if CallbackResult.Y > 0 and Offset > 0 then CallbackResult.Y / Offset else 1))
			end)
		end
		if CellResult then
			local function count()
				-- upvalues: PlainResult (copy), CellResult (copy)
				local Count = 0
				
				for _, Gui in PlainResult:GetChildren() do
					if Gui:IsA("GuiObject") then
						Count += 1
					end
				end
				CellResult:set(Count)
			end
			
			Runtime.connect(PlainResult, "ChildAdded", count)
			Runtime.connect(PlainResult, "ChildRemoved", count)
			count()
		end
		local FacetGridSelectionNeedsAnOwner = assert(Compose.currentOwner(), "Facet Grid selection needs an owner")
		local Flag = false
		
		local function selectable(Object)
			if Object.Selectable then
				return Object
			end
			for _, Gui in Object:GetDescendants() do
				if Gui:IsA("GuiObject") and Gui.Selectable then
					return Gui
				end
			end
			return nil
		end
		
		local _ = function(Object)
			-- upvalues: Flag (ref), PlainResult (copy), Compose (upval), FacetGridSelectionNeedsAnOwner (copy), Runtime (upval), ReadFunction (upval), p11 (copy), Flow (copy), selectable (copy)
			if not Flag and Object ~= nil and Object:IsDescendantOf(PlainResult) then
				Flag = true
				Compose.withOwner(FacetGridSelectionNeedsAnOwner, function()
					-- upvalues: Compose (upval), Runtime (upval), PlainResult (upval), ReadFunction (upval), p11 (upval), Flow (upval), selectable (upval)
					local self = setmetatable({}, { __mode = "kv" })
					local CellResult = Compose.cell(0)
					
					local function bump()
						-- upvalues: CellResult (copy)
						CellResult:set(CellResult:peek() + 1)
					end
					
					Runtime.connect(PlainResult, "ChildAdded", bump)
					Runtime.connect(PlainResult, "ChildRemoved", bump)
					Compose.watch(function(Callback: (any) -> ())
						-- upvalues: CellResult (copy), PlainResult (upval), ReadFunction (upval), p11 (upval), Flow (upval), selectable (upval), self (copy), Runtime (upval)
						Callback(CellResult)
						local List = {}
						local t = {}
						local LayoutOrders = {}
						
						for i, Gui in PlainResult:GetChildren() do
							if Gui:IsA("GuiObject") and Gui.Visible then
								table.insert(List, Gui)
								t[Gui] = i
								LayoutOrders[Gui] = Gui.LayoutOrder
							end
						end
						table.sort(List, function(A, B): boolean
							-- upvalues: LayoutOrders (copy), t (copy)
							return if LayoutOrders[A] == LayoutOrders[B] then t[A] < t[B] else LayoutOrders[A] < LayoutOrders[B]
						end)
						local CountList = #List
						local Largest = ReadFunction(p11.columns, Callback)
						assert(type(Largest) == "number" and Largest >= 1 and Largest % 1 == 0, "Facet Grid columns must be a whole number, 1 or more")
						
						if Flow == "column" then
							Largest = math.max(1, (math.ceil(CountList / Largest)))
						end
						local Ceiled = math.ceil(CountList / Largest)
						local CountListDelta = CountList - (Ceiled - 1) * Largest
						local v13 = if Ceiled >= 2 and CountListDelta < Largest then selectable(List[CountList]) else nil
						for i1, value in List do
							local IsCeiledAbove: boolean = v13 ~= nil and ((Ceiled - 2) * Largest + CountListDelta < i1 and i1 <= (Ceiled - 1) * Largest)
							local SelfEntry = if IsCeiledAbove then selectable(value) else self[value]
							local NoSelfEntry = SelfEntry == nil
							local NextSelectionRight = nil
							
							if not NoSelfEntry then
								NextSelectionRight = if Flow == "column" then SelfEntry.NextSelectionRight else SelfEntry.NextSelectionDown
								NoSelfEntry = IsCeiledAbove and NextSelectionRight ~= nil and self[value] ~= SelfEntry
							end
							local IsNextSelectionRightMatch: boolean = NoSelfEntry
							local NextSelectionRight1 = nil
							
							if not IsNextSelectionRightMatch then
								NextSelectionRight1 = if IsCeiledAbove then v13 else nil
								self[value] = if IsCeiledAbove then SelfEntry else nil
								IsNextSelectionRightMatch = NextSelectionRight == NextSelectionRight1
							end
							if not IsNextSelectionRightMatch then
								Runtime.host.render.setProperty(SelfEntry, if Flow == "column" then "NextSelectionRight" else "NextSelectionDown", NextSelectionRight1)
							end
						end
					end, "Grid selection clamp")
				end)
				
				return
			end
		end
		
		Runtime.connect(PlainResult, "SelectionChanged", function(_, _, Object)
			-- upvalues: Flag (ref), PlainResult (copy), Compose (upval), FacetGridSelectionNeedsAnOwner (copy), Runtime (upval), ReadFunction (upval), p11 (copy), Flow (copy), selectable (copy)
			if not Flag and Object ~= nil then
				if not Object:IsDescendantOf(PlainResult) then return end
				Flag = true
				Compose.withOwner(FacetGridSelectionNeedsAnOwner, function()
					-- upvalues: Compose (upval), Runtime (upval), PlainResult (upval), ReadFunction (upval), p11 (upval), Flow (upval), selectable (upval)
					local self = setmetatable({}, { __mode = "kv" })
					local CellResult = Compose.cell(0)
					
					local function bump()
						-- upvalues: CellResult (copy)
						CellResult:set(CellResult:peek() + 1)
					end
					
					Runtime.connect(PlainResult, "ChildAdded", bump)
					Runtime.connect(PlainResult, "ChildRemoved", bump)
					Compose.watch(function(Callback: (any) -> ())
						-- upvalues: CellResult (copy), PlainResult (upval), ReadFunction (upval), p11 (upval), Flow (upval), selectable (upval), self (copy), Runtime (upval)
						Callback(CellResult)
						local List = {}
						local t = {}
						local LayoutOrders = {}
						
						for i, Gui in PlainResult:GetChildren() do
							if Gui:IsA("GuiObject") and Gui.Visible then
								table.insert(List, Gui)
								t[Gui] = i
								LayoutOrders[Gui] = Gui.LayoutOrder
							end
						end
						table.sort(List, function(A, B): boolean
							-- upvalues: LayoutOrders (copy), t (copy)
							return if LayoutOrders[A] == LayoutOrders[B] then t[A] < t[B] else LayoutOrders[A] < LayoutOrders[B]
						end)
						local CountList = #List
						local Largest = ReadFunction(p11.columns, Callback)
						assert(type(Largest) == "number" and Largest >= 1 and Largest % 1 == 0, "Facet Grid columns must be a whole number, 1 or more")
						
						if Flow == "column" then
							Largest = math.max(1, (math.ceil(CountList / Largest)))
						end
						local Ceiled = math.ceil(CountList / Largest)
						local CountListDelta = CountList - (Ceiled - 1) * Largest
						local v13 = if Ceiled >= 2 and CountListDelta < Largest then selectable(List[CountList]) else nil
						for i1, value in List do
							local IsCeiledAbove: boolean = v13 ~= nil and ((Ceiled - 2) * Largest + CountListDelta < i1 and i1 <= (Ceiled - 1) * Largest)
							local SelfEntry = if IsCeiledAbove then selectable(value) else self[value]
							local NoSelfEntry = SelfEntry == nil
							local NextSelectionRight = nil
							
							if not NoSelfEntry then
								NextSelectionRight = if Flow == "column" then SelfEntry.NextSelectionRight else SelfEntry.NextSelectionDown
								NoSelfEntry = IsCeiledAbove and NextSelectionRight ~= nil and self[value] ~= SelfEntry
							end
							local IsNextSelectionRightMatch: boolean = NoSelfEntry
							local NextSelectionRight1 = nil
							
							if not IsNextSelectionRightMatch then
								NextSelectionRight1 = if IsCeiledAbove then v13 else nil
								self[value] = if IsCeiledAbove then SelfEntry else nil
								IsNextSelectionRightMatch = NextSelectionRight == NextSelectionRight1
							end
							if not IsNextSelectionRightMatch then
								Runtime.host.render.setProperty(SelfEntry, if Flow == "column" then "NextSelectionRight" else "NextSelectionDown", NextSelectionRight1)
							end
						end
					end, "Grid selection clamp")
				end)
			end
		end)
		local GetResult = if p1.config.guiService then p1.selection.get() else nil
		
		if not Flag and (GetResult ~= nil and GetResult:IsDescendantOf(PlainResult)) then
			Flag = true
			Compose.withOwner(FacetGridSelectionNeedsAnOwner, function()
				-- upvalues: Compose (upval), Runtime (upval), PlainResult (copy), ReadFunction (upval), p11 (copy), Flow (copy), selectable (copy)
				local self = setmetatable({}, { __mode = "kv" })
				local CellResult = Compose.cell(0)
				
				local function bump()
					-- upvalues: CellResult (copy)
					CellResult:set(CellResult:peek() + 1)
				end
				
				Runtime.connect(PlainResult, "ChildAdded", bump)
				Runtime.connect(PlainResult, "ChildRemoved", bump)
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: CellResult (copy), PlainResult (upval), ReadFunction (upval), p11 (upval), Flow (upval), selectable (upval), self (copy), Runtime (upval)
					Callback(CellResult)
					local List = {}
					local t = {}
					local LayoutOrders = {}
					
					for i, Gui in PlainResult:GetChildren() do
						if Gui:IsA("GuiObject") and Gui.Visible then
							table.insert(List, Gui)
							t[Gui] = i
							LayoutOrders[Gui] = Gui.LayoutOrder
						end
					end
					table.sort(List, function(A, B): boolean
						-- upvalues: LayoutOrders (copy), t (copy)
						return if LayoutOrders[A] == LayoutOrders[B] then t[A] < t[B] else LayoutOrders[A] < LayoutOrders[B]
					end)
					local CountList = #List
					local Largest = ReadFunction(p11.columns, Callback)
					assert(type(Largest) == "number" and Largest >= 1 and Largest % 1 == 0, "Facet Grid columns must be a whole number, 1 or more")
					
					if Flow == "column" then
						Largest = math.max(1, (math.ceil(CountList / Largest)))
					end
					local Ceiled = math.ceil(CountList / Largest)
					local CountListDelta = CountList - (Ceiled - 1) * Largest
					local v13 = if Ceiled >= 2 and CountListDelta < Largest then selectable(List[CountList]) else nil
					for i1, value in List do
						local IsCeiledAbove: boolean = v13 ~= nil and ((Ceiled - 2) * Largest + CountListDelta < i1 and i1 <= (Ceiled - 1) * Largest)
						local SelfEntry = if IsCeiledAbove then selectable(value) else self[value]
						local NoSelfEntry = SelfEntry == nil
						local NextSelectionRight = nil
						
						if not NoSelfEntry then
							NextSelectionRight = if Flow == "column" then SelfEntry.NextSelectionRight else SelfEntry.NextSelectionDown
							NoSelfEntry = IsCeiledAbove and NextSelectionRight ~= nil and self[value] ~= SelfEntry
						end
						local IsNextSelectionRightMatch: boolean = NoSelfEntry
						local NextSelectionRight1 = nil
						
						if not IsNextSelectionRightMatch then
							NextSelectionRight1 = if IsCeiledAbove then v13 else nil
							self[value] = if IsCeiledAbove then SelfEntry else nil
							IsNextSelectionRightMatch = NextSelectionRight == NextSelectionRight1
						end
						if not IsNextSelectionRightMatch then
							Runtime.host.render.setProperty(SelfEntry, if Flow == "column" then "NextSelectionRight" else "NextSelectionDown", NextSelectionRight1)
						end
					end
				end, "Grid selection clamp")
			end)
		end
		return PlainResult
	end)
	
	local _ = function(ScrollingFrame, p12): boolean
		-- upvalues: TypesEnum (copy)
		if ScrollingFrame == nil or not ScrollingFrame:IsA("ScrollingFrame") then
			return false
		else
			local ScrollingDirection = ScrollingFrame.ScrollingDirection
			
			return ScrollingDirection == TypesEnum.ScrollingDirection.XY or ScrollingDirection == (if p12 then TypesEnum.ScrollingDirection.X else TypesEnum.ScrollingDirection.Y)
		end
	end
	
	local function tracked(Key, AbsoluteSizeResults, ParentResults, CellResult, CellResults)
		-- upvalues: p1 (copy), Compose (copy), Runtime (copy)
		AbsoluteSizeResults[Key] = p1.observe.AbsoluteSize(Key)
		ParentResults[Key] = p1.observe.Parent(Key)
		
		if CellResults then
			local CellResult1 = Compose.cell(Key:GetAttribute("FacetOverflow") == true)
			Runtime.connect(Key, "AttributeChanged", function(p12)
				-- upvalues: CellResult1 (copy), Key (copy)
				if p12 == "FacetOverflow" then
					CellResult1:set(Key:GetAttribute("FacetOverflow") == true)
				end
			end)
			CellResults[Key] = CellResult1
		end
		CellResult:update(function(p12: number): number
			return p12 + 1
		end)
	end
	
	P1.AdaptiveStack = p1.construct("AdaptiveStack", function(p12)
		-- upvalues: split (copy), ReadFunction (copy), Compose (copy), OfResult (copy), Host (copy), p1 (copy), TypesEnum (copy), t (upval)
		local SplitResult, SplitResult2 = split(p12, {
			"axis", "gap", "padding", "align", "distribute", "width", "height"
		})
		local config = {
			gap = p12.gap,
			padding = p12.padding,
			align = p12.align,
			distribute = p12.distribute,
			width = p12.width,
			height = p12.height
		}
		local AxisFunction = p12.axis
		
		if AxisFunction == nil then
			local CellResult = Compose.cell(false)
			local self = setmetatable({}, { __mode = "k" })
			local self1 = setmetatable({}, { __mode = "k" })
			local self2 = setmetatable({}, { __mode = "k" })
			local CellResult1 = Compose.cell(0)
			local Fill, Fill2 = OfResult.extent(config, "fill", "hug")
			local ListResult = OfResult.list(config, CellResult)
			local config1 = { BorderSizePixel = 0, Size = Fill, AutomaticSize = Fill2 }
			local CellResult2 = if p12.padding == nil then nil else Compose.cell({ top = 0, right = 0, bottom = 0, left = 0 })
			local PlainResult = OfResult.plain(Host.Frame(OfResult.assemble(config1, SplitResult, { ListResult, OfResult.insets(p12.padding, CellResult2) }, SplitResult2, function(Key)
				-- upvalues: self2 (copy), p1 (upval), self (copy), self1 (copy), CellResult1 (copy)
				self2[Key] = p1.observe.Visible(Key)
				self[Key] = p1.observe.AbsoluteSize(Key)
				self1[Key] = p1.observe.Parent(Key)
				CellResult1:update(function(p13: number): number
					return p13 + 1
				end)
			end)), SplitResult)
			
			if CellResult2 then
				OfResult.shadowRoom(PlainResult, CellResult2)
			end
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(PlainResult)
			local ParentResult = p1.observe.Parent(PlainResult)
			local v13 = 0
			local Count = 0
			local Key = nil
			local Config = nil
			Compose.watch(function(Callback)
				-- upvalues: CellResult1 (copy), AbsoluteSizeResult (copy), ParentResult (copy), TypesEnum (upval), CellResult (copy), ReadFunction (upval), p12 (copy), t (upval), PlainResult (copy), self (copy), self1 (copy), self2 (copy), OfResult (upval), v13 (ref), Key (ref), Config (ref), Count (ref)
				Callback(CellResult1)
				local X: number = Callback(AbsoluteSizeResult).X
				local CallbackResult = Callback(ParentResult)
				local IsXYMatch = nil
				
				if CallbackResult == nil or not CallbackResult:IsA("ScrollingFrame") then
					IsXYMatch = false
				else
					local ScrollingDirection = CallbackResult.ScrollingDirection
					IsXYMatch = ScrollingDirection == TypesEnum.ScrollingDirection.XY or ScrollingDirection == TypesEnum.ScrollingDirection.X
				end
				if IsXYMatch then
					CellResult:set(false)
					
					return
				end
				if ReadFunction(p12.width, Callback) == "hug" and not t[PlainResult.Name] then
					t[PlainResult.Name] = true
					warn(`Facet AdaptiveStack '{PlainResult.Name}' has width = "hug", so it is always as wide as its row and never turns into a column. Give it a bounded width, or set axis`)
				end
				local UIPadding = PlainResult:FindFirstChildWhichIsA("UIPadding")
				local XDelta = if UIPadding then X - UIPadding.PaddingLeft.Offset - UIPadding.PaddingRight.Offset else X
				local Count1 = 0
				local NewX = 0
				
				for i, value in self do
					if Callback(self1[i]) == PlainResult and Callback(self2[i]) then
						Count1 += 1
						
						if i.Size.X.Scale == 0 and i:FindFirstChildWhichIsA("UIFlexItem") == nil then
							NewX += Callback(value).X
						end
					end
				end
				local NewNewX = NewX + OfResult.spacing(p12.gap, Callback) * math.max(Count1 - 1, 0)
				local IsStretch = ReadFunction(p12.align, Callback) == "stretch"
				local Text: string = if IsStretch then `{Count1}` else `{NewX}/{Count1}`
				
				if CellResult:peek() then
					if IsStretch then
						if Count1 ~= Count then
							v13 = 0
						end
					else
						v13 = NewNewX
					end
					local Largest = if Config and Config.key == Text then math.max(v13, Config.need) else v13
					
					if X > 0 and Largest + 8 <= XDelta then
						Key = Text
						CellResult:set(false)
					end
				else
					v13 = NewNewX
					
					if X > 0 and XDelta < NewNewX then
						if Key ~= nil then
							Config = { key = Key, need = NewNewX }
						end
						Key = nil
						CellResult:set(true)
					end
				end
				Count = Count1
			end)
			
			return PlainResult
		else
			local function column(p13): boolean
				-- upvalues: ReadFunction (upval), AxisFunction (copy)
				local ReadResult = ReadFunction(AxisFunction, p13)
				assert(ReadResult == "x" or ReadResult == "y", "Facet AdaptiveStack axis must be x or y")
				
				return ReadResult == "y"
			end
			local IsY = nil
			
			if Compose.isValue(AxisFunction) or type(AxisFunction) == "function" then
				IsY = column
			else
				local ReadResult = ReadFunction(AxisFunction, nil)
				assert(ReadResult == "x" or ReadResult == "y", "Facet AdaptiveStack axis must be x or y")
				IsY = ReadResult == "y"
			end
			return OfResult.stack(SplitResult2, SplitResult, config, IsY)
		end
	end)
	P1.ViewThatFits = p1.construct("ViewThatFits", function(p13)
		-- upvalues: split (copy), Compose (copy), OfResult (copy), Host (copy), tracked (copy), p1 (copy), ReadFunction (copy), TypesEnum (copy)
		local SplitResult, SplitResult2 = split(p13, { "width", "height" })
		assert(#SplitResult2 > 0, "Facet ViewThatFits needs at least one candidate")
		local self = setmetatable({}, { __mode = "k" })
		local self1 = setmetatable({}, { __mode = "k" })
		local self2 = setmetatable({}, { __mode = "k" })
		local CellResult = Compose.cell(0)
		local Fill, Fill2 = OfResult.extent({ width = p13.width, height = p13.height }, "fill", "hug")
		local PlainResult = OfResult.plain(Host.Frame(OfResult.assemble({ BorderSizePixel = 0, Size = Fill, AutomaticSize = Fill2 }, SplitResult, { OfResult.list({}, true) }, SplitResult2, function(Key)
			-- upvalues: tracked (upval), self (copy), self1 (copy), CellResult (copy), self2 (copy)
			tracked(Key, self, self1, CellResult, self2)
		end)), SplitResult)
		
		if #SplitResult2 == 1 then
			return PlainResult
		else
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(PlainResult)
			local ParentResult = p1.observe.Parent(PlainResult)
			Compose.watch(function(Callback)
				-- upvalues: CellResult (copy), AbsoluteSizeResult (copy), ParentResult (copy), ReadFunction (upval), p13 (copy), TypesEnum (upval), self (copy), self1 (copy), PlainResult (copy), self2 (copy)
				Callback(CellResult)
				local CallbackResult = Callback(AbsoluteSizeResult)
				local CallbackResult1 = Callback(ParentResult)
				local IsXYMatch = true
				
				if ReadFunction(p13.width, Callback) ~= "hug" then
					IsXYMatch = true
					
					if CallbackResult.X > 0 then
						if CallbackResult1 == nil or not CallbackResult1:IsA("ScrollingFrame") then
							IsXYMatch = false
						else
							local ScrollingDirection = CallbackResult1.ScrollingDirection
							IsXYMatch = ScrollingDirection == TypesEnum.ScrollingDirection.XY or ScrollingDirection == TypesEnum.ScrollingDirection.X
						end
					end
				end
				local ReadResult = ReadFunction(p13.height, Callback)
				local Flag = true
				
				if ReadResult ~= nil then
					Flag = true
					
					if ReadResult ~= "hug" then
						Flag = true
						
						if CallbackResult.Y > 0 then
							if CallbackResult1 == nil or not CallbackResult1:IsA("ScrollingFrame") then
								Flag = false
							else
								local ScrollingDirection = CallbackResult1.ScrollingDirection
								Flag = ScrollingDirection == TypesEnum.ScrollingDirection.XY or ScrollingDirection == TypesEnum.ScrollingDirection.Y
							end
						end
					end
				end
				local List = {}
				
				for i in self do
					if Callback(self1[i]) == PlainResult then
						table.insert(List, i)
					end
				end
				table.sort(List, function(A, B): boolean
					return A.LayoutOrder < B.LayoutOrder
				end)
				local Entry = List[#List]
				
				for _, value in List do
					local CallbackResult2 = Callback(self[value])
					local Inverted: boolean = CallbackResult2.X <= CallbackResult.X and not Callback(self2[value])
					
					if (IsXYMatch or Inverted) and (Flag or CallbackResult2.Y <= CallbackResult.Y) then
						Entry = value
						break
					end
				end
				for _, value1 in List do
					value1.Visible = value1 == Entry
				end
			end)
			
			return PlainResult
		end
	end)
	P1.ErrorBoundary = p1.construct("ErrorBoundary", function(p14)
		-- upvalues: containerProps (copy), OfResult (copy), Compose (copy), p1 (copy), Host (copy)
		assert(type(p14.view) == "function", "Facet ErrorBoundary requires a view function")
		assert(type(p14.fallback) == "function", "Facet ErrorBoundary requires a fallback function")
		local ContainerPropsResult = containerProps(p14, {
			"view",
			"fallback",
			"onError",
			"width",
			"height"
		})
		local Hug, Hug2 = OfResult.extent({ width = p14.width, height = p14.height }, "hug", "hug")
		local CellResult = Compose.cell(nil)
		local PlainResult = OfResult.plain(Host.Frame(OfResult.assemble({ BorderSizePixel = 0, Size = Hug, AutomaticSize = Hug2 }, ContainerPropsResult, {}, {
			(Compose.boundary(function()
				-- upvalues: CellResult (copy), p14 (copy)
				CellResult:set(nil)
				
				return (p14.view())
			end, function(p15, p16)
				-- upvalues: CellResult (copy), p14 (copy), p1 (upval)
				CellResult:set((tostring(p15)))
				local OnError: (any) -> () = p14.onError or p1.config.onError
				
				if OnError then
					OnError(p15)
				end
				return (p14.fallback(p15, p16))
			end))
		})), ContainerPropsResult)
		Compose.watch(function(Callback)
			-- upvalues: PlainResult (copy), CellResult (copy)
			PlainResult:SetAttribute("FacetError", Callback(CellResult))
		end)
		
		return PlainResult
	end)
	
	local function stackAxis(Divider, Axis)
		-- upvalues: Compose (copy), TypesEnum (copy), Runtime (copy)
		if Axis == nil then
			local Y = Compose.cell("y")
			local List = {}
			
			local function release()
				-- upvalues: List (copy)
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
			end
			
			local function attach()
				-- upvalues: List (copy), Divider (copy), attach (copy), Y (copy), TypesEnum (upval)
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				local Parent = Divider.Parent
				
				if Parent == nil then return end
				local UIListLayout = Parent:FindFirstChildWhichIsA("UIListLayout")
				
				if UIListLayout == nil then
					table.insert(List, Parent.ChildAdded:Connect(attach))
					Y:set("y")
					
					return
				else
					table.insert(List, UIListLayout:GetPropertyChangedSignal("FillDirection"):Connect(function()
						-- upvalues: Y (upval), UIListLayout (copy), TypesEnum (upval)
						Y:set(if UIListLayout.FillDirection == TypesEnum.FillDirection.Horizontal then "x" else "y")
					end))
					Y:set(if UIListLayout.FillDirection == TypesEnum.FillDirection.Horizontal then "x" else "y")
				end
			end
			
			Runtime.connect(Divider, "AncestryChanged", attach)
			Compose.cleanup(release)
			attach()
			
			return function(Callback): string
				-- upvalues: Y (copy)
				return if Callback(Y) == "x" then "x" else "y"
			end
		else
			assert(Axis == "x" or Axis == "y", "Facet axis must be x or y")
			
			return function()
				-- upvalues: Axis (copy)
				return Axis
			end
		end
	end
	
	P1.Divider = p1.construct("Divider", function(p14)
		-- upvalues: p1 (copy), OfResult (copy), Host (copy), stackAxis (copy), Runtime (copy), TypesUDim2 (copy), Compose (copy), ReadFunction (copy)
		local Thickness: number = p14.thickness
		assert(Thickness == nil or (type(Thickness) == "string" or type(Thickness) == "number" and Thickness > 0), "Facet Divider thickness must be a positive number or a theme metric name")
		
		local function weight(p15)
			-- upvalues: Thickness (copy), p1 (upval), OfResult (upval)
			if type(Thickness) == "number" then
				return Thickness
			else
				local Thickness1 = if type(Thickness) == "string" then Thickness else "strokes.hairline"
				
				return if string.find(Thickness1, ".", 1, true) then p1.metric(Thickness1, p15) else OfResult.spacing(Thickness1, p15)
			end
		end
		
		local Divider = p1.styled(Host.Frame(p1.props(p14, { "axis", "thickness", "appearance" }, { Name = "Divider", BorderSizePixel = 0 })), "divider")
		local StackAxisResult = stackAxis(Divider, p14.axis)
		
		if p14.Size == nil then
			Runtime.decorate(Divider, {
				Size = function(p15)
					-- upvalues: weight (copy), StackAxisResult (copy), TypesUDim2 (upval)
					local WeightResult = weight(p15)
					
					return if StackAxisResult(p15) == "x" then TypesUDim2.new(0, WeightResult, 1, 0) else TypesUDim2.new(1, 0, 0, WeightResult)
				end
			})
		end
		Compose.watch(function(p15)
			-- upvalues: ReadFunction (upval), p14 (copy), Divider (copy)
			local ReadResult = ReadFunction(p14.appearance, p15) or "standard"
			assert(ReadResult == "standard" or ReadResult == "strong", "Facet Divider appearance must be standard or strong")
			
			if ReadResult == "strong" then
				Divider:AddTag("facet-divider-strong")
				
				return
			end
			if Divider:HasTag("facet-divider-strong") then
				Divider:RemoveTag("facet-divider-strong")
			end
		end)
		
		return Divider
	end)
	P1.Spacer = p1.construct("Spacer", function(p14)
		-- upvalues: Host (copy), TypesEnum (copy), OfResult (copy), p1 (copy), stackAxis (copy), Runtime (copy), TypesUDim2 (copy)
		local PlainResult = OfResult.plain(Host.Frame(p1.props(p14, { "minLength" }, {
			Name = "Spacer",
			BorderSizePixel = 0,
			Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		})), p14)
		local StackAxisResult = stackAxis(PlainResult, nil)
		
		if p14.Size == nil then
			Runtime.decorate(PlainResult, {
				Size = function(p15)
					-- upvalues: OfResult (upval), p14 (copy), StackAxisResult (copy), TypesUDim2 (upval)
					local SpacingResult = OfResult.spacing(p14.minLength, p15)
					
					return if StackAxisResult(p15) == "x" then TypesUDim2.fromOffset(SpacingResult, 0) else TypesUDim2.fromOffset(0, SpacingResult)
				end
			})
		end
		return PlainResult
	end)
	
	function P1.fill(GrowRatio: number)
		-- upvalues: Host (copy), TypesEnum (copy)
		if GrowRatio == nil then
			return Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		else
			assert(type(GrowRatio) == "number" and GrowRatio > 0, "Facet fill weight must be a positive number")
			
			return Host.UIFlexItem({
				FlexMode = TypesEnum.UIFlexMode.Custom,
				GrowRatio = GrowRatio,
				ShrinkRatio = GrowRatio
			})
		end
	end
	
	return P1
end