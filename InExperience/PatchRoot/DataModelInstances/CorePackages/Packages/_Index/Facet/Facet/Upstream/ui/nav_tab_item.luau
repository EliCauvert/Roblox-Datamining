local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./content_types")
local _ = require("../vendor/compose/core")
local _ = require("./navigation_props")
local _ = require("./nav_tab_metrics")
local TextMeasureModule = require("./text_measure")

return function(p1, p2, p3, p4, p5)
	-- upvalues: TextMeasureModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	local Frame = p5.frame
	local Fit = Frame.fit
	local Placement = Frame.placement
	local VisibleTabs = Frame.visibleTabs
	local LayoutUnit = Frame.layoutUnit
	local IndicatorOfFunction = Frame.indicatorOf
	local SelectFunction = p5.select
	local IsCurrentFunction = p5.isCurrent
	local SectionLabels = p5.sectionLabels
	local TabButtons = p5.tabButtons
	local TabMeasures = p5.tabMeasures
	local TabLinks = p5.tabLinks
	local Metrics = p5.metrics
	local WordWidths = Metrics.wordWidths
	local StackedFunction = Metrics.stacked
	local Crowded = Metrics.crowded
	local LabelLineFunction = Metrics.labelLine
	local IconGapFunction = Metrics.iconGap
	local BadgeClearances = Metrics.badgeClearances
	local BandFunction = Metrics.band
	local TabHeightFunction = Metrics.tabHeight
	
	return Compose.keyed({
		from = VisibleTabs,
		key = function(p6)
			return p6.id
		end,
		render = function(p6, LayoutOrder)
			-- upvalues: Placement (copy), StackedFunction (copy), Fit (copy), Crowded (copy), SectionLabels (copy), TypesUDim2 (copy), VisibleTabs (copy), p2 (copy), p4 (copy), ReadFunction (copy), TabHeightFunction (copy), TypesEnum (copy), IndicatorOfFunction (copy), IsCurrentFunction (copy), SelectFunction (copy), p1 (copy), p3 (copy), TextMeasureModule (upval), Compose (copy), LayoutUnit (copy), WordWidths (copy), Runtime (copy), TypesUDim (copy), IconGapFunction (copy), LabelLineFunction (copy), Host (copy), TypesVector2 (copy), ReadFunction (copy), BadgeClearances (copy), Metrics (copy), BandFunction (copy), TabButtons (copy), TabMeasures (copy), TabLinks (copy)
			local PeekResult = p6:peek()
			local SelectionIndicator = nil
			
			local function _(Callback)
				-- upvalues: Placement (upval), StackedFunction (upval), Fit (upval), Crowded (upval)
				return string.find(Callback(Placement), "bottom") ~= nil and (StackedFunction(Callback) or Fit and not Callback(Crowded))
			end
			
			local HasNextEntry = next(SectionLabels) ~= nil
			
			local _ = function(Callback, p7)
				-- upvalues: TypesUDim2 (upval), VisibleTabs (upval)
				return TypesUDim2.new(1 / math.max(1, #Callback(VisibleTabs)), -4, 0, p7)
			end
			
			local ButtonResult = p2.Button({
				Name = PeekResult.id,
				controlSize = p4.controlSize,
				label = function(Callback): string
					-- upvalues: p6 (copy), ReadFunction (upval), p4 (upval)
					local CallbackResult = Callback(p6)
					
					return if ReadFunction(p4.iconOnly, Callback) then "" else tostring(ReadFunction(CallbackResult.label, Callback) or CallbackResult.id)
				end,
				name = function(Callback): string
					-- upvalues: p6 (copy), ReadFunction (upval)
					local CallbackResult = Callback(p6)
					local ReadResult = ReadFunction(CallbackResult.badge, Callback)
					
					return tostring(ReadFunction(CallbackResult.label, Callback) or CallbackResult.id) .. (if ReadResult == nil or ReadResult == "" then "" else ` ({ReadResult})`)
				end,
				icon = PeekResult.icon,
				glyph = PeekResult.glyph,
				subtitle = if PeekResult.badge == nil or PeekResult.icon ~= nil or PeekResult.glyph ~= nil then nil else function(): string
					return ""
				end,
				TextSize = if Fit then nil else p4.textSize,
				LayoutOrder = LayoutOrder,
				Size = function(Callback)
					-- upvalues: Placement (upval), TabHeightFunction (upval), StackedFunction (upval), Fit (upval), Crowded (upval), HasNextEntry (copy), TypesUDim2 (upval), VisibleTabs (upval)
					local CallbackResult = Callback(Placement)
					local TabHeightResult = TabHeightFunction(Callback)
					local StackedResult = string.find(Callback(Placement), "bottom") ~= nil and (StackedFunction(Callback) or Fit and not Callback(Crowded))
					
					return if StackedResult then if HasNextEntry then TypesUDim2.new(1, 0, 0, TabHeightResult) else TypesUDim2.new(1 / math.max(1, #Callback(VisibleTabs)), -4, 0, TabHeightResult) elseif CallbackResult == "sidebar" then TypesUDim2.new(1, 0, 0, TabHeightResult) else TypesUDim2.fromOffset(0, TabHeightResult)
				end,
				AutomaticSize = function(Callback)
					-- upvalues: Placement (upval), StackedFunction (upval), Fit (upval), Crowded (upval), TypesEnum (upval)
					if Callback(Placement) == "sidebar" or string.find(Callback(Placement), "bottom") ~= nil and (StackedFunction(Callback) or Fit and not Callback(Crowded)) then
						return TypesEnum.AutomaticSize.None
					else
						return TypesEnum.AutomaticSize.X
					end
				end,
				TextXAlignment = function(Callback)
					-- upvalues: Placement (upval), ReadFunction (upval), p4 (upval), TypesEnum (upval)
					return if Callback(Placement) == "sidebar" and ReadFunction(p4.railWidth, Callback) ~= nil then TypesEnum.TextXAlignment.Left else TypesEnum.TextXAlignment.Center
				end,
				TextTruncate = TypesEnum.TextTruncate.AtEnd,
				enabled = function(Callback): boolean
					-- upvalues: ReadFunction (upval), p4 (upval), p6 (copy)
					return ReadFunction(p4.enabled, Callback) ~= false and ReadFunction(Callback(p6).enabled, Callback) ~= false
				end,
				selected = function(Callback)
					-- upvalues: IndicatorOfFunction (upval), Placement (upval), IsCurrentFunction (upval), PeekResult (copy)
					local IndicatorOfResult = IndicatorOfFunction(Callback)
					
					if IndicatorOfResult == "none" or IndicatorOfResult == "mark" then
						return false
					else
						local CallbackResult: string = Callback(Placement)
						
						return if IndicatorOfResult == "pill" or CallbackResult == "sidebar" then Callback(IsCurrentFunction(PeekResult.id)) else string.find(CallbackResult, "bottom") ~= nil and Callback(IsCurrentFunction(PeekResult.id))
					end
				end,
				onActivate = function()
					-- upvalues: SelectFunction (upval), PeekResult (copy)
					SelectFunction(PeekResult.id)
				end
			})
			ButtonResult:AddTag("facet-tab-item")
			local Content = ButtonResult:FindFirstChild("Content")
			
			if Content ~= nil and Content:IsA("GuiObject") then
				Content.AnchorPoint = p1.types.Vector2.new(0.5, 0.5)
				Content.Position = TypesUDim2.fromScale(0.5, 0.5)
			end
			local LabelMeasure = p1.text({
				Name = "LabelMeasure",
				Visible = false,
				TextWrapped = false,
				Text = function(Callback): string
					-- upvalues: ReadFunction (upval), p6 (copy), PeekResult (copy)
					return (tostring(ReadFunction(Callback(p6).label, Callback) or PeekResult.id))
				end,
				TextSize = function(p7)
					-- upvalues: Fit (upval), ReadFunction (upval), p4 (upval), p1 (upval)
					local ReadResult = if Fit then nil else ReadFunction(p4.textSize, p7)
					
					return if type(ReadResult) == "number" then ReadResult else p1.metric("typography.control.size", p7)
				end,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			p3.attach(ButtonResult, { LabelMeasure })
			local NaturalResult = TextMeasureModule.natural(p1, LabelMeasure, function()
				-- upvalues: p1 (upval), LabelMeasure (copy), Compose (upval), LayoutUnit (upval)
				local TextBoundsResult = p1.observe.TextBounds(LabelMeasure)
				
				return Compose.formula(function(Callback)
					-- upvalues: TextBoundsResult (copy), LayoutUnit (upval)
					return Callback(TextBoundsResult) / Callback(LayoutUnit)
				end)
			end)
			Compose.watch(function(Callback)
				-- upvalues: NaturalResult (copy), LayoutUnit (upval), WordWidths (upval), PeekResult (copy)
				local ScaledX = Callback(NaturalResult).X * Callback(LayoutUnit)
				
				if ScaledX ~= 1e999 then
					local Copy = table.clone(WordWidths:peek())
					Copy[PeekResult.id] = ScaledX
					WordWidths:set(Copy)
					
					return
				end
			end)
			Compose.cleanup(function()
				-- upvalues: WordWidths (upval), PeekResult (copy)
				local Copy = table.clone(WordWidths:peek())
				Copy[PeekResult.id] = nil
				WordWidths:set(Copy)
			end)
			
			if Fit then
				local LabelMeasure1 = ButtonResult:FindFirstChild("LabelMeasure")
				local NaturalResult1 = TextMeasureModule.natural(p1, LabelMeasure1, function()
					-- upvalues: p1 (upval), LabelMeasure1 (copy), Compose (upval), LayoutUnit (upval)
					local TextBoundsResult = p1.observe.TextBounds(LabelMeasure1)
					
					return Compose.formula(function(Callback)
						-- upvalues: TextBoundsResult (copy), LayoutUnit (upval)
						return Callback(TextBoundsResult) / Callback(LayoutUnit)
					end)
				end)
				local FormulaResult = Compose.formula(function(Callback)
					-- upvalues: NaturalResult1 (copy), LayoutUnit (upval)
					return Callback(NaturalResult1) * Callback(LayoutUnit)
				end)
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(ButtonResult)
				
				local function budget(Callback)
					-- upvalues: FormulaResult (copy), LayoutUnit (upval), StackedFunction (upval), p6 (copy), p1 (upval), p4 (upval), AbsoluteSizeResult (copy), Placement (upval), Crowded (upval)
					local X = Callback(FormulaResult).X
					local CallbackResult = Callback(LayoutUnit)
					local ScaledIconSize = if StackedFunction(Callback) or not Callback(p6).icon and not Callback(p6).glyph then 0 else (p1.controlSize(p4.controlSize, "iconSize", Callback) + p1.metric("space.xs", Callback)) * CallbackResult
					
					return X, Callback(AbsoluteSizeResult).X - 2 * p1.controlSize(p4.controlSize, "paddingX", Callback) * CallbackResult - ScaledIconSize, Callback(AbsoluteSizeResult).X - ScaledIconSize - 2 * p1.metric("space.xs", Callback) * CallbackResult, string.find(Callback(Placement), "bottom") ~= nil and not Callback(Crowded)
				end
				
				local FormulaResult1 = Compose.formula(function(p7): boolean
					-- upvalues: budget (copy)
					local BudgetResult, BudgetResult2, _, BudgetResult4 = budget(p7)
					
					return BudgetResult4 and (BudgetResult > 0 and BudgetResult2 > 0 and BudgetResult2 < BudgetResult)
				end)
				Compose.watch(function(Callback)
					-- upvalues: FormulaResult1 (copy), ButtonResult (copy)
					if Callback(FormulaResult1) then
						ButtonResult:AddTag("facet-button-tight")
						
						return
					end
					if ButtonResult:HasTag("facet-button-tight") then
						ButtonResult:RemoveTag("facet-button-tight")
					end
				end)
				local FormulaResult2 = Compose.formula(function(Callback): number?
					-- upvalues: budget (copy), FormulaResult1 (copy), p1 (upval)
					local BudgetResult, BudgetResult2, BudgetResult3, BudgetResult4 = budget(Callback)
					local BudgetResult1 = if Callback(FormulaResult1) then BudgetResult3 else BudgetResult2
					
					if BudgetResult4 and BudgetResult > 0 and BudgetResult1 > 0 then
						local TypographyControlSize: number = p1.metric("typography.control.size", Callback)
						
						return (math.clamp(math.floor(TypographyControlSize * BudgetResult1 / BudgetResult), p1.metric("typography.caption.size", Callback), TypographyControlSize))
					else
						return nil
					end
				end)
				local CellResult = Compose.cell(0)
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: FormulaResult2 (copy), CellResult (copy)
					Callback(FormulaResult2)
					CellResult:set(0)
				end)
				local Title = ButtonResult:FindFirstChild("Title", true)
				local Title1 = if Title and Title:IsA("TextLabel") then Title else nil
				Compose.watch(function(Callback)
					-- upvalues: FormulaResult2 (copy), ButtonResult (copy), Title1 (copy), p1 (upval), CellResult (copy)
					local CallbackResult = Callback(FormulaResult2)
					
					if CallbackResult == nil then
						ButtonResult:ResetPropertyToDefault("TextSize")
						
						if Title1 then
							Title1:ResetPropertyToDefault("TextSize")
						end
						return
					else
						ButtonResult.TextSize = math.max(p1.metric("typography.caption.size", Callback), CallbackResult - Callback(CellResult))
						
						if Title1 then
							Title1.TextSize = ButtonResult.TextSize
						end
					end
				end)
				local TextFitsResult = p1.observe.TextFits(Title1 or ButtonResult)
				local TextBoundsResult = p1.observe.TextBounds(Title1 or ButtonResult)
				Compose.watch(function(Callback)
					-- upvalues: TextFitsResult (copy), TextBoundsResult (copy), p1 (upval), FormulaResult2 (copy), ButtonResult (copy), CellResult (copy)
					local CallbackResult = Callback(TextFitsResult)
					local CallbackResult1 = Callback(TextBoundsResult)
					local TypographyCaptionSize = p1.metric("typography.caption.size", Callback)
					
					if not CallbackResult and CallbackResult1.X > 0 and FormulaResult2:peek() ~= nil and TypographyCaptionSize < ButtonResult.TextSize then
						CellResult:set(CellResult:peek() + 1)
					end
				end)
				ButtonResult:SetAttribute("FacetTextFit", true)
			end
			local Child = ButtonResult:FindFirstChild(if PeekResult.glyph then "LeadingGlyph" else "LeadingIcon", true)
			local Child1 = if Child and Child:IsA("GuiObject") then Child else nil
			
			if Child1 and PeekResult.glyph then
				Child1:AddTag("facet-tab-glyph")
			end
			local Content1 = ButtonResult:FindFirstChild("Content")
			local UIListLayout = Content1 and Content1:FindFirstChildWhichIsA("UIListLayout")
			local Title = Content1 and Content1:FindFirstChild("Title")
			
			if Child1 and UIListLayout and Title then
				local Padding = UIListLayout.Padding
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Content1)
				Runtime.decorate(UIListLayout, {
					FillDirection = function(p7)
						-- upvalues: StackedFunction (upval), TypesEnum (upval)
						return if StackedFunction(p7) then TypesEnum.FillDirection.Vertical else TypesEnum.FillDirection.Horizontal
					end,
					Padding = function(p7)
						-- upvalues: StackedFunction (upval), TypesUDim (upval), IconGapFunction (upval), Padding (copy)
						return if StackedFunction(p7) then TypesUDim.new(0, IconGapFunction(p7)) else Padding
					end
				})
				Runtime.decorate(Title, {
					TextWrapped = false,
					Size = function(Callback)
						-- upvalues: StackedFunction (upval), TypesUDim2 (upval), LabelLineFunction (upval), Placement (upval), Fit (upval), Crowded (upval), LayoutUnit (upval), AbsoluteSizeResult1 (copy), p1 (upval), p4 (upval), UIListLayout (copy), WordWidths (upval), PeekResult (copy)
						if StackedFunction(Callback) then
							return TypesUDim2.new(1, 0, 0, LabelLineFunction(Callback))
						elseif string.find(Callback(Placement), "bottom") ~= nil and (StackedFunction(Callback) or Fit and not Callback(Crowded)) then
							local CallbackResult = Callback(LayoutUnit)
							local XDelta = Callback(AbsoluteSizeResult1).X / CallbackResult - p1.controlSize(p4.controlSize, "iconSize", Callback) - UIListLayout:GetStyled("Padding").Offset
							local CallbackResultEntry: number = Callback(WordWidths)[PeekResult.id]
							
							return TypesUDim2.fromOffset(math.max(0, if CallbackResultEntry and CallbackResultEntry > 0 then math.min(math.ceil(CallbackResultEntry / CallbackResult), XDelta) else XDelta), LabelLineFunction(Callback))
						else
							return TypesUDim2.fromOffset(0, 0)
						end
					end,
					AutomaticSize = function(Callback)
						-- upvalues: Placement (upval), StackedFunction (upval), Fit (upval), Crowded (upval), TypesEnum (upval)
						local StackedResult = string.find(Callback(Placement), "bottom") ~= nil and (StackedFunction(Callback) or Fit and not Callback(Crowded))
						
						return if StackedResult then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.XY
					end,
					TextXAlignment = TypesEnum.TextXAlignment.Center,
					TextTruncate = TypesEnum.TextTruncate.AtEnd
				})
			end
			local function badgeOf(Callback)
				-- upvalues: ReadFunction (upval), p6 (copy)
				local ReadResult = ReadFunction(Callback(p6).badge, Callback)
				
				return if ReadResult == nil or ReadResult == "" then nil else tostring(ReadResult)
			end
			
			if PeekResult.badge ~= nil and Child1 then
				local BadgedResult = p2.badged(Host.Frame({
					Name = "Anchor",
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromScale(1, 1)
				}), badgeOf)
				local CellResult1 = Compose.cell(TypesVector2.zero)
				local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(Child1)
				local SizeResult = p1.observe.Size(Child1)
				
				local function reach(Callback)
					-- upvalues: CellResult1 (copy), AbsoluteSizeResult2 (copy), SizeResult (copy)
					local CallbackResult = Callback(CellResult1)
					local X: number = Callback(AbsoluteSizeResult2).X
					local Offset: number = Callback(SizeResult).X.Offset
					local OffsetRatio = if Offset > 0 and X > 0 then Offset / X else 1
					local ScaledOffset = Offset * 0.25
					
					return math.round((math.max(0, CallbackResult.X * OffsetRatio / 2 - ScaledOffset))), math.round((math.max(0, CallbackResult.Y * OffsetRatio / 2 - ScaledOffset))), OffsetRatio
				end
				
				Runtime.decorate(BadgedResult, {
					Size = function(p7)
						-- upvalues: reach (copy), TypesUDim2 (upval)
						local ReachResult, ReachResult2 = reach(p7)
						
						return TypesUDim2.new(1, ReachResult, 1, ReachResult2)
					end,
					Position = function(Callback)
						-- upvalues: reach (copy), ReadFunction (upval), p6 (copy), TypesUDim2 (upval)
						local ReachResult, ReachResult2 = reach(Callback)
						local ReadResult = ReadFunction(Callback(p6).badgeAnchor, Callback) or "topTrailing"
						assert(table.find({
							"topLeading",
							"topTrailing",
							"bottomLeading",
							"bottomTrailing"
						}, ReadResult), "Invalid TabView tab.badgeAnchor")
						
						return TypesUDim2.fromOffset(if string.find(ReadResult, "Leading") then -ReachResult else 0, if string.find(ReadResult, "bottom") then 0 else -ReachResult2)
					end,
					AutomaticSize = TypesEnum.AutomaticSize.None
				})
				Runtime.mount(function()
					-- upvalues: BadgedResult (copy)
					return BadgedResult
				end, Child1)
				local Seal = BadgedResult:FindFirstChild("Seal")
				local Corner = if Seal then Seal:FindFirstChild("Corner") else nil
				
				if Corner then
					Runtime.decorate(Corner, {
						Position = function(Callback)
							-- upvalues: ReadFunction (upval), p6 (copy), TypesUDim2 (upval)
							local ReadResult = ReadFunction(Callback(p6).badgeAnchor, Callback) or "topTrailing"
							
							return TypesUDim2.fromScale(if string.find(ReadResult, "Leading") then 0 else 1, if string.find(ReadResult, "bottom") then 1 else 0)
						end
					})
					local CellResult2 = Compose.cell(0)
					
					local function track()
						-- upvalues: CellResult2 (copy)
						CellResult2:set(CellResult2:peek() + 1)
					end
					
					Compose.watch(function(Callback: (any) -> ())
						-- upvalues: CellResult2 (copy), Corner (copy), CellResult1 (copy), TypesVector2 (upval), Runtime (upval), Compose (upval)
						Callback(CellResult2)
						local GuiObject = Corner:FindFirstChildWhichIsA("GuiObject")
						
						if GuiObject == nil then
							CellResult1:set(TypesVector2.zero)
							
							return
						else
							local AbsoluteSize = Runtime.observe(GuiObject, "AbsoluteSize", if Runtime.host.frames then { frame = true } else nil)
							Compose.watch(function(Callback)
								-- upvalues: CellResult1 (upval), AbsoluteSize (copy)
								CellResult1:set((Callback(AbsoluteSize)))
							end)
						end
					end)
					local ChildAddedConnection = Corner.ChildAdded:Connect(track)
					local ChildRemovedConnection = Corner.ChildRemoved:Connect(track)
					Compose.cleanup(function()
						-- upvalues: ChildAddedConnection (copy), ChildRemovedConnection (copy)
						ChildAddedConnection:Disconnect()
						ChildRemovedConnection:Disconnect()
					end)
				end
				local UIListLayout1 = Child1.Parent and Child1.Parent:FindFirstChildWhichIsA("UIListLayout")
				Compose.watch(function(Callback)
					-- upvalues: ReadFunction (upval), p6 (copy), reach (copy), CellResult1 (copy), p1 (upval), BadgeClearances (upval), PeekResult (copy)
					local ReadResult = ReadFunction(Callback(p6).badgeAnchor, Callback) or "topTrailing"
					local _, ReachResult2, ReachResult3 = reach(Callback)
					local NewReachResult = if string.find(ReadResult, "bottom") then ReachResult2 + Callback(CellResult1).Y * ReachResult3 / 2 + p1.metric("space.xs", Callback) else 0
					local PeekResult1 = BadgeClearances:peek()
					
					if PeekResult1[PeekResult.id] ~= NewReachResult then
						local Copy = table.clone(PeekResult1)
						Copy[PeekResult.id] = NewReachResult
						BadgeClearances:set(Copy)
					end
				end)
				Compose.cleanup(function()
					-- upvalues: BadgeClearances (upval), PeekResult (copy)
					local Copy = table.clone(BadgeClearances:peek())
					Copy[PeekResult.id] = nil
					BadgeClearances:set(Copy)
				end)
				
				if UIListLayout1 then
					local Offset = UIListLayout1.Padding.Offset
					Runtime.decorate(UIListLayout1, {
						Padding = function(Callback)
							-- upvalues: StackedFunction (upval), TypesUDim (upval), IconGapFunction (upval), CellResult1 (copy), ReadFunction (upval), p4 (upval), Offset (copy), reach (copy), p1 (upval)
							if StackedFunction(Callback) then
								return TypesUDim.new(0, IconGapFunction(Callback))
							end
							local X: number = Callback(CellResult1).X
							
							if X <= 0 or ReadFunction(p4.iconOnly, Callback) then
								return TypesUDim.new(0, Offset)
							else
								local ReachResult, _, ReachResult3 = reach(Callback)
								
								return TypesUDim.new(0, (math.max(Offset, math.ceil(ReachResult + X * ReachResult3 / 2) + p1.metric("space.xs", Callback))))
							end
						end
					})
				end
			end
			local Content2 = ButtonResult:FindFirstChild("Content")
			
			if PeekResult.badge ~= nil and (not Child1 and Content2) then
				Runtime.mountFragment(function()
					-- upvalues: Compose (upval), ReadFunction (upval), p6 (copy), p2 (upval)
					return {
						Compose.show(function(Callback): boolean
							-- upvalues: ReadFunction (upval), p6 (upval)
							local ReadResult = ReadFunction(Callback(p6).badge, Callback)
							
							return (if ReadResult == nil or ReadResult == "" then nil else tostring(ReadResult)) ~= nil
						end, function()
							-- upvalues: p2 (upval), ReadFunction (upval), p6 (upval)
							return p2.Badge({
								Name = "Count",
								LayoutOrder = 900,
								label = function(Callback)
									-- upvalues: ReadFunction (upval), p6 (upval)
									local ReadResult = ReadFunction(Callback(p6).badge, Callback)
									
									return (if ReadResult == nil or ReadResult == "" then nil else tostring(ReadResult)) or ""
								end
							})
						end)
					}
				end, Content2)
			end
			local Indicator = PeekResult.indicator
			
			if Indicator then
				p3.attach(ButtonResult, {
					p2.StatusIndicator({
						Name = "Status",
						ZIndex = 3,
						status = Indicator.status,
						form = Indicator.form,
						count = Indicator.count,
						max = Indicator.max,
						AnchorPoint = TypesVector2.new(1, 0),
						Position = TypesUDim2.new(1, -4, 0, 4)
					})
				})
			end
			local Visible = false
			local IsSidebar = false
			Compose.watch(function(Callback)
				-- upvalues: IsCurrentFunction (upval), PeekResult (copy), SelectionIndicator (ref), Placement (upval), IndicatorOfFunction (upval), p4 (upval), Metrics (upval), Visible (ref), ButtonResult (copy), IsSidebar (ref)
				local CallbackResult = Callback(IsCurrentFunction(PeekResult.id))
				
				if SelectionIndicator then
					SelectionIndicator.Visible = CallbackResult
				end
				local CallbackResult1: string = Callback(Placement)
				local IsSidebar1 = CallbackResult and (IndicatorOfFunction(Callback) ~= "none" and (IndicatorOfFunction(Callback) ~= "mark" and (CallbackResult1 == "sidebar" or (string.find(CallbackResult1, "bottom") ~= nil or p4.style == "sidebarAdaptable" and Metrics.segmentedTop(Callback)))))
				
				if CallbackResult ~= Visible then
					Visible = CallbackResult
					
					if CallbackResult then
						ButtonResult:AddTag("facet-tab-current")
					else
						ButtonResult:RemoveTag("facet-tab-current")
					end
				end
				if IsSidebar1 ~= IsSidebar then
					IsSidebar = IsSidebar1
					
					if IsSidebar1 then
						ButtonResult:AddTag("facet-tab-filled")
						
						return
					end
					ButtonResult:RemoveTag("facet-tab-filled")
				end
			end)
			p3.attach(ButtonResult, {
				Host.UISizeConstraint({
					MinSize = function(p7)
						-- upvalues: TypesVector2 (upval), BandFunction (upval), TabHeightFunction (upval)
						return TypesVector2.new(BandFunction(p7), TabHeightFunction(p7))
					end
				}),
				Compose.show(function(Callback)
					-- upvalues: IndicatorOfFunction (upval), Placement (upval), IsCurrentFunction (upval), PeekResult (copy)
					return IndicatorOfFunction(Callback) == "mark" and (if Callback(Placement) == "sidebar" then Callback(IsCurrentFunction(PeekResult.id)) else string.find(Callback(Placement), "bottom") ~= nil and Callback(IsCurrentFunction(PeekResult.id)))
				end, function()
					-- upvalues: Compose (upval), ReadFunction (upval), p4 (upval), Placement (upval), Child1 (copy), p1 (upval), Host (upval), ButtonResult (copy), TypesVector2 (upval), TypesUDim2 (upval), TypesUDim (upval)
					local FormulaResult = Compose.formula(function(Callback): boolean
						-- upvalues: ReadFunction (upval), p4 (upval), Placement (upval), Child1 (upval)
						local ReadResult = ReadFunction(p4.indicatorPlacement, Callback)
						assert(ReadResult == nil or (ReadResult == "aboveIcon" or (ReadResult == "belowIcon" or ReadResult == "inset")), "Invalid TabView.indicatorPlacement")
						
						return Callback(Placement) == "sidebar" or (ReadResult == "inset" or Child1 == nil)
					end)
					
					local function buildMark()
						-- upvalues: p1 (upval), Host (upval), ButtonResult (upval), FormulaResult (copy), TypesVector2 (upval), ReadFunction (upval), p4 (upval), TypesUDim2 (upval), TypesUDim (upval)
						return p1.styled(Host.Frame("SelectionIndicator")({
							BorderSizePixel = 0,
							ZIndex = ButtonResult.ZIndex,
							AnchorPoint = function(Callback)
								-- upvalues: FormulaResult (upval), TypesVector2 (upval), ReadFunction (upval), p4 (upval)
								return if Callback(FormulaResult) then TypesVector2.zero else TypesVector2.new(0.5, if ReadFunction(p4.indicatorPlacement, Callback) == "belowIcon" then 0 else 1)
							end,
							Size = function(Callback)
								-- upvalues: FormulaResult (upval), TypesUDim2 (upval), p1 (upval)
								return if Callback(FormulaResult) then TypesUDim2.new(1, -2 * p1.metric("controls.tabRailSelection.insetX", Callback), 1, -2 * p1.metric("controls.tabRailSelection.insetY", Callback)) else TypesUDim2.fromOffset(p1.metric("controls.tabMark.width", Callback), p1.metric("controls.tabMark.height", Callback))
							end,
							Position = function(Callback)
								-- upvalues: FormulaResult (upval), TypesUDim2 (upval), p1 (upval), ReadFunction (upval), p4 (upval)
								return if Callback(FormulaResult) then TypesUDim2.fromOffset(p1.metric("controls.tabRailSelection.insetX", Callback), p1.metric("controls.tabRailSelection.insetY", Callback)) elseif ReadFunction(p4.indicatorPlacement, Callback) == "belowIcon" then TypesUDim2.new(0.5, 0, 1, p1.metric("controls.tabMark.gap", Callback)) else TypesUDim2.new(0.5, 0, 0, -p1.metric("controls.tabMark.gap", Callback))
							end,
							Host.UICorner({
								CornerRadius = function(Callback)
									-- upvalues: TypesUDim (upval), p1 (upval), FormulaResult (upval)
									return TypesUDim.new(0, p1.metric(if Callback(FormulaResult) then "controls.tabRailSelection.radius" else "controls.tabMark.radius", Callback))
								end
							})
						}), "selection-indicator")
					end
					
					return Host.Folder({
						Compose.keyed({
							from = function(Callback)
								-- upvalues: FormulaResult (copy), ButtonResult (upval), Child1 (upval)
								return {
									if Callback(FormulaResult) then ButtonResult else assert(Child1)
								}
							end,
							render = function(p7)
								-- upvalues: Host (upval), Compose (upval), buildMark (copy)
								return Host.Folder({
									Compose.portal(p7:peek(), function()
										-- upvalues: buildMark (upval)
										return { buildMark() }
									end)
								})
							end
						})
					})
				end),
				Compose.show(function(Callback): boolean
					-- upvalues: IndicatorOfFunction (upval), Placement (upval)
					return IndicatorOfFunction(Callback) ~= "none" and (IndicatorOfFunction(Callback) ~= "pill" and Callback(Placement) == "topBar")
				end, function()
					-- upvalues: SelectionIndicator (ref), p1 (upval), Host (upval), IsCurrentFunction (upval), PeekResult (copy), TypesUDim2 (upval), Compose (upval)
					SelectionIndicator = p1.styled(Host.Frame("SelectionIndicator")({
						BorderSizePixel = 0,
						Visible = IsCurrentFunction(PeekResult.id):peek(),
						Size = TypesUDim2.new(1, 0, 0, 2),
						Position = TypesUDim2.new(0, 0, 1, -2)
					}), "selection-indicator")
					Compose.cleanup(function()
						-- upvalues: SelectionIndicator (upval)
						SelectionIndicator = nil
					end)
					
					return SelectionIndicator
				end)
			})
			Compose.watch(function(Callback)
				-- upvalues: ButtonResult (copy), ReadFunction (upval), p6 (copy), PeekResult (copy)
				ButtonResult:SetAttribute("FacetLabel", ReadFunction(Callback(p6).label, Callback) or PeekResult.id)
			end)
			TabButtons[PeekResult.id] = ButtonResult
			TabMeasures[PeekResult.id] = {
				position = p1.observe.AbsolutePosition(ButtonResult),
				size = p1.observe.AbsoluteSize(ButtonResult)
			}
			TabLinks:set(TabLinks:peek() + 1)
			Compose.cleanup(function()
				-- upvalues: TabButtons (upval), PeekResult (copy), TabMeasures (upval), TabLinks (upval)
				TabButtons[PeekResult.id] = nil
				TabMeasures[PeekResult.id] = nil
				TabLinks:set(TabLinks:peek() + 1)
			end)
			
			return if next(SectionLabels) then p1.column({
				Compose.show(function(Callback): boolean
					-- upvalues: LayoutOrder (copy), VisibleTabs (upval), Placement (upval), p6 (copy)
					local CallbackResult: number = Callback(LayoutOrder)
					local CallbackResult1 = Callback(VisibleTabs)
					
					return Callback(Placement) == "sidebar" and (Callback(p6).section ~= nil and (CallbackResult == 1 or CallbackResult1[CallbackResult - 1].section ~= Callback(p6).section))
				end, function()
					-- upvalues: p1 (upval), SectionLabels (upval), p6 (copy), TypesUDim2 (upval), TypesEnum (upval)
					return p1.text({
						Name = "Section",
						Text = function(Callback)
							-- upvalues: SectionLabels (upval), p6 (upval)
							return SectionLabels[assert(Callback(p6).section)]
						end,
						Size = TypesUDim2.new(1, 0, 0, 28),
						AutomaticSize = TypesEnum.AutomaticSize.None
					})
				end),
				ButtonResult
			}, {
				Name = "TabRow-" .. PeekResult.id,
				LayoutOrder = LayoutOrder,
				Size = function(Callback)
					-- upvalues: Placement (upval), TypesUDim2 (upval), StackedFunction (upval), Fit (upval), Crowded (upval), BandFunction (upval), VisibleTabs (upval)
					if Callback(Placement) == "sidebar" then
						return (TypesUDim2.new(1, 0, 0, 0))
					else
						local StackedResult = string.find(Callback(Placement), "bottom") ~= nil and (StackedFunction(Callback) or Fit and not Callback(Crowded))
						
						return if StackedResult then TypesUDim2.new(1 / math.max(1, #Callback(VisibleTabs)), -4, 0, (BandFunction(Callback))) else TypesUDim2.fromOffset(0, BandFunction(Callback))
					end
				end,
				AutomaticSize = function(Callback)
					-- upvalues: Placement (upval), TypesEnum (upval), StackedFunction (upval), Fit (upval), Crowded (upval)
					if Callback(Placement) == "sidebar" then
						return TypesEnum.AutomaticSize.Y
					else
						local StackedResult = string.find(Callback(Placement), "bottom") ~= nil and (StackedFunction(Callback) or Fit and not Callback(Crowded))
						
						return if StackedResult then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.X
					end
				end
			}) else ButtonResult
		end
	})
end