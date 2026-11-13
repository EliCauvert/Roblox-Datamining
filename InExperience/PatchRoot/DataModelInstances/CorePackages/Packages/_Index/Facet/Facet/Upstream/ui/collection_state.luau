local _ = require("./theme_types")
local _ = require("./collection_tree")
local _ = require("./activation")
local CollectionSelectionModule = require("./collection_selection")
local ReducedFunction = require("./motion").reduced
local AdaptiveModule = require("./adaptive")
local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local ThemeSupportModule = require("./theme_support")

local function findSelectable(Object, p1, p2: number)
	-- upvalues: findSelectable (copy)
	if Object:IsA("GuiObject") and (not Object.Visible or not Object.Interactable) then
		return nil
	end
	if p1 and p1[p2] then
		local Selectable = nil
		for _, child in Object:GetChildren() do
			if child.Name == p1[p2] then
				Selectable = findSelectable(child, p1, p2 + 1)
				
				if Selectable then
					return Selectable
				end
			end
		end
	end
	if Object:IsA("GuiObject") and Object.Selectable and Object.Visible and Object.Interactable then
		return Object
	end
	local Selectable = nil
	for _, child1 in Object:GetChildren() do
		Selectable = findSelectable(child1, nil, 1)
		
		if Selectable then
			return Selectable
		end
	end
	return nil
end

return {
	create = function(p3, ScrollFrame, Kind, KeyOf, Tree, ActionsWrapped, Callback)
		-- upvalues: CollectionSelectionModule (copy), ReducedFunction (copy), CoreModule (copy), ThemeSupportModule (copy), AdaptiveModule (copy)
		local Compose = p3.Compose
		local Host = p3.Host
		local Runtime = p3.runtime
		local ReadFunction = p3.read
		local ReadSourceFunction = p3.readSource
		local Observe = p3.observe
		local TypesUDim2 = p3.types.UDim2
		local TypesEnum = p3.types.Enum
		local CellResult = Compose.cell({ offset = 0, size = 0 })
		local CellResult1 = Compose.cell(0)
		local CellResult2 = Compose.cell(0)
		local config = {
			mode = "windowed",
			direction = "vertical",
			total = 0,
			retained = 0,
			first = 0,
			last = 0,
			firstRow = 0,
			lastRow = 0,
			rowCount = 0,
			extent = 0,
			following = false,
			measured = 0
		}
		local Status = ScrollFrame.status or Compose.cell(config)
		
		if Status:peek() == nil then
			Status:set(config)
		end
		local Controls = ScrollFrame.controls or {}
		local Selection = if ScrollFrame.selection then ScrollFrame.selection else Compose.cell({})
		local CellResult3 = Compose.cell(nil)
		local SelectionMode = ScrollFrame.selectionMode or (if ScrollFrame.selection or ScrollFrame.onSelectionChange then "single" else "none")
		local CollectionSelectionModuleResult, CollectionSelectionModuleResult2 = CollectionSelectionModule(p3, ScrollFrame, Callback, KeyOf, Controls, Selection, SelectionMode)
		local CellResult4 = Compose.cell({})
		local CellResult5 = Compose.cell(false)
		local IsHorizontal = ScrollFrame.direction == "horizontal"
		local IsCards = ScrollFrame.itemSize == "cards"
		assert(not IsCards or IsHorizontal, "Facet collection: itemSize = \"cards\" needs a horizontal list")
		assert(ScrollFrame.cards == nil or IsCards, "Facet collection: cards needs itemSize = \"cards\"")
		local PreferredInputResult = if p3.config.userInputService then Observe.PreferredInput(p3.config.userInputService) else nil
		local Frames = assert(Runtime.host.frames)
		local ReducedResult = ReducedFunction(p3)
		
		local function reduced()
			-- upvalues: ScrollFrame (copy), ReducedResult (copy), ReadFunction (copy)
			return if ScrollFrame.reducedMotion == nil then ReducedResult() else ReadFunction(ScrollFrame.reducedMotion) == true
		end
		
		local LayoutUnit = Host.Frame({
			Name = "LayoutUnit",
			BackgroundTransparency = 1,
			Visible = false,
			Size = TypesUDim2.fromOffset(1, 1)
		})
		local AbsoluteSizeResult = Observe.AbsoluteSize(LayoutUnit)
		local CellResult6 = Compose.cell(ScrollFrame.focus ~= nil or ScrollFrame.initialFocus ~= nil or ScrollFrame.autoFocus == true)
		local NoFocusCandidates = {}
		local NoCanvasPosition: boolean = ReadFunction(ScrollFrame.follow) == "end" and ScrollFrame.CanvasPosition == nil
		local Mounted = {}
		local SlotKeys = {}
		
		local function nodeOf(p4)
			-- upvalues: Mounted (copy), SlotKeys (copy)
			local MountedEntry = Mounted[p4]
			local SlotKey = if MountedEntry then SlotKeys[MountedEntry] else nil
			
			if MountedEntry and (SlotKey == nil or SlotKey:peek() == p4) then
				return MountedEntry
			end
			for i, slotKey in SlotKeys do
				if slotKey:peek() == p4 then
					return i
				end
			end
			return nil
		end
		
		local CellEdits = {}
		local Placed = {}
		local Child = CoreModule.owner.createChild(assert(Compose.currentOwner()))
		local Preparing = {}
		local Retiring = {}
		local CellResult7 = Compose.cell(0)
		local OnFrameResult = nil
		
		local function _(p5): boolean
			-- upvalues: CellResult (copy), ScrollFrame (copy)
			local PeekResult = p5.placement:peek()
			local PeekResult1 = CellResult:peek()
			
			return ScrollFrame.mode == "all" or (PeekResult1.size <= 0 or PeekResult1.offset < PeekResult.offset + PeekResult.size and PeekResult.offset < PeekResult1.offset + PeekResult1.size)
		end
		
		local function reveal(p5)
			-- upvalues: Tree (copy), p3 (copy)
			p5.painted = true
			local Shown = p5.shown
			
			if Shown then
				Shown:set(true)
			elseif Tree then
				p3.fadeTo(p5.content, 0)
			else
				local Content = p5.content
				
				if Content:IsA("CanvasGroup") then
					Content.GroupTransparency = 0
				end
			end
			p5.content:SetAttribute("FacetCollectionReady", true)
		end
		
		if Tree then
			Compose.watch(function(Callback)
				-- upvalues: CellResult (copy), Tree (copy), ScrollFrame (copy), ReadFunction (copy)
				local Size = Callback(CellResult).size
				Tree.preview:set(if ScrollFrame.mode == "all" then 1e999 else math.ceil(Size / math.max(1, (ReadFunction(ScrollFrame.itemSize or 40, Callback)))) + (ScrollFrame.overscan or 2) * 2)
			end)
			Compose.cleanup(function()
				-- upvalues: OnFrameResult (ref)
				if OnFrameResult then
					OnFrameResult()
				end
			end)
		end
		Compose.watch(function(Callback)
			-- upvalues: CellResult7 (copy), CellResult (copy), Tree (copy), Preparing (copy), ScrollFrame (copy), reveal (copy), Retiring (copy), OnFrameResult (ref), Frames (copy)
			Callback(CellResult7)
			Callback(CellResult)
			local CallbackResult = Tree ~= nil and Callback(Tree.preparing)
			for _, value in Preparing do
				local PeekResult = value.placement:peek()
				local PeekResult1 = CellResult:peek()
				
				if (ScrollFrame.mode == "all" or (PeekResult1.size <= 0 or PeekResult1.offset < PeekResult.offset + PeekResult.size and PeekResult.offset < PeekResult1.offset + PeekResult1.size)) and not Callback(value.ready) then return end
			end
			for i, value1 in Preparing do
				if Callback(value1.ready) then
					reveal(value1)
					Preparing[i] = nil
					local SettleFunction: () -> () = value1.settle
					
					if SettleFunction then
						value1.settle = nil
						SettleFunction()
					end
				end
			end
			CellResult7:set(0)
			
			for i1, value2 in Retiring do
				Retiring[i1] = nil
				value2()
			end
			if CallbackResult and OnFrameResult == nil then
				OnFrameResult = Frames.onFrame(function()
					-- upvalues: OnFrameResult (upval), Preparing (upval), CellResult (upval), ScrollFrame (upval), Tree (upval)
					assert(OnFrameResult)()
					OnFrameResult = nil
					
					for _, value in Preparing do
						local PeekResult = value.placement:peek()
						local PeekResult1 = CellResult:peek()
						
						if (ScrollFrame.mode == "all" or (PeekResult1.size <= 0 or PeekResult1.offset < PeekResult.offset + PeekResult.size and PeekResult.offset < PeekResult1.offset + PeekResult1.size)) and not value.ready:peek() then return end
					end
					assert(Tree).resume()
				end)
			end
		end)
		
		local _ = function(p5, p6): number
			-- upvalues: Kind (copy), ReadFunction (copy)
			return if Kind == "grid" then math.ceil(math.max(0, ReadFunction(p5 or 0, p6)) / 2) else 0
		end
		
		local function plateReach(p5)
			-- upvalues: ThemeSupportModule (upval), ReadFunction (copy), p3 (copy)
			return ThemeSupportModule.plateReach(ReadFunction(p3.config.theme, p5))
		end
		
		local function gridColumns(p5, p6): number
			-- upvalues: Kind (copy), ScrollFrame (copy), ReadFunction (copy), AdaptiveModule (upval), Callback (copy)
			if Kind ~= "grid" then
				return 1
			elseif ScrollFrame.minColumnWidth == nil then
				return (math.max(1, (math.floor((ReadFunction(ScrollFrame.columns or 1, p5))))))
			else
				local Largest = math.max(AdaptiveModule.columnsFor(p6, ReadFunction(ScrollFrame.minColumnWidth, p5), ReadFunction(ScrollFrame.crossGap or (ScrollFrame.gap or 0), p5)), ReadFunction(ScrollFrame.minColumns or 1, p5))
				
				return if ScrollFrame.hug and ScrollFrame.slots == nil then math.min(Largest, (math.max(1, #Callback(p5 or function(p7)
					return p7:peek()
				end)))) else Largest
			end
		end
		
		return {
			spec = ScrollFrame,
			kind = Kind,
			keyOf = KeyOf,
			tree = Tree,
			actionsWrapped = ActionsWrapped,
			source = Callback,
			viewport = CellResult,
			cross = CellResult1,
			mountedVersion = CellResult2,
			status = Status,
			controls = Controls,
			selection = Selection,
			coordinator = CellResult3,
			selectionMode = SelectionMode,
			selectRow = CollectionSelectionModuleResult,
			extendSelection = CollectionSelectionModuleResult2,
			measured = CellResult4,
			containsCards = CellResult5,
			horizontal = IsHorizontal,
			cardsMode = IsCards,
			preferred = PreferredInputResult,
			frames = Frames,
			reduced = reduced,
			unit = LayoutUnit,
			unitSize = AbsoluteSizeResult,
			focusActive = CellResult6,
			noFocusCandidates = NoFocusCandidates,
			initialFollow = NoCanvasPosition,
			focusedPath = {},
			focusOwned = false,
			armPaging = nil,
			scope = nil,
			mounted = Mounted,
			slotKeys = SlotKeys,
			nodeOf = nodeOf,
			cellEdits = CellEdits,
			placed = Placed,
			poolOwner = Child,
			rowParent = nil,
			rowSignals = ScrollFrame.recycle == false or p3.config.guiService == nil and ScrollFrame.focus ~= nil,
			preparing = Preparing,
			retiring = Retiring,
			waiting = CellResult7,
			pool = Compose.createPool({
				maxRetained = ScrollFrame.maxRetained or 32,
				create = function()
					-- upvalues: Compose (copy), Child (copy), Host (copy)
					local Child1 = Compose.owner.createChild(Child)
					
					return {
						node = Compose.withOwner(Child1, function()
							-- upvalues: Host (upval)
							return Host.Frame({
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								ClipsDescendants = false
							})
						end),
						owner = Child1
					}
				end,
				reset = function(p5)
					if p5.node.Parent ~= nil then
						p5.node.Parent = nil
					end
				end,
				destroy = function(p5)
					-- upvalues: CoreModule (upval)
					CoreModule.owner.dispose(p5.owner)
					p5.node:Destroy()
				end
			}),
			mainEdge = function(p5): number
				-- upvalues: ScrollFrame (copy), Kind (copy), ReadFunction (copy), ReadSourceFunction (copy), CellResult5 (copy), plateReach (copy), CellResult4 (copy), p3 (copy)
				local Gap = ScrollFrame.gap
				local Ceiled: number = if Kind == "grid" then math.ceil(math.max(0, ReadFunction(Gap or 0, p5)) / 2) else 0
				
				if not ReadSourceFunction(CellResult5, p5) then
					return Ceiled
				end
				local Largest = math.max(Ceiled, plateReach(p5))
				local ReadResult = ReadFunction(ScrollFrame.itemSize or 40, p5)
				
				for _, value in ReadSourceFunction(CellResult4, p5) do
					ReadResult = math.max(ReadResult, value)
				end
				local Measured = ScrollFrame.measured or {}
				for _, value1 in ReadFunction(Measured, p5) do
					ReadResult = math.max(ReadResult, value1)
				end
				return (math.max(Largest, (math.ceil(ReadResult * math.max(0, p3.metric("motion.materialize.lift", p5) - 1)))))
			end,
			crossEdge = function(p6): number
				-- upvalues: ScrollFrame (copy), Kind (copy), ReadFunction (copy), ReadSourceFunction (copy), CellResult5 (copy), plateReach (copy), CellResult1 (copy), gridColumns (copy), p3 (copy)
				local CrossGap = ScrollFrame.crossGap or ScrollFrame.gap
				local Ceiled: number = if Kind == "grid" then math.ceil(math.max(0, ReadFunction(CrossGap or 0, p6)) / 2) else 0
				
				if ReadSourceFunction(CellResult5, p6) then
					local Largest = math.max(Ceiled, plateReach(p6))
					local Source = ReadSourceFunction(CellResult1, p6)
					
					return (math.max(Largest, (math.ceil(Source / gridColumns(p6, Source) * math.max(0, p3.metric("motion.materialize.lift", p6) - 1)))))
				else
					return Ceiled
				end
			end,
			gridColumns = gridColumns,
			cardLayout = function(Callback)
				-- upvalues: ScrollFrame (copy), CellResult (copy), ReadFunction (copy), PreferredInputResult (copy), ReadSourceFunction (copy), TypesEnum (copy), AdaptiveModule (upval)
				local Cards = ScrollFrame.cards or {}
				local Size = if Callback then Callback(CellResult).size else CellResult:peek().size
				local ReadResult = ReadFunction(ScrollFrame.gap or 0, Callback)
				local IsSourceMatch: boolean = PreferredInputResult ~= nil and ReadSourceFunction(PreferredInputResult, Callback) == TypesEnum.PreferredInput.Touch
				local PerView = Cards.perView or (if IsSourceMatch and Size < AdaptiveModule.BREAKPOINTS.regular then 1 else AdaptiveModule.columnsFor(Size, Cards.minWidth or 200, ReadResult))
				local Peek = Cards.peek or (if PerView == 1 and Cards.perView == nil then math.clamp(Size * 0.1, 24, 56) else 0)
				
				return math.max(1, (math.floor((Size - Peek - ReadResult * (PerView - 1) - (if Peek > 0 then ReadResult else 0)) / PerView))), PerView
			end,
			fullSizes = function(Callback)
				-- upvalues: CellResult4 (copy), ReadFunction (copy), ScrollFrame (copy)
				local Copy = table.clone(Callback(CellResult4))
				local Measured = ScrollFrame.measured or {}
				for i, value in ReadFunction(Measured, Callback) do
					Copy[i] = value
				end
				return Copy
			end
		}
	end,
	belongsTo = function(Ancestor, Ancestor1)
		return Ancestor ~= nil and (Ancestor == Ancestor1 or Ancestor:IsDescendantOf(Ancestor1))
	end,
	findSelectable = findSelectable
}