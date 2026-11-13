local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./input_props")
local _ = require("./collection_reorder_state")

return function(p1, Frame, p2, p3, p4)
	local Ctx = p1.ctx
	local Spec = p1.spec
	local Gesture = p1.gesture
	local Compose = Ctx.Compose
	local Host = Ctx.Host
	local ReadSourceFunction = Ctx.readSource
	local TypesUDim2 = Ctx.types.UDim2
	local TypesVector2 = Ctx.types.Vector2
	local Moving = p1.moving
	local Incoming = p1.incoming
	local ChoosingDestination = p1.choosingDestination
	local Drag = p1.drag
	local Source = p1.source
	local Controls = p1.controls
	local RowNodes = p1.rowNodes
	local Grid = p1.grid
	local Horizontal = p1.horizontal
	local ScaleOfFunction = p1.scaleOf
	local AxisFunction = p1.axis
	local CrossAxisFunction = p1.crossAxis
	
	local function dragImage(Callback)
		-- upvalues: Moving (copy), RowNodes (copy), Controls (copy), ScaleOfFunction (copy), Frame (copy), TypesVector2 (copy), CrossAxisFunction (copy), Grid (copy), Horizontal (copy), TypesUDim2 (copy), Spec (copy), ReadSourceFunction (copy), Source (copy), Ctx (copy), Host (copy), p1 (copy), p4 (copy), AxisFunction (copy), p3 (copy)
		local v1 = assert(Moving:peek())
		local RowNode = RowNodes[v1.key]
		local v2 = assert(Controls.indexOfKey)(v1.key)
		local v3 = if v2 then assert(Controls.placementOf)(v2) else nil
		local Size = if v3 then v3.size else 0
		local AbsoluteSizeRatio = if RowNode then RowNode.AbsoluteSize / ScaleOfFunction(Frame) else TypesVector2.zero
		local CrossAxisResult = if CrossAxisFunction(AbsoluteSizeRatio) > 0 then CrossAxisFunction(AbsoluteSizeRatio) elseif v3 then v3.crossSize else 0
		local Keys = { v1.key }
		
		for _, key in v1.keys do
			if key ~= v1.key then
				table.insert(Keys, key)
			end
		end
		local Smallest = math.min(3, #v1.keys)
		local ScaledSmallest = (Smallest - 1) * 6
		
		local function sized(p5)
			-- upvalues: Grid (upval), Horizontal (upval), TypesUDim2 (upval), Size (copy), CrossAxisResult (copy)
			return if Grid then if Horizontal then TypesUDim2.fromOffset(Size, CrossAxisResult) else TypesUDim2.fromOffset(CrossAxisResult, Size) elseif Horizontal then TypesUDim2.new(0, Size, 1, -p5) else TypesUDim2.new(1, -p5, 0, Size)
		end
		
		local config = {
			Name = "DragLabel",
			ZIndex = 1002,
			BackgroundTransparency = 0,
			AnchorPoint = TypesVector2.new(1, 0),
			Position = TypesUDim2.fromScale(1, 0),
			Visible = #v1.keys > 1,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = Ctx.types.Enum.AutomaticSize.XY,
			Text = if Spec.dragLabel then function(Callback)
				-- upvalues: Moving (upval), Controls (upval), Spec (upval), ReadSourceFunction (upval), Source (upval)
				local CallbackResult = Callback(Moving)
				
				if CallbackResult == nil then
					return ""
				elseif #CallbackResult.keys > 1 then
					return tostring(#CallbackResult.keys) .. " selected"
				else
					local v4 = assert(Controls.indexOfKey)(CallbackResult.key)
					
					return if Spec.dragLabel and v4 then Spec.dragLabel(ReadSourceFunction(Source, Callback)[v4]) else tostring(CallbackResult.key)
				end
			end elseif #v1.keys > 1 then tostring(#v1.keys) .. " selected" else tostring(v1.key)
		}
		local Badge = Ctx.styled(if #v1.keys > 1 then Ctx.text(config) else Host.TextLabel(config), "badge")
		local DragImage = Host.Frame({
			Name = "DragImage",
			ZIndex = 1001,
			BackgroundTransparency = 1,
			Interactable = false,
			Size = if Grid then if Horizontal then TypesUDim2.fromOffset(Size + ScaledSmallest, CrossAxisResult + ScaledSmallest) else TypesUDim2.fromOffset(CrossAxisResult + ScaledSmallest, Size + ScaledSmallest) elseif Horizontal then TypesUDim2.new(0, Size + ScaledSmallest, 1, 0) else TypesUDim2.new(1, 0, 0, Size + ScaledSmallest),
			Position = function(Callback1)
				-- upvalues: p1 (upval), Horizontal (upval), p4 (upval), AxisFunction (upval), Frame (upval), ScaleOfFunction (upval), Size (copy), ScaledSmallest (copy), Callback (copy), Grid (upval), CrossAxisFunction (upval), CrossAxisResult (copy), v3 (copy), v1 (copy), Moving (upval), TypesUDim2 (upval), Controls (upval), ReadSourceFunction (upval), Source (upval), p3 (upval)
				local CallbackResult = Callback1(p1.pointerPosition)
				local Offset = if Horizontal then Callback1(p4).X.Offset else Callback1(p4).Y.Offset
				local AxisResultRatio = AxisFunction(Frame.AbsoluteWindowSize) / ScaleOfFunction(Frame)
				local ClampedValue = if CallbackResult then math.clamp(p1.alongBody(Frame, CallbackResult) + Offset - Size / 2, Offset, (math.max(Offset, Offset + AxisResultRatio - Size - ScaledSmallest))) else Callback(Callback1)
				local ClampedValue1 = 0
				
				if Grid then
					local CrossAxisResultDelta = if CallbackResult then CrossAxisFunction(CallbackResult - Frame.AbsolutePosition) / ScaleOfFunction(Frame) - CrossAxisResult / 2 elseif v3 then v3.crossOffset else 0
					
					if v1.keyboard then
						local CallbackResult1 = Callback1(Moving)
						
						if CallbackResult1 == nil then
							return TypesUDim2.fromOffset(0, 0)
						end
						local RemainingEntry = CallbackResult1.remaining[Callback1(CallbackResult1.slot) + 1]
						local v4 = assert(Controls.placementOf)((if RemainingEntry then assert(Controls.indexOfKey)(RemainingEntry) else #ReadSourceFunction(Source, Callback1)) or 1)
						CrossAxisResultDelta = v4.crossOffset + (if RemainingEntry then 0 else v4.crossSize) - CrossAxisFunction(Callback1(p3))
					end
					ClampedValue1 = math.clamp(CrossAxisResultDelta, 0, (math.max(0, CrossAxisFunction(Frame.AbsoluteWindowSize) / ScaleOfFunction(Frame) - CrossAxisResult - ScaledSmallest)))
				end
				return if Horizontal then TypesUDim2.fromOffset(ClampedValue, ClampedValue1) else TypesUDim2.fromOffset(ClampedValue1, ClampedValue)
			end,
			Badge
		})
		local Largest = 1001
		
		for i = Smallest, 1, -1 do
			local RowNode1 = RowNodes[Keys[i]] or RowNode
			local Parent = if RowNode1 then RowNode1.Parent else nil
			local Preview = if i == 1 and v1.preview then v1.preview elseif Parent and Parent:IsA("Frame") and Parent:HasTag("facet-tablerow") then Parent else RowNode1
			local Reorderable = if Preview then Preview:Clone() else nil
			
			if Reorderable then
				local Cells = Reorderable:FindFirstChild("Cells", true)
				
				if Cells and Cells:IsA("GuiObject") then
					Cells.Visible = true
				end
				local Reorderable1 = if Reorderable.Name == "Reorderable" then Reorderable else Reorderable:FindFirstChild("Reorderable", true)
				
				if Reorderable1 then
					Reorderable1:SetAttribute("FacetDragging", nil)
					
					for _, ChildName in { "Move", "SelectMark", "Minus", "Confirm" } do
						local Child = Reorderable1:FindFirstChild(ChildName)
						
						if Child and Child:IsA("GuiObject") then
							Child.Visible = false
						end
					end
				end
				for _, descendant in Reorderable:GetDescendants() do
					if descendant:GetAttribute("FacetDragExclude") == true then
						descendant:Destroy()
					end
				end
				local Descendants = Reorderable:GetDescendants()
				table.insert(Descendants, Reorderable)
				local Largest1: number = Largest
				
				for _, descendant1 in Descendants do
					local FacetDragRestXAttribute = descendant1:GetAttribute("FacetDragRestX")
					
					if type(FacetDragRestXAttribute) == "number" and descendant1:IsA("GuiObject") then
						descendant1.Position = TypesUDim2.new(descendant1.Position.X.Scale, FacetDragRestXAttribute, descendant1.Position.Y.Scale, descendant1.Position.Y.Offset)
					end
					if descendant1:IsA("GuiObject") then
						descendant1.Interactable = false
						descendant1.Active = false
						descendant1.Selectable = false
						descendant1.ZIndex += Largest1
						Largest = math.max(Largest, descendant1.ZIndex)
					elseif descendant1:IsA("Path2D") then
						descendant1.ZIndex += Largest1
						Largest = math.max(Largest, descendant1.ZIndex)
					elseif descendant1:IsA("UIDragDetector") then
						descendant1.Enabled = false
					elseif descendant1:IsA("InputContext") then
						descendant1.Enabled = false
					elseif descendant1:IsA("UIScale") and descendant1.Name == "PressLift" then
						descendant1.Scale = 1
					end
				end
				Reorderable.Name = "Reorderable"
				Reorderable.AnchorPoint = TypesVector2.zero
				Reorderable.Position = TypesUDim2.fromOffset((i - 1) * 6, (i - 1) * 6)
				Reorderable.Size = sized(ScaledSmallest)
				Reorderable.ZIndex = Largest1 + 1
				Reorderable.Parent = DragImage
			end
		end
		Badge.ZIndex = Largest + 1
		
		return DragImage, Largest + 2, (sized(ScaledSmallest))
	end
	
	return (Host.Frame({
		Name = "ReorderFeedback",
		ZIndex = 1000,
		Position = function(Callback)
			-- upvalues: p2 (copy), TypesUDim2 (copy), p3 (copy)
			return if p2 then TypesUDim2.fromOffset(Callback(p3).X, Callback(p3).Y) else TypesUDim2.fromOffset(0, 0)
		end,
		Size = TypesUDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Attributes = { FacetDragFeedback = true },
		Compose.show(function(Callback): boolean
			-- upvalues: Incoming (copy)
			return Callback(Incoming) ~= nil
		end, function()
			-- upvalues: Incoming (copy), ReadSourceFunction (copy), Source (copy), Controls (copy), Ctx (copy), Host (copy), Grid (copy), Horizontal (copy), TypesUDim2 (copy), p2 (copy), TypesVector2 (copy), p4 (copy), AxisFunction (copy), p3 (copy), CrossAxisFunction (copy)
			local function placement(Callback)
				-- upvalues: Incoming (upval), ReadSourceFunction (upval), Source (upval), Controls (upval)
				local CallbackResult = Callback(Incoming)
				local Source1 = ReadSourceFunction(Source, Callback)
				
				if #Source1 == 0 then
					return { offset = 0, size = 44, crossOffset = 0, crossSize = 44 }, true
				else
					local BeforeKey = CallbackResult and CallbackResult.beforeKey
					
					return assert(Controls.placementOf)((if BeforeKey == nil then #Source1 else assert(Controls.indexOfKey)(BeforeKey)) or #Source1), BeforeKey ~= nil
				end
			end
			
			return Ctx.styled(Host.Frame({
				Name = "InsertionLine",
				BorderSizePixel = 0,
				ZIndex = 1000,
				Size = function(p5)
					-- upvalues: placement (copy), Grid (upval), Horizontal (upval), TypesUDim2 (upval)
					local PlacementResult = placement(p5)
					
					return if Grid then if Horizontal then TypesUDim2.fromOffset(PlacementResult.size, 2) else TypesUDim2.fromOffset(2, PlacementResult.size) elseif Horizontal then TypesUDim2.new(0, 2, 1, 0) else TypesUDim2.new(1, 0, 0, 2)
				end,
				Position = function(Callback)
					-- upvalues: placement (copy), p2 (upval), TypesVector2 (upval), p4 (upval), Grid (upval), AxisFunction (upval), p3 (upval), CrossAxisFunction (upval), TypesUDim2 (upval), Horizontal (upval)
					local PlacementResult, PlacementResult2 = placement(Callback)
					local Zero = if p2 then TypesVector2.zero else TypesVector2.new(Callback(p4).X.Offset, Callback(p4).Y.Offset)
					local OffsetDelta = PlacementResult.offset + (if Grid or PlacementResult2 then 0 else PlacementResult.size) - AxisFunction(Callback(p3))
					local CrossOffsetDelta = if Grid then PlacementResult.crossOffset + (if PlacementResult2 then 0 else PlacementResult.crossSize) - CrossAxisFunction(Callback(p3)) else 0
					
					return TypesUDim2.fromOffset(Zero.X + (if Horizontal then OffsetDelta else CrossOffsetDelta), Zero.Y + (if Horizontal then CrossOffsetDelta else OffsetDelta))
				end
			}), "drop-line")
		end),
		Compose.show(p1.active, function()
			-- upvalues: Moving (copy), Controls (copy), ReadSourceFunction (copy), Source (copy), p2 (copy), Horizontal (copy), p4 (copy), AxisFunction (copy), p3 (copy), dragImage (copy), Drag (copy), Frame (copy), TypesUDim2 (copy), p1 (copy), ChoosingDestination (copy), Spec (copy), Ctx (copy), Host (copy), Grid (copy), CrossAxisFunction (copy), Gesture (copy)
			local function dropY(Callback)
				-- upvalues: Moving (upval), Controls (upval), ReadSourceFunction (upval), Source (upval), p2 (upval), Horizontal (upval), p4 (upval), AxisFunction (upval), p3 (upval)
				local CallbackResult = Callback(Moving)
				
				if CallbackResult == nil then
					return 0
				else
					local RemainingEntry = CallbackResult.remaining[Callback(CallbackResult.slot) + 1]
					local v4 = assert(Controls.placementOf)((if RemainingEntry then assert(Controls.indexOfKey)(RemainingEntry) else #ReadSourceFunction(Source, Callback)) or 1)
					
					return (if p2 then 0 elseif Horizontal then Callback(p4).X.Offset else Callback(p4).Y.Offset) + v4.offset + (if RemainingEntry then 0 else v4.size) - AxisFunction(Callback(p3))
				end
			end
			
			local DragImageResult, DragImageResult2, DragImageResult3 = dragImage(dropY)
			Drag.preview(DragImageResult, Frame, DragImageResult3)
			DragImageResult.Visible = false
			local config = {
				Name = "Drop",
				label = "Drop",
				Position = TypesUDim2.new(1, -100, 0, 0),
				Size = TypesUDim2.fromOffset(100, 40),
				ZIndex = DragImageResult2,
				Visible = function(Callback): boolean
					-- upvalues: p1 (upval), ChoosingDestination (upval), Spec (upval)
					return Callback(p1.keyboard) and (not Callback(ChoosingDestination) and (Spec.onReorder ~= nil or Spec.drop ~= nil))
				end,
				onActivate = p1.commit
			}
			local config1 = {
				Name = "DropFeedback",
				ZIndex = 1000,
				Size = TypesUDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Ctx.styled(Host.Frame("DropLine")({
					BorderSizePixel = 0,
					ZIndex = 1000,
					Visible = function(Callback): boolean
						-- upvalues: Drag (upval), Spec (upval), p1 (upval), ChoosingDestination (upval), Frame (upval)
						local CallbackResult = Callback(Drag.state)
						
						return if Spec.onReorder == nil then Spec.drop ~= nil and (CallbackResult ~= nil and (Callback(p1.keyboard) and not Callback(ChoosingDestination) or CallbackResult.target == Frame and Frame:GetAttribute("FacetDropState") == "accepted")) else CallbackResult ~= nil and (Callback(p1.keyboard) and not Callback(ChoosingDestination) or CallbackResult.target == Frame and Frame:GetAttribute("FacetDropState") == "accepted")
					end,
					Size = if Grid then function(Callback)
						-- upvalues: Moving (upval), Grid (upval), Controls (upval), ReadSourceFunction (upval), Source (upval), Horizontal (upval), TypesUDim2 (upval)
						local CallbackResult = Callback(Moving)
						
						if Grid and CallbackResult then
							local RemainingEntry = CallbackResult.remaining[Callback(CallbackResult.slot) + 1]
							local v4 = assert(Controls.placementOf)((if RemainingEntry then assert(Controls.indexOfKey)(RemainingEntry) else #ReadSourceFunction(Source, Callback)) or 1)
							
							return if Horizontal then TypesUDim2.fromOffset(v4.size, 2) else TypesUDim2.fromOffset(2, v4.size)
						else
							return if Horizontal then TypesUDim2.new(0, 2, 1, 0) else TypesUDim2.new(1, 0, 0, 2)
						end
					end elseif Horizontal then TypesUDim2.new(0, 2, 1, 0) else TypesUDim2.new(1, 0, 0, 2),
					Position = function(Callback)
						-- upvalues: Moving (upval), Grid (upval), Controls (upval), ReadSourceFunction (upval), Source (upval), AxisFunction (upval), p3 (upval), CrossAxisFunction (upval), Horizontal (upval), TypesUDim2 (upval), dropY (copy)
						local CallbackResult = Callback(Moving)
						
						if Grid and CallbackResult then
							local RemainingEntry = CallbackResult.remaining[Callback(CallbackResult.slot) + 1]
							local v4 = assert(Controls.placementOf)((if RemainingEntry then assert(Controls.indexOfKey)(RemainingEntry) else #ReadSourceFunction(Source, Callback)) or 1)
							local OffsetDelta = v4.offset - AxisFunction(Callback(p3))
							local CrossOffsetDelta = v4.crossOffset + (if RemainingEntry then 0 else v4.crossSize) - CrossAxisFunction(Callback(p3))
							
							return if Horizontal then TypesUDim2.fromOffset(OffsetDelta, CrossOffsetDelta) else TypesUDim2.fromOffset(CrossOffsetDelta, OffsetDelta)
						else
							return if Horizontal then TypesUDim2.fromOffset(dropY(Callback), 0) else TypesUDim2.fromOffset(0, (dropY(Callback)))
						end
					end
				}), "divider"),
				DragImageResult
			}
			
			if assert(Moving:peek()).keyboard then
				local ButtonResult = p1.UI.Button(config)
				Gesture.keyboardTarget = ButtonResult
				table.insert(config1, ButtonResult)
			end
			return Host.Frame(config1)
		end)
	}))
end