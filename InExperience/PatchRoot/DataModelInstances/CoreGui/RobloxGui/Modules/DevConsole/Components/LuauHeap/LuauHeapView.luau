local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local headerButtonModule = require(components.HeaderButton)
local bannerButtonModule = require(components.BannerButton)
local cellLabelModule = require(components.CellLabel)
local boxButtonModule = require(components.BoxButton)
local luauHeapViewEntryModule = require(script.Parent.LuauHeapViewEntry)
local luauHeapViewStatEntryModule = require(script.Parent.LuauHeapViewStatEntry)
local luauHeapViewRefEntryModule = require(script.Parent.LuauHeapViewRefEntry)
local _ = require(script.Parent.LuauHeapTypes)
local actions = script.Parent.Parent.Parent.Actions
local setLuauHeapActiveSnapshotModule = require(actions.SetLuauHeapActiveSnapshot)
local setLuauHeapCompareSnapshotModule = require(actions.SetLuauHeapCompareSnapshot)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local headerFrameHeight = constantsModule.GeneralFormatting.HeaderFrameHeight
local entryFrameHeight = constantsModule.GeneralFormatting.EntryFrameHeight
local valueCellWidth = constantsModule.LuauHeapFormatting.ValueCellWidth
local cellPadding = constantsModule.LuauHeapFormatting.CellPadding
local valuePadding = constantsModule.LuauHeapFormatting.ValuePadding
local snapshotWidth = constantsModule.LuauHeapFormatting.SnapshotWidth
local snapshotHighlightSize = constantsModule.LuauHeapFormatting.SnapshotHighlightSize
local tabsHeight = constantsModule.LuauHeapFormatting.TabsHeight
local tabButtonWidth = constantsModule.LuauHeapFormatting.TabButtonWidth
local tabButtonHeight = constantsModule.LuauHeapFormatting.TabButtonHeight
local _ = constantsModule.LuauHeapFormatting.TabButtonPad
local tabHighlightHeight = constantsModule.LuauHeapFormatting.TabHighlightHeight
local tableHintHeight = constantsModule.LuauHeapFormatting.TableHintHeight
local t = {
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
	t.UnparentedRefs = {
		hint = "This view shows engine DataModel instances that are not parented to any instance (and are also not unique references).\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\t",
		headers = { "Name", "Count", "Total Instances" },
		initFragmentSource = function(p1)
			return p1:renderUnparentedRefs()
		end
	}
end
local luauHeapView = roactModule.PureComponent:extend("LuauHeapView")

function luauHeapView.renderSnapshotList(p1)
	-- upvalues: roactModule (ref), bannerButtonModule (ref), entryFrameHeight (ref), cellLabelModule (ref), cellPadding (ref), snapshotHighlightSize (ref), lineColor (ref), boxButtonModule (ref)
	local t = {}
	
	for i, v in p1.props.data do
		t[i] = roactModule.createElement(bannerButtonModule, {
			inset = 0,
			isExpanded = false,
			isExpandable = false,
			size = UDim2.new(1, 0, 0, entryFrameHeight),
			layoutOrder = i,
			onButtonPress = function()
				-- upvalues: p1 (ref), i (ref)
				p1.props.dispatchSetLuauHeapActiveSnapshot(i)
			end
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = `Snapshot #{i}`,
				size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding, 0, 0)
			}),
			HorizontalHighlightTop = if p1.props.activeSnapshot == i then roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, snapshotHighlightSize),
				BackgroundColor3 = lineColor
			}) else nil,
			HorizontalHighlightBottom = if p1.props.activeSnapshot == i then roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, snapshotHighlightSize),
				Position = UDim2.new(0, 0, 1, -snapshotHighlightSize),
				BackgroundColor3 = lineColor
			}) else nil,
			HorizontalHighlightLeft = if p1.props.activeSnapshot == i then roactModule.createElement("Frame", {
				Size = UDim2.new(0, snapshotHighlightSize, 1, 0),
				BackgroundColor3 = lineColor
			}) else nil,
			HorizontalHighlightRight = if p1.props.activeSnapshot == i then roactModule.createElement("Frame", {
				Size = UDim2.new(0, snapshotHighlightSize, 1, 0),
				Position = UDim2.new(1, -snapshotHighlightSize, 0, 0),
				BackgroundColor3 = lineColor
			}) else nil,
			Compare = if p1.props.activeSnapshot ~= i then nil else roactModule.createElement(boxButtonModule, {
				text = "Compare",
				size = UDim2.new(0.3, -6, 1, -6),
				pos = UDim2.new(0.7, 3, 0, 3),
				onClicked = function()
					-- upvalues: p1 (ref), i (ref)
					p1.props.dispatchSetLuauHeapCompareSnapshot(i)
				end
			})
		})
	end
	return t
end

function luauHeapView.renderChildren(p2)
	-- upvalues: roactModule (ref), luauHeapViewEntryModule (ref)
	local activeSnapshot = p2.props.data[p2.props.activeSnapshot]
	local compareSnapshot = p2.props.data[p2.props.compareSnapshot]
	
	return roactModule.createElement(luauHeapViewEntryModule, {
		layoutOrder = 0,
		depth = 0,
		data = if activeSnapshot then activeSnapshot.Graph else nil,
		compare = if compareSnapshot then compareSnapshot.Graph else nil
	})
end

function luauHeapView.renderChildrenStats(p2, p3)
	-- upvalues: roactModule (ref), luauHeapViewStatEntryModule (ref)
	local var1
	local compareSnapshot = p2.props.data[p2.props.compareSnapshot]
	local var2 = p2.props.data[p2.props.activeSnapshot][p3]
	local var3 = if compareSnapshot then compareSnapshot[p3] else nil
	local t = {}
	
	for i, v in var2 do
		var1 = nil
		
		if var3 then
			for i_1, v_1 in ipairs(var3) do
				if v.Name == v_1.Name then
					var1 = v_1
					break
				end
			end
		end
		t[i] = roactModule.createElement(luauHeapViewStatEntryModule, {
			depth = 0,
			layoutOrder = -v.Size,
			data = v,
			compare = var1
		})
	end
	return t
end

function luauHeapView.renderUnparentedRefs(p4)
	-- upvalues: roactModule (ref), luauHeapViewRefEntryModule (ref)
	local refs = p4.props.data[p4.props.activeSnapshot].Refs
	
	if not refs then
		return {}
	end
	local unparentedReferences = refs.UnparentedReferences
	
	if not unparentedReferences then
		return {}
	end
	local t = {}
	
	for i, v in unparentedReferences do
		t[i] = roactModule.createElement(luauHeapViewRefEntryModule, { depth = 0, layoutOrder = -v.Instances, data = v })
	end
	return t
end

function luauHeapView.renderChildrenRefs(p5)
	-- upvalues: roactModule (ref), luauHeapViewRefEntryModule (ref)
	local refs = p5.props.data[p5.props.activeSnapshot].Refs
	
	if not refs then
		return {}
	end
	assert(refs)
	local t = {}
	
	for i, v in refs.Roots do
		t[i] = roactModule.createElement(luauHeapViewRefEntryModule, { depth = 0, layoutOrder = -v.Instances, data = v })
	end
	return t
end

function luauHeapView.createTabSelector(value, p6, p7)
	-- upvalues: roactModule (ref), boxButtonModule (ref), tabButtonWidth (ref), tabButtonHeight (ref), tabHighlightHeight (ref), constantsModule (ref)
	local function _(value_1)
		-- upvalues: value (ref)
		value:setState({ activeTab = value_1 })
	end
	
	local function createButton(p8, p9, p10)
		-- upvalues: roactModule (copy), boxButtonModule (copy), tabButtonWidth (copy), tabButtonHeight (copy), value (ref)
		return roactModule.createElement(boxButtonModule, {
			text = p9,
			size = UDim2.new(0, tabButtonWidth, 0, tabButtonHeight),
			pos = UDim2.new(0, tabButtonWidth * p10, 0, 0),
			onClicked = function()
				-- upvalues: p8 (ref), value (copy)
				value:setState({ activeTab = p8 })
			end
		})
	end
	
	local function createHighlight(p8, p9)
		-- upvalues: value (ref), roactModule (copy), tabButtonWidth (copy), tabHighlightHeight (copy), tabButtonHeight (copy), constantsModule (copy)
		return if value.state.activeTab == p8 then roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 10,
			Size = UDim2.new(0, tabButtonWidth, 0, tabHighlightHeight),
			Position = UDim2.new(0, tabButtonWidth * p9, 0, tabButtonHeight - tabHighlightHeight),
			BackgroundColor3 = constantsModule.Color.HighlightBlue
		}) else nil
	end
	
	return if game:GetEngineFeature("UnparentedInstances") then roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p6, Position = p7 }, {
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
	}) else roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p6, Position = p7 }, {
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

function luauHeapView.createStatsTableHeader(p6, p7, p8, p9)
	-- upvalues: roactModule (ref), snapshotWidth (ref), headerFrameHeight (ref), headerButtonModule (ref), valueCellWidth (ref), valuePadding (ref), cellPadding (ref), lineColor (ref), lineWidth (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1 - snapshotWidth, 0, 0, headerFrameHeight),
		Position = UDim2.new(snapshotWidth, 0, p7, p8)
	}, {
		First = if p9[1] then roactModule.createElement(headerButtonModule, {
			text = p9[1],
			size = UDim2.new(1 - valueCellWidth * 2, (-valuePadding) - cellPadding, 0, headerFrameHeight),
			pos = UDim2.new(0, cellPadding, 0, 0),
			sortfunction = p6.onSortChanged
		}) else nil,
		Second = if p9[2] then roactModule.createElement(headerButtonModule, {
			text = p9[2],
			size = UDim2.new(valueCellWidth, -cellPadding, 0, headerFrameHeight),
			pos = UDim2.new(1 - valueCellWidth * 2, valuePadding, 0, 0),
			sortfunction = p6.onSortChanged
		}) else nil,
		Third = if p9[3] then roactModule.createElement(headerButtonModule, {
			text = p9[3],
			size = UDim2.new(valueCellWidth, -cellPadding, 0, headerFrameHeight),
			pos = UDim2.new(1 - valueCellWidth, valuePadding, 0, 0),
			sortfunction = p6.onSortChanged
		}) else nil,
		TopHorizontal = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = lineColor
		}),
		LowerHorizontal = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, lineWidth),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = lineColor
		}),
		Vertical1 = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
			BackgroundColor3 = lineColor
		}),
		Vertical2 = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = UDim2.new(1 - valueCellWidth * 2, 0, 0, 0),
			BackgroundColor3 = lineColor
		})
	})
end

function luauHeapView.init(p6)
	p6.state = { activeTab = "graph" }
end

function luauHeapView.render(p6)
	-- upvalues: t (ref), roactModule (ref), constantsModule (ref), headerButtonModule (ref), snapshotWidth (ref), cellPadding (ref), headerFrameHeight (ref), tabsHeight (ref), tableHintHeight (ref)
	local layoutOrder = p6.props.layoutOrder
	local size = p6.props.size
	local textLabel = nil
	local activeTab = t[p6.state.activeTab]
	
	if not p6.props.data or #p6.props.data == 0 then
		textLabel = roactModule.createElement("TextLabel", {
			Text = "Capture a Snapshot to view details",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			LayoutOrder = layoutOrder
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		SnapshotHeader = roactModule.createElement(headerButtonModule, {
			text = "Snapshots",
			size = UDim2.new(snapshotWidth, -cellPadding, 0, headerFrameHeight),
			pos = UDim2.new(0, cellPadding, 0, 0)
		}),
		Snapshots = roactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			Size = UDim2.new(snapshotWidth, -4, 1, -headerFrameHeight),
			Position = UDim2.new(0, 2, 0, headerFrameHeight),
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Stroke = roactModule.createElement("UIStroke", { Thickness = 2, Color = Color3.new(0.6, 0.6, 0.6) }),
			Children = roactModule.createFragment(p6:renderSnapshotList())
		}),
		Tabs = p6:createTabSelector(UDim2.new(1 - snapshotWidth, 0, 0, tabsHeight), UDim2.new(snapshotWidth, 0, 0, 0)),
		Hint = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1 - snapshotWidth, 0, 0, tableHintHeight),
			Position = UDim2.new(snapshotWidth, 0, 0, tabsHeight),
			Text = activeTab.hint,
			TextColor3 = constantsModule.Color.Text
		}),
		Headers = p6:createStatsTableHeader(0, tabsHeight + tableHintHeight, activeTab.headers),
		Entries = roactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			Size = UDim2.new(1 - snapshotWidth, 0, 1, -(tabsHeight + tableHintHeight + headerFrameHeight)),
			Position = UDim2.new(snapshotWidth, 0, 0, tabsHeight + tableHintHeight + headerFrameHeight),
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Children = textLabel or roactModule.createFragment(activeTab.initFragmentSource(p6))
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p6)
	-- upvalues: setLuauHeapActiveSnapshotModule (ref), setLuauHeapCompareSnapshotModule (ref)
	return {
		dispatchSetLuauHeapActiveSnapshot = function(value)
			-- upvalues: p6 (ref), setLuauHeapActiveSnapshotModule (copy)
			p6(setLuauHeapActiveSnapshotModule(value))
		end,
		dispatchSetLuauHeapCompareSnapshot = function(value)
			-- upvalues: p6 (ref), setLuauHeapCompareSnapshotModule (copy)
			p6(setLuauHeapCompareSnapshotModule(value))
		end
	}
end)(luauHeapView)