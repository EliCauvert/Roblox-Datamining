local _ = require("./theme_types")
local _ = require("./control_types")
local _ = require("./types")
local _ = require("./content_types")
local _ = require("../vendor/compose/core")
local PaginationWindowModule = require("./pagination_window")
local ContentValuesModule = require("./content_values")
local _ = require("./content_props")
local list = { "first", "previous", "next", "last" }

return function(p1, p2)
	-- upvalues: ContentValuesModule (copy), PaginationWindowModule (copy), list (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function isPage(Value: number): boolean
		return type(Value) == "number" and (Value == Value and Value % 1 == 0) and math.abs(Value) <= 9007199254740991
	end
	
	local function isCount(Value: number): boolean
		return Value == nil or type(Value) == "number" and (type(Value) == "number" and (Value == Value and (Value % 1 == 0 and math.abs(Value) <= 9007199254740991) and Value >= 0))
	end
	
	local function isFlag(p3): boolean
		return p3 == nil or type(p3) == "boolean"
	end
	
	local function _(p3, p4)
		-- upvalues: ReadFunction (copy)
		local ReadResult = ReadFunction(p4)
		assert(ReadResult == nil or type(ReadResult) == "boolean", `Facet UI.Pagination: {p3} is a boolean or a readable boolean`)
	end
	
	local _ = function(p3, Value: number)
		assert(Value == nil or type(Value) == "number" and (Value == Value and (Value % 1 == 0 and math.abs(Value) <= 9007199254740991) and (Value >= 0 and Value <= 20)), `Facet UI.Pagination: {p3} is a whole number from 0 to {20}`)
	end
	
	p2.Pagination = p1.construct("Pagination", function(Frame)
		-- upvalues: ReadFunction (copy), TypesEnum (copy), ContentValuesModule (upval), p1 (copy), isPage (copy), isCount (copy), isFlag (copy), Compose (copy), ReadSourceFunction (copy), PaginationWindowModule (upval), p2 (copy), TypesVector2 (copy), TypesUDim2 (copy), Host (copy), list (upval)
		local ReadResult: number = ReadFunction(Frame.page)
		assert(type(ReadResult) == "number" and (ReadResult == ReadResult and ReadResult % 1 == 0) and math.abs(ReadResult) <= 9007199254740991, "Facet UI.Pagination: page is required: a finite whole number or a readable of one")
		assert(type(Frame.onChange) == "function", "Facet UI.Pagination: onChange(nextPage) is required")
		local ReadResult1: number = ReadFunction(Frame.pageCount)
		assert(ReadResult1 == nil or type(ReadResult1) == "number" and (type(ReadResult1) == "number" and (ReadResult1 == ReadResult1 and (ReadResult1 % 1 == 0 and math.abs(ReadResult1) <= 9007199254740991) and ReadResult1 >= 0)), "Facet UI.Pagination: pageCount is a whole number of 0 or more, or nil for an unknown count")
		local ReadResult2 = ReadFunction(Frame.hasNext)
		assert(ReadResult2 == nil or type(ReadResult2) == "boolean", "Facet UI.Pagination: hasNext is a boolean or a readable boolean")
		local ReadResult3 = ReadFunction(Frame.hasPrevious)
		assert(ReadResult3 == nil or type(ReadResult3) == "boolean", "Facet UI.Pagination: hasPrevious is a boolean or a readable boolean")
		local ReadResult4 = ReadFunction(Frame.enabled)
		assert(ReadResult4 == nil or type(ReadResult4) == "boolean", "Facet UI.Pagination: enabled is a boolean or a readable boolean")
		local SiblingCount: number = Frame.siblingCount
		assert(SiblingCount == nil or type(SiblingCount) == "number" and (SiblingCount == SiblingCount and (SiblingCount % 1 == 0 and math.abs(SiblingCount) <= 9007199254740991) and (SiblingCount >= 0 and SiblingCount <= 20)), `Facet UI.Pagination: siblingCount is a whole number from 0 to {20}`)
		local BoundaryCount: number = Frame.boundaryCount
		assert(BoundaryCount == nil or type(BoundaryCount) == "number" and (BoundaryCount == BoundaryCount and (BoundaryCount % 1 == 0 and math.abs(BoundaryCount) <= 9007199254740991) and (BoundaryCount >= 0 and BoundaryCount <= 20)), `Facet UI.Pagination: boundaryCount is a whole number from 0 to {20}`)
		assert(Frame.showFirstLast == nil or type(Frame.showFirstLast) == "boolean", "Facet UI.Pagination: showFirstLast is a boolean")
		local Form = Frame.form or "numbers"
		assert(Form == "numbers" or (Form == "arrows" or Form == "label"), "Facet UI.Pagination: form is numbers, arrows or label")
		local Direction = Frame.direction or "ltr"
		assert(Direction == "ltr" or Direction == "rtl", "Facet UI.Pagination: direction is ltr or rtl")
		local ReadResult5 = ReadFunction(Frame.AutomaticSize)
		assert(ReadResult5 ~= TypesEnum.AutomaticSize.X and ReadResult5 ~= TypesEnum.AutomaticSize.XY, "Facet UI.Pagination: AutomaticSize cannot include X. The window narrows to the width that it is offered")
		local SiblingCount1 = Frame.siblingCount or 1
		local BoundaryCount1 = Frame.boundaryCount or 1
		local IsShowFirstLast = Frame.showFirstLast == true
		local OnChangeFunction = Frame.onChange
		local Pagination = ContentValuesModule(p1, "Pagination")
		
		if Frame.controls then
			Frame.controls.diagnostics = Pagination.list
		end
		local Page = Pagination.legal("page", Frame.page, isPage, "must be a finite whole number")
		local PageCount = Pagination.legal("pageCount", Frame.pageCount, isCount, "must be a whole number of 0 or more, or nil")
		local HasNext = Pagination.legal("hasNext", Frame.hasNext, isFlag, "must be a boolean")
		local HasPrevious = Pagination.legal("hasPrevious", Frame.hasPrevious, isFlag, "must be a boolean")
		
		local function Enabled(p3): boolean
			-- upvalues: ReadFunction (upval), Frame (copy)
			return ReadFunction(Frame.enabled, p3) ~= false
		end
		
		local v1 = nil
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: Page (copy), PageCount (copy), v1 (ref), Pagination (copy), HasPrevious (copy), HasNext (copy)
			local CallbackResult: number = Callback(Page)
			local CallbackResult1: number = Callback(PageCount)
			local Largest = if CallbackResult1 == 0 then nil elseif CallbackResult1 == nil then math.max(CallbackResult, 1) else math.clamp(CallbackResult, 1, CallbackResult1)
			local Text = if Largest == nil or Largest == CallbackResult then nil else `{CallbackResult}->{Largest}`
			
			if Text ~= nil and Text ~= v1 then
				Pagination.note(`Facet UI.Pagination: page {CallbackResult} is outside 1 to {CallbackResult1 or "?"}; the row shows {Largest}`)
			end
			v1 = Text
			
			return if Largest == nil then {
				current = nil,
				hasPrevious = false,
				hasNext = false,
				count = CallbackResult1
			} elseif CallbackResult1 == nil then {
				count = nil,
				current = Largest,
				hasPrevious = Callback(HasPrevious) == true and Largest > 1,
				hasNext = Callback(HasNext) == true and Largest < 9007199254740991
			} else {
				current = Largest,
				count = CallbackResult1,
				hasPrevious = Largest > 1,
				hasNext = Largest < CallbackResult1
			}
		end)
		
		local function target(p3, Current: number, p4)
			-- upvalues: p1 (upval), FormulaResult (copy)
			local Source = p1.readSource(FormulaResult, p4)
			local Current1: number = Source.current
			
			return if Current1 == nil then nil elseif p3 == "previous" then if Source.hasPrevious then Current1 - 1 else nil elseif p3 == "next" then if Source.hasNext then Current1 + 1 else nil elseif p3 == "first" then if Source.hasPrevious then 1 else nil elseif p3 == "last" then if Source.count == nil or Current1 >= Source.count then nil else Source.count elseif Current == nil or Current == Current1 or Current < 1 or Source.count ~= nil and Current > Source.count then nil else Current
		end
		
		local function _(p3): number
			-- upvalues: p1 (upval), Frame (copy)
			return (math.max(p1.metric("targetSizes.minimum", p3), (p1.controlSize(Frame.controlSize, "height", p3))))
		end
		
		local _ = function(p3)
			-- upvalues: p1 (upval)
			return (p1.metric("space.xs", p3))
		end
		
		local _ = function(Name, Text)
			-- upvalues: p1 (upval), TypesEnum (upval)
			local TextResult = p1.text({
				Visible = false,
				TextWrapped = false,
				Name = Name,
				Text = Text,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			TextResult:AddTag("facet-button")
			
			return TextResult
		end
		
		local DigitMeasure = p1.text({
			Name = "DigitMeasure",
			Text = "0000000000",
			Visible = false,
			TextWrapped = false,
			AutomaticSize = TypesEnum.AutomaticSize.XY
		})
		DigitMeasure:AddTag("facet-button")
		local EllipsisMeasure = p1.text({
			Name = "EllipsisMeasure",
			Text = "…",
			Visible = false,
			TextWrapped = false,
			AutomaticSize = TypesEnum.AutomaticSize.XY
		})
		EllipsisMeasure:AddTag("facet-button")
		local LabelMeasure = p1.text({
			Name = "LabelMeasure",
			Visible = false,
			TextWrapped = false,
			Text = function(Callback)
				-- upvalues: FormulaResult (copy), p1 (upval)
				local CallbackResult = Callback(FormulaResult)
				
				return if CallbackResult.current == nil then "No pages" elseif CallbackResult.count == nil then p1.phrase("Facet.Page", "Page {current}", {
					current = string.rep("0", (math.max(4, #tostring(CallbackResult.current))))
				}, Callback) else p1.phrase("Facet.PageOf", "Page {current} of {count}", {
					current = string.rep("0", #tostring(CallbackResult.count)),
					count = CallbackResult.count
				}, Callback)
			end,
			AutomaticSize = TypesEnum.AutomaticSize.XY
		})
		LabelMeasure:AddTag("facet-button")
		local LayoutUnitResult = p1.layoutUnit(DigitMeasure)
		local LayoutBoundsResult = p1.layoutBounds(DigitMeasure, LayoutUnitResult)
		local LayoutBoundsResult1 = p1.layoutBounds(EllipsisMeasure, LayoutUnitResult)
		local LayoutBoundsResult2 = p1.layoutBounds(LabelMeasure, LayoutUnitResult)
		local CellResult = Compose.cell(0)
		
		local function pageWidth(Current, p3): number
			-- upvalues: ReadSourceFunction (upval), LayoutBoundsResult (copy), ReadFunction (upval), p1 (upval)
			local XRatio = ReadSourceFunction(LayoutBoundsResult, p3).X / 10
			local ReadResult = ReadFunction(p1.config.theme, p3)
			local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
			local ContentInsets = if Control then Control.contentInsets else nil
			
			return (math.max(p1.controlSize("compact", "height", p3), (math.ceil(XRatio * #tostring(Current) + (2 * p1.controlSize("compact", "paddingX", p3) + (ContentInsets and ContentInsets.left or 0) + (ContentInsets and ContentInsets.right or 0))))))
		end
		
		local _ = function(p3, p4): number
			-- upvalues: p1 (upval), Frame (copy), pageWidth (copy)
			return (math.max(math.max(p1.metric("targetSizes.minimum", p4), (p1.controlSize(Frame.controlSize, "height", p4))), (pageWidth(p3, p4))))
		end
		
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), Form (copy), PaginationWindowModule (upval), SiblingCount1 (copy), BoundaryCount1 (copy), p1 (upval), IsShowFirstLast (copy), Frame (copy), LayoutBoundsResult1 (copy), pageWidth (copy), CellResult (copy), Direction (copy)
			local CallbackResult = Callback(FormulaResult)
			local t = {}
			local Current = CallbackResult.current
			
			if Current == nil then
				t[#t + 1] = { kind = "label", key = "label" }
				
				return t
			end
			local Form1: string = Form
			
			if Form1 == "numbers" and CallbackResult.count == nil then
				Form1 = "label"
			end
			local List = {}
			
			if Form1 == "numbers" then
				List = PaginationWindowModule(Current, assert(CallbackResult.count), SiblingCount1, BoundaryCount1)
				local SpaceXs = p1.metric("space.xs", Callback)
				local v2 = (if IsShowFirstLast then 2 else 0) + 2
				
				local function need()
					-- upvalues: v2 (copy), Callback (copy), p1 (upval), Frame (upval), SpaceXs (copy), List (ref), LayoutBoundsResult1 (upval), pageWidth (upval)
					local ScaledLargest = v2 * (math.max(p1.metric("targetSizes.minimum", Callback), (p1.controlSize(Frame.controlSize, "height", Callback))) + SpaceXs)
					local Page = nil
					
					for _, value in List do
						if Page ~= nil and Page + 1 < value.page then
							ScaledLargest += Callback(LayoutBoundsResult1).X + SpaceXs
						end
						ScaledLargest += math.max(math.max(p1.metric("targetSizes.minimum", Callback), (p1.controlSize(Frame.controlSize, "height", Callback))), (pageWidth(value.page, Callback))) + SpaceXs
						Page = value.page
					end
					return ScaledLargest
				end
				
				local CallbackResult1: number = Callback(CellResult)
				local CallbackResult2 = if CallbackResult1 > 0 then CallbackResult1 else 1e999
				while CallbackResult2 < need() do
					local Index = nil
					
					for _, value in { "boundary", "neighbor" } do
						for i, value1 in List do
							if value1.role == value then
								local Magnitude = math.abs(value1.page - Current)
								local Magnitude1: number = if Index == nil then -1 else math.abs(List[Index].page - Current)
								
								if Magnitude1 < Magnitude or Magnitude == Magnitude1 and Index ~= nil and List[Index].page < value1.page then
									Index = i
								end
							end
						end
						if Index ~= nil then break end
					end
					if Index == nil then break end
					table.remove(List, Index)
				end
				if CallbackResult2 < need() then
					Form1 = "label"
				end
			end
			if IsShowFirstLast then
				t[#t + 1] = { kind = "first", key = "first" }
			end
			t[#t + 1] = { kind = "previous", key = "previous" }
			
			if Form1 == "numbers" then
				local Page = nil
				
				for _, value2 in List do
					if Page ~= nil and Page + 1 < value2.page then
						t[#t + 1] = { kind = "gap", key = `gap-{Page}` }
					end
					t[#t + 1] = {
						kind = "page",
						key = tostring(value2.page),
						page = value2.page
					}
					Page = value2.page
				end
			elseif Form1 == "label" then
				t[#t + 1] = { kind = "label", key = "label" }
			end
			t[#t + 1] = { kind = "next", key = "next" }
			
			if IsShowFirstLast and CallbackResult.count ~= nil then
				t[#t + 1] = { kind = "last", key = "last" }
			end
			if Direction == "rtl" then
				local List1 = {}
				
				for i1 = #t, 1, -1 do
					table.insert(List1, t[i1])
				end
				t = List1
			end
			return t
		end)
		local Flag = false
		Compose.cleanup(function()
			-- upvalues: Flag (ref)
			Flag = true
		end)
		
		local _ = function(p3, p4)
			-- upvalues: Flag (ref), ReadFunction (upval), Frame (copy), target (copy), OnChangeFunction (copy)
			if Flag or ReadFunction(Frame.enabled, nil) == false then return end
			local TargetResult = target(p3, p4)
			
			if TargetResult ~= nil then
				OnChangeFunction(TargetResult)
			end
		end
		
		local config = {
			first = if Direction == "rtl" then "chevron.last" else "chevron.first",
			previous = if Direction == "rtl" then "chevron.trailing" else "chevron.leading",
			next = if Direction == "rtl" then "chevron.leading" else "chevron.trailing",
			last = if Direction == "rtl" then "chevron.first" else "chevron.last"
		}
		local config1 = {
			first = "First page",
			previous = "Previous page",
			next = "Next page",
			last = "Last page"
		}
		local GuiService = p1.config.services.GuiService
		local ButtonResults = {}
		local ButtonResults1 = {}
		local Flag1 = false
		local CellResult1 = Compose.cell(0)
		local CellResult2 = Compose.cell(nil)
		
		local _ = function(p3)
			-- upvalues: Compose (upval), GuiService (copy), p1 (upval), Flag1 (ref), CellResult1 (copy)
			Compose.cleanup(function()
				-- upvalues: GuiService (upval), p1 (upval), p3 (copy), Flag1 (upval), CellResult1 (upval)
				if GuiService and p1.selection.get() == p3 then
					Flag1 = true
					CellResult1:update(function(p4: number): number
						return p4 + 1
					end)
				end
			end)
		end
		
		local Ancestor = Host.ScrollingFrame("Row")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = TypesUDim2.fromScale(1, 1),
			CanvasSize = TypesUDim2.fromOffset(0, 0),
			AutomaticCanvasSize = TypesEnum.AutomaticSize.X,
			ScrollingDirection = TypesEnum.ScrollingDirection.X,
			ScrollBarThickness = 0,
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Horizontal,
				HorizontalAlignment = TypesEnum.HorizontalAlignment.Center,
				VerticalAlignment = TypesEnum.VerticalAlignment.Center,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = function(p3)
					-- upvalues: p1 (upval)
					return p1.types.UDim.new(0, (p1.metric("space.xs", p3)))
				end
			}),
			(Compose.keyed({
				from = FormulaResult1,
				key = function(p3)
					return p3.key
				end,
				render = function(p3, LayoutOrder)
					-- upvalues: p2 (upval), TypesVector2 (upval), TypesUDim2 (upval), pageWidth (copy), p1 (upval), TypesEnum (upval), FormulaResult (copy), Enabled (copy), Flag (ref), ReadFunction (upval), Frame (copy), OnChangeFunction (copy), ButtonResults (copy), Compose (upval), GuiService (copy), Flag1 (ref), CellResult1 (copy), Host (upval), LayoutBoundsResult2 (copy), config1 (copy), config (copy), ButtonResults1 (copy)
					local PeekResult = p3:peek()
					
					if PeekResult.kind == "page" then
						local Current = assert(PeekResult.page)
						local ButtonResult = p2.Button({
							controlSize = "compact",
							Name = `Page-{Current}`,
							label = tostring(Current),
							AnchorPoint = TypesVector2.new(0.5, 0.5),
							Position = TypesUDim2.fromScale(0.5, 0.5),
							Size = function(p4)
								-- upvalues: TypesUDim2 (upval), pageWidth (upval), Current (copy), p1 (upval)
								return TypesUDim2.fromOffset(pageWidth(Current, p4), p1.controlSize("compact", "height", p4))
							end,
							AutomaticSize = TypesEnum.AutomaticSize.None,
							selected = function(Callback): boolean
								-- upvalues: FormulaResult (upval), Current (copy)
								return Callback(FormulaResult).current == Current
							end,
							enabled = Enabled,
							onActivate = function()
								-- upvalues: Current (copy), Flag (upval), ReadFunction (upval), Frame (upval), p1 (upval), FormulaResult (upval), OnChangeFunction (upval)
								if not Flag then
									if ReadFunction(Frame.enabled, nil) == false then return end
									local Source = p1.readSource(FormulaResult, nil)
									local Current1 = Source.current
									local Current2 = if Current1 == nil then nil elseif Current == nil or Current == Current1 or Current < 1 or Source.count ~= nil and Current > Source.count then nil else Current
									
									if Current2 ~= nil then
										OnChangeFunction(Current2)
									end
								end
							end
						})
						ButtonResults[Current] = ButtonResult
						Compose.cleanup(function()
							-- upvalues: GuiService (upval), p1 (upval), ButtonResult (copy), Flag1 (upval), CellResult1 (upval)
							if GuiService and p1.selection.get() == ButtonResult then
								Flag1 = true
								CellResult1:update(function(p4: number): number
									return p4 + 1
								end)
							end
						end)
						Compose.cleanup(function()
							-- upvalues: ButtonResults (upval), Current (copy), ButtonResult (copy)
							if ButtonResults[Current] == ButtonResult then
								ButtonResults[Current] = nil
							end
						end)
						
						return Host.Frame(`Slot-{Current}`)({
							LayoutOrder = LayoutOrder,
							BackgroundTransparency = 1,
							Size = function(p4)
								-- upvalues: TypesUDim2 (upval), Current (copy), p1 (upval), Frame (upval), pageWidth (upval)
								return TypesUDim2.fromOffset(math.max(math.max(p1.metric("targetSizes.minimum", p4), (p1.controlSize(Frame.controlSize, "height", p4))), (pageWidth(Current, p4))), (math.max(p1.metric("targetSizes.minimum", p4), (p1.controlSize(Frame.controlSize, "height", p4)))))
							end,
							ButtonResult
						})
					elseif PeekResult.kind == "gap" then
						local TextResult = p1.text({
							Text = "…",
							Name = PeekResult.key,
							LayoutOrder = LayoutOrder,
							AutomaticSize = TypesEnum.AutomaticSize.XY
						})
						TextResult:AddTag("facet-secondary")
						
						return TextResult
					elseif PeekResult.kind == "label" then
						return p1.text({
							Name = "Label",
							LayoutOrder = LayoutOrder,
							Text = function(Callback)
								-- upvalues: FormulaResult (upval), p1 (upval)
								local CallbackResult = Callback(FormulaResult)
								
								return if CallbackResult.current == nil then "No pages" elseif CallbackResult.count == nil then p1.phrase("Facet.Page", "Page {current}", { current = CallbackResult.current }, Callback) else p1.phrase("Facet.PageOf", "Page {current} of {count}", {
									current = CallbackResult.current,
									count = CallbackResult.count
								}, Callback)
							end,
							TextXAlignment = TypesEnum.TextXAlignment.Center,
							AutomaticSize = function(Callback)
								-- upvalues: LayoutBoundsResult2 (upval), TypesEnum (upval)
								return if Callback(LayoutBoundsResult2).X > 0 then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.XY
							end,
							Size = function(Callback)
								-- upvalues: TypesUDim2 (upval), LayoutBoundsResult2 (upval), p1 (upval), Frame (upval)
								return TypesUDim2.fromOffset(math.ceil(Callback(LayoutBoundsResult2).X), (math.max(p1.metric("targetSizes.minimum", Callback), (p1.controlSize(Frame.controlSize, "height", Callback)))))
							end
						})
					else
						local Kind: string = PeekResult.kind
						local ButtonResult1 = p2.Button({
							label = "",
							Name = string.upper((string.sub(Kind, 1, 1))) .. string.sub(Kind, 2),
							LayoutOrder = LayoutOrder,
							name = config1[Kind],
							icon = config[Kind],
							Size = function(p4)
								-- upvalues: TypesUDim2 (upval), p1 (upval), Frame (upval)
								return TypesUDim2.fromOffset(math.max(p1.metric("targetSizes.minimum", p4), (p1.controlSize(Frame.controlSize, "height", p4))), (math.max(p1.metric("targetSizes.minimum", p4), (p1.controlSize(Frame.controlSize, "height", p4)))))
							end,
							AutomaticSize = TypesEnum.AutomaticSize.None,
							enabled = function(p4): boolean
								-- upvalues: ReadFunction (upval), Frame (upval), Kind (copy), p1 (upval), FormulaResult (upval)
								local IsReadResult = ReadFunction(Frame.enabled, p4) ~= false
								
								if IsReadResult then
									local Source = p1.readSource(FormulaResult, p4)
									local Current: number = Source.current
									IsReadResult = (if Current == nil then nil elseif Kind == "previous" then if Source.hasPrevious then Current - 1 else nil elseif Kind == "next" then if Source.hasNext then Current + 1 else nil elseif Kind == "first" then if Source.hasPrevious then 1 else nil elseif Kind == "last" then if Source.count == nil or Current >= Source.count then nil else Source.count else nil) ~= nil
								end
								return IsReadResult
							end,
							onActivate = function()
								-- upvalues: Kind (copy), Flag (upval), ReadFunction (upval), Frame (upval), p1 (upval), FormulaResult (upval), OnChangeFunction (upval)
								if not Flag then
									if ReadFunction(Frame.enabled, nil) == false then return end
									local Source = p1.readSource(FormulaResult, nil)
									local Current: number = Source.current
									local CurrentDelta = if Current == nil then nil elseif Kind == "previous" then if Source.hasPrevious then Current - 1 else nil elseif Kind == "next" then if Source.hasNext then Current + 1 else nil elseif Kind == "first" then if Source.hasPrevious then 1 else nil elseif Kind == "last" then if Source.count == nil or Current >= Source.count then nil else Source.count else nil
									
									if CurrentDelta ~= nil then
										OnChangeFunction(CurrentDelta)
									end
								end
							end
						})
						ButtonResults1[Kind] = ButtonResult1
						Compose.cleanup(function()
							-- upvalues: GuiService (upval), p1 (upval), ButtonResult1 (copy), Flag1 (upval), CellResult1 (upval)
							if GuiService and p1.selection.get() == ButtonResult1 then
								Flag1 = true
								CellResult1:update(function(p4: number): number
									return p4 + 1
								end)
							end
						end)
						Compose.cleanup(function()
							-- upvalues: ButtonResults1 (upval), Kind (copy), ButtonResult1 (copy)
							if ButtonResults1[Kind] == ButtonResult1 then
								ButtonResults1[Kind] = nil
							end
						end)
						
						return ButtonResult1
					end
				end
			}))
		})
		
		if GuiService and GuiService.GetPropertyChangedSignal then
			local ObserveResult = p1.selection.observe()
			p1.runtime.decorate(Ancestor, {
				Selectable = function(Callback): boolean
					-- upvalues: ObserveResult (copy), Ancestor (copy)
					local CallbackResult = Callback(ObserveResult)
					
					return not (CallbackResult ~= nil and CallbackResult:IsDescendantOf(Ancestor))
				end
			})
		end
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult (copy), Ancestor (copy)
			local Current = Callback(FormulaResult).current
			Ancestor:SetAttribute("FacetEntry", if Current then `Page-{Current}` else nil)
		end)
		local FrameResult = Host.Frame(p1.props(Frame, {
			"page", "onChange", "pageCount", "hasNext", "hasPrevious", "siblingCount",
			"boundaryCount", "showFirstLast", "form", "direction", "controlSize",
			"enabled", "controls"
		}, {
			Name = "Pagination",
			BackgroundTransparency = 1,
			Size = function(p3)
				-- upvalues: TypesUDim2 (upval), p1 (upval), Frame (copy)
				return TypesUDim2.new(1, 0, 0, (math.max(p1.metric("targetSizes.minimum", p3), (p1.controlSize(Frame.controlSize, "height", p3)))))
			end,
			Attributes = {
				FacetCurrent = function(Callback)
					-- upvalues: FormulaResult (copy)
					return Callback(FormulaResult).current
				end,
				FacetCount = function(Callback)
					-- upvalues: FormulaResult (copy)
					return Callback(FormulaResult).count
				end,
				FacetForm = Form,
				FacetDirection = Direction
			},
			DigitMeasure,
			EllipsisMeasure,
			LabelMeasure,
			Ancestor
		}))
		local LayoutSizeResult = p1.layoutSize(FrameResult, LayoutUnitResult)
		Compose.watch(function(Callback)
			-- upvalues: LayoutSizeResult (copy), CellResult (copy)
			local X: number = Callback(LayoutSizeResult).X
			
			if X > 0 then
				CellResult:set(X)
			end
		end)
		
		local function neighbour()
			-- upvalues: FrameResult (copy)
			local LayerCollector = FrameResult:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector == nil then
				return nil
			end
			local NewAbsolutePosition = FrameResult.AbsolutePosition + FrameResult.AbsoluteSize / 2
			local v3 = nil
			local v4 = 1e999
			
			for _, Gui in LayerCollector:GetDescendants() do
				if Gui:IsA("GuiObject") and Gui.Selectable and Gui.Visible and not Gui:IsDescendantOf(FrameResult) and Gui.AbsoluteSize.X > 0 and Gui.AbsoluteSize.Y > 0 then
					local Distance = (Gui.AbsolutePosition + Gui.AbsoluteSize / 2 - NewAbsolutePosition).Magnitude
					
					if Distance < v4 then
						v3 = Gui
						v4 = Distance
					end
				end
			end
			return v3
		end
		
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult1 (copy), CellResult1 (copy), FormulaResult (copy), GuiService (copy), p1 (upval), ButtonResults1 (copy), Flag1 (ref), ButtonResults (copy), list (upval), neighbour (copy), CellResult2 (copy)
			Callback(FormulaResult1)
			Callback(CellResult1)
			local CallbackResult = Callback(FormulaResult)
			
			if not GuiService then return end
			local GetResult = p1.selection.get()
			local Flag = false
			
			for i, value in ButtonResults1 do
				if GetResult == value then
					local Source = p1.readSource(FormulaResult, nil)
					local Current: number = Source.current
					
					if (if Current == nil then nil elseif i == "previous" then if Source.hasPrevious then Current - 1 else nil elseif i == "next" then if Source.hasNext then Current + 1 else nil elseif i == "first" then if Source.hasPrevious then 1 else nil elseif i == "last" then if Source.count == nil or Current >= Source.count then nil else Source.count else nil) == nil then
						Flag = true
					end
				end
			end
			if not Flag1 and not Flag then return end
			Flag1 = false
			local ButtonResult = if CallbackResult.current then ButtonResults[CallbackResult.current] else nil
			
			if ButtonResult and ButtonResult.Parent == nil then
				ButtonResult = nil
			end
			if ButtonResult == nil then
				local ButtonResult1 = nil
				for _, value1 in list do
					ButtonResult1 = ButtonResults1[value1]
					
					if ButtonResult1 then
						local Source = p1.readSource(FormulaResult, nil)
						local Current: number = Source.current
						
						if (if Current == nil then nil elseif value1 == "previous" then if Source.hasPrevious then Current - 1 else nil elseif value1 == "next" then if Source.hasNext then Current + 1 else nil elseif value1 == "first" then if Source.hasPrevious then 1 else nil elseif value1 == "last" then if Source.count == nil or Current >= Source.count then nil else Source.count else nil) ~= nil then
							ButtonResult = ButtonResult1
							break
						end
					end
				end
			end
			if ButtonResult == nil then
				ButtonResult = neighbour()
			end
			if ButtonResult then
				pcall(function()
					-- upvalues: p1 (upval), ButtonResult (ref)
					p1.selection.set(ButtonResult)
				end)
				CellResult2:set(if ButtonResult.AbsoluteSize.X <= 0 then ButtonResult else nil)
			end
		end)
		
		if GuiService and GuiService.GetPropertyChangedSignal then
			local ObserveResult1 = p1.selection.observe()
			local v5 = nil
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult1 (copy), v5 (ref), FrameResult (copy), Flag1 (ref), CellResult1 (copy)
				local CallbackResult = Callback(ObserveResult1)
				local Object = v5
				v5 = if CallbackResult == nil or not CallbackResult:IsDescendantOf(FrameResult) then nil else CallbackResult
				
				if Object ~= nil and Object ~= CallbackResult and not Object:IsDescendantOf(FrameResult) then
					Flag1 = true
					CellResult1:update(function(p3: number): number
						return p3 + 1
					end)
				end
			end)
			Compose.watch(function(Callback)
				-- upvalues: CellResult2 (copy), p1 (upval), ObserveResult1 (copy)
				local CallbackResult = Callback(CellResult2)
				
				if CallbackResult == nil then return end
				local CallbackResult1 = Callback(p1.observe.AbsoluteSize(CallbackResult))
				local CallbackResult2 = Callback(ObserveResult1)
				
				if CallbackResult.Parent == nil then
					CellResult2:set(nil)
					
					return
				end
				if CallbackResult1.X > 0 then
					CellResult2:set(nil)
					
					if CallbackResult2 ~= CallbackResult then
						pcall(function()
							-- upvalues: p1 (upval), CallbackResult (copy)
							p1.selection.set(CallbackResult)
						end)
					end
				end
			end)
		end
		FrameResult:SetAttribute("FacetSelectionOwner", true)
		
		return FrameResult
	end)
end