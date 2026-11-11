local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local HeaderButtonModule = require(Components.HeaderButton)
local BannerButtonModule = require(Components.BannerButton)
local CellLabelModule = require(Components.CellLabel)
local BoxButtonModule = require(Components.BoxButton)
local LuauHeapViewEntryModule = require(script.Parent.LuauHeapViewEntry)
local LuauHeapViewStatEntryModule = require(script.Parent.LuauHeapViewStatEntry)
local LuauHeapViewRefEntryModule = require(script.Parent.LuauHeapViewRefEntry)
local _ = require(script.Parent.LuauHeapTypes)
local Actions = script.Parent.Parent.Parent.Actions
local SetLuauHeapActiveSnapshotModule = require(Actions.SetLuauHeapActiveSnapshot)
local SetLuauHeapCompareSnapshotModule = require(Actions.SetLuauHeapCompareSnapshot)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local HeaderFrameHeight = ConstantsModule.GeneralFormatting.HeaderFrameHeight
local EntryFrameHeight = ConstantsModule.GeneralFormatting.EntryFrameHeight
local ValueCellWidth = ConstantsModule.LuauHeapFormatting.ValueCellWidth
local CellPadding = ConstantsModule.LuauHeapFormatting.CellPadding
local ValuePadding = ConstantsModule.LuauHeapFormatting.ValuePadding
local SnapshotWidth = ConstantsModule.LuauHeapFormatting.SnapshotWidth
local SnapshotHighlightSize = ConstantsModule.LuauHeapFormatting.SnapshotHighlightSize
local TabsHeight = ConstantsModule.LuauHeapFormatting.TabsHeight
local TabButtonWidth = ConstantsModule.LuauHeapFormatting.TabButtonWidth
local TabButtonHeight = ConstantsModule.LuauHeapFormatting.TabButtonHeight
local _ = ConstantsModule.LuauHeapFormatting.TabButtonPad
local TabHighlightHeight = ConstantsModule.LuauHeapFormatting.TabHighlightHeight
local TableHintHeight = ConstantsModule.LuauHeapFormatting.TableHintHeight
local config = {
	graph = {
		hint = "Graph displays the size of the objects in Luau VM aggregated by the shortest path from the root Engine references to them.\n\t\tMost important root references are ModuleScript tables and functions connected to signals or the task scheduler.",
		headers = { "Name", "Size", "Self" },
		initFragmentSource = function(p1)
			return p1:renderChildren()
		end
	},
	tag = {
		hint = "This memory breakdown displays how much memory is used by Luau VM types.",
		headers = { "Name", "Size", "Count" },
		initFragmentSource = function(p1)
			return p1:renderChildrenStats("TagBreakdown")
		end
	},
	memcat = {
		hint = "Memory separated by the category at the time of allocation.\n\t\tMemory category is assigned to the thread performing the allocation, not the script.\n\t\tDefault value is based on the script name. Custom value can be assigned using 'debug.setmemorycategory' API.",
		headers = { "Name", "Size", "Count" },
		initFragmentSource = function(p1)
			return p1:renderChildrenStats("MemcatBreakdown")
		end
	},
	userdata = {
		hint = "This breakdown shows how much memory inside Luau VM is taken by custom Roblox engine classes.\n\t\tFor DataModel classes like 'Part' this does not include the memory taken inside the engine itself.",
		headers = { "Name", "Size", "Count" },
		initFragmentSource = function(p1)
			return p1:renderChildrenStats("UserdataBreakdown")
		end
	},
	[if game:GetEngineFeature("UnparentedInstances") then "UniqueRefs" else "refs"] = {
		hint = "This view shows engine DataModel instances that are only referenced by Luau VM and are not directly parented to the DataModel.\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\tMost often, engine Luau references come from ModuleScript tables, active signal connections and active coroutines in the task scheduler.",
		headers = { "Name", "Count", "Total Instances" },
		initFragmentSource = function(p1)
			return p1:renderChildrenRefs()
		end
	}
}

if game:GetEngineFeature("UnparentedInstances") then
	config.UnparentedRefs = {
		hint = "This view shows engine DataModel instances that are not parented to any instance (and are also not unique references).\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\t",
		headers = { "Name", "Count", "Total Instances" },
		initFragmentSource = function(p1)
			return p1:renderUnparentedRefs()
		end
	}
end
local LuauHeapView = RoactModule.PureComponent:extend("LuauHeapView")

function LuauHeapView.renderSnapshotList(p1)
	-- upvalues: RoactModule (copy), BannerButtonModule (copy), EntryFrameHeight (copy), CellLabelModule (copy), CellPadding (copy), SnapshotHighlightSize (copy), LineColor (copy), BoxButtonModule (copy)
	local Elements = {}
	
	for ActiveSnapshot, _ in p1.props.data do
		Elements[ActiveSnapshot] = RoactModule.createElement(BannerButtonModule, {
			inset = 0,
			isExpanded = false,
			isExpandable = false,
			size = UDim2.new(1, 0, 0, EntryFrameHeight),
			layoutOrder = ActiveSnapshot,
			onButtonPress = function()
				-- upvalues: p1 (copy), ActiveSnapshot (copy)
				p1.props.dispatchSetLuauHeapActiveSnapshot(ActiveSnapshot)
			end
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				text = `Snapshot #{ActiveSnapshot}`,
				size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding, 0, 0)
			}),
			HorizontalHighlightTop = if p1.props.activeSnapshot == ActiveSnapshot then RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, SnapshotHighlightSize),
				BackgroundColor3 = LineColor
			}) else nil,
			HorizontalHighlightBottom = if p1.props.activeSnapshot == ActiveSnapshot then RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, SnapshotHighlightSize),
				Position = UDim2.new(0, 0, 1, -SnapshotHighlightSize),
				BackgroundColor3 = LineColor
			}) else nil,
			HorizontalHighlightLeft = if p1.props.activeSnapshot == ActiveSnapshot then RoactModule.createElement("Frame", {
				Size = UDim2.new(0, SnapshotHighlightSize, 1, 0),
				BackgroundColor3 = LineColor
			}) else nil,
			HorizontalHighlightRight = if p1.props.activeSnapshot == ActiveSnapshot then RoactModule.createElement("Frame", {
				Size = UDim2.new(0, SnapshotHighlightSize, 1, 0),
				Position = UDim2.new(1, -SnapshotHighlightSize, 0, 0),
				BackgroundColor3 = LineColor
			}) else nil,
			Compare = if p1.props.activeSnapshot == ActiveSnapshot then nil else RoactModule.createElement(BoxButtonModule, {
				text = "Compare",
				size = UDim2.new(0.3, -6, 1, -6),
				pos = UDim2.new(0.7, 3, 0, 3),
				onClicked = function()
					-- upvalues: p1 (copy), ActiveSnapshot (copy)
					p1.props.dispatchSetLuauHeapCompareSnapshot(ActiveSnapshot)
				end
			})
		})
	end
	return Elements
end

function LuauHeapView.renderChildren(p2)
	-- upvalues: RoactModule (copy), LuauHeapViewEntryModule (copy)
	local Entry = p2.props.data[p2.props.activeSnapshot]
	local Entry1 = p2.props.data[p2.props.compareSnapshot]
	
	return RoactModule.createElement(LuauHeapViewEntryModule, {
		layoutOrder = 0,
		depth = 0,
		data = if Entry then Entry.Graph else nil,
		compare = if Entry1 then Entry1.Graph else nil
	})
end

function LuauHeapView.renderChildrenStats(p2, p3)
	-- upvalues: RoactModule (copy), LuauHeapViewStatEntryModule (copy)
	local Entry = p2.props.data[p2.props.compareSnapshot]
	local Entry1 = if Entry then Entry[p3] else nil
	local Elements = {}
	local Compare = nil
	
	for i, Data in p2.props.data[p2.props.activeSnapshot][p3] do
		Compare = nil
		
		if Entry1 then
			for _, value in ipairs(Entry1) do
				if Data.Name == value.Name then
					Compare = value
					break
				end
			end
		end
		Elements[i] = RoactModule.createElement(LuauHeapViewStatEntryModule, {
			depth = 0,
			layoutOrder = -Data.Size,
			data = Data,
			compare = Compare
		})
	end
	return Elements
end

function LuauHeapView.renderUnparentedRefs(p4)
	-- upvalues: RoactModule (copy), LuauHeapViewRefEntryModule (copy)
	local Refs = p4.props.data[p4.props.activeSnapshot].Refs
	
	if not Refs then
		return {}
	end
	local UnparentedReferences = Refs.UnparentedReferences
	
	if not UnparentedReferences then
		return {}
	end
	local Elements = {}
	
	for i, unparentedReference in UnparentedReferences do
		Elements[i] = RoactModule.createElement(LuauHeapViewRefEntryModule, {
			depth = 0,
			layoutOrder = -unparentedReference.Instances,
			data = unparentedReference
		})
	end
	return Elements
end

function LuauHeapView.renderChildrenRefs(p5)
	-- upvalues: RoactModule (copy), LuauHeapViewRefEntryModule (copy)
	local Refs = p5.props.data[p5.props.activeSnapshot].Refs
	
	if not Refs then
		return {}
	end
	assert(Refs)
	local Elements = {}
	
	for i, root in Refs.Roots do
		Elements[i] = RoactModule.createElement(LuauHeapViewRefEntryModule, { depth = 0, layoutOrder = -root.Instances, data = root })
	end
	return Elements
end

function LuauHeapView.createTabSelector(p6, Size, Position)
	-- upvalues: RoactModule (copy), BoxButtonModule (copy), TabButtonWidth (copy), TabButtonHeight (copy), TabHighlightHeight (copy), ConstantsModule (copy)
	local function _(ActiveTab)
		-- upvalues: p6 (copy)
		p6:setState({ activeTab = ActiveTab })
	end
	
	local function createButton(ActiveTab, Text, p7)
		-- upvalues: RoactModule (upval), BoxButtonModule (upval), TabButtonWidth (upval), TabButtonHeight (upval), p6 (copy)
		return RoactModule.createElement(BoxButtonModule, {
			text = Text,
			size = UDim2.new(0, TabButtonWidth, 0, TabButtonHeight),
			pos = UDim2.new(0, TabButtonWidth * p7, 0, 0),
			onClicked = function()
				-- upvalues: ActiveTab (copy), p6 (upval)
				p6:setState({ activeTab = ActiveTab })
			end
		})
	end
	
	local function createHighlight(ActiveTab, p7)
		-- upvalues: p6 (copy), RoactModule (upval), TabButtonWidth (upval), TabHighlightHeight (upval), TabButtonHeight (upval), ConstantsModule (upval)
		return if p6.state.activeTab == ActiveTab then RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(0, TabButtonWidth, 0, TabHighlightHeight),
			Position = UDim2.new(0, TabButtonWidth * p7, 0, TabButtonHeight - TabHighlightHeight),
			BackgroundColor3 = ConstantsModule.Color.HighlightBlue
		}) else nil
	end
	
	return if game:GetEngineFeature("UnparentedInstances") then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		Position = Position
	}, {
		Graph = createButton("graph", "Graph", 0),
		GraphHighlight = createHighlight("graph", 0),
		Tags = createButton("tag", "Object Tags", 1),
		TagHighlight = createHighlight("tag", 1),
		Memcat = createButton("memcat", "Memory Categories", 2),
		MemcatHighlight = createHighlight("memcat", 2),
		Userdata = createButton("userdata", "Object Classes", 3),
		UserdataHighlight = createHighlight("userdata", 3),
		Refs = createButton("UniqueRefs", "Unique References", 4),
		RefHighlight = createHighlight("UniqueRefs", 4),
		UnparentedInstances = createButton("UnparentedRefs", "Unparented Instances", 5),
		UnparentedHighlight = createHighlight("UnparentedRefs", 5)
	}) else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		Position = Position
	}, {
		Graph = createButton("graph", "Graph", 0),
		GraphHighlight = createHighlight("graph", 0),
		Tags = createButton("tag", "Object Tags", 1),
		TagHighlight = createHighlight("tag", 1),
		Memcat = createButton("memcat", "Memory Categories", 2),
		MemcatHighlight = createHighlight("memcat", 2),
		Userdata = createButton("userdata", "Object Classes", 3),
		UserdataHighlight = createHighlight("userdata", 3),
		Refs = createButton("refs", "Unique References", 4),
		RefHighlight = createHighlight("refs", 4),
		UnparentedInstances = createButton("UnparentedRefs", "Unparented Instances", 5),
		UnparentedHighlight = createHighlight("UnparentedRefs", 5)
	})
end

function LuauHeapView.createStatsTableHeader(p6, YScale, YOffset, Entry)
	-- upvalues: RoactModule (copy), SnapshotWidth (copy), HeaderFrameHeight (copy), HeaderButtonModule (copy), ValueCellWidth (copy), ValuePadding (copy), CellPadding (copy), LineColor (copy), LineWidth (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1 - SnapshotWidth, 0, 0, HeaderFrameHeight),
		Position = UDim2.new(SnapshotWidth, 0, YScale, YOffset)
	}, {
		First = if Entry[1] then RoactModule.createElement(HeaderButtonModule, {
			text = Entry[1],
			size = UDim2.new(1 - ValueCellWidth * 2, -ValuePadding - CellPadding, 0, HeaderFrameHeight),
			pos = UDim2.new(0, CellPadding, 0, 0),
			sortfunction = p6.onSortChanged
		}) else nil,
		Second = if Entry[2] then RoactModule.createElement(HeaderButtonModule, {
			text = Entry[2],
			size = UDim2.new(ValueCellWidth, -CellPadding, 0, HeaderFrameHeight),
			pos = UDim2.new(1 - ValueCellWidth * 2, ValuePadding, 0, 0),
			sortfunction = p6.onSortChanged
		}) else nil,
		Third = if Entry[3] then RoactModule.createElement(HeaderButtonModule, {
			text = Entry[3],
			size = UDim2.new(ValueCellWidth, -CellPadding, 0, HeaderFrameHeight),
			pos = UDim2.new(1 - ValueCellWidth, ValuePadding, 0, 0),
			sortfunction = p6.onSortChanged
		}) else nil,
		TopHorizontal = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = LineColor
		}),
		LowerHorizontal = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, LineWidth),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = LineColor
		}),
		Vertical1 = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 1, 0),
			Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
			BackgroundColor3 = LineColor
		}),
		Vertical2 = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 1, 0),
			Position = UDim2.new(1 - ValueCellWidth * 2, 0, 0, 0),
			BackgroundColor3 = LineColor
		})
	})
end

function LuauHeapView.init(p6)
	p6.state = { activeTab = "graph" }
end

function LuauHeapView.render(p6)
	-- upvalues: config (copy), RoactModule (copy), ConstantsModule (copy), HeaderButtonModule (copy), SnapshotWidth (copy), CellPadding (copy), HeaderFrameHeight (copy), TabsHeight (copy), TableHintHeight (copy)
	local LayoutOrder = p6.props.layoutOrder
	local Size = p6.props.size
	local TextLabel = nil
	local Entry = config[p6.state.activeTab]
	
	if not p6.props.data or #p6.props.data == 0 then
		TextLabel = RoactModule.createElement("TextLabel", {
			Text = "Capture a Snapshot to view details",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = ConstantsModule.Color.Text,
			LayoutOrder = LayoutOrder
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		SnapshotHeader = RoactModule.createElement(HeaderButtonModule, {
			text = "Snapshots",
			size = UDim2.new(SnapshotWidth, -CellPadding, 0, HeaderFrameHeight),
			pos = UDim2.new(0, CellPadding, 0, 0)
		}),
		Snapshots = RoactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			Size = UDim2.new(SnapshotWidth, -4, 1, -HeaderFrameHeight),
			Position = UDim2.new(0, 2, 0, HeaderFrameHeight),
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Stroke = RoactModule.createElement("UIStroke", { Thickness = 2, Color = Color3.new(0.6, 0.6, 0.6) }),
			Children = RoactModule.createFragment(p6:renderSnapshotList())
		}),
		Tabs = p6:createTabSelector(UDim2.new(1 - SnapshotWidth, 0, 0, TabsHeight), UDim2.new(SnapshotWidth, 0, 0, 0)),
		Hint = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1 - SnapshotWidth, 0, 0, TableHintHeight),
			Position = UDim2.new(SnapshotWidth, 0, 0, TabsHeight),
			Text = Entry.hint,
			TextColor3 = ConstantsModule.Color.Text
		}),
		Headers = p6:createStatsTableHeader(0, TabsHeight + TableHintHeight, Entry.headers),
		Entries = RoactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			Size = UDim2.new(1 - SnapshotWidth, 0, 1, -(TabsHeight + TableHintHeight + HeaderFrameHeight)),
			Position = UDim2.new(SnapshotWidth, 0, 0, TabsHeight + TableHintHeight + HeaderFrameHeight),
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Children = if TextLabel then TextLabel else RoactModule.createFragment(Entry.initFragmentSource(p6))
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetLuauHeapActiveSnapshotModule (copy), SetLuauHeapCompareSnapshotModule (copy)
	return {
		dispatchSetLuauHeapActiveSnapshot = function(p6)
			-- upvalues: Callback (copy), SetLuauHeapActiveSnapshotModule (upval)
			Callback(SetLuauHeapActiveSnapshotModule(p6))
		end,
		dispatchSetLuauHeapCompareSnapshot = function(p6)
			-- upvalues: Callback (copy), SetLuauHeapCompareSnapshotModule (upval)
			Callback(SetLuauHeapCompareSnapshotModule(p6))
		end
	}
end)(LuauHeapView)