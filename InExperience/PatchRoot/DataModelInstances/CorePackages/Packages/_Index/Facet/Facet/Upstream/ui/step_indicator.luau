local _ = require("./types")
local _ = require("./content_types")
local _ = require("./navigation_types")
local _ = require("./theme_types")
local _ = require("../vendor/compose/core")
local ContentValuesModule = require("./content_values")
local _ = require("./content_props")
local _ = require("./control_types")
local _ = require("./input_props")
local ReducedFunction = require("./motion").reduced
local config = {
	complete = "Complete",
	current = "Current",
	upcoming = "Upcoming",
	error = "Error"
}
local config1 = {
	id = true,
	label = true,
	description = true,
	state = true,
	navigable = true,
	enabled = true
}

return function(p1, p2)
	-- upvalues: config1 (copy), config (copy), ContentValuesModule (copy), ReducedFunction (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	
	local function problem(List, Id): string?
		-- upvalues: config1 (upval), config (upval)
		if type(List) ~= "table" then
			return "steps must be an array of steps"
		end
		if Id ~= nil and type(Id) ~= "string" then
			return "current must be a step id or nil"
		end
		local t = {}
		
		for i, value in List do
			if type(value) ~= "table" then
				return `step {i} must be a table`
			end
			assert(type(value) == "table")
			
			for i1 in value do
				if type(i1) ~= "string" or not config1[i1] then
					return `step {i} has the unknown field '{tostring(i1)}'`
				end
			end
			if type(value.id) ~= "string" or value.id == "" then
				return `step {i} needs a nonempty string id`
			end
			if t[value.id] then
				return `two steps share the id '{value.id}'`
			end
			t[value.id] = true
			
			if type(value.label) ~= "string" or string.find(value.label, "%S") == nil then
				return `step '{value.id}' needs a nonempty label`
			end
			if value.description ~= nil and type(value.description) ~= "string" then
				return `step '{value.id}' description must be a string`
			end
			if value.state ~= nil and config[value.state] == nil then
				return `step '{value.id}' state must be complete, current, upcoming or error`
			end
			if value.state == "current" and value.id ~= Id then
				return `step '{value.id}' is marked current, but current names '{tostring(Id)}'`
			end
			if value.navigable ~= nil and type(value.navigable) ~= "boolean" then
				return `step '{value.id}' navigable must be a boolean`
			elseif value.enabled ~= nil and type(value.enabled) ~= "boolean" then
				return `step '{value.id}' enabled must be a boolean`
			end
		end
		return nil
	end
	
	p2.StepIndicator = p1.construct("StepIndicator", function(p3)
		-- upvalues: ReadFunction (copy), problem (copy), ContentValuesModule (upval), p1 (copy), Compose (copy), TypesUDim (copy), TypesVector2 (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), config (upval), p2 (copy), ReducedFunction (upval), Runtime (copy)
		local ReadResult = ReadFunction(p3.steps)
		local ReadResult1 = ReadFunction(p3.current)
		local ProblemResult = problem(ReadResult, ReadResult1)
		
		if ProblemResult then
			error(`Facet UI.StepIndicator: {ProblemResult}`, 0)
		end
		assert(p3.sizing == nil or (p3.sizing == "fill" or p3.sizing == "hug"), "Facet UI.StepIndicator: sizing is fill or hug")
		assert(p3.onSelect == nil or type(p3.onSelect) == "function", "Facet UI.StepIndicator: onSelect must be a function")
		assert(p3.listLabel == nil or type(p3.listLabel) == "string", "Facet UI.StepIndicator: listLabel must be a string")
		local Sizing = p3.sizing or "fill"
		local OnSelectFunction = p3.onSelect
		local StepIndicator = ContentValuesModule(p1, "StepIndicator")
		
		if p3.controls then
			p3.controls.diagnostics = StepIndicator.list
		end
		local SnapshotResult = nil
		
		local function snapshot(Steps, p4)
			local Index = {}
			
			for i, step in Steps do
				Index[step.id] = i
			end
			return {
				steps = Steps,
				current = if p4 and Index[p4] then p4 else nil,
				index = Index
			}
		end
		
		SnapshotResult = snapshot(ReadResult, ReadResult1)
		local Flag = false
		local FormulaResult = Compose.formula(function(p5)
			-- upvalues: ReadFunction (upval), p3 (copy), problem (upval), SnapshotResult (ref), Flag (ref), snapshot (copy), StepIndicator (copy)
			local ReadResult = ReadFunction(p3.steps, p5)
			local ReadResult1 = ReadFunction(p3.current, p5)
			local ProblemResult = problem(ReadResult, ReadResult1)
			
			if ProblemResult == nil then
				SnapshotResult = snapshot(ReadResult, ReadResult1)
				Flag = false
			elseif not Flag then
				Flag = true
				StepIndicator.note(`Facet UI.StepIndicator: {ProblemResult}; the last legal snapshot stays`)
			end
			return SnapshotResult
		end)
		
		local function Enabled(p5): boolean
			-- upvalues: ReadFunction (upval), p3 (copy)
			return ReadFunction(p3.enabled, p5) ~= false
		end
		
		local function _(p5): boolean
			-- upvalues: OnSelectFunction (copy)
			return OnSelectFunction ~= nil and (p5.navigable == true and p5.enabled ~= false)
		end
		
		local _ = function(p5, Id)
			local State = p5.state
			
			if not State then
				if p5.id == Id then
					return "current"
				end
				State = "upcoming"
			end
			return State
		end
		
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), p1 (upval)
			local CallbackResult = Callback(FormulaResult)
			
			if #CallbackResult.steps == 0 then
				return "No steps"
			elseif CallbackResult.current == nil then
				return "No current step"
			else
				local IndexEntry = CallbackResult.index[CallbackResult.current]
				
				return p1.phrase("Facet.StepOf", "Step {current} of {count} — {label}", {
					current = IndexEntry,
					count = #CallbackResult.steps,
					label = CallbackResult.steps[IndexEntry].label
				}, Callback)
			end
		end)
		
		local function propose(Id)
			-- upvalues: FormulaResult (copy), OnSelectFunction (copy), ReadFunction (upval), p3 (copy)
			local PeekResult = FormulaResult:peek()
			local IndexEntry = PeekResult.index[Id]
			
			if OnSelectFunction == nil or (ReadFunction(p3.enabled, nil) == false or IndexEntry == nil or Id == PeekResult.current) then return end
			local Step = PeekResult.steps[IndexEntry]
			
			if OnSelectFunction ~= nil and (Step.navigable == true and Step.enabled ~= false) then
				OnSelectFunction(Id)
			end
		end
		
		local _ = function(p5, p6)
			-- upvalues: p1 (upval), FormulaResult (copy)
			local Source = p1.readSource(FormulaResult, p6)
			local IndexEntry = Source.index[p5]
			
			return if IndexEntry then Source.steps[IndexEntry] else nil
		end
		
		local _ = function(p5)
			-- upvalues: p1 (upval), p3 (copy)
			return (p1.controlSize(p3.controlSize, "iconSize", p5))
		end
		
		local function inset(p5, p6): number
			-- upvalues: ReadFunction (upval), p1 (upval), p3 (copy)
			local ReadResult = ReadFunction(p1.config.theme, p6)
			local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
			local ContentInsets = if Control then Control.contentInsets or {} else {}
			
			return (math.max(if p5 == "left" or p5 == "right" then p1.controlSize(p3.controlSize, "paddingX", p6) else p1.metric("space.xs", p6), (if p5 == "left" then ContentInsets.left elseif p5 == "right" then ContentInsets.right elseif p5 == "top" then ContentInsets.top else ContentInsets.bottom) or 0))
		end
		
		local _ = function(p5)
			-- upvalues: TypesUDim (upval), inset (copy)
			return function(p6)
				-- upvalues: TypesUDim (upval), inset (upval), p5 (copy)
				return TypesUDim.new(0, (inset(p5, p6)))
			end
		end
		
		local CellResult = Compose.cell({})
		local t = {}
		local CellResult1 = Compose.cell({})
		
		local function content(Id)
			-- upvalues: p1 (upval), FormulaResult (copy), TypesVector2 (upval), TypesUDim2 (upval), TypesEnum (upval), Host (upval), p3 (copy), config (upval), CellResult (copy), Compose (upval), TypesUDim (upval), inset (copy)
			local Number = p1.text({
				Name = "Number",
				Text = function(p5): string
					-- upvalues: p1 (upval), FormulaResult (upval), Id (copy)
					return (tostring(p1.readSource(FormulaResult, p5).index[Id] or ""))
				end,
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			local LayoutBoundsResult = p1.layoutBounds(Number, (p1.layoutUnit(Number)))
			local TextSizeResult = p1.observeStyled.TextSize(Number)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(Number)
			local v1 = Host.Frame("Cue")({
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = function(Callback)
					-- upvalues: LayoutBoundsResult (copy), TextSizeResult (copy), AbsoluteSizeResult (copy), Number (copy), p1 (upval), p3 (upval), TypesUDim2 (upval)
					local CallbackResult = Callback(LayoutBoundsResult)
					Callback(TextSizeResult)
					Callback(AbsoluteSizeResult)
					local Largest = math.max(p1.controlSize(p3.controlSize, "iconSize", Callback), math.ceil((math.max(CallbackResult.X, CallbackResult.Y, tonumber(Number:GetStyled("TextSize")) or 0))) + 8)
					
					return TypesUDim2.fromOffset(Largest, Largest)
				end,
				Host.UIAspectRatioConstraint({ AspectRatio = 1 }),
				p1.styled(Host.Frame("Circle")({
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromScale(1, 1),
					Visible = function(p5): boolean
						-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
						local Source = p1.readSource(FormulaResult, p5)
						local IndexEntry = Source.index[Id]
						local Step = if IndexEntry then Source.steps[IndexEntry] else nil
						local State = nil
						
						if Step then
							local Current = p1.readSource(FormulaResult, p5).current
							State = Step.state or (if Step.id == Current then "current" else "upcoming")
						else
							State = "upcoming"
						end
						return State ~= "complete" and State ~= "error"
					end,
					Host.UICorner({ CornerRadius = p1.round }),
					Host.UIStroke({ ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border }),
					Number
				}), "step-circle"),
				p1.icon("checkmark", {
					Name = "Check",
					Size = TypesUDim2.fromScale(1, 1),
					Visible = function(p5): boolean
						-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
						local Source = p1.readSource(FormulaResult, p5)
						local IndexEntry = Source.index[Id]
						local Step = if IndexEntry then Source.steps[IndexEntry] else nil
						local IsComplete = false
						
						if Step ~= nil then
							local Current = p1.readSource(FormulaResult, p5).current
							IsComplete = (Step.state or (if Step.id == Current then "current" else "upcoming")) == "complete"
						end
						return IsComplete
					end
				}),
				p1.icon("status.error", {
					Name = "Error",
					Size = TypesUDim2.fromScale(1, 1),
					Visible = function(p5): boolean
						-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
						local Source = p1.readSource(FormulaResult, p5)
						local IndexEntry = Source.index[Id]
						local Step = if IndexEntry then Source.steps[IndexEntry] else nil
						local IsError = false
						
						if Step ~= nil then
							local Current = p1.readSource(FormulaResult, p5).current
							IsError = (Step.state or (if Step.id == Current then "current" else "upcoming")) == "error"
						end
						return IsError
					end
				})
			})
			local Label = p1.text({
				Name = "Label",
				LayoutOrder = 1,
				Text = function(p5)
					-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
					local Source = p1.readSource(FormulaResult, p5)
					local IndexEntry = Source.index[Id]
					local Step = if IndexEntry then Source.steps[IndexEntry] else nil
					
					return if Step then Step.label else ""
				end,
				TextTruncate = TypesEnum.TextTruncate.AtEnd,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			local State = p1.text({
				Name = "State",
				LayoutOrder = 2,
				Text = function(p5)
					-- upvalues: Id (copy), p1 (upval), FormulaResult (upval), config (upval)
					local Source = p1.readSource(FormulaResult, p5)
					local IndexEntry = Source.index[Id]
					local Step = if IndexEntry then Source.steps[IndexEntry] else nil
					
					if Step then
						local Current = p1.readSource(FormulaResult, p5).current
						
						return config[Step.state or (if Step.id == Current then "current" else "upcoming")]
					else
						return ""
					end
				end,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			p1.textRole(State, "caption")
			State:AddTag("facet-secondary")
			local Description = p1.text({
				Name = "Description",
				LayoutOrder = 3,
				Text = function(p5)
					-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
					local Source = p1.readSource(FormulaResult, p5)
					local IndexEntry = Source.index[Id]
					local Step = if IndexEntry then Source.steps[IndexEntry] else nil
					
					return Step and Step.description or ""
				end,
				Visible = function(p5): boolean
					-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
					local Source = p1.readSource(FormulaResult, p5)
					local IndexEntry = Source.index[Id]
					local Step = if IndexEntry then Source.steps[IndexEntry] else nil
					
					return Step ~= nil and Step.description ~= nil
				end,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			p1.textRole(Description, "caption")
			Description:AddTag("facet-secondary")
			local ColumnResult = p1.column({ Label, State, Description }, { Name = "Copy", LayoutOrder = 2 })
			local Measure = p1.text({
				Name = "Measure",
				Visible = false,
				Text = function(p5)
					-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
					local Source = p1.readSource(FormulaResult, p5)
					local IndexEntry = Source.index[Id]
					local Step = if IndexEntry then Source.steps[IndexEntry] else nil
					
					return if Step then Step.label else ""
				end,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			local Copy = table.clone(CellResult:peek())
			Copy[Id] = {
				p1.observe.TextBounds(Measure),
				p1.observe.TextBounds(State),
				p1.observe.TextBounds(Description)
			}
			CellResult:set(Copy)
			Compose.cleanup(function()
				-- upvalues: CellResult (upval), Id (copy)
				local Copy = table.clone(CellResult:peek())
				Copy[Id] = nil
				CellResult:set(Copy)
			end)
			local v2 = "left"
			
			local function PaddingLeft(p5)
				-- upvalues: TypesUDim (upval), inset (upval), v2 (copy)
				return TypesUDim.new(0, (inset(v2, p5)))
			end
			
			local v3 = "right"
			
			local function PaddingRight(p5)
				-- upvalues: TypesUDim (upval), inset (upval), v3 (copy)
				return TypesUDim.new(0, (inset(v3, p5)))
			end
			
			local v4 = "top"
			
			local function PaddingTop(p5)
				-- upvalues: TypesUDim (upval), inset (upval), v4 (copy)
				return TypesUDim.new(0, (inset(v4, p5)))
			end
			
			local v5 = "bottom"
			
			return {
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					VerticalAlignment = TypesEnum.VerticalAlignment.Top,
					Padding = function(p5)
						-- upvalues: TypesUDim (upval), p1 (upval)
						return TypesUDim.new(0, p1.metric("space.s", p5))
					end
				}),
				Host.UIPadding({
					PaddingLeft = PaddingLeft,
					PaddingRight = PaddingRight,
					PaddingTop = PaddingTop,
					PaddingBottom = function(p5)
						-- upvalues: TypesUDim (upval), inset (upval), v5 (copy)
						return TypesUDim.new(0, (inset(v5, p5)))
					end
				}),
				v1,
				ColumnResult,
				Measure
			}
		end
		
		local KeyedResult = Compose.keyed({
			from = function(Callback)
				-- upvalues: FormulaResult (copy)
				return Callback(FormulaResult).steps
			end,
			key = function(p5): string
				-- upvalues: OnSelectFunction (copy)
				local IsEnabled: boolean = OnSelectFunction ~= nil and (p5.navigable == true and p5.enabled ~= false)
				
				return p5.id .. (if IsEnabled then ":button" else ":plain")
			end,
			render = function(p5, LayoutOrder)
				-- upvalues: TypesUDim2 (upval), Sizing (copy), TypesEnum (upval), OnSelectFunction (copy), p1 (upval), FormulaResult (copy), Enabled (copy), propose (copy), content (copy), p2 (upval), Host (upval), Compose (upval), ReadFunction (upval), p3 (copy), t (copy), CellResult1 (copy)
				local PeekResult = p5:peek()
				local Id = PeekResult.id
				local ButtonResult = nil
				local Frame = {
					Name = `Step-{Id}`,
					LayoutOrder = LayoutOrder,
					Size = TypesUDim2.fromScale(0, 0),
					AutomaticSize = if Sizing == "fill" then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY
				}
				
				if OnSelectFunction ~= nil and (PeekResult.navigable == true and PeekResult.enabled ~= false) then
					local config = {
						label = "",
						selected = false,
						Name = Frame.Name,
						LayoutOrder = Frame.LayoutOrder,
						Size = Frame.Size,
						AutomaticSize = Frame.AutomaticSize,
						name = function(p6)
							-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
							local Source = p1.readSource(FormulaResult, p6)
							local IndexEntry = Source.index[Id]
							local Step = if IndexEntry then Source.steps[IndexEntry] else nil
							
							return if Step then Step.label else Id
						end,
						enabled = Enabled,
						onActivate = function()
							-- upvalues: propose (upval), Id (copy)
							propose(Id)
						end
					}
					
					for _, value in content(Id) do
						config[#config + 1] = value
					end
					ButtonResult = p2.Button(config)
				else
					local config1 = {
						BackgroundTransparency = 1,
						Name = Frame.Name,
						LayoutOrder = Frame.LayoutOrder,
						Size = Frame.Size,
						AutomaticSize = Frame.AutomaticSize,
						Attributes = {
							label = function(p6)
								-- upvalues: Id (copy), p1 (upval), FormulaResult (upval)
								local Source = p1.readSource(FormulaResult, p6)
								local IndexEntry = Source.index[Id]
								local Step = if IndexEntry then Source.steps[IndexEntry] else nil
								
								return if Step then Step.label else Id
							end
						}
					}
					
					for _, value1 in content(Id) do
						config1[#config1 + 1] = value1
					end
					ButtonResult = Host.Frame(config1)
					Compose.watch(function(p6)
						-- upvalues: Id (copy), p1 (upval), FormulaResult (upval), ReadFunction (upval), p3 (upval), ButtonResult (ref)
						local Source = p1.readSource(FormulaResult, p6)
						local IndexEntry = Source.index[Id]
						local Step = if IndexEntry then Source.steps[IndexEntry] else nil
						
						if Step and Step.enabled == false or ReadFunction(p3.enabled, p6) == false then
							ButtonResult:AddTag("facet-disabled")
							
							return
						end
						if ButtonResult:HasTag("facet-disabled") then
							ButtonResult:RemoveTag("facet-disabled")
						end
					end)
				end
				t[Id] = ButtonResult
				local Copy = table.clone(CellResult1:peek())
				Copy[Id] = {
					p1.observe.AbsolutePosition(ButtonResult),
					p1.observe.AbsoluteSize(ButtonResult)
				}
				CellResult1:set(Copy)
				Compose.cleanup(function()
					-- upvalues: t (upval), Id (copy), ButtonResult (ref), CellResult1 (upval)
					if rawequal(t[Id], ButtonResult) then
						t[Id] = nil
					end
					local Copy = table.clone(CellResult1:peek())
					Copy[Id] = nil
					CellResult1:set(Copy)
				end)
				
				return ButtonResult
			end
		})
		local CellResult2 = Compose.cell({ x = 0, width = 0 })
		local ReducedResult = ReducedFunction(p1)
		local FormulaResult2 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), CellResult1 (copy), CellResult2 (copy)
			local CallbackResult = Callback(FormulaResult)
			local CallbackResultEntry = if CallbackResult.current then Callback(CellResult1)[CallbackResult.current] else nil
			local CallbackResult1 = Callback(CellResult2)
			
			return if CallbackResultEntry == nil or CallbackResult1.width <= 0 then { x = 0, width = 0, shown = false } else {
				shown = true,
				x = (Callback(CallbackResultEntry[1]).X - CallbackResult1.x) / CallbackResult1.width,
				width = Callback(CallbackResultEntry[2]).X / CallbackResult1.width
			}
		end)
		local Control = p1.motionSpring("control")
		local SpringResult = Runtime.spring(function(Callback)
			-- upvalues: FormulaResult2 (copy)
			return Callback(FormulaResult2).x
		end, { period = Control.period, damping = Control.damping })
		local SpringResult1 = Runtime.spring(function(Callback)
			-- upvalues: FormulaResult2 (copy)
			return Callback(FormulaResult2).width
		end, { period = Control.period, damping = Control.damping })
		local UIListLayoutResult = Host.UIListLayout({
			FillDirection = TypesEnum.FillDirection.Horizontal,
			SortOrder = TypesEnum.SortOrder.LayoutOrder,
			VerticalAlignment = TypesEnum.VerticalAlignment.Top,
			ItemLineAlignment = TypesEnum.ItemLineAlignment.Stretch,
			HorizontalFlex = if Sizing == "fill" then TypesEnum.UIFlexAlignment.Fill else TypesEnum.UIFlexAlignment.None,
			Padding = function(p6)
				-- upvalues: TypesUDim (upval), p1 (upval)
				return TypesUDim.new(0, p1.metric("space.m", p6))
			end
		})
		local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(UIListLayoutResult)
		local v1 = Host.Frame("Strip")({
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			Host.Frame("Row")({
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				UIListLayoutResult,
				Host.UIPadding({
					PaddingBottom = function(p6)
						-- upvalues: TypesUDim (upval), p1 (upval)
						return TypesUDim.new(0, p1.metric("space.xs", p6) + 2)
					end
				}),
				KeyedResult
			}),
			(p1.styled(Host.Frame({
				Name = "Underline",
				BorderSizePixel = 0,
				ZIndex = 2,
				AnchorPoint = TypesVector2.new(0, 1),
				Visible = function(Callback)
					-- upvalues: FormulaResult2 (copy)
					return Callback(FormulaResult2).shown
				end,
				Position = function(Callback)
					-- upvalues: ReducedResult (copy), FormulaResult2 (copy), SpringResult (copy), TypesUDim2 (upval)
					return TypesUDim2.new(if ReducedResult(Callback) then Callback(FormulaResult2).x else Callback(SpringResult), 0, 1, 0)
				end,
				Size = function(Callback)
					-- upvalues: ReducedResult (copy), FormulaResult2 (copy), SpringResult1 (copy), TypesUDim2 (upval)
					return TypesUDim2.new(if ReducedResult(Callback) then Callback(FormulaResult2).width else Callback(SpringResult1), 0, 0, 2)
				end
			}), "selection-indicator"))
		})
		local AbsolutePositionResult = p1.observe.AbsolutePosition(v1)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(v1)
		local LayoutUnitResult = p1.layoutUnit(v1)
		Compose.watch(function(Callback)
			-- upvalues: CellResult2 (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy)
			CellResult2:set({
				x = Callback(AbsolutePositionResult).X,
				width = Callback(AbsoluteSizeResult).X
			})
		end)
		local CellResult3 = Compose.cell(0)
		local FormulaResult3 = Compose.formula(function(Callback): string
			-- upvalues: FormulaResult (copy), CellResult3 (copy), Sizing (copy), AbsoluteContentSizeResult (copy), LayoutUnitResult (copy), p1 (upval), inset (copy), CellResult (copy), p3 (copy)
			local CallbackResult = Callback(FormulaResult)
			local CallbackResult1: number = Callback(CellResult3)
			
			if #CallbackResult.steps == 0 or CallbackResult1 <= 0 then
				return "row"
			end
			if Sizing == "hug" then
				return if Callback(AbsoluteContentSizeResult).X / Callback(LayoutUnitResult) <= CallbackResult1 then "row" else "summary"
			end
			local SpaceM = p1.metric("space.m", Callback)
			local SpaceS = p1.metric("space.s", Callback)
			local NewLeft = inset("left", Callback) + inset("right", Callback)
			local CallbackResult2 = Callback(CellResult)
			local Largest = 0
			
			for _, step in CallbackResult.steps do
				local Largest1 = 0
				local CallbackResultEntry = CallbackResult2[step.id] or {}
				for _, value in ipairs(CallbackResultEntry) do
					Largest1 = math.max(Largest1, Callback(value).X / Callback(LayoutUnitResult))
				end
				Largest = math.max(Largest, p1.controlSize(p3.controlSize, "iconSize", Callback) + SpaceS + Largest1 + NewLeft)
			end
			return if Largest * #CallbackResult.steps + SpaceM * (#CallbackResult.steps - 1) <= CallbackResult1 then "row" else "summary"
		end)
		local CellResult4 = Compose.cell(false)
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: FormulaResult (copy), CellResult4 (copy)
			Callback(FormulaResult)
			
			if CellResult4:peek() then
				CellResult4:set(false)
			end
		end)
		local RowResult = p1.row({
			p1.text({
				Name = "Summary",
				Text = FormulaResult1,
				TextTruncate = TypesEnum.TextTruncate.AtEnd,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			}),
			Compose.show(function(Callback): boolean
				-- upvalues: FormulaResult (copy)
				return #Callback(FormulaResult).steps > 0
			end, function()
				-- upvalues: p2 (upval), p3 (copy), CellResult4 (copy), Enabled (copy), FormulaResult (copy), config (upval), OnSelectFunction (copy), propose (copy)
				return p2.Menu({
					Name = "ShowSteps",
					label = p3.listLabel or "Steps",
					isPresented = CellResult4,
					enabled = Enabled,
					items = function(Callback)
						-- upvalues: FormulaResult (upval), config (upval), OnSelectFunction (upval), propose (upval)
						local List = {}
						local CallbackResult = Callback(FormulaResult)
						
						for _, step in CallbackResult.steps do
							local Id = step.id
							local Current = CallbackResult.current
							table.insert(List, {
								dismiss = false,
								id = `Item-{Id}`,
								label = step.label,
								description = config[step.state or (if step.id == Current then "current" else "upcoming")],
								marked = Id == CallbackResult.current,
								enabled = OnSelectFunction ~= nil and (step.navigable == true and step.enabled ~= false),
								onSelect = function()
									-- upvalues: propose (upval), Id (copy)
									propose(Id)
								end
							})
						end
						return List
					end
				})
			end)
		}, { Name = "SummaryRow" })
		local FrameResult = Host.Frame(p1.props(p3, {
			"steps", "current", "onSelect", "sizing", "listLabel", "controlSize",
			"enabled", "controls"
		}, {
			Name = "StepIndicator",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			Attributes = {
				FacetCurrent = function(Callback)
					-- upvalues: FormulaResult (copy)
					return Callback(FormulaResult).current
				end,
				FacetSummary = FormulaResult1,
				FacetForm = FormulaResult3,
				FacetListOpen = CellResult4
			},
			v1,
			RowResult
		}))
		Runtime.decorate(v1, {
			Visible = function(Callback): boolean
				-- upvalues: FormulaResult3 (copy)
				return Callback(FormulaResult3) == "row"
			end
		})
		Runtime.decorate(RowResult, {
			Visible = function(Callback): boolean
				-- upvalues: FormulaResult3 (copy)
				return Callback(FormulaResult3) == "summary"
			end
		})
		local LayoutSizeResult = p1.layoutSize(FrameResult, LayoutUnitResult)
		Compose.watch(function(Callback)
			-- upvalues: CellResult3 (copy), LayoutSizeResult (copy)
			CellResult3:set(Callback(LayoutSizeResult).X)
		end)
		
		return FrameResult
	end)
end