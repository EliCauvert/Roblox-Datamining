local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local ReducedFunction = require("./motion").reduced
local _ = require("./navigation_props")
local _ = require("./collection_props")
local _ = require("./nav_page_layers")
local InputContactsModule = require("./input_contacts")
local SettleModule = require("./settle")

return function(p1, p2, p3, p4)
	-- upvalues: ReducedFunction (copy), SettleModule (copy), InputContactsModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local CheckedSelectionFunction = p4.checkedSelection
	local ReadFunction = p1.read
	p2.PageView = p1.construct("PageView", function(Frame: Frame)
		-- upvalues: CheckedSelectionFunction (copy), ReducedFunction (upval), p1 (copy), TypesEnum (copy), Compose (copy), Host (copy), TypesUDim2 (copy), p2 (copy), Runtime (copy), p3 (copy), SettleModule (upval), TypesVector2 (copy), InputContactsModule (upval), ReadFunction (copy)
		assert(Frame.indicatorPlacement == nil or (Frame.indicatorPlacement == "footer" or Frame.indicatorPlacement == "overlay"), "PageView.indicatorPlacement must be footer or overlay")
		local IsOverlay = Frame.indicatorPlacement == "overlay"
		local PageView = CheckedSelectionFunction(Frame.selection, Frame.pages, "PageView")
		local t = {}
		
		for i, page in Frame.pages do
			t[page.id] = i
		end
		local v1 = (if Frame.summary == false then 0 else 24) + (if Frame.indicators == false or IsOverlay then 0 else 48) + (if Frame.controls == false then 0 else 48)
		local t1 = {}
		local ReducedResult = ReducedFunction(p1)
		local IsAutomaticSizeMatch: boolean = Frame.AutomaticSize == TypesEnum.AutomaticSize.Y or Frame.AutomaticSize == TypesEnum.AutomaticSize.XY
		local CellResult = Compose.cell(0)
		local AbsoluteSizeResults = {}
		
		for LayoutOrder, page1 in Frame.pages do
			local ContentFunction = page1.content
			local ContentResult = if type(ContentFunction) == "function" then ContentFunction() else ContentFunction
			
			if IsAutomaticSizeMatch and ContentResult:IsA("GuiObject") then
				table.insert(AbsoluteSizeResults, p1.observe.AbsoluteSize(ContentResult))
			end
			t1[page1.id] = Host.Frame(page1.id)({
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 1),
				LayoutOrder = LayoutOrder,
				ContentResult
			})
		end
		local CellResult1 = Compose.cell(1)
		local EffectiveInputResult = p1.effectiveInput()
		
		local function nativeScroll(p5): boolean
			-- upvalues: EffectiveInputResult (copy), p1 (upval), Frame (copy)
			return EffectiveInputResult(p5) == "Touch" or p1.read(Frame.scrollWheel, p5) == true
		end
		
		local Pages = p2.VirtualList({
			mode = "all",
			direction = "horizontal",
			gap = 0,
			ScrollBarThickness = 0,
			Selectable = true,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			from = Frame.pages,
			key = function(p5)
				return p5.id
			end,
			render = function(p5)
				-- upvalues: t1 (copy)
				return assert(t1[p5:peek().id])
			end,
			itemSize = CellResult1,
			Active = nativeScroll,
			ScrollingEnabled = nativeScroll,
			ElasticBehavior = TypesEnum.ElasticBehavior.Never,
			Size = function(Callback)
				-- upvalues: IsAutomaticSizeMatch (copy), TypesUDim2 (upval), CellResult (copy), v1 (copy)
				return if IsAutomaticSizeMatch then TypesUDim2.new(1, 0, 0, Callback(CellResult)) else TypesUDim2.new(1, 0, 1, -v1)
			end
		}, "Pages")
		local CellResult2 = Compose.cell(false)
		local ClampedValue = nil
		local CellResult3 = if Frame.autoAdvanceSeconds == nil then nil else Compose.cell(false)
		local Flag = false
		local Flag1 = false
		local SchedulerResult = Runtime.scheduler()
		local ParentResult = p1.observe.Parent(Pages)
		local AvailableResult = p3.available(Pages)
		local GuiService = p3.service("GuiService")
		local Flag2 = false
		local LayoutUnitResult = p1.layoutUnit(Pages)
		local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(Pages)
		local AbsoluteCanvasSizeResult = p1.observe.AbsoluteCanvasSize(Pages)
		
		local function _(p5: number, p6, p7): number
			-- upvalues: TypesUDim2 (upval), CellResult1 (copy), LayoutUnitResult (copy)
			return (math.clamp(TypesUDim2.fromOffset((p5 - 1) * CellResult1:peek(), 0).X.Offset * LayoutUnitResult:peek(), 0, (math.max(0, p7.X - p6.X))))
		end
		
		local _ = function(p5, p6): number
			-- upvalues: Frame (copy)
			return (math.clamp(math.floor(p5 / p6.X + 0.5) + 1, 1, #Frame.pages))
		end
		
		local CellResult4 = Compose.cell(false)
		local ClampedValue1 = 0
		local Flag3 = false
		local SettleModuleResult = SettleModule(p1, function()
			-- upvalues: ClampedValue1 (ref)
			return ClampedValue1
		end, p1.motionSpring("control"))
		local v2 = assert(Runtime.host.frames)
		local ClampedValue2 = 1
		local X = 0
		local NowResult = v2.now()
		local v3 = 0
		
		local _ = function()
			-- upvalues: Flag3 (ref), SettleModuleResult (copy)
			Flag3 = false
			SettleModuleResult.halt()
		end
		
		Compose.watch(function(Callback)
			-- upvalues: SettleModuleResult (copy), Flag3 (ref), Pages (copy), TypesVector2 (upval), ClampedValue1 (ref)
			local CallbackResult = Callback(SettleModuleResult.value)
			
			if Flag3 then
				Pages:ResetScrollVelocity()
				Pages.CanvasPosition = TypesVector2.new(CallbackResult or ClampedValue1, 0)
				
				if CallbackResult == nil then
					Flag3 = false
				end
			end
		end)
		InputContactsModule(p1, Pages, function()
			-- upvalues: SchedulerResult (copy), Flag3 (ref), SettleModuleResult (copy), ClampedValue (ref), CellResult2 (copy), p2 (upval), Pages (copy), AbsoluteWindowSizeResult (copy), ClampedValue2 (ref), Frame (copy), t (copy), X (ref), NowResult (ref), v3 (ref), v2 (copy), Flag1 (ref), CellResult3 (copy)
			SchedulerResult.cancel("wheel")
			Flag3 = false
			SettleModuleResult.halt()
			ClampedValue = nil
			CellResult2:set(true)
			p2.scrollTo(Pages, Pages.CanvasPosition, { animated = false })
			Pages:ResetScrollVelocity()
			local PeekResult = AbsoluteWindowSizeResult:peek()
			ClampedValue2 = if PeekResult.X > 0 then math.clamp(math.floor(Pages.CanvasPosition.X / PeekResult.X + 0.5) + 1, 1, #Frame.pages) else t[Frame.selection:peek()]
			X = Pages.CanvasPosition.X
			NowResult = v2.now()
			v3 = 0
			SchedulerResult.cancel("resume")
			Flag1 = false
			
			if CellResult3 then
				CellResult3:set(true)
			end
		end, function(p5)
			-- upvalues: AbsoluteWindowSizeResult (copy), AbsoluteCanvasSizeResult (copy), CellResult4 (copy), Pages (copy), v2 (copy), NowResult (ref), p1 (upval), v3 (ref), ClampedValue2 (ref), TypesUDim2 (upval), CellResult1 (copy), LayoutUnitResult (copy), Frame (copy), ClampedValue1 (ref), ClampedValue (ref), Flag3 (ref), SettleModuleResult (copy), TypesVector2 (upval), Flag1 (ref), CellResult2 (copy), SchedulerResult (copy), CellResult3 (copy), Flag (ref)
			local PeekResult = AbsoluteWindowSizeResult:peek()
			local PeekResult1 = AbsoluteCanvasSizeResult:peek()
			
			if CellResult4:peek() and PeekResult.X > 0 then
				local X = Pages.CanvasPosition.X
				local X1 = Pages:GetScrollVelocity().X
				
				if X1 == 0 and v2.now() - NowResult <= p1.metric("motion.fling.projection") then
					X1 = v3
				end
				local Value = X - math.clamp(TypesUDim2.fromOffset((ClampedValue2 - 1) * CellResult1:peek(), 0).X.Offset * LayoutUnitResult:peek(), 0, (math.max(0, PeekResult1.X - PeekResult.X)))
				ClampedValue1 = math.clamp(TypesUDim2.fromOffset((math.clamp(ClampedValue2 + (if p5 or p1.metric("motion.fling.bounceSpeed") > math.abs(X1) then if p5 or PeekResult.X / 2 >= math.abs(Value) then 0 else math.sign(Value) else math.sign(X1)), 1, #Frame.pages) - 1) * CellResult1:peek(), 0).X.Offset * LayoutUnitResult:peek(), 0, (math.max(0, PeekResult1.X - PeekResult.X)))
				ClampedValue = ClampedValue1
				Pages:ResetScrollVelocity()
				Flag3 = true
				
				if not SettleModuleResult.launch(X, 0, p1.motionSpring("control")) then
					Flag3 = false
					Pages.CanvasPosition = TypesVector2.new(ClampedValue1, 0)
				end
			end
			Flag1 = true
			CellResult2:set(false)
			SchedulerResult.replace("resume", p1.metric("motion.durations.scrollReveal"), function()
				-- upvalues: Flag1 (upval), CellResult3 (upval), Flag (upval), CellResult2 (upval)
				Flag1 = false
				
				if CellResult3 then
					CellResult3:set(Flag or CellResult2:peek())
				end
			end)
		end)
		local Flag4 = false
		local X1 = 0
		local v4 = 0
		Compose.watch(function(Callback)
			-- upvalues: AbsoluteWindowSizeResult (copy), Frame (copy), PageView (copy), LayoutUnitResult (copy), CellResult1 (copy), TypesUDim2 (upval), ParentResult (copy), AvailableResult (copy), Flag4 (ref), CellResult4 (copy), X1 (ref), v4 (ref), AbsoluteCanvasSizeResult (copy), Flag3 (ref), SettleModuleResult (copy), SchedulerResult (copy), ClampedValue (ref), t (copy), GuiService (copy), p3 (upval), p1 (upval), Pages (copy), Flag2 (ref), p2 (upval), TypesVector2 (upval), ReducedResult (copy)
			local CallbackResult = Callback(AbsoluteWindowSizeResult)
			local CallbackResult1 = Callback(Frame.selection)
			assert(PageView[CallbackResult1], "PageView.selection must name a declared page")
			local CallbackResult2: number = Callback(LayoutUnitResult)
			
			if CallbackResult.X > 0 then
				CellResult1:set(TypesUDim2.fromOffset(CallbackResult.X / math.max(CallbackResult2, 0.001), 0).X.Offset)
			end
			if CallbackResult.X <= 0 or not Callback(ParentResult) or not Callback(AvailableResult) then
				Flag4 = false
				CellResult4:set(false)
				
				return
			end
			local IsNotXMatch: boolean = X1 ~= CallbackResult.X or v4 ~= CallbackResult2
			local CallbackResult3 = Callback(AbsoluteCanvasSizeResult)
			
			if #Frame.pages * CallbackResult2 + 0.5 < math.abs(CallbackResult3.X - CellResult1:peek() * #Frame.pages * CallbackResult2) then
				CellResult4:set(false)
				
				return
			end
			Flag3 = false
			SettleModuleResult.halt()
			SchedulerResult.cancel("wheel")
			ClampedValue = math.clamp(TypesUDim2.fromOffset((t[CallbackResult1] - 1) * CellResult1:peek(), 0).X.Offset * LayoutUnitResult:peek(), 0, (math.max(0, CallbackResult3.X - CallbackResult.X)))
			
			if GuiService and p3.within(p1.selection.get(), Pages) then
				Flag2 = true
			end
			CellResult4:set(true)
			
			if not p2.scrollTo(Pages, TypesVector2.new(ClampedValue, 0), {
				animated = Flag4 and (not IsNotXMatch and not ReducedResult(Callback))
			}) then
				ClampedValue = nil
			end
			Flag4 = true
			X1 = CallbackResult.X
			v4 = CallbackResult2
		end)
		local CanvasPositionResult = p1.observe.CanvasPosition(Pages)
		Compose.watch(function(Callback)
			-- upvalues: CanvasPositionResult (copy), CellResult2 (copy), v2 (copy), NowResult (ref), v3 (ref), X (ref), AbsoluteWindowSizeResult (copy), ClampedValue (ref), Flag3 (ref), CellResult4 (copy), Frame (copy), AbsoluteCanvasSizeResult (copy), TypesUDim2 (upval), CellResult1 (copy), LayoutUnitResult (copy), SchedulerResult (copy), p1 (upval), ClampedValue1 (ref), Pages (copy), SettleModuleResult (copy), TypesVector2 (upval), AvailableResult (copy), t1 (copy), GuiService (copy), Flag2 (ref), p3 (upval)
			local X1: number = Callback(CanvasPositionResult).X
			
			if CellResult2:peek() then
				local NowResult1 = v2.now()
				
				if NowResult < NowResult1 then
					v3 = (X1 - X) / (NowResult1 - NowResult)
				end
				X = X1
				NowResult = NowResult1
			end
			local CallbackResult = Callback(AbsoluteWindowSizeResult)
			
			if not CellResult2:peek() and not ClampedValue and not Flag3 and CellResult4:peek() and CallbackResult.X > 0 then
				local ClampedValue2 = math.clamp(TypesUDim2.fromOffset((math.clamp(math.floor(X1 / CallbackResult.X + 0.5) + 1, 1, #Frame.pages) - 1) * CellResult1:peek(), 0).X.Offset * LayoutUnitResult:peek(), 0, (math.max(0, AbsoluteCanvasSizeResult:peek().X - CallbackResult.X)))
				
				if math.abs(X1 - ClampedValue2) >= 0.5 then
					SchedulerResult.replace("wheel", p1.metric("motion.durations.scrollReveal"), function()
						-- upvalues: ClampedValue1 (upval), ClampedValue (upval), Flag3 (upval), ClampedValue2 (copy), Pages (upval), SettleModuleResult (upval), TypesVector2 (upval)
						ClampedValue1 = ClampedValue2
						ClampedValue = ClampedValue2
						Flag3 = true
						Pages:ResetScrollVelocity()
						
						if not SettleModuleResult.launch(Pages.CanvasPosition.X, 0) then
							Flag3 = false
							Pages.CanvasPosition = TypesVector2.new(ClampedValue2, 0)
						end
					end)
				end
			end
			if not Callback(CellResult4) or not Callback(AvailableResult) or Callback(CellResult2) or CallbackResult.X <= 0 or ClampedValue and math.abs(X1 - ClampedValue) > 0.5 then return end
			ClampedValue = nil
			local ClampedValue3 = math.clamp(math.floor(X1 / CallbackResult.X + 0.5) + 1, 1, #Frame.pages)
			
			if math.abs(X1 - math.clamp(TypesUDim2.fromOffset((ClampedValue3 - 1) * CellResult1:peek(), 0).X.Offset * LayoutUnitResult:peek(), 0, (math.max(0, Callback(AbsoluteCanvasSizeResult).X - CallbackResult.X)))) < 0.5 then
				local Id = Frame.pages[ClampedValue3].id
				
				if Frame.selection:peek() ~= Id then
					Frame.selection:set(Id)
				end
				local Entry = t1[Id]
				local GetResult = if GuiService then p1.selection.get() else nil
				
				if GuiService and (Flag2 and GetResult == nil or p3.within(GetResult, Pages)) then
					Flag2 = false
					
					if not p3.within(GetResult, Entry) then
						local FirstSelectableResult = nil
						
						for _, child in Entry:GetChildren() do
							FirstSelectableResult = p3.firstSelectable(child)
							
							if FirstSelectableResult then break end
						end
						if FirstSelectableResult == nil then
							Entry.Selectable = true
							FirstSelectableResult = Entry
						end
						p1.selection.set(FirstSelectableResult)
					end
				end
			end
		end)
		
		if CellResult3 then
			local ObserveResult = if GuiService then p1.selection.observe() else nil
			Runtime.connect(Pages, "MouseEnter", function()
				-- upvalues: Flag (ref), CellResult3 (copy)
				Flag = true
				CellResult3:set(true)
			end)
			Runtime.connect(Pages, "MouseLeave", function()
				-- upvalues: Flag (ref), CellResult3 (copy), CellResult2 (copy), Flag1 (ref)
				Flag = false
				CellResult3:set(CellResult2:peek() or Flag1)
			end)
			Compose.watch(function(Callback)
				-- upvalues: ReadFunction (upval), Frame (copy), CellResult3 (copy), ObserveResult (copy), SchedulerResult (copy), p3 (upval), Pages (copy), t (copy)
				local ReadResult: number = ReadFunction(Frame.autoAdvanceSeconds, Callback)
				local CallbackResult = Callback(Frame.selection)
				local CallbackResult1 = Callback(CellResult3)
				local CallbackResult2 = if ObserveResult then Callback(ObserveResult) else nil
				SchedulerResult.cancel("advance")
				
				if ReadResult == nil then return end
				assert(ReadResult > 0 and ReadResult < 1e999, "PageView.autoAdvanceSeconds must be finite and positive")
				
				if not CallbackResult1 and (not CallbackResult2 or not p3.within(CallbackResult2, Pages)) and #Frame.pages >= 2 then
					SchedulerResult.replace("advance", ReadResult, function()
						-- upvalues: Frame (upval), t (upval), CallbackResult (copy)
						Frame.selection:set(Frame.pages[t[CallbackResult] % #Frame.pages + 1].id)
					end)
					
					return
				end
			end)
		end
		local _ = function(p5)
			-- upvalues: t (copy), Frame (copy)
			Frame.selection:set(Frame.pages[math.clamp(t[Frame.selection:peek()] + p5, 1, #Frame.pages)].id)
		end
		
		if GuiService and p1.action then
			local ObserveResult1 = p1.selection.observe()
			
			local function inside(Callback)
				-- upvalues: p3 (upval), ObserveResult1 (copy), Pages (copy)
				return p3.within(Callback(ObserveResult1), Pages)
			end
			
			p1.action(Pages, "PageForward", { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight }, inside, function()
				-- upvalues: t (copy), Frame (copy)
				Frame.selection:set(Frame.pages[math.clamp(t[Frame.selection:peek()] + 1, 1, #Frame.pages)].id)
			end, { priority = 1500, capture = true })
			p1.action(Pages, "PageBack", { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft }, inside, function()
				-- upvalues: t (copy), Frame (copy)
				Frame.selection:set(Frame.pages[math.clamp(t[Frame.selection:peek()] + -1, 1, #Frame.pages)].id)
			end, { priority = 1500, capture = true })
		end
		local List = {}
		local v5 = nil
		
		if Frame.summary ~= false then
			table.insert(List, p1.text({
				Name = "Summary",
				Text = function(Callback)
					-- upvalues: p1 (upval), t (copy), Frame (copy)
					return p1.phrase("Facet.PageOf", "Page {current} of {count}", {
						current = t[Callback(Frame.selection)],
						count = #Frame.pages
					}, Callback)
				end,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			}))
		end
		if Frame.indicators ~= false then
			local List1 = {}
			
			for Current, page2 in Frame.pages do
				local Id = page2.id
				local Object = p2.Button(Id)({
					BackgroundTransparency = 1,
					name = function(p5)
						-- upvalues: p1 (upval), Current (copy), Frame (copy)
						return p1.phrase("Facet.PageOf", "Page {current} of {count}", { current = Current, count = #Frame.pages }, p5)
					end,
					LayoutOrder = Current,
					Size = TypesUDim2.fromOffset(if IsOverlay then 24 else 44, 44),
					target = if IsOverlay then "inline" else "hit",
					AutomaticSize = TypesEnum.AutomaticSize.None,
					selected = function(Callback): boolean
						-- upvalues: Frame (copy), Id (copy)
						return Callback(Frame.selection) == Id
					end,
					onActivate = function()
						-- upvalues: Frame (copy), Id (copy)
						Frame.selection:set(Id)
					end
				})
				Object:AddTag("facet-page-indicator")
				Runtime.mount(function()
					-- upvalues: p1 (upval), Host (upval), TypesVector2 (upval), TypesUDim2 (upval)
					return p1.styled(Host.Frame("Dot")({
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Position = TypesUDim2.fromScale(0.5, 0.5),
						Size = TypesUDim2.fromOffset(8, 8),
						BorderSizePixel = 0,
						Host.UICorner({ CornerRadius = p1.round })
					}), "page-dot")
				end, Object)
				table.insert(List1, Object)
			end
			local config = { Name = "Indicators" }
			
			if IsOverlay then
				config.AnchorPoint = TypesVector2.new(0.5, 1)
				
				function config.Position(Callback)
					-- upvalues: IsAutomaticSizeMatch (copy), TypesUDim2 (upval), CellResult (copy), v1 (copy)
					return if IsAutomaticSizeMatch then TypesUDim2.new(0.5, 0, 0, Callback(CellResult)) else TypesUDim2.new(0.5, 0, 1, -v1)
				end
				
				config.ZIndex = 2
			end
			local RowResult = p1.row(List1, config)
			assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).Padding = p1.types.UDim.new(0, 0)
			
			if IsOverlay then
				v5 = RowResult
			else
				table.insert(List, RowResult)
			end
		end
		if Frame.controls ~= false then
			table.insert(List, p1.row({
				p2.Button("Previous")({
					label = "Previous",
					enabled = function(Callback): boolean
						-- upvalues: t (copy), Frame (copy)
						return t[Callback(Frame.selection)] > 1
					end,
					onActivate = function()
						-- upvalues: t (copy), Frame (copy)
						Frame.selection:set(Frame.pages[math.clamp(t[Frame.selection:peek()] + -1, 1, #Frame.pages)].id)
					end
				}),
				p2.Button("Next")({
					label = "Next",
					enabled = function(Callback): boolean
						-- upvalues: t (copy), Frame (copy)
						return t[Callback(Frame.selection)] < #Frame.pages
					end,
					onActivate = function()
						-- upvalues: t (copy), Frame (copy)
						Frame.selection:set(Frame.pages[math.clamp(t[Frame.selection:peek()] + 1, 1, #Frame.pages)].id)
					end
				})
			}))
		end
		local ColumnResult = p1.column(List, {
			Name = "Footer",
			Position = function(Callback)
				-- upvalues: IsAutomaticSizeMatch (copy), TypesUDim2 (upval), CellResult (copy), v1 (copy)
				return if IsAutomaticSizeMatch then TypesUDim2.fromOffset(0, Callback(CellResult)) else TypesUDim2.new(0, 0, 1, -v1)
			end,
			Size = TypesUDim2.new(1, 0, 0, v1),
			AutomaticSize = TypesEnum.AutomaticSize.None
		})
		assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout")).HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
		local config1 = {
			Name = "PageView",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			Pages,
			ColumnResult
		}
		
		if v5 then
			config1[#config1 + 1] = v5
		end
		local FrameResult = Host.Frame(p1.props(Frame, {
			"pages", "selection", "indicators", "indicatorPlacement", "summary",
			"controls", "autoAdvanceSeconds", "scrollWheel"
		}, config1))
		
		if IsAutomaticSizeMatch then
			local LayoutUnitResult1 = p1.layoutUnit(FrameResult)
			Compose.watch(function(Callback)
				-- upvalues: AbsoluteSizeResults (copy), CellResult (copy), LayoutUnitResult1 (copy)
				local Largest = 0
				
				for _, absoluteSizeResult in AbsoluteSizeResults do
					Largest = math.max(Largest, Callback(absoluteSizeResult).Y)
				end
				CellResult:set((math.ceil(Largest / Callback(LayoutUnitResult1) - 0.001)))
			end)
		end
		return FrameResult
	end)
end