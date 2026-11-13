local _ = require("./types")
local _ = require("./navigation_types")
local DragSessionModule = require("./drag_session")
local _ = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local MotionModule = require("./motion")
local ReducedFunction = MotionModule.reduced
local AdaptiveModule = require("./adaptive")
local _ = require("./control_types")
local _ = require("./navigation_props")
local _ = require("./nav_page_layers")
local FontReadinessModule = require("./font_readiness")
local TextMeasureModule = require("./text_measure")
local PresentationReadinessModule = require("./presentation_readiness")
local GlassModule = require("./glass")
local GameplayHoldModule = require("./gameplay_hold")
local EntryUpgradeModule = require("./entry_upgrade")
local PreparationModule = require("./preparation")

return function(p1, p2, p3, p4)
	-- upvalues: ReducedFunction (copy), MotionModule (copy), GlassModule (copy), OverlayPartsModule (copy), AdaptiveModule (copy), FontReadinessModule (copy), TextMeasureModule (copy), PreparationModule (copy), PresentationReadinessModule (copy), EntryUpgradeModule (copy), DragSessionModule (copy), GameplayHoldModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Content = p4.content
	local CheckTransitionFunction = p4.checkTransition
	local LayerFunction = p4.layer
	local Count = 0
	p2.NavigationStack = p1.construct("NavigationStack", function(p5)
		-- upvalues: p1 (copy), CheckTransitionFunction (copy), p3 (copy), Compose (copy), Count (ref), ReducedFunction (upval), MotionModule (upval), Host (copy), TypesUDim2 (copy), GlassModule (upval), ReadFunction (copy), Runtime (copy), TypesEnum (copy), OverlayPartsModule (upval), p2 (copy), TypesVector2 (copy), AdaptiveModule (upval), FontReadinessModule (upval), TextMeasureModule (upval), Content (copy), LayerFunction (copy), PreparationModule (upval), PresentationReadinessModule (upval), EntryUpgradeModule (upval), DragSessionModule (upval), GameplayHoldModule (upval)
		local Move = p1.motionSpring("move")
		local MotionDistancesParallax = p1.metric("motion.distances.parallax")
		local MotionDistancesDim = p1.metric("motion.distances.dim")
		assert(type(p5.path) == "table" and (p5.path.set and (p5.root and p5.destinations)), "NavigationStack requires path, root and destinations")
		CheckTransitionFunction(p5.transition)
		local GuiService = p3.service("GuiService")
		local ObserveResult = if GuiService then p1.selection.observe() else Compose.cell(nil)
		local Count1: number = Count
		local config = { id = "@root" }
		local CellResult = Compose.cell(nil)
		local list = { config }
		local ReducedResult = ReducedFunction(p1)
		local LevelResult = MotionModule.level(p1)
		local Transition = if type(p5.transition) == "table" then p5.transition else nil
		local NoTransition = p5.transition == nil
		
		local function validate(PeekResult)
			-- upvalues: config (copy), p5 (copy)
			assert(type(PeekResult) == "table", "NavigationStack.path must contain an array")
			local List = { config }
			
			for _, value in PeekResult do
				assert(type(value) == "table" and type(value.id) == "string" and p5.destinations[value.id], "NavigationStack path has an undeclared destination")
				table.insert(List, value)
			end
			return List
		end
		
		validate(p5.path:peek())
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: validate (copy), p5 (copy), list (ref), CellResult (copy)
			local Success, Result = pcall(validate, Callback(p5.path))
			
			if Success then
				list = Result
				CellResult:set(nil)
			else
				CellResult:set((tostring(Result)))
			end
			return list
		end)
		local CellResult1 = Compose.cell(nil)
		local Object = nil
		local Flag = false
		local Config = nil
		
		if GuiService or NoTransition or Transition then
			local PeekResult = FormulaResult:peek()
			Compose.watch(function(Callback)
				-- upvalues: FormulaResult (copy), PeekResult (ref), GuiService (copy), Object (ref), p3 (upval), p1 (upval), Flag (ref), Config (ref), CellResult1 (copy), NoTransition (copy), Transition (copy), LevelResult (copy)
				local CallbackResult = Callback(FormulaResult)
				local List = PeekResult
				PeekResult = CallbackResult
				local Value = List[#List]
				
				if Value ~= CallbackResult[#CallbackResult] and GuiService and Object and p3.within(p1.selection.get(), Object) then
					Flag = true
					Object:SetAttribute("FacetSelectionOwner", true)
					p1.selection.set(nil)
				end
				if Value ~= CallbackResult[#CallbackResult] and GuiService then
					Config = { selected = p1.selection.get() }
				end
				local PeekResult1 = CellResult1:peek()
				
				if table.find(CallbackResult, Value) == nil and (NoTransition or Transition ~= nil) and LevelResult() ~= "none" then
					CellResult1:set({
						entry = Value,
						behind = NoTransition and table.find(List, CallbackResult[#CallbackResult]) == nil
					})
					
					return
				end
				if PeekResult1 and table.find(CallbackResult, PeekResult1.entry) then
					CellResult1:set(nil)
					
					return
				end
				if PeekResult1 and NoTransition and table.find(List, CallbackResult[#CallbackResult]) == nil then
					CellResult1:set({ behind = true, entry = PeekResult1.entry })
				end
			end)
		end
		local FormulaResult1 = if p5.transition == false then FormulaResult else Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), CellResult1 (copy)
			local CallbackResult = Callback(FormulaResult)
			local CallbackResult1 = Callback(CellResult1)
			
			if CallbackResult1 == nil or table.find(CallbackResult, CallbackResult1.entry) then
				return CallbackResult
			else
				local Copy = table.clone(CallbackResult)
				table.insert(Copy, if CallbackResult1.behind then #Copy else #Copy + 1, CallbackResult1.entry)
				
				return Copy
			end
		end)
		local CellResult2 = Compose.cell({})
		local Flag1 = false
		
		local function pop()
			-- upvalues: p5 (copy)
			local Copy = table.clone(p5.path:peek())
			local Entry = Copy[#Copy]
			local Destination = if Entry then p5.destinations[Entry.id] else nil
			
			if Destination and Destination.onBack and Destination.onBack(Entry) == false then return end
			if #Copy > 0 then
				table.remove(Copy)
				p5.path:set(Copy)
			end
		end
		
		local function _(Callback)
			-- upvalues: FormulaResult1 (copy), CellResult2 (copy)
			local CallbackResult = Callback(FormulaResult1)
			local CallbackResultEntry = Callback(CellResult2)[CallbackResult[#CallbackResult]]
			
			return if CallbackResultEntry then CallbackResultEntry(Callback) else 0, CallbackResultEntry ~= nil
		end
		
		local CellResult3 = Compose.cell(nil)
		local CellResult4 = if p5.transition == false then Compose.cell(false) else Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult1 (copy), CellResult2 (copy), CellResult1 (copy)
			local v1 = true
			local CallbackResult = Callback(FormulaResult1)
			local CallbackResultEntry = Callback(CellResult2)[CallbackResult[#CallbackResult]]
			local CallbackResultEntryResult = if CallbackResultEntry then CallbackResultEntry(Callback) else 0
			
			if CallbackResultEntryResult <= 0 then
				v1 = Callback(CellResult1) ~= nil
			end
			return v1
		end)
		Compose.watch(function(Callback)
			-- upvalues: CellResult4 (copy), Object (ref), CellResult3 (copy)
			if not Callback(CellResult4) then return end
			local Parent = Object and Object.Parent
			while Parent do
				if Parent:IsA("GuiObject") and Parent:GetStyled("BackgroundTransparency") < 1 then
					CellResult3:set(Parent:GetStyled("BackgroundColor3"))
					
					return
				end
				Parent = Parent.Parent
			end
			CellResult3:set(nil)
		end)
		Object = Host.Frame(p1.props(p5, {
			"path", "root", "destinations", "backLabel", "chrome", "transition"
		}, {
			Name = "NavigationStack",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			ClipsDescendants = function(Callback): boolean
				-- upvalues: CellResult4 (copy), Object (ref), GlassModule (upval)
				return Callback(CellResult4) and not (Object and GlassModule.fills(Object))
			end,
			Compose.LayerStack({
				retention = "all",
				from = FormulaResult1,
				render = function(p6, p7)
					-- upvalues: config (copy), p5 (copy), ReadFunction (upval), p1 (upval), Compose (upval), FormulaResult (copy), Flag1 (ref), NoTransition (copy), ReducedResult (copy), Runtime (upval), Move (copy), LevelResult (copy), CellResult2 (copy), FormulaResult1 (copy), MotionDistancesParallax (copy), TypesUDim2 (upval), TypesEnum (upval), Host (upval), OverlayPartsModule (upval), p2 (upval), pop (copy), TypesVector2 (upval), AdaptiveModule (upval), FontReadinessModule (upval), TextMeasureModule (upval), Count (upval), Content (upval), CellResult (copy), Transition (copy), LayerFunction (upval), CellResult1 (copy), CellResult4 (copy), CellResult3 (copy), MotionDistancesDim (copy), PreparationModule (upval), PresentationReadinessModule (upval), GuiService (copy), p3 (upval), Flag (ref), Object (ref), ObserveResult (copy), Config (ref), EntryUpgradeModule (upval)
					local PeekResult = p6:peek()
					local Root = if PeekResult == config then p5.root else p5.destinations[PeekResult.id]
					local IsNotPeekResultMatch: boolean = PeekResult ~= config or Root.title ~= nil and Root.title ~= ""
					
					local function chromeVisible(p8): boolean
						-- upvalues: ReadFunction (upval), Root (copy), p5 (upval), IsNotPeekResultMatch (copy)
						local ReadResult = ReadFunction(Root.chrome, p8) or ReadFunction(p5.chrome, p8)
						assert(ReadResult == nil or (ReadResult == "automatic" or ReadResult == "hidden"), "Invalid NavigationStack.chrome")
						
						return IsNotPeekResultMatch and ReadResult ~= "hidden"
					end
					
					local function _(p8)
						-- upvalues: ReadFunction (upval), Root (copy), p5 (upval), IsNotPeekResultMatch (copy), p1 (upval)
						local ReadResult = ReadFunction(Root.chrome, p8) or ReadFunction(p5.chrome, p8)
						assert(ReadResult == nil or (ReadResult == "automatic" or ReadResult == "hidden"), "Invalid NavigationStack.chrome")
						local IsNotHidden: boolean = IsNotPeekResultMatch and ReadResult ~= "hidden"
						
						return if IsNotHidden then p1.metric("targetSizes.minimum", p8) else 0
					end
					
					local FormulaResult2 = Compose.formula(function(Callback): string
						-- upvalues: p5 (upval), p7 (copy), FormulaResult (upval), PeekResult (copy)
						if p5.transition == false then
							return if Callback(p7).top then "top" else "covered"
						else
							local CallbackResult = Callback(FormulaResult)
							local FoundIndex: number? = table.find(CallbackResult, PeekResult)
							
							return if FoundIndex == nil then "exiting" elseif FoundIndex == #CallbackResult then "top" else "covered"
						end
					end)
					local CellResult5 = Compose.cell(Flag1 and (NoTransition and not ReducedResult()))
					local RunService = p1.config.services.RunService
					local HasPreRender: boolean = Runtime.host.frames ~= nil and (RunService ~= nil and RunService.PreRender ~= nil)
					local CellResult6 = Compose.cell(not HasPreRender)
					
					local function target(Callback): number
						-- upvalues: FormulaResult2 (copy), CellResult5 (copy), ReducedResult (upval)
						return if Callback(FormulaResult2) == "exiting" or Callback(CellResult5) and not ReducedResult(Callback) then 1 else 0
					end
					
					local SpringResult = if NoTransition then Runtime.spring(target, {
						tolerance = 0.001,
						period = Move.period,
						damping = Move.damping,
						reducedMotion = function(p8)
							-- upvalues: ReducedResult (upval)
							return ReducedResult(p8)
						end
					}) else Compose.cell(0)
					local CellResult7 = Compose.cell(Flag1 and (NoTransition and LevelResult() == "limited"))
					local TweenResult = if NoTransition then Runtime.tween(function(Callback): number
						-- upvalues: CellResult7 (copy)
						return if Callback(CellResult7) then 0 else 1
					end, {
						seconds = p1.metric("motion.reducedFade"),
						ease = p1.motionEase("fade")
					}) else Compose.cell(1)
					
					local function offset(p8)
						-- upvalues: NoTransition (upval), ReducedResult (upval), p1 (upval), FormulaResult2 (copy), SpringResult (copy)
						return if NoTransition and not ReducedResult(p8) then p1.readSource(SpringResult, p8) elseif p1.readSource(FormulaResult2, p8) == "exiting" then 1 else 0
					end
					
					if p5.transition ~= false then
						local Copy = table.clone(CellResult2:peek())
						Copy[PeekResult] = offset
						CellResult2:set(Copy)
						Compose.cleanup(function()
							-- upvalues: CellResult2 (upval), PeekResult (copy)
							local Copy = table.clone(CellResult2:peek())
							Copy[PeekResult] = nil
							CellResult2:set(Copy)
						end)
					end
					local function placement(Callback)
						-- upvalues: FormulaResult1 (upval), PeekResult (copy), offset (copy), CellResult2 (upval), FormulaResult2 (copy)
						local CallbackResult = Callback(FormulaResult1)
						local FoundIndex: number? = table.find(CallbackResult, PeekResult)
						
						if FoundIndex == #CallbackResult then
							return "front", offset(Callback)
						end
						if FoundIndex == #CallbackResult - 1 then
							local CallbackResultEntry = Callback(CellResult2)[CallbackResult[#CallbackResult]]
							local CallbackResultEntryResult = if CallbackResultEntry then CallbackResultEntry(Callback) else 0
							
							if CallbackResultEntryResult > 0 or Callback(FormulaResult2) == "top" then
								return "beneath", CallbackResultEntryResult
							end
						end
						return "rest", 0
					end
					
					local _ = function(p8): number
						-- upvalues: placement (copy), MotionDistancesParallax (upval)
						local PlacementResult, PlacementResult2 = placement(p8)
						
						return if PlacementResult == "beneath" then PlacementResult2 + MotionDistancesParallax * (1 - PlacementResult2) else 1
					end
					
					local HasRunService: boolean = Runtime.host.frames ~= nil and p1.config.services.RunService ~= nil
					local CellResult8 = Compose.cell(not HasRunService)
					local Title = p1.text({
						Name = "Title",
						Visible = CellResult8,
						Text = Root.title or "",
						Size = TypesUDim2.fromScale(1, 1),
						TextTruncate = TypesEnum.TextTruncate.AtEnd,
						TextXAlignment = if PeekResult == config then TypesEnum.TextXAlignment.Left else TypesEnum.TextXAlignment.Center
					})
					Runtime.mount(function()
						-- upvalues: p1 (upval), Host (upval)
						local function inset(p8)
							-- upvalues: p1 (upval)
							return p1.types.UDim.new(0, p1.controlSize(nil, "paddingX", p8))
						end
						
						return Host.UIPadding({ PaddingLeft = inset, PaddingRight = inset })
					end, Title)
					local Frame = Host.Frame("NavigationBar")({
						BackgroundTransparency = 1,
						Size = function(p8)
							-- upvalues: TypesUDim2 (upval), ReadFunction (upval), Root (copy), p5 (upval), IsNotPeekResultMatch (copy), p1 (upval)
							local NewFunction = TypesUDim2.new
							local v1 = 1
							local v2 = 0
							local v3 = 0
							local ReadResult = ReadFunction(Root.chrome, p8) or ReadFunction(p5.chrome, p8)
							assert(ReadResult == nil or (ReadResult == "automatic" or ReadResult == "hidden"), "Invalid NavigationStack.chrome")
							local IsNotHidden: boolean = IsNotPeekResultMatch and ReadResult ~= "hidden"
							
							return NewFunction(v1, v2, v3, if IsNotHidden then p1.metric("targetSizes.minimum", p8) else 0)
						end,
						Visible = chromeVisible,
						Title,
						Compose.show(function(p8): boolean
							-- upvalues: ReadFunction (upval), Root (copy), p5 (upval), IsNotPeekResultMatch (copy), PeekResult (copy), config (upval)
							local ReadResult = ReadFunction(Root.chrome, p8) or ReadFunction(p5.chrome, p8)
							assert(ReadResult == nil or (ReadResult == "automatic" or ReadResult == "hidden"), "Invalid NavigationStack.chrome")
							
							return IsNotPeekResultMatch and ReadResult ~= "hidden" and PeekResult ~= config
						end, function()
							-- upvalues: OverlayPartsModule (upval), p1 (upval), p2 (upval), p5 (upval), pop (upval), TypesVector2 (upval), TypesUDim2 (upval)
							return OverlayPartsModule.back(p1, p2, p5.backLabel, pop, {
								AnchorPoint = TypesVector2.new(0, 0.5),
								Position = TypesUDim2.fromScale(0, 0.5)
							})
						end)
					})
					
					if PeekResult == config then
						local AbsoluteSizeResult = p1.observe.AbsoluteSize(Frame)
						Compose.watch(function(Callback)
							-- upvalues: AdaptiveModule (upval), AbsoluteSizeResult (copy), p1 (upval), Title (copy)
							local IsNotCompact = AdaptiveModule.sizeClass(Callback(AbsoluteSizeResult).X) ~= "compact"
							p1.textRole(Title, if IsNotCompact then "title" else "heading")
						end)
					else
						p1.textRole(Title, "heading")
					end
					if HasRunService then
						local FontReadinessModuleResult = FontReadinessModule(p1, { Title })
						local SettledResult = Runtime.settled({
							ready = function(): boolean
								-- upvalues: Frame (copy), FontReadinessModuleResult (copy), TextMeasureModule (upval), Title (copy)
								return Frame.AbsoluteSize.X > 0 and (FontReadinessModuleResult() and (not TextMeasureModule.pending(Title) and (Title.Text == "" or Title.TextBounds.X > 0 and Title.TextBounds.Y > 0)))
							end,
							sample = function(): string
								-- upvalues: Frame (copy), Title (copy)
								return `{Frame.AbsoluteSize}:{Title.AbsoluteSize}:{Title.TextBounds}:{Title:GetStyled("TextSize")}:{Title:GetStyled("FontFace")}`
							end
						})
						Compose.watch(function(Callback)
							-- upvalues: CellResult8 (copy), SettledResult (copy)
							CellResult8:set(Callback(SettledResult))
						end)
					end
					local Panel = Host.Frame("Destination")({
						BackgroundTransparency = 1,
						Position = function(p8)
							-- upvalues: TypesUDim2 (upval), ReadFunction (upval), Root (copy), p5 (upval), IsNotPeekResultMatch (copy), p1 (upval)
							local FromOffsetFunction = TypesUDim2.fromOffset
							local v1 = 0
							local ReadResult = ReadFunction(Root.chrome, p8) or ReadFunction(p5.chrome, p8)
							assert(ReadResult == nil or (ReadResult == "automatic" or ReadResult == "hidden"), "Invalid NavigationStack.chrome")
							local IsNotHidden: boolean = IsNotPeekResultMatch and ReadResult ~= "hidden"
							
							return FromOffsetFunction(v1, if IsNotHidden then p1.metric("targetSizes.minimum", p8) else 0)
						end,
						Size = function(p8)
							-- upvalues: TypesUDim2 (upval), ReadFunction (upval), Root (copy), p5 (upval), IsNotPeekResultMatch (copy), p1 (upval)
							local NewFunction = TypesUDim2.new
							local v1 = 1
							local v2 = 0
							local v3 = 1
							local ReadResult = ReadFunction(Root.chrome, p8) or ReadFunction(p5.chrome, p8)
							assert(ReadResult == nil or (ReadResult == "automatic" or ReadResult == "hidden"), "Invalid NavigationStack.chrome")
							local IsNotHidden: boolean = IsNotPeekResultMatch and ReadResult ~= "hidden"
							
							return NewFunction(v1, v2, v3, -(if IsNotHidden then p1.metric("targetSizes.minimum", p8) else 0))
						end,
						Compose.boundary(function()
							-- upvalues: Count (upval), Content (upval), Root (copy), PeekResult (copy), config (upval)
							Count += 1
							local Success, Result = pcall(Content, Root.content, if PeekResult == config then nil else PeekResult)
							Count -= 1
							
							if not Success then
								error(Result, 0)
							end
							return Result
						end, function(p8)
							-- upvalues: CellResult (upval), p1 (upval), PeekResult (copy), TypesEnum (upval)
							CellResult:set((tostring(p8)))
							local OnErrorFunction: (any) -> () = p1.config.onError
							
							if OnErrorFunction then
								OnErrorFunction(p8)
							else
								warn(`Facet NavigationStack: the "{PeekResult.id}" page failed to build: {tostring(p8)}`)
							end
							return p1.text({
								Name = "DestinationError",
								Text = "This page could not be displayed.",
								TextWrapped = true,
								AutomaticSize = TypesEnum.AutomaticSize.XY
							})
						end)
					})
					local LayerResult = nil
					LayerResult = if Transition then LayerFunction({
						Name = PeekResult.id,
						BackgroundTransparency = 1,
						Size = TypesUDim2.fromScale(1, 1),
						Visible = function(Callback)
							-- upvalues: p7 (copy)
							return Callback(p7).top
						end,
						Frame,
						Panel
					}, Compose.formula(function(Callback)
						-- upvalues: p7 (copy), FormulaResult2 (copy)
						local Copy = table.clone(Callback(p7))
						Copy.top = Callback(FormulaResult2) == "top"
						
						return Copy
					end), Transition, function()
						-- upvalues: CellResult1 (upval), PeekResult (copy)
						local PeekResult1 = CellResult1:peek()
						
						if PeekResult1 and PeekResult1.entry == PeekResult then
							CellResult1:set(nil)
						end
					end, not Flag1) elseif p5.transition == false then Host.Frame({
						Name = PeekResult.id,
						BackgroundTransparency = 1,
						Size = TypesUDim2.fromScale(1, 1),
						Visible = function(Callback): boolean
							-- upvalues: CellResult6 (copy), FormulaResult2 (copy)
							return Callback(CellResult6) and Callback(FormulaResult2) == "top"
						end,
						Interactable = function(Callback): boolean
							-- upvalues: CellResult6 (copy), FormulaResult2 (copy)
							return Callback(CellResult6) and Callback(FormulaResult2) == "top"
						end,
						Frame,
						Panel
					}) else p1.fade({
						Name = PeekResult.id,
						GroupTransparency = function(Callback): number
							-- upvalues: CellResult6 (copy), LevelResult (upval), TweenResult (copy)
							return if Callback(CellResult6) then if LevelResult(Callback) == "limited" then 1 - Callback(TweenResult) else 0 else 1
						end,
						BackgroundTransparency = function(Callback): number
							-- upvalues: CellResult4 (upval), CellResult3 (upval), placement (copy)
							return if Callback(CellResult4) and Callback(CellResult3) ~= nil and placement(Callback) ~= "rest" then 0 else 1
						end,
						BackgroundColor3 = function(Callback)
							-- upvalues: CellResult3 (upval), p1 (upval)
							return Callback(CellResult3) or p1.types.Color3.new(0, 0, 0)
						end,
						BorderSizePixel = 0,
						Size = TypesUDim2.fromScale(1, 1),
						Position = function(p8)
							-- upvalues: placement (copy), TypesUDim2 (upval), MotionDistancesParallax (upval)
							local PlacementResult, PlacementResult2 = placement(p8)
							
							return if PlacementResult == "front" then TypesUDim2.fromScale(PlacementResult2, 0) elseif PlacementResult == "beneath" then TypesUDim2.fromScale(-MotionDistancesParallax * (1 - PlacementResult2), 0) else TypesUDim2.fromScale(0, 0)
						end,
						ClipsDescendants = function(p8): boolean
							-- upvalues: placement (copy), MotionDistancesParallax (upval)
							local PlacementResult, PlacementResult2 = placement(p8)
							
							return (if PlacementResult == "beneath" then PlacementResult2 + MotionDistancesParallax * (1 - PlacementResult2) else 1) < 1
						end,
						Visible = function(Callback): boolean
							-- upvalues: placement (copy), FormulaResult2 (copy)
							local PlacementResult = placement(Callback)
							
							return PlacementResult == "beneath" or PlacementResult == "front" and Callback(FormulaResult2) ~= "covered"
						end,
						Interactable = function(Callback): boolean
							-- upvalues: CellResult6 (copy), FormulaResult2 (copy)
							return Callback(CellResult6) and Callback(FormulaResult2) == "top"
						end,
						Host.Frame("Page")({
							BackgroundTransparency = 1,
							Size = TypesUDim2.fromScale(1, 1),
							Frame,
							Panel
						}),
						Compose.show(function(p8): boolean
							-- upvalues: placement (copy)
							return placement(p8) == "beneath"
						end, function()
							-- upvalues: Host (upval), p1 (upval), TypesUDim2 (upval), placement (copy), MotionDistancesDim (upval)
							return Host.Frame("Dim")({
								BorderSizePixel = 0,
								ZIndex = 10,
								Interactable = false,
								BackgroundColor3 = p1.types.Color3.new(0, 0, 0),
								Size = TypesUDim2.fromScale(1, 1),
								BackgroundTransparency = function(p8): number
									-- upvalues: placement (upval), MotionDistancesDim (upval)
									local _, PlacementResult2 = placement(p8)
									
									return 1 - MotionDistancesDim * (1 - PlacementResult2)
								end
							})
						end)
					})
					
					if HasPreRender and not Transition then
						PreparationModule.begin(p1, LayerResult)
						local PresentationReadinessModuleResult = PresentationReadinessModule(p1, { Panel, Frame })
						Compose.watch(function(Callback)
							-- upvalues: PresentationReadinessModuleResult (copy), CellResult6 (copy), PreparationModule (upval), p1 (upval), LayerResult (ref), CellResult5 (copy), CellResult7 (copy)
							if Callback(PresentationReadinessModuleResult) then
								CellResult6:set(true)
								PreparationModule.finish(p1, LayerResult)
								CellResult5:set(false)
								CellResult7:set(false)
							end
						end)
					else
						CellResult5:set(false)
						CellResult7:set(false)
					end
					if p5.transition ~= false then
						Compose.watch(function(Callback)
							-- upvalues: CellResult4 (upval), GuiService (upval), p3 (upval), p1 (upval), LayerResult (ref), Flag (upval), Object (upval), CellResult1 (upval), Transition (upval), FormulaResult2 (copy), PeekResult (copy), FormulaResult1 (upval), CellResult2 (upval), NoTransition (upval), ReducedResult (upval), SpringResult (copy)
							if not Callback(CellResult4) then return end
							if GuiService and p3.within(p1.selection.get(), LayerResult) then
								Flag = true
								Object:SetAttribute("FacetSelectionOwner", true)
								p1.selection.set(nil)
							end
							local CallbackResult = Callback(CellResult1)
							
							if Transition == nil and Callback(FormulaResult2) == "exiting" and CallbackResult ~= nil and CallbackResult.entry == PeekResult then
								local CallbackResult1 = Callback(FormulaResult1)
								local CallbackResultEntry = Callback(CellResult2)[CallbackResult1[#CallbackResult1]]
								local CallbackResultEntryResult = if CallbackResultEntry then CallbackResultEntry(Callback) else 0
								local HasCallbackResultEntry = CallbackResultEntry ~= nil
								
								if if CallbackResult.behind then HasCallbackResultEntry and CallbackResultEntryResult <= 0 else (if NoTransition and not ReducedResult(Callback) then p1.readSource(SpringResult, Callback) elseif p1.readSource(FormulaResult2, Callback) == "exiting" then 1 else 0) >= 1 then
									CellResult1:set(nil)
								end
							end
						end)
					end
					if GuiService then
						local VisibleResult = p1.observe.Visible(LayerResult)
						local ParentResult = p1.observe.Parent(LayerResult)
						local InteractableResult = p1.observe.Interactable(LayerResult)
						local v1 = nil
						local List = {}
						local Enabled = nil
						local SelectingResult = p3.selecting()
						Compose.watch(function(Callback)
							-- upvalues: ObserveResult (upval), p3 (upval), LayerResult (ref), v1 (ref), List (copy)
							local CallbackResult = Callback(ObserveResult)
							
							if CallbackResult and CallbackResult:IsA("GuiObject") and p3.within(CallbackResult, LayerResult) then
								v1 = CallbackResult
								table.clear(List)
								local Parent = CallbackResult
								while Parent and Parent ~= LayerResult do
									table.insert(List, 1, Parent.Name)
									Parent = Parent.Parent
								end
							end
						end)
						
						local function recall()
							-- upvalues: v1 (ref), LayerResult (ref), List (copy)
							if v1 and v1.Parent then
								return v1
							end
							local Gui = LayerResult
							
							for _, ChildName in List do
								if Gui then
									Gui = Gui:FindFirstChild(ChildName)
								else
									Gui = nil
								end
							end
							return if Gui and Gui ~= LayerResult and Gui:IsA("GuiObject") then Gui else nil
						end
						
						local function contentEntry()
							-- upvalues: p3 (upval), Panel (copy)
							return p3.firstSelectable(Panel, nil, function(Object): boolean
								return Object:GetAttribute("FacetNavBar") == true
							end)
						end
						
						local Name = nil
						
						local function landing()
							-- upvalues: Name (ref), Root (copy), LayerResult (ref), p3 (upval), Panel (copy)
							if Name == nil then
								local InitialFocusFunction = Root.initialFocus
								local InitialFocusResult = if type(InitialFocusFunction) == "function" then InitialFocusFunction() else InitialFocusFunction
								assert(InitialFocusResult == nil or type(InitialFocusResult) == "string", "Facet.NavigationStack: initialFocus must return a control's name or nil")
								Name = InitialFocusResult or false
							end
							if Name then
								local FirstSelectableResult = nil
								for _, descendant in LayerResult:GetDescendants() do
									if descendant.Name == Name then
										FirstSelectableResult = p3.firstSelectable(descendant)
										
										if FirstSelectableResult then
											return FirstSelectableResult
										end
									end
								end
							end
							return p3.firstSelectable(Panel, nil, function(Object): boolean
								return Object:GetAttribute("FacetNavBar") == true
							end) or (p3.firstSelectable(Panel) or p3.firstSelectable(LayerResult))
						end
						
						local _ = function(p8, p9)
							-- upvalues: p3 (upval), Object (upval)
							return p8 ~= nil and (p9 or p3.within(p8, Object))
						end
						
						local _ = function(p8): boolean
							-- upvalues: Config (upval), p3 (upval), Object (upval)
							local Config1 = Config
							
							return Config1 ~= nil and (p8 ~= nil and (p8 ~= Config1.selected and not p3.within(p8, Object)))
						end
						
						local CellResult9 = Compose.cell(nil)
						Compose.watch(function(Callback)
							-- upvalues: FormulaResult2 (copy), CellResult4 (upval), VisibleResult (copy), InteractableResult (copy), ParentResult (copy), Enabled (ref), p7 (copy), Flag (upval), SelectingResult (copy), p1 (upval), p3 (upval), Object (upval), Config (upval), recall (copy), landing (copy), CellResult9 (copy), Name (ref), Panel (copy)
							local IsTop = Callback(FormulaResult2) == "top"
							
							if IsTop and (Callback(CellResult4) or not Callback(VisibleResult) or not Callback(InteractableResult)) then return end
							if not Callback(ParentResult) then return end
							if IsTop and Enabled ~= true and (Enabled == false or Callback(p7).index > 1) then
								local Flag1 = Flag or SelectingResult(Callback)
								
								if not Flag1 then
									local GetResult = p1.selection.get()
									Flag1 = GetResult ~= nil and (Enabled == nil or p3.within(GetResult, Object))
								end
								if Flag1 then
									Flag = false
									local GetResult = p1.selection.get()
									local Config1 = Config
									
									if Config1 ~= nil and (GetResult ~= nil and (GetResult ~= Config1.selected and not p3.within(GetResult, Object))) then
										Object:SetAttribute("FacetSelectionOwner", false)
										Enabled = IsTop
										
										return
									end
									local RecallResult = recall()
									local Interactable = RecallResult and (RecallResult.Visible and (RecallResult.Selectable and RecallResult.Interactable))
									local RecallResult1 = if Interactable then RecallResult else landing()
									
									if RecallResult1 ~= nil or p3.within(p1.selection.get(), Object) then
										p1.selection.set(RecallResult1)
									end
									CellResult9:set(if Interactable or Name or RecallResult1 == p3.firstSelectable(Panel, nil, function(Object): boolean
										return Object:GetAttribute("FacetNavBar") == true
									end) then nil else RecallResult1)
									Object:SetAttribute("FacetSelectionOwner", false)
								end
							end
							Enabled = IsTop
						end)
						EntryUpgradeModule(p1, {
							gui = GuiService,
							panel = Panel,
							held = CellResult9,
							entry = contentEntry,
							displayed = p3.displayed,
							ready = function(Callback)
								-- upvalues: FormulaResult2 (copy), CellResult4 (upval), VisibleResult (copy), InteractableResult (copy)
								return Callback(FormulaResult2) == "top" and (not Callback(CellResult4) and (Callback(VisibleResult) and Callback(InteractableResult)))
							end
						})
					end
					p3.keep(Root.content)
					
					return LayerResult
				end
			})
		}))
		Flag1 = true
		local X = nil
		local HasPeekResult = false
		local DragSessionModuleResult = DragSessionModule(p1)
		local LayoutUnitResult = p1.layoutUnit(Object)
		Runtime.decorate(Object, {
			Active = function(Callback): boolean
				-- upvalues: p5 (copy), ReadFunction (upval)
				local CallbackResult = Callback(p5.path)
				local CallbackResultEntry = CallbackResult[#CallbackResult]
				local Destination = if CallbackResultEntry then p5.destinations[CallbackResultEntry.id] else p5.root
				
				return ReadFunction(p5.Active, Callback) == true or CallbackResultEntry ~= nil and (Destination ~= nil and (ReadFunction(Destination.chrome, Callback) or ReadFunction(p5.chrome, Callback)) == "hidden")
			end
		})
		Runtime.connect(Object, "InputBegan", function(Input)
			-- upvalues: X (ref), TypesEnum (upval), HasPeekResult (ref), DragSessionModuleResult (copy)
			X = if Input.UserInputType == TypesEnum.UserInputType.Touch then Input.Position.X else nil
			HasPeekResult = DragSessionModuleResult.state:peek() ~= nil
		end)
		Compose.watch(function(Callback)
			-- upvalues: DragSessionModuleResult (copy), X (ref), HasPeekResult (ref)
			if Callback(DragSessionModuleResult.state) ~= nil and X ~= nil then
				HasPeekResult = true
			end
		end)
		Runtime.connect(Object, "TouchSwipe", function(Right, p8)
			-- upvalues: p5 (copy), X (ref), TypesEnum (upval), Object (ref), p1 (upval), LayoutUnitResult (copy), CellResult4 (copy), HasPeekResult (ref), ReadFunction (upval), DragSessionModule (upval), pop (copy)
			local PeekResult = p5.path:peek()
			local PeekResultEntry = PeekResult[#PeekResult]
			local Destination = if PeekResultEntry then p5.destinations[PeekResultEntry.id] else p5.root
			local X1 = X
			X = nil
			
			if Right == TypesEnum.SwipeDirection.Right and p8 == 1 and PeekResultEntry and Destination ~= nil and X1 ~= nil and Object.AbsolutePosition.X <= X1 and X1 <= Object.AbsolutePosition.X + p1.metric("controls.navigationBack.swipeEdge") * LayoutUnitResult:peek() and not CellResult4:peek() and not HasPeekResult and ((ReadFunction(Destination.chrome) or ReadFunction(p5.chrome)) == "hidden" and DragSessionModule(p1).state:peek() == nil) then
				pop()
			end
		end)
		
		if p1.action then
			local DragSessionModuleResult1 = DragSessionModule(p1)
			Object:SetAttribute("FacetNavigationStack", true)
			local CellResult5 = Compose.cell(Count1)
			local _, NavigationBack2 = p1.action(Object, "NavigationBack", { "Escape", "ButtonB" }, function(Callback)
				-- upvalues: DragSessionModuleResult1 (copy), p5 (copy), CellResult5 (copy), p3 (upval), ObserveResult (copy), Object (ref)
				return Callback(DragSessionModuleResult1.state) == nil and #Callback(p5.path) > 0 and (Callback(CellResult5) == 0 or p3.within(Callback(ObserveResult), Object))
			end, pop, { priority = Count1 + 1000 })
			
			local function locate()
				-- upvalues: Object (ref), CellResult5 (copy), NavigationBack2 (copy)
				local Count = 0
				local Parent = Object.Parent
				while Parent do
					if Parent:GetAttribute("FacetNavigationStack") == true then
						Count += 1
					end
					Parent = Parent.Parent
				end
				CellResult5:set(Count)
				NavigationBack2.Priority = Count + 1000
			end
			
			Runtime.connect(Object, "AncestryChanged", locate)
			locate()
		end
		Compose.watch(function(Callback)
			-- upvalues: Object (ref), CellResult (copy)
			Object:SetAttribute("FacetError", Callback(CellResult))
		end)
		
		if p1.config.suspendGameplay then
			local CellResult6 = Compose.cell(0)
			local CellResult7 = Compose.cell(false)
			Runtime.connect(Object, "AncestryChanged", function()
				-- upvalues: CellResult6 (copy)
				CellResult6:set(CellResult6:peek() + 1)
			end)
			Compose.watch(function(Callback: (any) -> ())
				-- upvalues: CellResult6 (copy), Object (ref), p1 (upval), Compose (upval), CellResult7 (copy)
				Callback(CellResult6)
				local List = {}
				local Flag = false
				local Parent = Object
				while Parent do
					if Parent:IsA("GuiObject") then
						table.insert(List, p1.observe.Visible(Parent))
					elseif Parent:IsA("LayerCollector") then
						table.insert(List, p1.observe.Enabled(Parent))
						Flag = true
						break
					end
					Parent = Parent.Parent
				end
				Compose.watch(function(Callback)
					-- upvalues: Flag (ref), List (copy), CellResult7 (upval)
					local Flag1: boolean = Flag
					
					for _, value in List do
						if not Callback(value) then
							Flag1 = false
						end
					end
					CellResult7:set(Flag1)
				end)
			end)
			local FormulaResult2 = Compose.formula(function(Callback)
				-- upvalues: p5 (copy), CellResult7 (copy)
				return #Callback(p5.path) > 0 and Callback(CellResult7)
			end)
			Compose.watch(function(Callback)
				-- upvalues: FormulaResult2 (copy), Compose (upval), GameplayHoldModule (upval), p1 (upval)
				if Callback(FormulaResult2) then
					Compose.cleanup(GameplayHoldModule.hold(p1, p1.config.guiService, true))
				end
			end)
		end
		return Object
	end)
end