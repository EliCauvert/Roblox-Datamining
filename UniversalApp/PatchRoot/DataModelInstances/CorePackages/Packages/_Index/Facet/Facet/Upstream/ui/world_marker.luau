local _ = require("./types")
local _ = require("./control_types")
local _ = require("../vendor/compose/core")
local _ = require("./hud_props")
local _ = require("./environment_types")
local LayoutKitModule = require("./layout_kit")
local config = { clamp = true, hide = true }

return function(p1, p2)
	-- upvalues: LayoutKitModule (copy), config (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local Types = p1.types
	local Runtime = p1.runtime
	local TypesUDim2 = Types.UDim2
	local TypesVector2 = Types.Vector2
	local OfResult = LayoutKitModule.of(p1)
	p2.WorldMarker = p1.construct("WorldMarker", function(p3)
		-- upvalues: Compose (copy), TypesVector2 (copy), ReadFunction (copy), p1 (copy), Host (copy), TypesUDim2 (copy), Types (copy), Runtime (copy), config (upval), OfResult (copy)
		assert(p3.anchor ~= nil, "Facet WorldMarker requires an anchor from UI.worldAnchor")
		local CellResult = Compose.cell(TypesVector2.zero)
		local CellResult1 = Compose.cell(TypesVector2.zero)
		
		local function _(p4): number
			-- upvalues: ReadFunction (upval), p3 (copy), p1 (upval)
			return if ReadFunction(p3.arrow, p4) == false then 0 else p1.controlSize(nil, "iconSize", p4) + 8
		end
		
		local CellResult2 = Compose.cell(false)
		local CellResult3 = Compose.cell(false)
		local CellResult4 = Compose.cell(0)
		local FrameResult = Host.Frame(p1.props(p3, { "anchor", "edge", "margin", "arrow" }, {
			BackgroundTransparency = 1,
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Size = function(Callback)
				-- upvalues: CellResult1 (copy), ReadFunction (upval), p3 (copy), p1 (upval), TypesUDim2 (upval)
				local CallbackResult = Callback(CellResult1)
				local NewIconSize: number = if ReadFunction(p3.arrow, Callback) == false then 0 else p1.controlSize(nil, "iconSize", Callback) + 8
				
				return TypesUDim2.fromOffset(CallbackResult.X + NewIconSize * 2, CallbackResult.Y + NewIconSize * 2)
			end,
			Position = function(Callback)
				-- upvalues: CellResult (copy), TypesUDim2 (upval)
				local CallbackResult = Callback(CellResult)
				
				return TypesUDim2.fromOffset(CallbackResult.X, CallbackResult.Y)
			end,
			Visible = function(Callback)
				-- upvalues: CellResult2 (copy)
				return Callback(CellResult2)
			end
		}))
		Host.UIPadding({
			PaddingTop = function(p4)
				-- upvalues: Types (upval), ReadFunction (upval), p3 (copy), p1 (upval)
				return Types.UDim.new(0, if ReadFunction(p3.arrow, p4) == false then 0 else p1.controlSize(nil, "iconSize", p4) + 8)
			end,
			PaddingBottom = function(p4)
				-- upvalues: Types (upval), ReadFunction (upval), p3 (copy), p1 (upval)
				return Types.UDim.new(0, if ReadFunction(p3.arrow, p4) == false then 0 else p1.controlSize(nil, "iconSize", p4) + 8)
			end,
			PaddingLeft = function(p4)
				-- upvalues: Types (upval), ReadFunction (upval), p3 (copy), p1 (upval)
				return Types.UDim.new(0, if ReadFunction(p3.arrow, p4) == false then 0 else p1.controlSize(nil, "iconSize", p4) + 8)
			end,
			PaddingRight = function(p4)
				-- upvalues: Types (upval), ReadFunction (upval), p3 (copy), p1 (upval)
				return Types.UDim.new(0, if ReadFunction(p3.arrow, p4) == false then 0 else p1.controlSize(nil, "iconSize", p4) + 8)
			end
		}).Parent = FrameResult
		local Parent = Host.Folder("Pointer")({})
		Parent.Parent = FrameResult
		local Badge = p1.styled(Host.Frame("Arrow")({
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Size = function(p4)
				-- upvalues: ReadFunction (upval), p3 (copy), p1 (upval), TypesUDim2 (upval)
				local NewIconSize: number = if ReadFunction(p3.arrow, p4) == false then 0 else p1.controlSize(nil, "iconSize", p4) + 8
				
				return TypesUDim2.fromOffset(NewIconSize, NewIconSize)
			end,
			Visible = function(Callback): boolean
				-- upvalues: CellResult3 (copy), ReadFunction (upval), p3 (copy)
				return Callback(CellResult3) and ReadFunction(p3.arrow, Callback) ~= false
			end,
			Rotation = function(Callback): number
				-- upvalues: CellResult4 (copy)
				return (math.deg((Callback(CellResult4))))
			end,
			Host.UICorner({ CornerRadius = Types.UDim.new(0.5, 0) }),
			p1.icon("chevron.trailing", {
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				Size = TypesUDim2.fromScale(0.7, 0.7)
			})
		}), "badge")
		Badge.Parent = Parent
		Compose.watch(function(Callback)
			-- upvalues: FrameResult (copy), CellResult3 (copy)
			FrameResult:SetAttribute("Clamped", Callback(CellResult3))
		end)
		local Tbl = {}
		local MarkerUnit = p1.layoutUnit(FrameResult, "MarkerUnit")
		
		local function measure()
			-- upvalues: FrameResult (copy), MarkerUnit (copy), TypesVector2 (upval), CellResult1 (copy)
			local Largest = 0
			local Largest1 = 0
			
			for _, Gui in FrameResult:GetChildren() do
				if Gui:IsA("GuiObject") and Gui.Visible then
					if Gui.Size.X.Scale == 0 then
						Largest = math.max(Largest, Gui.AbsoluteSize.X)
					end
					if Gui.Size.Y.Scale == 0 then
						Largest1 = math.max(Largest1, Gui.AbsoluteSize.Y)
					end
				end
			end
			local PeekResult: number = MarkerUnit:peek()
			local PeekResult1 = if PeekResult > 0 then PeekResult else 1
			local NewTypesVector = TypesVector2.new(Largest / PeekResult1, Largest1 / PeekResult1)
			
			if CellResult1:peek() ~= NewTypesVector then
				CellResult1:set(NewTypesVector)
			end
		end
		
		local AfterLayoutResult = p1.afterLayout(measure)
		
		local function track(Gui)
			-- upvalues: Tbl (copy), AfterLayoutResult (copy), measure (copy)
			if Gui:IsA("GuiObject") and Tbl[Gui] == nil then
				Tbl[Gui] = {
					Gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(AfterLayoutResult),
					Gui:GetPropertyChangedSignal("Visible"):Connect(measure)
				}
			end
			measure()
		end
		
		for _, child in FrameResult:GetChildren() do
			track(child)
		end
		Runtime.connect(FrameResult, "ChildAdded", track)
		Runtime.connect(FrameResult, "ChildRemoved", function(Key)
			-- upvalues: Tbl (copy), measure (copy)
			local Entry = Tbl[Key]
			
			if Entry then
				for _, Connection in Entry do
					Connection:Disconnect()
				end
				Tbl[Key] = nil
			end
			measure()
		end)
		local CellResult5 = Compose.cell(0)
		local Tbl1 = {}
		
		local _ = function()
			-- upvalues: Tbl1 (copy)
			for _, Connection in Tbl1 do
				Connection:Disconnect()
			end
			table.clear(Tbl1)
		end
		
		local AfterLayoutResult1 = p1.afterLayout(function()
			-- upvalues: CellResult5 (copy)
			CellResult5:set(CellResult5:peek() + 1)
		end)
		
		local function hold()
			-- upvalues: Tbl1 (copy), FrameResult (copy), AfterLayoutResult1 (copy), CellResult5 (copy)
			for _, Connection in Tbl1 do
				Connection:Disconnect()
			end
			table.clear(Tbl1)
			local Parent = FrameResult.Parent
			
			if Parent and Parent:IsA("GuiObject") then
				table.insert(Tbl1, Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(AfterLayoutResult1))
				table.insert(Tbl1, Parent:GetPropertyChangedSignal("AbsolutePosition"):Connect(AfterLayoutResult1))
			end
			CellResult5:set(CellResult5:peek() + 1)
		end
		
		Runtime.connect(FrameResult, "AncestryChanged", hold)
		hold()
		Compose.cleanup(function()
			-- upvalues: Tbl1 (copy), Tbl (copy)
			for _, Connection in Tbl1 do
				Connection:Disconnect()
			end
			table.clear(Tbl1)
			
			for _, value in Tbl do
				for _, Connection1 in value do
					Connection1:Disconnect()
				end
			end
			table.clear(Tbl)
		end)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(FrameResult)
		Compose.watch(function(Callback)
			-- upvalues: p1 (upval), p3 (copy), config (upval), CellResult5 (copy), MarkerUnit (copy), AbsoluteSizeResult (copy), ReadFunction (upval), OfResult (upval), FrameResult (copy), CellResult2 (copy), TypesVector2 (upval), CellResult (copy), CellResult3 (copy), CellResult4 (copy), Badge (copy), TypesUDim2 (upval)
			local Source = p1.readSource(p3.anchor, Callback)
			local Edge = p3.edge
			local Clamp = if Edge == nil then "clamp" elseif type(Edge) == "string" then Edge else p1.readSource(Edge, Callback)
			assert(config[Clamp] == true, "Facet WorldMarker edge must be clamp or hide")
			Callback(CellResult5)
			local CallbackResult: number = Callback(MarkerUnit)
			local CallbackResult1 = if CallbackResult > 0 then CallbackResult else 1
			local CallbackResultRatio = Callback(AbsoluteSizeResult) / CallbackResult1
			local ReadResult = ReadFunction(p3.margin, Callback)
			
			local function _(p4)
				-- upvalues: ReadResult (copy), OfResult (upval), Callback (copy)
				if type(ReadResult) == "table" then
					local ReadResultEntry = ReadResult[p4]
					
					return OfResult.spacing(if ReadResultEntry == nil then "m" else ReadResultEntry, Callback)
				else
					return OfResult.spacing(if ReadResult == nil then "m" else ReadResult, Callback)
				end
			end
			
			local Parent = FrameResult.Parent
			
			if not Source.visible or Source.x == nil or Source.y == nil or not Parent or not Parent:IsA("GuiObject") then
				CellResult2:set(false)
				
				return
			end
			local X = Source.x
			local Y = Source.y
			local GuiService = p1.config.guiService
			
			if GuiService and FrameResult:FindFirstAncestorWhichIsA("ScreenGui") then
				local Success, Result = pcall(GuiService.GetGuiInset, GuiService)
				
				if Success and typeof(Result) == "Vector2" then
					X -= Result.X
					Y -= Result.Y
				end
			end
			local AbsolutePosition = Parent.AbsolutePosition
			local AbsoluteSizeRatio = Parent.AbsoluteSize / CallbackResult1
			local XRatio = (X - AbsolutePosition.X) / CallbackResult1
			local YRatio = (Y - AbsolutePosition.Y) / CallbackResult1
			local CallbackResultRatioRatio = CallbackResultRatio / 2
			local SpacingResult = nil
			
			if type(ReadResult) == "table" then
				local Left = ReadResult.left
				SpacingResult = OfResult.spacing(if Left == nil then "m" else Left, Callback)
			else
				SpacingResult = OfResult.spacing(if ReadResult == nil then "m" else ReadResult, Callback)
			end
			local NewSpacingResult = SpacingResult + CallbackResultRatioRatio.X
			local SpacingResult1 = nil
			
			if type(ReadResult) == "table" then
				local Top = ReadResult.top
				SpacingResult1 = OfResult.spacing(if Top == nil then "m" else Top, Callback)
			else
				SpacingResult1 = OfResult.spacing(if ReadResult == nil then "m" else ReadResult, Callback)
			end
			local NewSpacingResult1 = SpacingResult1 + CallbackResultRatioRatio.Y
			local X1 = AbsoluteSizeRatio.X
			local SpacingResult2 = nil
			
			if type(ReadResult) == "table" then
				local Right = ReadResult.right
				SpacingResult2 = OfResult.spacing(if Right == nil then "m" else Right, Callback)
			else
				SpacingResult2 = OfResult.spacing(if ReadResult == nil then "m" else ReadResult, Callback)
			end
			local XDelta = X1 - SpacingResult2 - CallbackResultRatioRatio.X
			local Y1 = AbsoluteSizeRatio.Y
			local SpacingResult3 = nil
			
			if type(ReadResult) == "table" then
				local Bottom = ReadResult.bottom
				SpacingResult3 = OfResult.spacing(if Bottom == nil then "m" else Bottom, Callback)
			else
				SpacingResult3 = OfResult.spacing(if ReadResult == nil then "m" else ReadResult, Callback)
			end
			local YDelta = Y1 - SpacingResult3 - CallbackResultRatioRatio.Y
			
			local function place(NewResult)
				-- upvalues: TypesVector2 (upval), CellResult (upval), CellResult2 (upval)
				local NewTypesVector = TypesVector2.new(math.round(NewResult.X), (math.round(NewResult.Y)))
				
				if (NewTypesVector - CellResult:peek()).Magnitude >= 1 or not CellResult2:peek() then
					CellResult:set(NewTypesVector)
				end
			end
			
			if Source.onscreen ~= false and (NewSpacingResult <= XRatio and (XRatio <= XDelta and NewSpacingResult1 <= YRatio) and YRatio <= YDelta) then
				place(TypesVector2.new(XRatio, YRatio))
				CellResult3:set(false)
				CellResult2:set(true)
				
				return
			end
			if Clamp == "hide" then
				CellResult2:set(false)
				
				return
			end
			local NewSpacingResultRatio = (NewSpacingResult + XDelta) / 2
			local NewSpacingResultRatio1 = (NewSpacingResult1 + YDelta) / 2
			local Value = XRatio - NewSpacingResultRatio
			local Value1 = YRatio - NewSpacingResultRatio1
			
			if math.abs(Value) < 0.001 and math.abs(Value1) < 0.001 then
				Value1 = 1
			end
			local Largest = math.max(0, (XDelta - NewSpacingResult) / 2)
			local Largest1 = math.max(0, (YDelta - NewSpacingResult1) / 2)
			local Smallest = math.min(if math.abs(Value) > 0.001 then Largest / math.abs(Value) else 1e999, if math.abs(Value1) > 0.001 then Largest1 / math.abs(Value1) else 1e999)
			local Angle = math.atan2(Value1, Value)
			
			if math.abs((Angle - CellResult4:peek() + 3.141592653589793) % 6.283185307179586 - 3.141592653589793) >= 0.025 or not CellResult3:peek() then
				CellResult4:set(Angle)
			end
			local PeekResult: number = CellResult4:peek()
			place(TypesVector2.new(NewSpacingResultRatio + Value * Smallest, NewSpacingResultRatio1 + Value1 * Smallest))
			local v1 = (if ReadFunction(p3.arrow, nil) == false then 0 else p1.controlSize(nil, "iconSize", nil) + 8) / 2
			local Cosine = math.cos(PeekResult)
			local Sine = math.sin(PeekResult)
			local Smallest1 = math.min(if math.abs(Cosine) > 0.001 then math.max(0, CallbackResultRatioRatio.X - v1) / math.abs(Cosine) else 1e999, if math.abs(Sine) > 0.001 then math.max(0, CallbackResultRatioRatio.Y - v1) / math.abs(Sine) else 1e999)
			Badge.Position = TypesUDim2.new(0.5, math.round(Cosine * Smallest1), 0.5, (math.round(Sine * Smallest1)))
			CellResult3:set(true)
			CellResult2:set(true)
		end)
		
		return FrameResult
	end)
end