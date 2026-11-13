local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local MotionModule = require("./motion")
local AdaptiveModule = require("./adaptive")
local SegmentMetricsModule = require("./segment_metrics")
local ReservationsModule = require("./reservations")
local _ = require("./control_types")
local _ = require("./navigation_props")
local _ = require("./nav_page_layers")
local NavTabMetricsModule = require("./nav_tab_metrics")
local NavTabItemModule = require("./nav_tab_item")
local NavTabAccessoriesModule = require("./nav_tab_accessories")
local PresentationReadinessModule = require("./presentation_readiness")
local ScrollLockModule = require("./scroll_lock")
local TransitionModule = require("./transition")
local LayoutKitModule = require("./layout_kit")
local PreparationModule = require("./preparation")

return function(p1, p2, p3, p4)
	-- upvalues: MotionModule (copy), AdaptiveModule (copy), TransitionModule (copy), LayoutKitModule (copy), NavTabMetricsModule (copy), SegmentMetricsModule (copy), NavTabItemModule (copy), ScrollLockModule (copy), ReservationsModule (copy), NavTabAccessoriesModule (copy), PreparationModule (copy), PresentationReadinessModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	local LayerFunction = p4.layer
	local CheckedSelectionFunction = p4.checkedSelection
	local Total = 0
	p2.TabView = p1.construct("TabView", function(p5)
		-- upvalues: Total (ref), MotionModule (upval), p1 (copy), Compose (copy), ReadFunction (copy), ReadFunction (copy), CheckedSelectionFunction (copy), TypesUDim2 (copy), Runtime (copy), Host (copy), p3 (copy), ReadFunction (copy), AdaptiveModule (upval), TypesEnum (copy), TransitionModule (upval), LayoutKitModule (upval), TypesVector2 (copy), NavTabMetricsModule (upval), SegmentMetricsModule (upval), NavTabItemModule (upval), p2 (copy), ScrollLockModule (upval), ReservationsModule (upval), LayerFunction (copy), TypesUDim (copy), NavTabAccessoriesModule (upval), PreparationModule (upval), PresentationReadinessModule (upval)
		local Retention = p5.retention
		assert(Retention == nil or (Retention == "all" or Retention == "top"), "TabView.retention uses Compose all or top")
		local Total1: number = Total
		local LevelResult = MotionModule.level(p1)
		local CellResult = Compose.cell(Total1 > 0)
		local config = {
			neutral = true,
			info = true,
			success = true,
			warning = true,
			error = true,
			accent = true,
			voice = true,
			contrast = true
		}
		local config1 = { dot = true, ring = true, square = true, dash = true }
		
		for _, value in ReadFunction(p5.tabs) do
			local Indicator = value.indicator
			
			if Indicator ~= nil then
				assert(type(Indicator) == "table", "Facet UI.TabView: tab.indicator must be a StatusIndicator spec table { form?, status?, count?, max? }")
				assert(Indicator.status == nil or config[Indicator.status], "Facet UI.TabView: tab.indicator.status must be neutral, info, success, warning, error or accent")
				assert(Indicator.form == nil or config1[Indicator.form], "Facet UI.TabView: tab.indicator.form must be dot, ring, square or dash")
			end
		end
		local NoTextSize: boolean = p5.textSize == nil or p5.textSize == "fit"
		local TabView = p5.labelPlacement == nil or table.find({ "besideIcon", "belowIcon" }, ReadFunction(assert(p5.labelPlacement)))
		assert(TabView, "Invalid TabView.labelPlacement")
		TabView = p5.style == nil or table.find({ "automatic", "sidebarAdaptable", "collapsible" }, p5.style)
		assert(TabView, "Invalid TabView.style")
		local SectionLabels = {}
		local Sections = p5.sections or {}
		for _, section in Sections do
			assert(type(section.id) == "string" and type(section.label) == "string" and SectionLabels[section.id] == nil, "TabView sections require unique ids and labels")
			SectionLabels[section.id] = section.label
		end
		TabView = CheckedSelectionFunction(p5.selection, ReadFunction(p5.tabs), "TabView")
		local FormulaResult = Compose.formula(function(p6)
			-- upvalues: ReadFunction (upval), p5 (copy), SectionLabels (copy)
			local t = {}
			
			for _, value in ReadFunction(p5.tabs, p6) do
				assert(type(value.id) == "string" and t[value.id] == nil, "TabView tabs require unique string ids")
				assert(value.section == nil or SectionLabels[value.section] ~= nil, "TabView tab.section must name a declared section")
				t[value.id] = value
			end
			return t
		end)
		local PropsResult = p1.props(p5, {
			"selection", "tabs", "sections", "customization", "accessories", "railWidth",
			"transition", "retention", "placement", "style", "sidebarPreference",
			"sidebarExpanded", "restoreScroll", "shoulderNavigation", "restoreFocus",
			"indicator", "track", "indicatorPlacement", "iconOnly", "textSize",
			"labelPlacement", "enabled", "onChange", "controlSize"
		}, {
			Name = "TabView",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1)
		})
		local RunService = p1.config.services.RunService
		local HasFrames: boolean = RunService ~= nil and (RunService.PreRender ~= nil and Runtime.host.frames ~= nil)
		local FadeResult = if HasFrames then p1.fade(PropsResult, false, false) else Host.Frame(PropsResult)
		
		if HasFrames then
			p1.fadeTo(FadeResult, 1)
		end
		local LayoutUnitResult = p1.layoutUnit(FadeResult)
		local LayoutSizeResult = p1.layoutSize(FadeResult, LayoutUnitResult)
		
		local function locate()
			-- upvalues: FadeResult (copy), Total1 (copy), CellResult (copy)
			local Parent = FadeResult.Parent
			local IsTotalAbove = Total1 > 0
			while Parent and not IsTotalAbove do
				IsTotalAbove = Parent:GetAttribute("FacetTabPage") == true
				Parent = Parent.Parent
			end
			if CellResult:peek() ~= IsTotalAbove then
				CellResult:set(IsTotalAbove)
			end
		end
		
		Runtime.connect(FadeResult, "AncestryChanged", locate)
		locate()
		local UserInputService = p3.service("UserInputService")
		local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else Compose.cell(nil)
		local TenFootResult = p1.tenFoot()
		local ViewportDisplaySizeResult = if p1.config.guiService then p1.observe.ViewportDisplaySize(p1.config.guiService) else nil
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: p5 (copy), ReadFunction (upval), TenFootResult (copy), ReadFunction (upval), CellResult (copy), LayoutSizeResult (copy), PreferredInputResult (copy), ViewportDisplaySizeResult (copy), AdaptiveModule (upval), TypesEnum (upval), ReadFunction (upval)
			if p5.style == "collapsible" then
				return "topBar"
			end
			local ReadResult = ReadFunction(p5.placement, Callback)
			
			if ReadResult and ReadResult ~= "automatic" then
				return ReadResult
			end
			local TenFootResultResult = TenFootResult(Callback)
			
			if p5.style == "sidebarAdaptable" and TenFootResultResult and ReadFunction(p5.sidebarExpanded, Callback) == true then
				return "sidebar"
			end
			if Callback(CellResult) then
				return "topBar"
			end
			local CallbackResult = Callback(LayoutSizeResult)
			local CallbackResult1 = Callback(PreferredInputResult)
			local CallbackResult2 = if ViewportDisplaySizeResult then Callback(ViewportDisplaySizeResult) else nil
			local NavPlacementResult = AdaptiveModule.navPlacement({
				sizeClass = AdaptiveModule.sizeClass(CallbackResult.X),
				heightClass = AdaptiveModule.heightClass(CallbackResult.Y),
				primary = if CallbackResult1 == TypesEnum.PreferredInput.Gamepad then "gamepad" elseif CallbackResult1 == TypesEnum.PreferredInput.Touch then "touch" else "pointer",
				displaySize = if typeof(CallbackResult2) == "EnumItem" then CallbackResult2.Name else nil,
				tenFoot = TenFootResultResult
			})
			
			if NavPlacementResult == "bottomBar" and #ReadFunction(p5.tabs, Callback) > 5 then
				return "topBar"
			end
			if p5.style == "sidebarAdaptable" and not TenFootResultResult and (NavPlacementResult == "sidebar" or NavPlacementResult == "topBar") then
				local ReadResult1 = ReadFunction(p5.sidebarPreference, Callback)
				
				if ReadResult1 and ReadResult1 ~= "automatic" then
					return ReadResult1
				end
			end
			return NavPlacementResult
		end)
		local CellResult1 = Compose.cell(FormulaResult1:peek())
		local CellResult2 = Compose.cell(FormulaResult1:peek() == "none")
		local PacedResult = TransitionModule.paced(p1, function(Callback): number
			-- upvalues: CellResult2 (copy)
			return if Callback(CellResult2) then 1 else 0
		end, Compose.formula(function(p7): boolean
			-- upvalues: LevelResult (copy)
			return LevelResult(p7) ~= "normal"
		end), function(p7)
			-- upvalues: p1 (upval)
			return p1.metric("motion.durations.tabChrome", p7)
		end, p1.motionEase("fade"), true)
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult1 (copy), CellResult2 (copy), PacedResult (copy), CellResult1 (copy)
			local CallbackResult = Callback(FormulaResult1)
			CellResult2:set(CallbackResult == "none")
			
			if CallbackResult ~= "none" or Callback(PacedResult) >= 1 then
				CellResult1:set(CallbackResult)
			end
		end)
		
		local function indicatorOf(p7)
			-- upvalues: ReadFunction (upval), p5 (copy)
			local ReadResult = ReadFunction(p5.indicator, p7)
			
			return if (ReadResult == nil or ReadResult == "automatic") and p5.style == "sidebarAdaptable" then "pill" else ReadResult
		end
		
		local FormulaResult2 = Compose.formula(function(Callback): boolean
			-- upvalues: p5 (copy), CellResult (copy), ReadFunction (upval), LayoutSizeResult (copy)
			if p5.style == "collapsible" then
				return true
			elseif not Callback(CellResult) or p5.style ~= nil and p5.style ~= "automatic" then
				return false
			else
				local ReadResult = ReadFunction(p5.placement, Callback)
				
				if ReadResult and ReadResult ~= "automatic" then
					return false
				else
					local CallbackResult = Callback(LayoutSizeResult)
					
					return CallbackResult.Y > 0 and CallbackResult.Y < 480
				end
			end
		end)
		local CellResult3 = Compose.cell(0)
		local CellResult4 = Compose.cell(0)
		local CellResult5 = Compose.cell(0)
		local CellResult6 = Compose.cell(0)
		local CellResult7 = Compose.cell(0)
		LayoutKitModule.of(p1).underTopbar(FadeResult, CellResult7)
		local FormulaResult3 = Compose.formula(function(Callback)
			-- upvalues: CellResult3 (copy), CellResult7 (copy)
			return Callback(CellResult3) + Callback(CellResult7)
		end)
		local FormulaResult4 = Compose.formula(function(Callback)
			-- upvalues: ReadFunction (upval), p5 (copy), FormulaResult (copy), ReadFunction (upval)
			local ReadResult = ReadFunction(p5.customization, Callback)
			local CallbackResult = Callback(FormulaResult)
			
			if not ReadResult then
				return ReadFunction(p5.tabs, Callback)
			end
			local List = {}
			local t = {}
			local t1 = {}
			local Hidden = ReadResult.hidden or {}
			local Order = ReadResult.order or {}
			for _, value in Hidden do
				t1[value] = true
			end
			for _, value1 in Order do
				local CallbackResultEntry = CallbackResult[value1]
				
				if CallbackResultEntry and not t[value1] and (not t1[value1] or CallbackResultEntry.required) then
					table.insert(List, CallbackResultEntry)
					t[value1] = true
				end
			end
			for _, value2 in ReadFunction(p5.tabs, Callback) do
				if not t[value2.id] and (not t1[value2.id] or value2.required) then
					table.insert(List, value2)
				end
			end
			assert(#List > 0, "TabView customization must leave a visible tab")
			
			return List
		end)
		local CellResult8 = Compose.cell({})
		local Flag = false
		local Parents = {}
		local PeekResults = {}
		local t = {}
		local TabButtons = {}
		local CellResult9 = Compose.cell(0)
		local TabMeasures = {}
		local GuiService = p3.service("GuiService")
		local ObserveResult = if GuiService then p1.selection.observe() else Compose.cell(nil)
		local v1 = nil
		local CellResult10 = Compose.cell(nil)
		local SelectorResult = Compose.selector(CellResult10)
		Compose.watch(function(Callback)
			-- upvalues: p5 (copy), FormulaResult (copy), FormulaResult4 (copy), TabView (ref), CellResult8 (copy), v1 (ref), Parents (copy), ObserveResult (copy), GuiService (copy), p3 (upval), PeekResults (copy), CellResult10 (copy), TypesVector2 (upval)
			local CallbackResult = Callback(p5.selection)
			local CallbackResult1 = Callback(FormulaResult)
			local Flag = false
			
			for _, value in Callback(FormulaResult4) do
				if value.id == CallbackResult then
					Flag = true
					break
				end
			end
			if not Flag then
				p5.selection:set(Callback(FormulaResult4)[1].id)
				
				return
			end
			if CallbackResult1 ~= TabView then
				TabView = CallbackResult1
				local List = {}
				
				for _, value1 in CellResult8:peek() do
					if TabView[value1] then
						table.insert(List, value1)
					end
				end
				if #List ~= #CellResult8:peek() then
					CellResult8:set(List)
				end
			end
			if v1 == CallbackResult then return end
			local Flag1 = false
			local Parent = if v1 then Parents[v1] else nil
			local PeekResult = ObserveResult:peek()
			
			if GuiService and v1 and Parent and p3.within(PeekResult, Parent) then
				Flag1 = true
				PeekResults[v1] = PeekResult
			end
			local PeekResult1 = CellResult8:peek()
			local FoundIndex: number? = table.find(PeekResult1, CallbackResult)
			
			if not FoundIndex or p5.transition ~= false or p5.retention == "top" then
				local Copy = table.clone(PeekResult1)
				
				if FoundIndex then
					table.remove(Copy, FoundIndex)
				end
				table.insert(Copy, CallbackResult)
				CellResult8:set(Copy)
			end
			local PeekResult2 = PeekResults[CallbackResult]
			CellResult10:set(if p5.restoreFocus == false or not GuiService or not Flag1 and (not PeekResult2 or not PeekResult2.Parent) then nil else CallbackResult)
			
			if p5.restoreScroll == false and Parents[CallbackResult] then
				local function reset(ScrollingFrame)
					-- upvalues: TypesVector2 (upval), reset (copy)
					if ScrollingFrame:IsA("ScrollingFrame") then
						ScrollingFrame.CanvasPosition = TypesVector2.zero
					end
					for _, child in ScrollingFrame:GetChildren() do
						reset(child)
					end
				end
				
				local Parent1 = Parents[CallbackResult]
				
				if Parent1:IsA("ScrollingFrame") then
					Parent1.CanvasPosition = TypesVector2.zero
				end
				for _, child in Parent1:GetChildren() do
					reset(child)
				end
			end
			v1 = CallbackResult
		end)
		
		local function _(p7, p8): boolean
			-- upvalues: p1 (upval), FormulaResult (copy), ReadFunction (upval)
			local SourceEntry = p1.readSource(FormulaResult, p8)[p7]
			
			return SourceEntry ~= nil and ReadFunction(SourceEntry.enabled, p8) ~= false
		end
		
		local SelectorResult1 = Compose.selector(p5.selection)
		
		local function _select(Id)
			-- upvalues: ReadFunction (upval), p5 (copy), p1 (upval), FormulaResult (copy)
			if ReadFunction(p5.enabled) ~= false and Id ~= p5.selection:peek() then
				local SourceEntry = p1.readSource(FormulaResult, nil)[Id]
				
				if SourceEntry ~= nil and ReadFunction(SourceEntry.enabled, nil) ~= false then
					p5.selection:set(Id)
					
					if p5.onChange then
						p5.onChange(Id)
					end
					return
				end
			end
		end
		
		local Frame = {
			fit = NoTextSize,
			placement = CellResult1,
			visibleTabs = FormulaResult4,
			dimensions = LayoutSizeResult,
			layoutUnit = LayoutUnitResult,
			headHeight = CellResult3,
			footHeight = CellResult4,
			trailingWidth = CellResult5,
			indicatorOf = indicatorOf
		}
		local NavTabMetricsModuleResult = NavTabMetricsModule(p1, p5, Frame)
		local FloatingFunction = NavTabMetricsModuleResult.floating
		local FloatingSizeFunction = NavTabMetricsModuleResult.floatingSize
		local FloatingPositionFunction = NavTabMetricsModuleResult.floatingPosition
		local SegmentedTopFunction = NavTabMetricsModuleResult.segmentedTop
		local InsetFunction = NavTabMetricsModuleResult.inset
		local BandFunction = NavTabMetricsModuleResult.band
		local RailWidthFunction = NavTabMetricsModuleResult.railWidth
		local BottomInsetFunction = NavTabMetricsModuleResult.bottomInset
		local BarExtent = NavTabMetricsModuleResult.barExtent
		local StripOverflows = NavTabMetricsModuleResult.stripOverflows
		local StripContent = NavTabMetricsModuleResult.stripContent
		local Inset = SegmentMetricsModule.inset
		local ScrollFrame = Host.ScrollingFrame("Tabs")({
			ZIndex = 2,
			Selectable = false,
			BackgroundTransparency = function(p7): number
				-- upvalues: SegmentedTopFunction (copy)
				return if SegmentedTopFunction(p7) then 0 else 1
			end,
			BorderSizePixel = 0,
			ScrollBarThickness = function(Callback): number
				-- upvalues: CellResult1 (copy)
				return if Callback(CellResult1) == "sidebar" then 2 else 0
			end,
			VerticalScrollBarInset = TypesEnum.ScrollBarInset.ScrollBar,
			HorizontalScrollBarInset = TypesEnum.ScrollBarInset.None,
			CanvasSize = TypesUDim2.fromOffset(0, 0),
			AutomaticCanvasSize = function(Callback)
				-- upvalues: CellResult1 (copy), TypesEnum (upval)
				return if Callback(CellResult1) == "sidebar" then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.X
			end,
			ScrollingDirection = function(Callback)
				-- upvalues: CellResult1 (copy), TypesEnum (upval)
				return if Callback(CellResult1) == "sidebar" then TypesEnum.ScrollingDirection.Y else TypesEnum.ScrollingDirection.X
			end,
			Size = function(p7)
				-- upvalues: SegmentedTopFunction (copy), TypesUDim2 (upval), BandFunction (copy), Inset (copy)
				return if SegmentedTopFunction(p7) then TypesUDim2.fromOffset(0, BandFunction(p7) + 2 * Inset) else TypesUDim2.fromScale(1, 1)
			end,
			AutomaticSize = function(p7)
				-- upvalues: SegmentedTopFunction (copy), TypesEnum (upval)
				return if SegmentedTopFunction(p7) then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.None
			end,
			Host.UIFlexItem({
				FlexMode = function(p7)
					-- upvalues: SegmentedTopFunction (copy), TypesEnum (upval)
					return if SegmentedTopFunction(p7) then TypesEnum.UIFlexMode.Shrink else TypesEnum.UIFlexMode.None
				end
			}),
			Host.Frame("Strip")({
				BackgroundTransparency = 1,
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), CellResult1 (copy)
					return TypesUDim2.fromScale(1, if Callback(CellResult1) == "sidebar" then 0 else 1)
				end,
				AutomaticSize = function(Callback)
					-- upvalues: CellResult1 (copy), TypesEnum (upval)
					return if Callback(CellResult1) == "sidebar" then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.X
				end,
				Host.UIPadding({
					PaddingLeft = InsetFunction,
					PaddingRight = InsetFunction,
					PaddingTop = InsetFunction,
					PaddingBottom = InsetFunction
				}),
				NavTabMetricsModuleResult.stripLayout,
				NavTabItemModule(p1, p2, p3, p5, {
					isCurrent = SelectorResult1,
					frame = Frame,
					select = _select,
					sectionLabels = SectionLabels,
					tabButtons = TabButtons,
					tabMeasures = TabMeasures,
					tabLinks = CellResult9,
					metrics = NavTabMetricsModuleResult
				})
			})
		})
		ScrollLockModule.own(ScrollFrame, p1)
		
		local function stowOffset(Callback)
			-- upvalues: PacedResult (copy), TypesUDim2 (upval), CellResult1 (copy), RailWidthFunction (copy), BandFunction (copy), BottomInsetFunction (copy), Inset (copy)
			local CallbackResult: number = Callback(PacedResult)
			
			if CallbackResult <= 0 then
				return TypesUDim2.fromOffset(0, 0)
			else
				local CallbackResult1: string = Callback(CellResult1)
				
				return if CallbackResult1 == "sidebar" then TypesUDim2.fromOffset(-CallbackResult * RailWidthFunction(Callback), 0) elseif string.find(CallbackResult1, "bottom") then TypesUDim2.fromOffset(0, CallbackResult * (BandFunction(Callback) + BottomInsetFunction(Callback) + 2 * Inset)) elseif CallbackResult1 == "topBar" then TypesUDim2.fromOffset(0, -CallbackResult * (BandFunction(Callback) + 2 * Inset)) else TypesUDim2.fromOffset(0, 0)
			end
		end
		
		local Object = Host.Frame("TabBand")({
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = function(Callback)
				-- upvalues: FloatingFunction (copy), FloatingSizeFunction (copy), SegmentedTopFunction (copy), TypesUDim2 (upval), CellResult5 (copy), BandFunction (copy), Inset (copy), CellResult1 (copy), RailWidthFunction (copy), FormulaResult3 (copy), CellResult4 (copy)
				return if FloatingFunction(Callback) then FloatingSizeFunction(Callback) elseif SegmentedTopFunction(Callback) then TypesUDim2.new(1, -Callback(CellResult5), 0, BandFunction(Callback) + 2 * Inset) elseif Callback(CellResult1) == "sidebar" then TypesUDim2.new(0, RailWidthFunction(Callback) - 16, 1, -Callback(FormulaResult3) - Callback(CellResult4)) else TypesUDim2.new(1, -Callback(CellResult5), 0, BandFunction(Callback))
			end,
			Position = function(Callback)
				-- upvalues: FloatingFunction (copy), FloatingPositionFunction (copy), stowOffset (copy), CellResult1 (copy), TypesUDim2 (upval), FormulaResult3 (copy), BandFunction (copy)
				return if FloatingFunction(Callback) then FloatingPositionFunction(Callback) + stowOffset(Callback) else (if Callback(CellResult1) == "sidebar" then TypesUDim2.fromOffset(8, Callback(FormulaResult3)) elseif string.find(Callback(CellResult1), "bottom") then TypesUDim2.new(0, 0, 1, -BandFunction(Callback)) else TypesUDim2.fromOffset(0, 0)) + stowOffset(Callback)
			end,
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Horizontal,
				HorizontalAlignment = TypesEnum.HorizontalAlignment.Center,
				VerticalAlignment = TypesEnum.VerticalAlignment.Center
			}),
			ScrollFrame
		})
		Compose.watch(function(p7)
			-- upvalues: SegmentedTopFunction (copy), FadeResult (copy), Object (copy), ScrollFrame (copy)
			if SegmentedTopFunction(p7) then
				FadeResult:AddTag("facet-top-tabs")
				Object:AddTag("facet-top-tabs")
				ScrollFrame:AddTag("facet-tab-plate")
				ScrollFrame:AddTag("facet-segmented")
				
				return
			else
				FadeResult:RemoveTag("facet-top-tabs")
				Object:RemoveTag("facet-top-tabs")
				ScrollFrame:RemoveTag("facet-tab-plate")
				ScrollFrame:RemoveTag("facet-segmented")
			end
		end)
		local CellResult11 = Compose.cell(0)
		local AbsolutePositionResult = p1.observe.AbsolutePosition(ScrollFrame)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(ScrollFrame)
		local LayerCollector = nil
		Runtime.connect(ScrollFrame, "AncestryChanged", function()
			-- upvalues: CellResult11 (copy)
			CellResult11:set(CellResult11:peek() + 1)
		end)
		Compose.watch(function(Callback)
			-- upvalues: CellResult11 (copy), ScrollFrame (copy), LayerCollector (ref), ReservationsModule (upval), CellResult1 (copy), AbsoluteSizeResult (copy), AbsolutePositionResult (copy), CellResult6 (copy), BottomInsetFunction (copy)
			Callback(CellResult11)
			local LayerCollector1 = ScrollFrame:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector and LayerCollector ~= LayerCollector1 then
				ReservationsModule.clear(LayerCollector, ScrollFrame)
			end
			LayerCollector = LayerCollector1
			
			if LayerCollector1 and LayerCollector1:IsA("GuiBase2d") then
				local IsYAbove: boolean = string.find(Callback(CellResult1), "bottom") ~= nil and Callback(AbsoluteSizeResult).Y > 0
				local YDelta = Callback(AbsolutePositionResult).Y - LayerCollector1.AbsolutePosition.Y - Callback(CellResult6)
				ReservationsModule.set(LayerCollector1, ScrollFrame, "bottom", if IsYAbove then YDelta else nil, if IsYAbove then Callback(AbsoluteSizeResult).Y + Callback(CellResult6) + BottomInsetFunction(Callback) else nil)
			end
		end)
		Compose.cleanup(function()
			-- upvalues: LayerCollector (ref), ReservationsModule (upval), ScrollFrame (copy)
			if LayerCollector then
				ReservationsModule.clear(LayerCollector, ScrollFrame)
			end
		end)
		local SetPropertyFunction = Runtime.host.render.setProperty
		Compose.watch(function(Callback)
			-- upvalues: CellResult9 (copy), CellResult1 (copy), FormulaResult4 (copy), TabButtons (copy), ReadFunction (upval), p5 (copy), p1 (upval), FormulaResult (copy), SetPropertyFunction (copy)
			Callback(CellResult9)
			local IsSidebar = Callback(CellResult1) == "sidebar"
			local List = {}
			
			for _, value in Callback(FormulaResult4) do
				local TabButton = TabButtons[value.id]
				
				if TabButton and TabButton.Parent then
					local v2 = false
					
					if ReadFunction(p5.enabled, Callback) ~= false then
						local SourceEntry = p1.readSource(FormulaResult, Callback)[value.id]
						v2 = SourceEntry ~= nil and ReadFunction(SourceEntry.enabled, Callback) ~= false
					end
					if v2 then
						table.insert(List, TabButton)
					else
						SetPropertyFunction(TabButton, "NextSelectionLeft", nil)
						SetPropertyFunction(TabButton, "NextSelectionRight", nil)
						SetPropertyFunction(TabButton, "NextSelectionUp", nil)
						SetPropertyFunction(TabButton, "NextSelectionDown", nil)
					end
				end
			end
			for i, value1 in List do
				local Entry = List[i - 1]
				local Entry1 = List[i + 1]
				SetPropertyFunction(value1, "NextSelectionLeft", if IsSidebar then nil else Entry)
				SetPropertyFunction(value1, "NextSelectionRight", if IsSidebar then nil else Entry1)
				SetPropertyFunction(value1, "NextSelectionUp", if IsSidebar then Entry else nil)
				SetPropertyFunction(value1, "NextSelectionDown", if IsSidebar then Entry1 else nil)
			end
		end)
		local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(ScrollFrame)
		local AbsolutePositionResult1 = p1.observe.AbsolutePosition(ScrollFrame)
		Compose.watch(function(Callback)
			-- upvalues: BarExtent (copy), AbsoluteSizeResult1 (copy)
			BarExtent:set(Callback(AbsoluteSizeResult1))
		end)
		Compose.watch(function(Callback)
			-- upvalues: AbsoluteSizeResult1 (copy), StripOverflows (copy), CellResult1 (copy), StripContent (copy), InsetFunction (copy)
			local X: number = Callback(AbsoluteSizeResult1).X
			StripOverflows:set(Callback(CellResult1) ~= "sidebar" and (X > 0 and X - 2 * InsetFunction(Callback).Offset + 0.5 < Callback(StripContent).X))
		end)
		local v3 = nil
		Compose.watch(function(Callback)
			-- upvalues: CellResult11 (copy), CellResult9 (copy), p5 (copy), ScrollFrame (copy), TabMeasures (copy), AbsoluteSizeResult1 (copy), AbsolutePositionResult1 (copy), CellResult1 (copy), StripContent (copy), StripOverflows (copy), v3 (ref), TypesVector2 (upval)
			Callback(CellResult11)
			Callback(CellResult9)
			local CallbackResult = Callback(p5.selection)
			ScrollFrame:SetAttribute("FacetEntry", CallbackResult)
			local TabMeasure = TabMeasures[CallbackResult]
			
			if not TabMeasure then return end
			local CallbackResult1 = Callback(AbsoluteSizeResult1)
			local CallbackResult2 = Callback(AbsolutePositionResult1)
			local CallbackResult3 = Callback(TabMeasure.position)
			local CallbackResult4 = Callback(TabMeasure.size)
			local IsSidebar = Callback(CellResult1) == "sidebar"
			local YDelta = if IsSidebar then CallbackResult3.Y - CallbackResult2.Y else CallbackResult3.X - CallbackResult2.X
			local Y = if IsSidebar then CallbackResult4.Y else CallbackResult4.X
			local Y1 = if IsSidebar then CallbackResult1.Y else CallbackResult1.X
			local Text: string = `{CallbackResult}:{Y1}:{Y}:{Callback(StripContent).X}:{Callback(StripOverflows)}`
			
			if Y1 <= 0 or Y <= 0 or v3 == Text then return end
			v3 = Text
			local YDelta1 = if YDelta < 0 then YDelta elseif Y1 < YDelta + Y then YDelta + Y - Y1 else 0
			
			if YDelta1 ~= 0 then
				ScrollFrame.CanvasPosition = if IsSidebar then TypesVector2.new(ScrollFrame.CanvasPosition.X, (math.max(0, ScrollFrame.CanvasPosition.Y + YDelta1))) else TypesVector2.new(math.max(0, ScrollFrame.CanvasPosition.X + YDelta1), ScrollFrame.CanvasPosition.Y)
			end
		end)
		local CellResults = {}
		local FormulaResult5 = nil
		
		if p5.transition ~= false then
			for i in TabView do
				CellResults[i] = Compose.cell(false)
			end
			FormulaResult5 = Compose.formula(function(Callback)
				-- upvalues: CellResults (copy), p5 (copy)
				return Callback(CellResults[Callback(p5.selection)])
			end)
		end
		local Object1 = Host.Frame("Content")({
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Position = function(Callback)
				-- upvalues: CellResult1 (copy), TypesUDim2 (upval), RailWidthFunction (copy), BandFunction (copy)
				local CallbackResult = Callback(CellResult1)
				
				return if CallbackResult == "sidebar" then TypesUDim2.fromOffset(RailWidthFunction(Callback), 0) elseif CallbackResult == "topBar" then TypesUDim2.fromOffset(0, BandFunction(Callback) + 8) else TypesUDim2.fromOffset(0, 0)
			end,
			Size = function(Callback)
				-- upvalues: CellResult1 (copy), TypesUDim2 (upval), RailWidthFunction (copy), BandFunction (copy), NavTabMetricsModuleResult (copy), CellResult6 (copy), BottomInsetFunction (copy)
				local CallbackResult = Callback(CellResult1)
				
				return if CallbackResult == "sidebar" then TypesUDim2.new(1, -RailWidthFunction(Callback), 1, 0) elseif CallbackResult == "none" then TypesUDim2.fromScale(1, 1) else TypesUDim2.new(1, 0, 1, -BandFunction(Callback) - NavTabMetricsModuleResult.contentGap(Callback) - Callback(CellResult6) - BottomInsetFunction(Callback))
			end,
			Compose.LayerStack({
				retention = "all",
				from = CellResult8,
				render = function(p7, p8, Name)
					-- upvalues: p5 (copy), SelectorResult1 (copy), Total (upval), TabView (ref), LayerFunction (upval), TypesUDim2 (upval), LevelResult (copy), p1 (upval), CellResult8 (copy), Flag (ref), CellResults (copy), FormulaResult5 (ref), Parents (copy), Compose (upval), Runtime (upval), SelectorResult (copy), GuiService (copy), CellResult10 (copy), PeekResults (copy), t (copy), TabButtons (copy), p3 (upval)
					local function onTop(Callback)
						-- upvalues: p5 (upval), SelectorResult1 (upval), Name (copy), p8 (copy)
						return if p5.transition == false then Callback(SelectorResult1(Name)) else Callback(p8).top
					end
					
					local Amount: number = if p5.placement == "none" then 0 else 1
					Total += Amount
					local Success, Result = pcall(function()
						-- upvalues: TabView (upval), p7 (copy)
						local ContentFunction = TabView[p7:peek()].content
						
						return if type(ContentFunction) == "function" then ContentFunction() else ContentFunction
					end)
					Total -= Amount
					
					if not Success then
						error(Result, 0)
					end
					local LayerResult = LayerFunction({
						Name = Name,
						BackgroundTransparency = 1,
						Size = TypesUDim2.fromScale(1, 1),
						Visible = onTop,
						SelectionGroup = true,
						Attributes = { FacetTabPage = p5.placement ~= "none" },
						Result
					}, p8, if p5.transition == nil then {
						seconds = function()
							-- upvalues: LevelResult (upval), p1 (upval)
							return if LevelResult() == "limited" then p1.metric("motion.reducedFade") else p1.metric("motion.durations.tabFade")
						end,
						ease = p1.motionEase("fade")
					} else p5.transition, if p5.retention == "top" then function()
						-- upvalues: p5 (upval), Name (copy), CellResult8 (upval)
						if p5.selection:peek() == Name then return end
						local List = {}
						
						for _, value in CellResult8:peek() do
							if value ~= Name then
								table.insert(List, value)
							end
						end
						CellResult8:set(List)
					end else nil, not Flag, CellResults[Name], FormulaResult5)
					Parents[Name] = LayerResult
					local VisibleResult = p1.observe.Visible(LayerResult)
					local InteractableResult = p1.observe.Interactable(LayerResult)
					local CellResult = Compose.cell(0)
					Runtime.connect(LayerResult, "AncestryChanged", function()
						-- upvalues: CellResult (copy)
						CellResult:set(CellResult:peek() + 1)
					end)
					Compose.watch(function(Callback)
						-- upvalues: SelectorResult (upval), Name (copy), GuiService (upval), CellResult (copy), VisibleResult (copy), InteractableResult (copy), p5 (upval), SelectorResult1 (upval), p8 (copy), LayerResult (copy), CellResult10 (upval), PeekResults (upval), t (upval), TabButtons (upval), p1 (upval), p3 (upval)
						if not Callback(SelectorResult(Name)) then return end
						Callback(CellResult)
						
						if not Callback(VisibleResult) or not Callback(InteractableResult) or (not (if p5.transition == false then Callback(SelectorResult1(Name)) else Callback(p8).top) or not GuiService or LayerResult:FindFirstAncestorWhichIsA("LayerCollector") == nil) then return end
						CellResult10:set(nil)
						local PeekResult = PeekResults[Name]
						
						if not PeekResult and t[Name] then
							local Gui = LayerResult
							
							for _, ChildName in t[Name] do
								if Gui then
									Gui = Gui:FindFirstChild(ChildName)
								else
									Gui = nil
								end
							end
							PeekResult = if Gui and Gui:IsA("GuiObject") then Gui else nil
						end
						t[Name] = nil
						local TabButton = TabButtons[Name]
						p1.selection.set(if PeekResult and p3.within(PeekResult, LayerResult) and PeekResult.Visible and PeekResult.Interactable then PeekResult else p3.firstSelectable(LayerResult) or (if TabButton and TabButton.Parent and TabButton.Visible then TabButton else nil))
					end)
					Compose.cleanup(function()
						-- upvalues: PeekResults (upval), Name (copy), p3 (upval), LayerResult (copy), t (upval), Parents (upval)
						local PeekResult = PeekResults[Name]
						
						if PeekResult and p3.within(PeekResult, LayerResult) then
							local List = {}
							local Parent = PeekResult
							while Parent and Parent ~= LayerResult do
								table.insert(List, 1, Parent.Name)
								Parent = Parent.Parent
							end
							t[Name] = List
						end
						Parents[Name] = nil
						PeekResults[Name] = nil
					end)
					
					return LayerResult
				end
			})
		})
		Compose.watch(function(Callback)
			-- upvalues: Object1 (copy), CellResult2 (copy), PacedResult (copy), CellResult1 (copy)
			Object1:SetAttribute("FacetSettling", Callback(CellResult2) and (Callback(PacedResult) > 0 and Callback(CellResult1) ~= "none"))
		end)
		Flag = true
		local Object2 = Host.Frame("Track")({
			ZIndex = 1,
			BorderSizePixel = 0,
			Visible = function(Callback): boolean
				-- upvalues: NavTabMetricsModuleResult (copy), FloatingFunction (copy), FormulaResult2 (copy), SegmentedTopFunction (copy)
				return if NavTabMetricsModuleResult.plated(Callback) then not Callback(FormulaResult2) and not SegmentedTopFunction(Callback) else FloatingFunction(Callback) and (not Callback(FormulaResult2) and not SegmentedTopFunction(Callback))
			end,
			Size = function(Callback)
				-- upvalues: FloatingFunction (copy), FloatingSizeFunction (copy), CellResult1 (copy), TypesUDim2 (upval), RailWidthFunction (copy), FormulaResult3 (copy), CellResult4 (copy)
				return if FloatingFunction(Callback) then FloatingSizeFunction(Callback) elseif Callback(CellResult1) == "sidebar" then TypesUDim2.new(0, RailWidthFunction(Callback) - 16, 1, -Callback(FormulaResult3) - Callback(CellResult4)) else TypesUDim2.fromOffset(0, 0)
			end,
			Position = function(Callback)
				-- upvalues: FloatingFunction (copy), FloatingPositionFunction (copy), stowOffset (copy), CellResult1 (copy), TypesUDim2 (upval), FormulaResult3 (copy)
				return if FloatingFunction(Callback) then FloatingPositionFunction(Callback) + stowOffset(Callback) elseif Callback(CellResult1) == "sidebar" then TypesUDim2.fromOffset(8, Callback(FormulaResult3)) + stowOffset(Callback) else TypesUDim2.fromOffset(0, 0)
			end
		})
		
		if not FloatingFunction() then
			Object2:AddTag("facet-segmented")
		end
		Object2:AddTag("facet-tab-plate")
		p3.attach(Object2, {
			Compose.show(FloatingFunction, function()
				-- upvalues: Host (upval), TypesUDim (upval), p1 (upval), CellResult1 (copy)
				return Host.UICorner({
					CornerRadius = function(Callback)
						-- upvalues: TypesUDim (upval), p1 (upval), CellResult1 (upval)
						return TypesUDim.new(0, p1.metric(if Callback(CellResult1) == "sidebar" then "controls.tabRailTrack.radius" else "controls.tabBottomTrack.radius", Callback))
					end
				})
			end)
		})
		Compose.watch(function(p9)
			-- upvalues: FloatingFunction (copy), Object2 (copy)
			if FloatingFunction(p9) then
				Object2:RemoveTag("facet-segmented")
				
				return
			else
				Object2:AddTag("facet-segmented")
			end
		end)
		p3.attach(FadeResult, { Object2, Object, Object1 })
		local AbsoluteCanvasSizeResult = p1.observe.AbsoluteCanvasSize(ScrollFrame)
		local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollFrame)
		Runtime.decorate(ScrollFrame, {
			Visible = function(Callback): boolean
				-- upvalues: FormulaResult2 (copy), CellResult1 (copy)
				return not Callback(FormulaResult2) and Callback(CellResult1) ~= "none"
			end,
			ClipsDescendants = function(Callback): boolean
				-- upvalues: AbsoluteCanvasSizeResult (copy), AbsoluteWindowSizeResult (copy)
				local CallbackResult = Callback(AbsoluteCanvasSizeResult)
				local CallbackResult1 = Callback(AbsoluteWindowSizeResult)
				
				return CallbackResult1.X + 0.5 < CallbackResult.X or CallbackResult1.Y + 0.5 < CallbackResult.Y
			end
		})
		p3.attach(FadeResult, {
			Compose.show(FormulaResult2, function()
				-- upvalues: p2 (upval), TypesUDim2 (upval), BandFunction (copy), TypesEnum (upval), FormulaResult (copy), p5 (copy), ReadFunction (upval), FormulaResult4 (copy), SelectorResult1 (copy), _select (copy)
				return p2.Menu("TabsMenu")({
					disclosure = true,
					Size = function(p9)
						-- upvalues: TypesUDim2 (upval), BandFunction (upval)
						return TypesUDim2.fromOffset(0, BandFunction(p9))
					end,
					AutomaticSize = TypesEnum.AutomaticSize.X,
					label = function(Callback)
						-- upvalues: FormulaResult (upval), p5 (upval), ReadFunction (upval)
						local CallbackResultEntry = Callback(FormulaResult)[Callback(p5.selection)]
						
						return ReadFunction(CallbackResultEntry.label, Callback) or CallbackResultEntry.id
					end,
					items = function(Callback)
						-- upvalues: FormulaResult4 (upval), SelectorResult1 (upval), _select (upval)
						local t = {}
						
						for _, value in Callback(FormulaResult4) do
							t[#t + 1] = {
								id = value.id,
								label = value.label or value.id,
								icon = value.icon,
								enabled = value.enabled,
								marked = function(Callback)
									-- upvalues: SelectorResult1 (upval), value (copy)
									return Callback(SelectorResult1(value.id))
								end,
								onSelect = function()
									-- upvalues: _select (upval), value (copy)
									_select(value.id)
								end
							}
						end
						return t
					end
				})
			end)
		})
		NavTabAccessoriesModule(p1, p3, p5, FadeResult, {
			frame = Frame,
			aboveHeight = CellResult6,
			metrics = NavTabMetricsModuleResult
		})
		
		local function advance(p9: number)
			-- upvalues: FormulaResult4 (copy), p5 (copy), p1 (upval), FormulaResult (copy), ReadFunction (upval), _select (copy)
			local PeekResult = FormulaResult4:peek()
			local v4 = 1
			
			for i, value in PeekResult do
				if value.id == p5.selection:peek() then
					v4 = i
					break
				end
			end
			local ClampedValue: number = v4
			
			for _ = 1, #PeekResult do
				local ClampedValue1: number = if p5.shoulderNavigation == "content" then math.clamp(ClampedValue + p9, 1, #PeekResult) else (ClampedValue - 1 + p9) % #PeekResult + 1
				
				if ClampedValue1 == ClampedValue then break end
				ClampedValue = ClampedValue1
				local SourceEntry = p1.readSource(FormulaResult, nil)[PeekResult[ClampedValue].id]
				
				if SourceEntry ~= nil and ReadFunction(SourceEntry.enabled, nil) ~= false then break end
			end
			_select(PeekResult[ClampedValue].id)
		end
		
		if p1.action then
			local function v103(Callback)
				-- upvalues: ReadFunction (upval), p5 (copy), GuiService (copy), p3 (upval), ObserveResult (copy), FadeResult (copy), ScrollFrame (copy)
				return ReadFunction(p5.enabled, Callback) ~= false and (GuiService ~= nil and p3.within(Callback(ObserveResult), if p5.shoulderNavigation == "content" then FadeResult else ScrollFrame))
			end
			
			p1.action(FadeResult, "PreviousTab", { "ButtonL1" }, v103, function()
				-- upvalues: advance (copy)
				advance(-1)
			end, { priority = Total1 + 50 })
			p1.action(FadeResult, "NextTab", { "ButtonR1" }, v103, function()
				-- upvalues: advance (copy)
				advance(1)
			end, { priority = Total1 + 50 })
			local SidebarExpanded = p5.sidebarExpanded
			
			if SidebarExpanded ~= nil then
				assert(type(SidebarExpanded) == "table" and SidebarExpanded.set ~= nil, "Facet UI.TabView: sidebarExpanded must be a writable Compose cell")
				p1.action(FadeResult, "SidebarCollapse", { "ButtonB" }, function(Callback)
					-- upvalues: SidebarExpanded (copy), TenFootResult (copy), GuiService (copy), p3 (upval), ObserveResult (copy), ScrollFrame (copy)
					return Callback(SidebarExpanded) == true and (TenFootResult(Callback) and (GuiService ~= nil and p3.within(Callback(ObserveResult), ScrollFrame)))
				end, function()
					-- upvalues: SidebarExpanded (copy)
					SidebarExpanded:set(false)
				end, { priority = Total1 + 1100 })
			end
			local function inChrome(GetResult): boolean
				-- upvalues: FadeResult (copy), p3 (upval), ScrollFrame (copy)
				local Content = FadeResult:FindFirstChild("Content")
				
				return GetResult ~= nil and (p3.within(GetResult, FadeResult) and (not (Content and p3.within(GetResult, Content)) and not p3.within(GetResult, ScrollFrame)))
			end
			
			local v5 = nil
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), v5 (ref), inChrome (copy)
				local CallbackResult = Callback(ObserveResult)
				v5 = if inChrome(CallbackResult) then CallbackResult else nil
			end)
			local Flag1 = true
			Compose.watch(function(Callback: (any) -> ())
				-- upvalues: CellResult1 (copy), Flag1 (ref), TabButtons (copy), p5 (copy), GuiService (copy), p1 (upval), v5 (ref), inChrome (copy)
				Callback(CellResult1)
				
				if Flag1 then
					Flag1 = false
					
					return
				end
				local TabButton = TabButtons[p5.selection:peek()]
				local GetResult = GuiService and p1.selection.get()
				
				if GuiService and TabButton and (v5 ~= nil or inChrome(GetResult)) and GetResult ~= TabButton then
					v5 = nil
					p1.selection.set(TabButton)
				end
			end)
		end
		if HasFrames then
			PreparationModule.begin(p1, FadeResult)
			local PresentationReadinessModuleResult = PresentationReadinessModule(p1, { FadeResult })
			Compose.watch(function(Callback)
				-- upvalues: PresentationReadinessModuleResult (copy), p1 (upval), FadeResult (copy), PreparationModule (upval)
				if Callback(PresentationReadinessModuleResult) then
					p1.fadeTo(FadeResult, 0)
					PreparationModule.finish(p1, FadeResult)
				end
			end)
		end
		return FadeResult
	end)
end