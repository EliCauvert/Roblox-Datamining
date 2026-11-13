local PointerDragModule = require("./pointer_drag")
local ActivationModule = require("./activation")
local ScrollLockModule = require("./scroll_lock")
local ReducedFunction = require("./motion").reduced
local SettleModule = require("./settle")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local _ = require("./input_types")
local _ = require("./navigation_types")
local _ = require("./collection_props")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("./navigation_props")

return function(p1, p2)
	-- upvalues: PointerDragModule (copy), ActivationModule (copy), ReducedFunction (copy), SettleModule (copy), ScrollLockModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local ReadFunction1 = p1.read
	local ReadFunction2 = p1.read
	local ReadFunction4 = p1.read
	local ReadFunction3 = p1.read
	local ReadSourceFunction = p1.readSource
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local list = {
		"content", "leading", "trailing", "actionWidth", "actionPlacement",
		"fullSwipe", "open", "onOpenChange", "coordinator", "enabled", "reducedMotion",
		"onActivate", "editing", "swipeEnabled"
	}
	p2.RowActions = p1.construct("RowActions", function(p3)
		-- upvalues: PointerDragModule (upval), p1 (copy), ActivationModule (upval), Compose (copy), TypesVector2 (copy), Runtime (copy), ReducedFunction (upval), ReadFunction (copy), ReadFunction1 (copy), ReadFunction2 (copy), ReadSourceFunction (copy), SettleModule (upval), TypesUDim2 (copy), Host (copy), TypesEnum (copy), ReadFunction4 (copy), p2 (copy), ScrollLockModule (upval), list (copy), ReadFunction3 (copy)
		assert(p3.actionPlacement == nil or (p3.actionPlacement == "trailing" or p3.actionPlacement == "bottom"), "RowActions.actionPlacement must be trailing or bottom")
		local PointerDragModuleResult = PointerDragModule(p1)
		local IsBottom = p3.actionPlacement == "bottom"
		local Leading = p3.leading or {}
		local Trailing = p3.trailing or {}
		local ContentResult = if type(p3.content) == "function" then p3.content() else p3.content
		assert(typeof(ContentResult) == "Instance" or type(ContentResult) == "table", "Facet.RowActions requires content")
		local EditsResult = ActivationModule.edits(ContentResult)
		local Open = p3.open or Compose.cell(nil)
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(nil)
		local CellResult2 = Compose.cell(TypesVector2.zero)
		local CellResult3 = Compose.cell(72)
		local CellResult4 = Compose.cell(TypesVector2.zero)
		local CellResult5 = Compose.cell({})
		local t = {}
		local TimelineResult = Runtime.timeline({
			autoplay = false,
			duration = p1.metric("motion.durations.rowDeparture")
		})
		local CellResult6 = Compose.cell(nil)
		local Flag = false
		local ReducedResult = ReducedFunction(p1)
		
		local function _(p4)
			-- upvalues: p3 (copy), ReducedResult (copy), ReadFunction (upval)
			return if p3.reducedMotion == nil then ReducedResult(p4) else ReadFunction(p3.reducedMotion, p4) == true
		end
		
		local function actions(Name, p4)
			-- upvalues: ReadFunction1 (upval), Leading (copy), Trailing (copy)
			return ReadFunction1(if Name == "leading" then Leading else Trailing, p4)
		end
		
		local function bandWidth(Leading1, p4): number
			-- upvalues: ReadFunction1 (upval), Leading (copy), Trailing (copy), ReadFunction2 (upval), p3 (copy), ReadSourceFunction (upval), CellResult5 (copy), CellResult2 (copy)
			local ReadResult = ReadFunction1(if Leading1 == "leading" then Leading else Trailing, p4)
			local HasIcon = #ReadResult > 0
			for _, value in ReadResult do
				HasIcon = HasIcon and value.icon ~= nil
			end
			local ReadResult1 = ReadFunction2(p3.actionWidth or (if HasIcon then 64 else 88), p4)
			local Source = ReadSourceFunction(CellResult5, p4)
			
			for _, value1 in ReadResult do
				ReadResult1 = math.max(ReadResult1, Source[Leading1 .. ":" .. value1.id] or 0)
			end
			return (math.min(ReadResult1 * #ReadResult, ReadSourceFunction(CellResult2, p4).X))
		end
		
		local _ = function(p5): boolean
			-- upvalues: p3 (copy)
			local FullSwipe = p3.fullSwipe
			
			return if type(FullSwipe) == "table" then (if p5 == "leading" then FullSwipe.leading else FullSwipe.trailing) ~= false else FullSwipe ~= false
		end
		
		local _ = function(p5)
			-- upvalues: p3 (copy), t (copy), Open (copy)
			if p3.coordinator and p5 then
				p3.coordinator:set(t)
			end
			if p3.onOpenChange then
				p3.onOpenChange(p5)
				
				return
			end
			if type(Open.set) == "function" then
				Open:set(p5)
			end
		end
		
		Compose.watch(function(p5)
			-- upvalues: ReadSourceFunction (upval), Open (copy), ReadFunction1 (upval), Leading (copy), Trailing (copy), p3 (copy)
			local Source = ReadSourceFunction(Open, p5)
			
			if Source ~= nil and #ReadFunction1(if Source == "leading" then Leading else Trailing, p5) == 0 then
				local _ = p3.coordinator
				
				if p3.onOpenChange then
					p3.onOpenChange(nil)
					
					return
				end
				if type(Open.set) == "function" then
					Open:set(nil)
				end
			end
		end)
		
		if p3.coordinator then
			Compose.watch(function(p5)
				-- upvalues: ReadSourceFunction (upval), Open (copy), p3 (copy), t (copy)
				if ReadSourceFunction(Open, p5) ~= nil and p3.coordinator:peek() ~= t then
					p3.coordinator:set(t)
				end
			end)
			Compose.watch(function(Callback)
				-- upvalues: p3 (copy), t (copy), CellResult (copy), ReadSourceFunction (upval), Open (copy)
				if Callback(p3.coordinator) ~= t then
					CellResult:set(false)
					
					if ReadSourceFunction(Open) ~= nil then
						local _ = p3.coordinator
						
						if p3.onOpenChange then
							p3.onOpenChange(nil)
							
							return
						end
						if type(Open.set) == "function" then
							Open:set(nil)
						end
					end
				end
			end)
			Compose.cleanup(function()
				-- upvalues: p3 (copy), t (copy)
				if p3.coordinator:peek() == t then
					p3.coordinator:set(nil)
				end
			end)
		end
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: CellResult6 (copy), p3 (copy), ReducedResult (copy), ReadFunction (upval), TimelineResult (copy), CellResult2 (copy), CellResult1 (copy), Open (copy), bandWidth (copy)
			local CallbackResult = Callback(CellResult6)
			
			if CallbackResult then
				local ReducedResultResult = if p3.reducedMotion == nil then ReducedResult(Callback) else ReadFunction(p3.reducedMotion, Callback) == true
				
				return CallbackResult.from + ((if CallbackResult.edge == "leading" then 1 else -1) * Callback(CellResult2).X - CallbackResult.from) * (if ReducedResultResult then 1 else math.min(1, Callback(TimelineResult.progress) / 0.7))
			end
			local CallbackResult1 = Callback(CellResult1)
			
			if CallbackResult1 == nil then
				local CallbackResult2 = Callback(Open)
				
				return if CallbackResult2 == nil then 0 else bandWidth(CallbackResult2, Callback) * (if CallbackResult2 == "leading" then 1 else -1)
			else
				return CallbackResult1
			end
		end)
		local PeekResult = FormulaResult:peek()
		local SettleModuleResult = SettleModule(p1, function()
			-- upvalues: PeekResult (ref)
			return PeekResult
		end, p1.motionSpring("snappy"), function()
			-- upvalues: p3 (copy), ReducedResult (copy), ReadFunction (upval)
			return if p3.reducedMotion == nil then ReducedResult(nil) else ReadFunction(p3.reducedMotion, nil) == true
		end)
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult (copy), CellResult1 (copy), CellResult6 (copy), PeekResult (ref), SettleModuleResult (copy)
			local CallbackResult = Callback(FormulaResult)
			
			if Callback(CellResult1) ~= nil or Callback(CellResult6) ~= nil then
				PeekResult = CallbackResult
				
				return
			end
			if SettleModuleResult.value:peek() == nil and math.abs(CallbackResult - PeekResult) > 0.5 then
				SettleModuleResult.launch(PeekResult, 0)
			end
			PeekResult = CallbackResult
		end)
		
		local _ = function()
			-- upvalues: CellResult1 (copy), p3 (copy), ReducedResult (copy), ReadFunction (upval), FormulaResult (copy), SettleModuleResult (copy)
			if CellResult1:peek() == nil and not (if p3.reducedMotion == nil then ReducedResult(nil) else ReadFunction(p3.reducedMotion, nil) == true) then
				return SettleModuleResult.value:peek() or FormulaResult:peek()
			else
				return (FormulaResult:peek())
			end
		end
		
		local _ = function(p5)
			if p5.onActivate then
				p5.onActivate()
			end
		end
		
		local v1 = assert(Runtime.host.frames)
		local OnFrameResult = nil
		
		local _ = function()
			-- upvalues: OnFrameResult (ref), v1 (copy), CellResult6 (copy), Flag (ref)
			if not OnFrameResult then
				OnFrameResult = v1.onFrame(function()
					-- upvalues: OnFrameResult (upval), CellResult6 (upval), Flag (upval)
					if OnFrameResult then
						OnFrameResult()
						OnFrameResult = nil
					end
					CellResult6:set(nil)
					Flag = false
				end)
				
				return
			end
		end
		
		Compose.cleanup(function()
			-- upvalues: OnFrameResult (ref)
			if OnFrameResult then
				OnFrameResult()
				OnFrameResult = nil
			end
		end)
		
		local function execute(Action, Leading)
			-- upvalues: CellResult6 (copy), ReadFunction (upval), p3 (copy), CellResult1 (copy), ReducedResult (copy), FormulaResult (copy), SettleModuleResult (copy), CellResult (copy), Open (copy), Flag (ref), OnFrameResult (ref), v1 (copy), TimelineResult (copy)
			if CellResult6:peek() or ReadFunction(p3.enabled) == false or ReadFunction(Action.enabled) == false then return end
			local PeekResult = if CellResult1:peek() == nil then if if p3.reducedMotion == nil then ReducedResult(nil) else ReadFunction(p3.reducedMotion, nil) == true then FormulaResult:peek() else SettleModuleResult.value:peek() or FormulaResult:peek() else FormulaResult:peek()
			CellResult1:set(nil)
			CellResult:set(false)
			local _ = p3.coordinator
			
			if p3.onOpenChange then
				p3.onOpenChange(nil)
			elseif type(Open.set) == "function" then
				Open:set(nil)
			end
			if Action.role == "destructive" then
				CellResult6:set({
					action = Action,
					edge = if Leading == "leading" then "leading" else "trailing",
					from = PeekResult
				})
				
				if not (if p3.reducedMotion == nil then ReducedResult(nil) else ReadFunction(p3.reducedMotion, nil) == true) then
					TimelineResult:restart()
					
					return
				end
				Flag = true
				
				if not OnFrameResult then
					OnFrameResult = v1.onFrame(function()
						-- upvalues: OnFrameResult (upval), CellResult6 (upval), Flag (upval)
						if OnFrameResult then
							OnFrameResult()
							OnFrameResult = nil
						end
						CellResult6:set(nil)
						Flag = false
					end)
				end
				if Action.onActivate then
					Action.onActivate()
					
					return
				end
			elseif Action.onActivate then
				Action.onActivate()
			end
		end
		
		Compose.watch(function(p5)
			-- upvalues: ReadSourceFunction (upval), Open (copy), Flag (ref), CellResult6 (copy)
			if ReadSourceFunction(Open, p5) ~= nil and Flag then
				Flag = false
				CellResult6:set(nil)
			end
		end)
		Compose.watch(function(Callback)
			-- upvalues: TimelineResult (copy), Flag (ref), CellResult6 (copy), OnFrameResult (ref), v1 (copy)
			if Callback(TimelineResult.completed) and not Flag then
				local PeekResult = CellResult6:peek()
				
				if PeekResult then
					Flag = true
					
					if not OnFrameResult then
						OnFrameResult = v1.onFrame(function()
							-- upvalues: OnFrameResult (upval), CellResult6 (upval), Flag (upval)
							if OnFrameResult then
								OnFrameResult()
								OnFrameResult = nil
							end
							CellResult6:set(nil)
							Flag = false
						end)
					end
					local Action = PeekResult.action
					
					if Action.onActivate then
						Action.onActivate()
					end
				end
			end
		end)
		
		local function paintedOffset(Callback)
			-- upvalues: CellResult1 (copy), CellResult6 (copy), p3 (copy), ReducedResult (copy), ReadFunction (upval), FormulaResult (copy), SettleModuleResult (copy)
			if Callback(CellResult1) == nil and Callback(CellResult6) == nil and not (if p3.reducedMotion == nil then ReducedResult(Callback) else ReadFunction(p3.reducedMotion, Callback) == true) then
				return Callback(SettleModuleResult.value) or Callback(FormulaResult)
			else
				return (Callback(FormulaResult))
			end
		end
		
		local function armed(Name, Callback): boolean
			-- upvalues: CellResult6 (copy), CellResult1 (copy), p3 (copy), ReadFunction1 (upval), Leading (copy), Trailing (copy), CellResult2 (copy)
			local CallbackResult = Callback(CellResult6)
			
			if CallbackResult then
				return CallbackResult.edge == Name
			end
			local CallbackResult1: number = Callback(CellResult1)
			local IsXBelow = false
			
			if CallbackResult1 ~= nil then
				local FullSwipe = p3.fullSwipe
				IsXBelow = if type(FullSwipe) == "table" then (if Name == "leading" then FullSwipe.leading else FullSwipe.trailing) ~= false and (#ReadFunction1(if Name == "leading" then Leading else Trailing, Callback) > 0 and (if Name == "leading" then CallbackResult1 > 0 and Callback(CellResult2).X * 0.6 <= math.abs(CallbackResult1) else CallbackResult1 < 0 and Callback(CellResult2).X * 0.6 <= math.abs(CallbackResult1))) else FullSwipe ~= false and (#ReadFunction1(if Name == "leading" then Leading else Trailing, Callback) > 0 and (if Name == "leading" then CallbackResult1 > 0 and Callback(CellResult2).X * 0.6 <= math.abs(CallbackResult1) else CallbackResult1 < 0 and Callback(CellResult2).X * 0.6 <= math.abs(CallbackResult1)))
			end
			return IsXBelow
		end
		
		local function tray(Name)
			-- upvalues: TypesVector2 (upval), TypesUDim2 (upval), paintedOffset (copy), Host (upval), TypesEnum (upval), Compose (upval), actions (copy), ReadFunction4 (upval), armed (copy), bandWidth (copy), ReadFunction1 (upval), Leading (copy), Trailing (copy), ReadFunction (upval), p3 (copy), execute (copy), p2 (upval), p1 (upval), CellResult5 (copy)
			return Host.Frame({
				Name = Name,
				AnchorPoint = TypesVector2.new(if Name == "leading" then 0 else 1, 0),
				Position = TypesUDim2.fromScale(if Name == "leading" then 0 else 1, 0),
				Size = function(p5)
					-- upvalues: paintedOffset (upval), TypesUDim2 (upval)
					return TypesUDim2.new(0, math.abs((paintedOffset(p5))), 1, 0)
				end,
				Visible = function(p5): boolean
					-- upvalues: paintedOffset (upval), Name (copy)
					local PaintedOffsetResult: number = paintedOffset(p5)
					
					return if Name == "leading" then PaintedOffsetResult > 0 else PaintedOffsetResult < 0
				end,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Attributes = { FacetDragExclude = true },
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					HorizontalAlignment = if Name == "leading" then TypesEnum.HorizontalAlignment.Right else TypesEnum.HorizontalAlignment.Left,
					SortOrder = TypesEnum.SortOrder.LayoutOrder
				}),
				Compose.keyed({
					from = function(p5)
						-- upvalues: actions (upval), Name (copy)
						return actions(Name, p5)
					end,
					key = function(p5)
						return p5.id
					end,
					render = function(p5, p6)
						-- upvalues: ReadFunction4 (upval), Name (copy), armed (upval), TypesUDim2 (upval), bandWidth (upval), paintedOffset (upval), ReadFunction1 (upval), Leading (upval), Trailing (upval), TypesEnum (upval), ReadFunction (upval), p3 (upval), execute (upval), p2 (upval), p1 (upval), Compose (upval), CellResult5 (upval)
						local HasIcon = p5:peek().icon ~= nil
						
						local function words(Callback)
							-- upvalues: ReadFunction4 (upval), p5 (copy)
							return ReadFunction4(Callback(p5).label, Callback)
						end
						
						local function _(Callback): boolean
							-- upvalues: p6 (copy)
							return Callback(p6) == 1
						end
						
						local ButtonResult = p2.Button({
							Name = p5:peek().id,
							LayoutOrder = function(Callback)
								-- upvalues: Name (upval), p6 (copy)
								return if Name == "leading" then -Callback(p6) else Callback(p6)
							end,
							Size = function(Callback)
								-- upvalues: armed (upval), Name (upval), p6 (copy), TypesUDim2 (upval), bandWidth (upval), paintedOffset (upval), ReadFunction1 (upval), Leading (upval), Trailing (upval)
								if armed(Name, Callback) and Callback(p6) == 1 then
									return TypesUDim2.fromScale(1, 1)
								else
									local BandWidthResult = bandWidth(Name, Callback)
									local IsCallbackResultMatch = Callback(p6) == 1
									
									return TypesUDim2.new(0, BandWidthResult / math.max(1, #ReadFunction1(if Name == "leading" then Leading else Trailing, Callback)) + (if IsCallbackResultMatch then math.max(0, math.abs((paintedOffset(Callback))) - BandWidthResult) else 0), 1, 0)
								end
							end,
							Visible = function(Callback): boolean
								-- upvalues: armed (upval), Name (upval), p6 (copy)
								return not armed(Name, Callback) or Callback(p6) == 1
							end,
							AutomaticSize = TypesEnum.AutomaticSize.None,
							label = if HasIcon then "" else words,
							name = if HasIcon then words else nil,
							role = p5:peek().role,
							icon = p5:peek().icon,
							enabled = function(Callback): boolean
								-- upvalues: ReadFunction (upval), p3 (upval), p5 (copy)
								return ReadFunction(p3.enabled, Callback) ~= false and ReadFunction(Callback(p5).enabled, Callback) ~= false
							end,
							onActivate = function()
								-- upvalues: execute (upval), p5 (copy), Name (upval)
								execute(p5:peek(), Name)
							end
						})
						ButtonResult:AddTag("facet-row-action")
						local Title = ButtonResult:FindFirstChild("Title", true)
						local TextBoundsResult = if Title and Title:IsA("TextLabel") then p1.observe.TextBounds(Title) else p1.observe.TextBounds(ButtonResult)
						Compose.watch(function(Callback)
							-- upvalues: TextBoundsResult (copy), p5 (copy), p1 (upval), Name (upval), CellResult5 (upval)
							local CallbackResult = Callback(TextBoundsResult)
							local CallbackResult1 = Callback(p5)
							local NewCeiled = math.ceil(if CallbackResult then CallbackResult.X else 0) + 32 + (if CallbackResult1.icon then p1.controlSize(nil, "iconSize", Callback) + 8 else 0)
							local Text = Name .. ":" .. CallbackResult1.id
							
							if CellResult5:peek()[Text] ~= NewCeiled then
								local Copy = table.clone(CellResult5:peek())
								Copy[Text] = NewCeiled
								CellResult5:set(Copy)
							end
						end)
						
						return ButtonResult
					end
				})
			})
		end
		
		local Frame = nil
		local Object = nil
		local Input = nil
		local reveal = nil
		
		local function began(Input1)
			-- upvalues: TypesEnum (upval), Input (ref)
			if Input1.UserInputType == TypesEnum.UserInputType.Touch or Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 then
				Input = Input1
			end
		end
		
		local v2 = nil
		local PeekResult1 = 0
		local Horizontal = nil
		
		local function cancelDrag()
			-- upvalues: v2 (ref), Horizontal (ref), Input (ref), CellResult1 (copy)
			v2 = nil
			Horizontal = nil
			Input = nil
			CellResult1:set(nil)
		end
		
		local X = 0
		local v3 = 0
		local XRatio = 0
		local NowFunction = assert(p1.runtime.host.frames).now
		
		local function begin(p5)
			-- upvalues: CellResult6 (copy), ReadFunction (upval), p3 (copy), p1 (upval), Frame (ref), v2 (ref), PeekResult1 (ref), Horizontal (ref), CellResult1 (copy), ReducedResult (copy), FormulaResult (copy), SettleModuleResult (copy), X (ref), v3 (ref), XRatio (ref), NowFunction (copy)
			if not CellResult6:peek() and ReadFunction(p3.enabled) ~= false and p1.available(Frame) then
				v2 = p5
				PeekResult1 = if CellResult1:peek() == nil then if if p3.reducedMotion == nil then ReducedResult(nil) else ReadFunction(p3.reducedMotion, nil) == true then FormulaResult:peek() else SettleModuleResult.value:peek() or FormulaResult:peek() else FormulaResult:peek()
				Horizontal = nil
				SettleModuleResult.halt()
				local X1 = p5.X
				local NowResult = NowFunction()
				X = X1
				v3 = NowResult
				XRatio = 0
				
				return
			end
		end
		
		local function move(Vector)
			-- upvalues: v2 (ref), ReadFunction (upval), p3 (copy), NowFunction (copy), v3 (ref), XRatio (ref), X (ref), Horizontal (ref), ReadFunction1 (upval), Leading (copy), CellResult2 (copy), Trailing (copy), PeekResult1 (ref), bandWidth (copy), CellResult1 (copy)
			if v2 == nil or ReadFunction(p3.enabled) == false then return end
			local NowResult = NowFunction()
			local NowResultDelta = NowResult - v3
			
			if NowResultDelta >= 0.005 then
				XRatio = (Vector.X - X) / NowResultDelta
				X = Vector.X
				v3 = NowResult
			end
			local VectorDelta = Vector - v2
			
			if Horizontal == nil and math.max(math.abs(VectorDelta.X), (math.abs(VectorDelta.Y))) >= 8 then
				Horizontal = if math.abs(VectorDelta.Y) < math.abs(VectorDelta.X) then "horizontal" else "vertical"
			end
			if Horizontal == "horizontal" then
				local X1 = if #ReadFunction1(Leading, nil) > 0 then CellResult2:peek().X else 0
				local X2 = if #ReadFunction1(Trailing, nil) > 0 then CellResult2:peek().X else 0
				local NewPeekResult = PeekResult1 + VectorDelta.X
				local Leading1: string = if NewPeekResult > 0 then "leading" else "trailing"
				local BandWidthResult = bandWidth(Leading1)
				local FullSwipe = p3.fullSwipe
				
				if not (if type(FullSwipe) == "table" then (if Leading1 == "leading" then FullSwipe.leading else FullSwipe.trailing) ~= false else FullSwipe ~= false) and BandWidthResult < math.abs(NewPeekResult) then
					NewPeekResult = math.sign(NewPeekResult) * (BandWidthResult + (math.abs(NewPeekResult) - BandWidthResult) * 0.55)
				end
				CellResult1:set((math.clamp(NewPeekResult, -X2, X1)))
			end
		end
		
		local v4 = nil
		
		local _ = function()
			-- upvalues: Frame (ref)
			local Parent = Frame.Parent
			while Parent and Parent:GetAttribute("FacetCollectionRow") ~= true do
				Parent = Parent.Parent
			end
			return Parent
		end
		
		local function tap(p5)
			-- upvalues: ReadSourceFunction (upval), Open (copy), p3 (copy), Frame (ref), ActivationModule (upval), v4 (ref), Object (ref)
			if ReadSourceFunction(Open) == nil then
				local Parent = Frame.Parent
				while Parent and Parent:GetAttribute("FacetCollectionRow") ~= true do
					Parent = Parent.Parent
				end
				local RowHit = if Parent then Parent:FindFirstChild("RowHit") else nil
				
				if RowHit and ActivationModule.trigger(RowHit, p5 or v4) then return end
				for _, descendant in Object:GetDescendants() do
					if ActivationModule.trigger(descendant) then break end
				end
				return
			else
				local _ = p3.coordinator
				
				if p3.onOpenChange then
					p3.onOpenChange(nil)
					
					return
				end
				if type(Open.set) == "function" then
					Open:set(nil)
				end
			end
		end
		
		local function finish()
			-- upvalues: ReadFunction (upval), p3 (copy), v2 (ref), Horizontal (ref), CellResult1 (copy), NowFunction (copy), v3 (ref), XRatio (ref), CellResult2 (copy), ReadFunction1 (upval), Leading (copy), Trailing (copy), p1 (upval), execute (copy), bandWidth (copy), t (copy), Open (copy), CellResult6 (copy), SettleModuleResult (copy)
			if ReadFunction(p3.enabled) == false then
				v2 = nil
				Horizontal = nil
				CellResult1:set(nil)
				
				return
			end
			local PeekResult: number = CellResult1:peek()
			local XRatio1 = if NowFunction() - v3 < 0.1 then XRatio else 0
			
			if PeekResult ~= nil and PeekResult ~= 0 and Horizontal == "horizontal" and CellResult2:peek().X > 0 then
				local Leading1: string = if PeekResult > 0 then "leading" else "trailing"
				local ReadResult = ReadFunction1(if Leading1 == "leading" then Leading else Trailing, nil)
				local X: number = CellResult2:peek().X
				local ScaledXRatio = if NowFunction() - v3 < 0.1 then XRatio * p1.metric("motion.fling.projection") else 0
				local Value: number = if ScaledXRatio * PeekResult > 0 then PeekResult + ScaledXRatio else PeekResult
				local FullSwipe = p3.fullSwipe
				
				if (if type(FullSwipe) == "table" then (if Leading1 == "leading" then FullSwipe.leading else FullSwipe.trailing) ~= false else FullSwipe ~= false) and #ReadResult > 0 and X > 0 and X * 0.6 <= math.abs(Value) then
					execute(ReadResult[1], Leading1)
				elseif #ReadResult > 0 and PeekResult ~= 0 and (bandWidth(Leading1) * 0.5 <= math.abs(PeekResult) or math.abs(XRatio) > 600 and XRatio * PeekResult > 0 and NowFunction() - v3 < 0.1) then
					if p3.coordinator and Leading1 then
						p3.coordinator:set(t)
					end
					if p3.onOpenChange then
						p3.onOpenChange(Leading1)
					elseif type(Open.set) == "function" then
						Open:set(Leading1)
					end
				else
					local _ = p3.coordinator
					
					if p3.onOpenChange then
						p3.onOpenChange(nil)
					elseif type(Open.set) == "function" then
						Open:set(nil)
					end
				end
			end
			v2 = nil
			Horizontal = nil
			CellResult1:set(nil)
			
			if PeekResult ~= nil and CellResult6:peek() == nil then
				SettleModuleResult.launch(PeekResult, XRatio1)
			end
		end
		
		local _ = function()
			-- upvalues: v2 (ref), Horizontal (ref), CellResult6 (copy), finish (copy), ReadFunction (upval), p3 (copy), tap (copy)
			local NoPeekResult: boolean = v2 ~= nil and (Horizontal == nil and CellResult6:peek() == nil)
			finish()
			
			if NoPeekResult and ReadFunction(p3.enabled) ~= false then
				tap()
			end
		end
		
		local PreferredInputResult = if p1.config.userInputService then p1.observe.PreferredInput(p1.config.userInputService) else nil
		
		local _ = function(p6): boolean
			-- upvalues: PreferredInputResult (copy), ReadSourceFunction (upval), TypesEnum (upval)
			return PreferredInputResult ~= nil and ReadSourceFunction(PreferredInputResult, p6) == TypesEnum.PreferredInput.Touch
		end
		
		local function actionSize(Callback): number
			-- upvalues: EditsResult (copy), ReadFunction (upval), p3 (copy), PreferredInputResult (copy), TypesEnum (upval), p1 (upval)
			return if #EditsResult > 0 and ReadFunction(p3.enabled, Callback) ~= false and PreferredInputResult and Callback(PreferredInputResult) ~= TypesEnum.PreferredInput.KeyboardAndMouse then math.max(44, p1.controlSize(nil, "height", Callback)) else 0
		end
		
		local _ = function(Callback): number
			-- upvalues: actionSize (copy), CellResult4 (copy)
			local ActionSizeResult: number = actionSize(Callback)
			
			return if ActionSizeResult > 0 then math.max(ActionSizeResult, Callback(CellResult4).X) else 0
		end
		
		local _ = function(Callback): number
			-- upvalues: actionSize (copy), IsBottom (copy), CellResult4 (copy)
			local ActionSizeResult: number = actionSize(Callback)
			
			return if IsBottom and ActionSizeResult > 0 then math.max(ActionSizeResult, Callback(CellResult4).Y) else 0
		end
		
		local Flag1 = false
		local OnFrameResult1 = nil
		
		local _ = function()
			-- upvalues: OnFrameResult1 (ref), v1 (copy), Flag1 (ref)
			if not OnFrameResult1 then
				OnFrameResult1 = v1.onFrame(function()
					-- upvalues: OnFrameResult1 (upval), Flag1 (upval)
					if OnFrameResult1 then
						OnFrameResult1()
						OnFrameResult1 = nil
					end
					Flag1 = false
				end)
				
				return
			end
		end
		
		Compose.cleanup(function()
			-- upvalues: OnFrameResult1 (ref)
			if OnFrameResult1 then
				OnFrameResult1()
				OnFrameResult1 = nil
			end
		end)
		local HoldOwnedAncestorsResult: (() -> ())? = nil
		
		local _ = function()
			-- upvalues: HoldOwnedAncestorsResult (ref), ScrollLockModule (upval), Frame (ref)
			if HoldOwnedAncestorsResult == nil then
				HoldOwnedAncestorsResult = ScrollLockModule.holdOwnedAncestors(Frame)
			end
		end
		
		Compose.cleanup(function()
			-- upvalues: HoldOwnedAncestorsResult (ref)
			if HoldOwnedAncestorsResult then
				HoldOwnedAncestorsResult()
				HoldOwnedAncestorsResult = nil
			end
		end)
		
		local function pan(Entry, p6, p7, Begin)
			-- upvalues: TypesEnum (upval), Flag1 (ref), begin (copy), v2 (ref), move (copy), XRatio (ref), v3 (ref), NowFunction (copy), HoldOwnedAncestorsResult (ref), finish (copy), OnFrameResult1 (ref), v1 (copy), Horizontal (ref), ScrollLockModule (upval), Frame (ref), Input (ref), CellResult1 (copy)
			if Begin == TypesEnum.UserInputState.Begin then
				local Entry1 = Entry[1]
				
				if Entry1 == nil then return end
				Flag1 = true
				begin(Entry1 - p6)
			end
			if Begin == TypesEnum.UserInputState.Begin or Begin == TypesEnum.UserInputState.Change or Begin == TypesEnum.UserInputState.End then
				if v2 then
					move(v2 + p6)
					local X = p7.X
					local NowResult = NowFunction()
					XRatio = X
					v3 = NowResult
				end
				if Begin == TypesEnum.UserInputState.End then
					if HoldOwnedAncestorsResult then
						HoldOwnedAncestorsResult()
						HoldOwnedAncestorsResult = nil
					end
					finish()
					
					if not OnFrameResult1 then
						OnFrameResult1 = v1.onFrame(function()
							-- upvalues: OnFrameResult1 (upval), Flag1 (upval)
							if OnFrameResult1 then
								OnFrameResult1()
								OnFrameResult1 = nil
							end
							Flag1 = false
						end)
						
						return
					end
					return
				elseif Horizontal == "horizontal" and HoldOwnedAncestorsResult == nil then
					HoldOwnedAncestorsResult = ScrollLockModule.holdOwnedAncestors(Frame)
					
					return
				end
			else
				if HoldOwnedAncestorsResult then
					HoldOwnedAncestorsResult()
					HoldOwnedAncestorsResult = nil
				end
				v2 = nil
				Horizontal = nil
				Input = nil
				CellResult1:set(nil)
				
				if OnFrameResult1 then return end
				OnFrameResult1 = v1.onFrame(function()
					-- upvalues: OnFrameResult1 (upval), Flag1 (upval)
					if OnFrameResult1 then
						OnFrameResult1()
						OnFrameResult1 = nil
					end
					Flag1 = false
				end)
			end
		end
		
		local function swipeable(Callback): boolean
			-- upvalues: EditsResult (copy), CellResult6 (copy), ReadFunction (upval), p3 (copy), ReadFunction1 (upval), Leading (copy), Trailing (copy)
			return #EditsResult == 0 and Callback(CellResult6) == nil and (ReadFunction(p3.editing, Callback) ~= true and (ReadFunction(p3.swipeEnabled, Callback) ~= false and (ReadFunction(p3.enabled, Callback) ~= false and #ReadFunction1(Leading, Callback) + #ReadFunction1(Trailing, Callback) > 0)))
		end
		
		local function swipeDetector(p6): boolean
			-- upvalues: swipeable (copy), PointerDragModuleResult (copy), PreferredInputResult (copy), ReadSourceFunction (upval), TypesEnum (upval)
			return swipeable(p6) and (PointerDragModuleResult(p6) and (not (PreferredInputResult ~= nil and ReadSourceFunction(PreferredInputResult, p6) == TypesEnum.PreferredInput.Touch) and not (PreferredInputResult ~= nil and ReadSourceFunction(PreferredInputResult, p6) == TypesEnum.PreferredInput.Gamepad)))
		end
		
		local Flag2 = false
		Compose.watch(function(p6)
			-- upvalues: swipeable (copy), PointerDragModuleResult (copy), PreferredInputResult (copy), ReadSourceFunction (upval), TypesEnum (upval), Flag2 (ref), v2 (ref), Horizontal (ref), Input (ref), CellResult1 (copy)
			if (not swipeable(p6) or (not PointerDragModuleResult(p6) or (PreferredInputResult ~= nil and ReadSourceFunction(PreferredInputResult, p6) == TypesEnum.PreferredInput.Touch or PreferredInputResult ~= nil and ReadSourceFunction(PreferredInputResult, p6) == TypesEnum.PreferredInput.Gamepad))) and Flag2 then
				Flag2 = false
				v2 = nil
				Horizontal = nil
				Input = nil
				CellResult1:set(nil)
			end
		end)
		local FormulaResult1 = Compose.formula(function(p6)
			-- upvalues: ReadFunction1 (upval), Leading (copy), Trailing (copy), execute (copy)
			local List = {}
			
			for _, value in { "leading", "trailing" } do
				local Leading1 = if value == "leading" then Leading else Trailing
				for _, value1 in ReadFunction1(Leading1, p6) do
					table.insert(List, {
						id = value .. ":" .. value1.id,
						label = value1.label,
						icon = value1.icon,
						role = value1.role,
						enabled = value1.enabled,
						onSelect = function()
							-- upvalues: execute (upval), value1 (copy), value (copy)
							execute(value1, value)
						end
					})
				end
			end
			return List
		end)
		Compose.watch(function(p7)
			-- upvalues: ReadFunction (upval), p3 (copy), v2 (ref), Horizontal (ref), CellResult1 (copy), CellResult (copy), Open (copy)
			if ReadFunction(p3.enabled, p7) == false then
				v2 = nil
				Horizontal = nil
				CellResult1:set(nil)
				CellResult:set(false)
				local _ = p3.coordinator
				
				if p3.onOpenChange then
					p3.onOpenChange(nil)
					
					return
				end
				if type(Open.set) == "function" then
					Open:set(nil)
				end
			end
		end)
		Frame = Host.Frame(p1.props(p3, list, {
			Size = TypesUDim2.new(1, 0, 0, 44),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			tray("leading"),
			tray("trailing"),
			Host.Frame("Content")({
				Visible = function(Callback): boolean
					-- upvalues: CellResult6 (copy), p3 (copy), ReducedResult (copy), ReadFunction (upval), TimelineResult (copy)
					return Callback(CellResult6) == nil or not (if p3.reducedMotion == nil then ReducedResult(Callback) else ReadFunction(p3.reducedMotion, Callback) == true) and Callback(TimelineResult.progress) < 0.7
				end,
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), ReadFunction (upval), p3 (copy), CellResult3 (copy), IsBottom (copy), actionSize (copy), CellResult4 (copy)
					local NewFunction = TypesUDim2.new
					local v5 = 1
					local Negated = if ReadFunction(p3.editing, Callback) then -Callback(CellResult3) else 0
					local Largest = nil
					
					if IsBottom then
						Largest = 0
					else
						local ActionSizeResult: number = actionSize(Callback)
						Largest = if ActionSizeResult > 0 then math.max(ActionSizeResult, Callback(CellResult4).X) else 0
					end
					local NegatedDelta = Negated - Largest
					local ActionSizeResult: number = actionSize(Callback)
					
					return NewFunction(v5, NegatedDelta, 1, -(if IsBottom and ActionSizeResult > 0 then math.max(ActionSizeResult, Callback(CellResult4).Y) else 0))
				end,
				BackgroundTransparency = 1,
				Position = function(Callback)
					-- upvalues: ReadFunction (upval), p3 (copy), CellResult3 (copy), TypesUDim2 (upval), paintedOffset (copy)
					return TypesUDim2.fromOffset((if ReadFunction(p3.editing, Callback) then Callback(CellResult3) else 0) + paintedOffset(Callback), 0)
				end,
				Attributes = {
					FacetDragRestX = function(Callback)
						-- upvalues: ReadFunction (upval), p3 (copy), CellResult3 (copy)
						return if ReadFunction(p3.editing, Callback) then Callback(CellResult3) else 0
					end
				},
				ContentResult,
				Host.TextButton("SwipeGrip")({
					Size = TypesUDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Text = "",
					AutoButtonColor = false,
					Selectable = false,
					ZIndex = if ContentResult:IsA("GuiButton") then 4 else 0,
					Visible = swipeable,
					InputBegan = function(Input1)
						-- upvalues: TypesEnum (upval), Input (ref), v4 (ref), Frame (ref), ActivationModule (upval)
						if Input1.UserInputType == TypesEnum.UserInputType.Touch or Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 then
							Input = Input1
						end
						v4 = Input1
						local Parent = Frame.Parent
						while Parent and Parent:GetAttribute("FacetCollectionRow") ~= true do
							Parent = Parent.Parent
						end
						local RowHit = if Parent then Parent:FindFirstChild("RowHit") else nil
						
						if RowHit then
							ActivationModule.press(RowHit, Input1)
						end
					end,
					Activated = function(p7)
						-- upvalues: PreferredInputResult (copy), ReadSourceFunction (upval), TypesEnum (upval), Flag1 (ref), v2 (ref), tap (copy)
						if PreferredInputResult ~= nil and ReadSourceFunction(PreferredInputResult, nil) == TypesEnum.PreferredInput.Touch and not Flag1 and v2 == nil then
							tap(p7)
						end
					end,
					Host.UIDragDetector({
						Enabled = swipeDetector,
						DragStyle = TypesEnum.UIDragDetectorDragStyle.TranslateLine,
						DragAxis = TypesVector2.new(1, 0),
						ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
						DragStart = function(p7)
							-- upvalues: Flag2 (ref), ActivationModule (upval), Frame (ref), begin (copy)
							Flag2 = true
							ActivationModule.drag(Frame, "start", p7)
							begin(p7)
						end,
						DragContinue = function(p7)
							-- upvalues: Flag2 (ref), ActivationModule (upval), Frame (ref), move (copy)
							if Flag2 then
								if ActivationModule.drag(Frame, "move", p7) then return end
								move(p7)
							end
						end,
						DragEnd = function()
							-- upvalues: Flag2 (ref), ActivationModule (upval), Frame (ref), v2 (ref), Horizontal (ref), CellResult6 (copy), finish (copy), ReadFunction (upval), p3 (copy), tap (copy)
							if Flag2 then
								Flag2 = false
								ActivationModule.drag(Frame, "end", nil)
								local NoPeekResult: boolean = v2 ~= nil and (Horizontal == nil and CellResult6:peek() == nil)
								finish()
								
								if NoPeekResult and ReadFunction(p3.enabled) ~= false then
									tap()
								end
							end
						end
					})
				}),
				Host.TextButton("DismissTray")({
					BackgroundTransparency = 1,
					Text = "",
					Active = true,
					AutoButtonColor = false,
					Selectable = false,
					ZIndex = 5,
					Size = TypesUDim2.fromScale(1, 1),
					Visible = function(Callback): boolean
						-- upvalues: ReadSourceFunction (upval), Open (copy), CellResult6 (copy)
						return ReadSourceFunction(Open, Callback) ~= nil and Callback(CellResult6) == nil
					end,
					InputBegan = function(Input)
						-- upvalues: TypesEnum (upval), Frame (ref), ActivationModule (upval), ReadSourceFunction (upval), Open (copy), CellResult6 (copy), p3 (copy)
						if Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 and Input.UserInputType ~= TypesEnum.UserInputType.Touch then return end
						local Parent = Frame.Parent
						while Parent and Parent:GetAttribute("FacetCollectionRow") ~= true do
							Parent = Parent.Parent
						end
						local RowHit = if Parent then Parent:FindFirstChild("RowHit") else nil
						
						if RowHit then
							ActivationModule.press(RowHit, Input)
						end
						if ReadSourceFunction(Open) ~= nil and CellResult6:peek() == nil then
							local _ = p3.coordinator
							
							if p3.onOpenChange then
								p3.onOpenChange(nil)
								
								return
							end
							if type(Open.set) == "function" then
								Open:set(nil)
							end
						end
					end,
					Activated = function()
						-- upvalues: ReadSourceFunction (upval), Open (copy), CellResult6 (copy), p3 (copy)
						if ReadSourceFunction(Open) ~= nil and CellResult6:peek() == nil then
							local _ = p3.coordinator
							
							if p3.onOpenChange then
								p3.onOpenChange(nil)
								
								return
							end
							if type(Open.set) == "function" then
								Open:set(nil)
							end
						end
					end
				})
			})
		}))
		p2.Menu({
			closeButton = true,
			trigger = Frame,
			items = FormulaResult1,
			isPresented = CellResult,
			triggers = { "secondary" },
			enabled = function(p7): boolean
				-- upvalues: ReadFunction (upval), p3 (copy), ReadSourceFunction (upval), CellResult6 (copy), FormulaResult1 (copy)
				return ReadFunction(p3.enabled, p7) ~= false and (ReadSourceFunction(CellResult6, p7) == nil and #ReadSourceFunction(FormulaResult1, p7) > 0)
			end,
			onOpen = function()
				-- upvalues: p3 (copy), Open (copy), t (copy)
				local _ = p3.coordinator
				
				if p3.onOpenChange then
					p3.onOpenChange(nil)
				elseif type(Open.set) == "function" then
					Open:set(nil)
				end
				if p3.coordinator then
					p3.coordinator:set(t)
				end
			end
		})
		
		if #EditsResult > 0 then
			Runtime.mount(function()
				-- upvalues: p2 (upval), IsBottom (copy), TypesVector2 (upval), TypesUDim2 (upval), actionSize (copy), p3 (copy), reveal (ref), p1 (upval), Frame (ref), Compose (upval), CellResult4 (copy)
				local CellActions = p2.Button({
					Name = "CellActions",
					icon = "more",
					label = "",
					name = "Item actions",
					ZIndex = 5,
					appearance = if IsBottom then "utility" else "plain",
					shape = if IsBottom then "circle" else nil,
					AnchorPoint = TypesVector2.new(1, if IsBottom then 1 else 0.5),
					Position = TypesUDim2.fromScale(1, if IsBottom then 1 else 0.5),
					Size = function(p7)
						-- upvalues: TypesUDim2 (upval), actionSize (upval)
						return TypesUDim2.fromOffset(actionSize(p7), (actionSize(p7)))
					end,
					Visible = function(p7): boolean
						-- upvalues: actionSize (upval)
						return actionSize(p7) > 0
					end,
					enabled = p3.enabled,
					onActivate = function()
						-- upvalues: reveal (upval)
						reveal()
					end
				})
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(CellActions)
				local LayoutUnitResult = p1.layoutUnit(Frame)
				Compose.watch(function(Callback)
					-- upvalues: CellResult4 (upval), AbsoluteSizeResult (copy), LayoutUnitResult (copy)
					CellResult4:set(Callback(AbsoluteSizeResult) / Callback(LayoutUnitResult))
				end)
				
				return CellActions
			end, Frame)
		end
		Object = assert(Frame:FindFirstChild("Content"))
		local v5 = assert(Object:FindFirstChild("SwipeGrip"))
		Runtime.connect(v5, "TouchPan", pan)
		Runtime.decorate(Frame, {
			Size = function(Callback)
				-- upvalues: p3 (copy), TypesUDim2 (upval), ReadFunction3 (upval), CellResult6 (copy), ReducedResult (copy), ReadFunction (upval), TimelineResult (copy)
				local NewTypesUDim = if p3.Size == nil then TypesUDim2.new(1, 0, 0, 44) else ReadFunction3(p3.Size, Callback)
				local ClampedValue = nil
				
				if Callback(CellResult6) then
					local ReducedResultResult = if p3.reducedMotion == nil then ReducedResult(Callback) else ReadFunction(p3.reducedMotion, Callback) == true
					ClampedValue = if ReducedResultResult then 1 else math.clamp((Callback(TimelineResult.progress) - 0.7) / 0.3, 0, 1)
				else
					ClampedValue = 0
				end
				return TypesUDim2.new(NewTypesUDim.X.Scale, NewTypesUDim.X.Offset, NewTypesUDim.Y.Scale * (1 - ClampedValue), NewTypesUDim.Y.Offset * (1 - ClampedValue))
			end
		})
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(Frame)
		Compose.watch(function(Callback)
			-- upvalues: CellResult2 (copy), AbsoluteSizeResult (copy)
			CellResult2:set(Callback(AbsoluteSizeResult))
		end)
		
		reveal = function()
			-- upvalues: ReadFunction (upval), p3 (copy), CellResult6 (copy), p1 (upval), Frame (ref), FormulaResult1 (copy), Open (copy), t (copy), CellResult (copy)
			if ReadFunction(p3.enabled) ~= false and CellResult6:peek() == nil and p1.available(Frame) and #FormulaResult1:peek() > 0 then
				local _ = p3.coordinator
				
				if p3.onOpenChange then
					p3.onOpenChange(nil)
				elseif type(Open.set) == "function" then
					Open:set(nil)
				end
				if p3.coordinator then
					p3.coordinator:set(t)
				end
				CellResult:set(true)
			end
		end
		
		Runtime.connect(Frame, "InputBegan", began)
		local UserInputService = p1.config.userInputService
		
		if UserInputService then
			local function cancelInput(Input1)
				-- upvalues: Input (ref), TypesEnum (upval), v2 (ref), Horizontal (ref), CellResult1 (copy)
				if Input == Input1 and Input1.UserInputState == TypesEnum.UserInputState.Cancel then
					v2 = nil
					Horizontal = nil
					Input = nil
					CellResult1:set(nil)
				end
			end
			
			Runtime.connect(UserInputService, "InputChanged", cancelInput)
			Runtime.connect(UserInputService, "InputEnded", cancelInput)
			Runtime.connect(UserInputService, "WindowFocusReleased", cancelDrag)
		end
		if UserInputService then
			local function outside(Input): boolean
				-- upvalues: Frame (ref), TypesVector2 (upval), p1 (upval)
				local LayerCollector = Frame:FindFirstAncestorWhichIsA("LayerCollector")
				
				if LayerCollector == nil or not LayerCollector:IsA("ScreenGui") then
					return false
				end
				local NewTypesVector = TypesVector2.new(Input.Position.X, Input.Position.Y)
				local GuiService = p1.config.guiService
				
				if LayerCollector.IgnoreGuiInset and GuiService then
					NewTypesVector += GuiService:GetGuiInset()
				end
				local AbsolutePosition = Frame.AbsolutePosition
				local AbsoluteSize = Frame.AbsoluteSize
				
				return NewTypesVector.X < AbsolutePosition.X or (NewTypesVector.Y < AbsolutePosition.Y or (AbsolutePosition.X + AbsoluteSize.X < NewTypesVector.X or AbsolutePosition.Y + AbsoluteSize.Y < NewTypesVector.Y))
			end
			
			local InputBeganConnection = nil
			
			local function release()
				-- upvalues: InputBeganConnection (ref)
				if InputBeganConnection then
					InputBeganConnection:Disconnect()
					InputBeganConnection = nil
				end
			end
			
			Compose.watch(function(p7)
				-- upvalues: ReadSourceFunction (upval), Open (copy), InputBeganConnection (ref), UserInputService (copy), TypesEnum (upval), CellResult6 (copy), outside (copy), p3 (copy)
				if ReadSourceFunction(Open, p7) == nil then
					if InputBeganConnection then
						InputBeganConnection:Disconnect()
						InputBeganConnection = nil
						
						return
					end
				elseif InputBeganConnection == nil then
					InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
						-- upvalues: TypesEnum (upval), CellResult6 (upval), ReadSourceFunction (upval), Open (upval), outside (upval), p3 (upval)
						local UserInputType = Input.UserInputType
						
						if (UserInputType == TypesEnum.UserInputType.MouseButton1 or UserInputType == TypesEnum.UserInputType.Touch) and CellResult6:peek() == nil and ReadSourceFunction(Open) ~= nil and outside(Input) then
							local _ = p3.coordinator
							
							if p3.onOpenChange then
								p3.onOpenChange(nil)
								
								return
							end
							if type(Open.set) == "function" then
								Open:set(nil)
							end
						end
					end)
				end
			end)
			Compose.cleanup(release)
		end
		local function longPress(_, Begin)
			-- upvalues: TypesEnum (upval), EditsResult (copy), reveal (ref)
			if Begin == TypesEnum.UserInputState.Begin and #EditsResult == 0 then
				reveal()
			end
		end
		
		Runtime.connect(Frame, "TouchLongPress", longPress)
		Runtime.connect(v5, "TouchLongPress", longPress)
		local GuiService = p1.config.guiService
		local ObserveResult = if GuiService then p1.selection.observe() else Compose.cell(nil)
		
		local _ = function()
			-- upvalues: Frame (ref)
			local Parent = Frame.Parent
			while Parent and Parent:GetAttribute("FacetCollectionRow") ~= true do
				Parent = Parent.Parent
			end
			if not Parent then
				Parent = Frame
			end
			return Parent
		end
		
		local function eligible(p7): boolean
			-- upvalues: ReadSourceFunction (upval), ObserveResult (copy), Frame (ref), ReadFunction (upval), p3 (copy), CellResult6 (copy)
			local Source = ReadSourceFunction(ObserveResult, p7)
			local v6 = false
			
			if Source ~= nil then
				local Parent = Frame.Parent
				while Parent and Parent:GetAttribute("FacetCollectionRow") ~= true do
					Parent = Parent.Parent
				end
				if not Parent then
					Parent = Frame
				end
				v6 = Source:IsDescendantOf(Parent) and (ReadFunction(p3.enabled, p7) ~= false and (ReadSourceFunction(CellResult6, p7) == nil and not (Source:IsA("TextBox") and Source:IsFocused())))
			end
			return v6
		end
		
		p1.action(Frame, "RowActionsReveal", { TypesEnum.KeyCode.ButtonX, TypesEnum.KeyCode.Menu }, eligible, reveal, { priority = 450 })
		p1.action(Frame, "RowActionsClose", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, function(Callback)
			-- upvalues: eligible (copy), ReadSourceFunction (upval), Open (copy), CellResult (copy)
			return eligible(Callback) and (ReadSourceFunction(Open, Callback) ~= nil or Callback(CellResult))
		end, function()
			-- upvalues: CellResult (copy), p3 (copy), Open (copy)
			CellResult:set(false)
			local _ = p3.coordinator
			
			if p3.onOpenChange then
				p3.onOpenChange(nil)
				
				return
			end
			if type(Open.set) == "function" then
				Open:set(nil)
			end
		end, { priority = 300 })
		
		local function destructive(p8)
			-- upvalues: ReadFunction1 (upval), Leading (copy), Trailing (copy), ReadFunction (upval)
			for _, value in { "trailing", "leading" } do
				local Leading1 = if value == "leading" then Leading else Trailing
				for _, value1 in ReadFunction1(Leading1, p8) do
					if value1.role == "destructive" and ReadFunction(value1.enabled, p8) ~= false then
						return value1, value
					end
				end
			end
			return nil, nil
		end
		
		local function delete()
			-- upvalues: destructive (copy), execute (copy)
			local DestructiveResult, DestructiveResult2 = destructive()
			
			if DestructiveResult then
				execute(DestructiveResult, DestructiveResult2)
			end
		end
		
		p1.action(Frame, "RowActionsDelete", { TypesEnum.KeyCode.Delete, TypesEnum.KeyCode.Backspace }, function(Callback): boolean
			-- upvalues: eligible (copy), ReadSourceFunction (upval), Open (copy), CellResult (copy), destructive (copy)
			return eligible(Callback) and (ReadSourceFunction(Open, Callback) == nil and (not Callback(CellResult) and destructive(Callback) ~= nil))
		end, delete, { priority = 300 })
		p1.action(Frame, "RowActionsToggle", {
			{
				KeyCode = TypesEnum.KeyCode.Return,
				PrimaryModifier = TypesEnum.KeyCode.LeftShift
			},
			{
				KeyCode = TypesEnum.KeyCode.Return,
				PrimaryModifier = TypesEnum.KeyCode.RightShift
			}
		}, eligible, function()
			-- upvalues: CellResult (copy), reveal (ref)
			if CellResult:peek() then
				CellResult:set(false)
				
				return
			else
				reveal()
			end
		end, { priority = 300 })
		p1.shiftRoute(Frame, function()
			-- upvalues: ReadFunction (upval), p3 (copy), CellResult (copy), reveal (ref)
			if ReadFunction(p3.enabled) == false then return end
			if CellResult:peek() then
				CellResult:set(false)
				
				return
			else
				reveal()
			end
		end)
		
		if p3.editing then
			Runtime.mountFragment(function()
				-- upvalues: Compose (upval), ReadFunction (upval), p3 (copy), destructive (copy), TypesUDim2 (upval), CellResult3 (copy), delete (copy), p2 (upval), p1 (upval), CellResult2 (copy)
				return {
					Compose.show(function(p9): boolean
						-- upvalues: ReadFunction (upval), p3 (upval), destructive (upval)
						return ReadFunction(p3.editing, p9) == true and destructive(p9) ~= nil
					end, function()
						-- upvalues: TypesUDim2 (upval), CellResult3 (upval), destructive (upval), ReadFunction (upval), delete (upval), p2 (upval), p1 (upval), Compose (upval), CellResult2 (upval)
						local Delete = p2.Button({
							Name = "Delete",
							ZIndex = 5,
							role = "destructive",
							Size = function(Callback)
								-- upvalues: TypesUDim2 (upval), CellResult3 (upval)
								return TypesUDim2.new(0, Callback(CellResult3), 1, 0)
							end,
							label = function(p9)
								-- upvalues: destructive (upval), ReadFunction (upval)
								local DestructiveResult = destructive(p9)
								
								return if DestructiveResult then ReadFunction(DestructiveResult.label, p9) else "Delete"
							end,
							onActivate = delete
						})
						local Title = Delete:FindFirstChild("Title", true)
						local TextBoundsResult = if Title and Title:IsA("TextLabel") then p1.observe.TextBounds(Title) else p1.observe.TextBounds(Delete)
						Compose.watch(function(Callback)
							-- upvalues: TextBoundsResult (copy), CellResult3 (upval), CellResult2 (upval)
							local CallbackResult = Callback(TextBoundsResult)
							CellResult3:set((math.min(Callback(CellResult2).X, (math.max(72, math.ceil(if CallbackResult then CallbackResult.X else 0) + 32)))))
						end)
						
						return Delete
					end)
				}
			end, Frame)
		end
		local v7 = nil
		Compose.watch(function(Callback)
			-- upvalues: Open (copy), GuiService (copy), p1 (upval), Frame (ref), v7 (ref)
			local CallbackResult = Callback(Open)
			
			if GuiService == nil then return end
			if CallbackResult ~= nil then
				local GetResult = p1.selection.get()
				
				if GetResult then
					local Parent = Frame.Parent
					while Parent and Parent:GetAttribute("FacetCollectionRow") ~= true do
						Parent = Parent.Parent
					end
					if not Parent then
						Parent = Frame
					end
					if GetResult:IsDescendantOf(Parent) then
						v7 = GetResult
						local CallbackResult1 = Frame:FindFirstChild(CallbackResult)
						
						if CallbackResult1 then
							for _, Button in CallbackResult1:GetChildren() do
								if Button:IsA("GuiButton") and Button.Selectable and Button.Interactable then
									p1.selection.set(Button)
									break
								end
							end
							return
						end
					end
				end
			elseif v7 and v7.Parent then
				p1.selection.set(v7)
				v7 = nil
			end
		end)
		
		return p1.styled(Frame, "RowActions")
	end)
end