local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("ScriptContext")
local HttpService = game:GetService("HttpService")
local HeapProfilerService = game:GetService("HeapProfilerService")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local UtilAndTabModule = require(Components.UtilAndTab)
local BoxButtonModule = require(Components.BoxButton)
local LuauHeapViewModule = require(script.Parent.LuauHeapView)
local _ = require(script.Parent.LuauHeapTypes)
local Actions = script.Parent.Parent.Parent.Actions
local SetLuauHeapStateModule = require(Actions.SetLuauHeapState)
local SetLuauHeapProfileTargetModule = require(Actions.SetLuauHeapProfileTarget)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MainViewLuauHeap = RoactModule.PureComponent:extend("MainViewLuauHeap")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")

local function filterNode(Tbl, Text: string)
	-- upvalues: filterNode (copy)
	if Text == nil then
		return false
	end
	local Copy = table.clone(Tbl)
	local HasFoundAt = Copy.Name ~= nil and string.find(string.lower(Copy.Name), string.lower(Text), 1, true) ~= nil
	
	if Copy.Source ~= nil then
		local HasFoundAt1 = string.find(string.lower(Copy.Source), string.lower(Text), 1, true) ~= nil
		HasFoundAt = HasFoundAt or HasFoundAt1
	end
	if Copy.Paths ~= nil then
		for _, path in Copy.Paths do
			for _, value in path do
				local HasFoundAt2 = string.find(string.lower(value), string.lower(Text), 1, true) ~= nil
				HasFoundAt = HasFoundAt or HasFoundAt2
			end
		end
	end
	if Copy.Roots ~= nil then
		local Roots = {}
		
		for _, root in Copy.Roots do
			local Copy1 = table.clone(root)
			local FilterNodeResult = filterNode(Copy1, Text)
			
			if FilterNodeResult then
				table.insert(Roots, Copy1)
			end
			HasFoundAt = HasFoundAt or FilterNodeResult
		end
		Copy.Roots = Roots
	end
	if Copy.Children ~= nil then
		local Children = {}
		
		for _, child in Copy.Children do
			local FilterNodeResult = filterNode(table.clone(child), Text)
			
			if FilterNodeResult then
				table.insert(Children, child)
			end
			HasFoundAt = HasFoundAt or FilterNodeResult
		end
		Copy.Children = Children
	end
	return if HasFoundAt then Copy else nil
end

local function filterHeapReportsStatEntryList(MemcatBreakdown, Text: string)
	if Text == nil then
		return MemcatBreakdown
	end
	local List = {}
	
	for _, value in MemcatBreakdown do
		if string.find(string.lower(value.Name), string.lower(Text), 1, true) ~= nil then
			table.insert(List, (table.clone(value)))
		end
	end
	return List
end

local function filterHeapReportGraph(Tbl, Text: string, p1: number)
	-- upvalues: filterHeapReportGraph (copy)
	if Text == nil then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	local Children = {}
	
	for _, child in Copy.Children do
		local FilterHeapReportGraphResult = filterHeapReportGraph(child, Text, p1 + 1)
		
		if FilterHeapReportGraphResult then
			table.insert(Children, FilterHeapReportGraphResult)
		end
	end
	Copy.Children = Children
	
	if p1 == 0 then
		return Copy
	else
		local HasFoundAt: boolean = string.find(string.lower(Copy.Name), string.lower(Text), 1, true) ~= nil or #Children > 0
		
		return if HasFoundAt then Copy else nil
	end
end

local function filterUniqueRefEntryPath(List, Text: string)
	if Text == nil then
		return List
	end
	local List1 = {}
	
	for _, value in List do
		if string.find(string.lower(value), string.lower(Text), 1, true) ~= nil then
			table.insert(List1, value)
		end
	end
	return if #List1 > 0 then List1 else nil
end

local function filterUniqueRefEntryPathList(Paths, p2)
	-- upvalues: filterUniqueRefEntryPath (copy)
	if p2 == nil then
		return Paths
	end
	local List = {}
	
	for _, path in Paths do
		local FilterUniqueRefEntryPathResult = filterUniqueRefEntryPath(path, p2)
		
		if FilterUniqueRefEntryPathResult then
			table.insert(List, FilterUniqueRefEntryPathResult)
		end
	end
	return List
end

local function filterUniqueRefEntry(Tbl, Text: string)
	-- upvalues: filterUniqueRefEntryPathList (copy)
	if Text == nil then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	local HasFoundAt = string.find(string.lower(Copy.Name), string.lower(Text), 1, true) ~= nil
	local FilterUniqueRefEntryPathListResult = filterUniqueRefEntryPathList(Copy.Paths, Text)
	Copy.Paths = FilterUniqueRefEntryPathListResult
	
	if #FilterUniqueRefEntryPathListResult > 0 then
		HasFoundAt = true
	end
	return if HasFoundAt then Copy else nil
end

local function filterUniqueRefReport(Tbl, p3)
	-- upvalues: filterUniqueRefEntry (copy)
	if p3 == nil or Tbl == nil then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	local Roots = {}
	
	for _, root in Copy.Roots do
		local FilterUniqueRefEntryResult = filterUniqueRefEntry(root, p3)
		
		if FilterUniqueRefEntryResult then
			table.insert(Roots, FilterUniqueRefEntryResult)
		end
	end
	Copy.Roots = Roots
	
	return Copy
end

local function filterSnapshots(List, p4, _)
	-- upvalues: filterHeapReportsStatEntryList (copy), filterHeapReportGraph (copy), filterUniqueRefReport (copy)
	if p4 == nil then
		return List
	end
	local List1 = {}
	
	for _, value in List do
		local Copy = table.clone(value)
		Copy.TagBreakdown = filterHeapReportsStatEntryList(Copy.TagBreakdown, p4)
		Copy.MemcatBreakdown = filterHeapReportsStatEntryList(Copy.MemcatBreakdown, p4)
		Copy.UserdataBreakdown = filterHeapReportsStatEntryList(Copy.UserdataBreakdown, p4)
		Copy.Graph = filterHeapReportGraph(Copy.Graph, p4, 0)
		
		if Copy.Refs then
			Copy.Refs = filterUniqueRefReport(Copy.Refs, p4)
		end
		table.insert(List1, Copy)
	end
	return List1
end

function MainViewLuauHeap.getState(p5, p6)
	return if p6 then p5.props.client else p5.props.server
end

function MainViewLuauHeap.getActiveState(p5)
	return p5.props.isClientView, p5:getState(p5.props.isClientView)
end

function MainViewLuauHeap.init(p5)
	-- upvalues: MemoizeFunction (copy), filterSnapshots (copy), HeapProfilerService (copy), Players (copy), HttpService (copy), RoactModule (copy)
	function p5.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p5 (copy)
		p5:setState({ utilTabHeight = UtilTabHeight })
	end
	
	p5.version = 0
	
	function p5.dispatchSetLuauHeapState(p6, p7)
		-- upvalues: p5 (copy)
		p5.version += 1
		p5.props.dispatchSetLuauHeapState(p6, p7)
	end
	
	function p5.onClientButton()
		-- upvalues: p5 (copy)
		p5.props.dispatchSetLuauHeapProfileTarget(true)
	end
	
	function p5.onServerButton()
		-- upvalues: p5 (copy)
		p5.props.dispatchSetLuauHeapProfileTarget(false)
	end
	
	p5.filterSnapshots = MemoizeFunction(filterSnapshots)
	
	function p5.onCreateSnapshot()
		-- upvalues: p5 (copy), HeapProfilerService (upval), Players (upval), HttpService (upval)
		local ActiveState, ActiveState2 = p5:getActiveState()
		local Result = nil
		local Success = nil
		
		if ActiveState then
			Success, Result = pcall(HeapProfilerService.ClientRequestDataAsync, HeapProfilerService, Players.LocalPlayer)
		else
			Success, Result = pcall(HeapProfilerService.ServerRequestDataAsync, HeapProfilerService)
		end
		if Success then
			local Data = HttpService:JSONDecode(Result)
			local Report = Data.Report
			Report.Refs = Data.Refs
			local Copy = table.clone(ActiveState2)
			table.insert(Copy.snapshots, Report)
			Copy.active = #Copy.snapshots
			p5.dispatchSetLuauHeapState(ActiveState, Copy)
			
			return
		else
			warn(Result)
		end
	end
	
	function p5.onClearSnapshots()
		-- upvalues: p5 (copy)
		local ActiveState, ActiveState2 = p5:getActiveState()
		local Copy = table.clone(ActiveState2)
		table.clear(Copy.snapshots)
		Copy.active = 0
		p5.dispatchSetLuauHeapState(ActiveState, Copy)
	end
	
	p5.utilRef = RoactModule.createRef()
	p5.state = { searchTerm = nil, utilTabHeight = 0 }
	
	function p5.onSearchTermChanged(SearchTerm)
		-- upvalues: p5 (copy), RoactModule (upval)
		if SearchTerm == nil or SearchTerm == "" then
			p5:setState({ searchTerm = RoactModule.None })
			
			return
		else
			p5:setState({ searchTerm = SearchTerm })
		end
	end
end

function MainViewLuauHeap.didMount(p5)
	p5:setState({ utilTabHeight = p5.utilRef.current.Size.Y.Offset })
end

function MainViewLuauHeap:willUnmount() end

function MainViewLuauHeap.didUpdate(p5)
	local Size = p5.utilRef.current.Size
	
	if Size.Y.Offset ~= p5.state.utilTabHeight then
		p5:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewLuauHeap.render(p5)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), BoxButtonModule (copy), LuauHeapViewModule (copy)
	local Size = p5.props.size
	local FormFactor = p5.props.formFactor
	local TabList = p5.props.tabList
	local UtilTabHeight = p5.state.utilTabHeight
	local ActiveState, ActiveState2 = p5:getActiveState()
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = Size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, MainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = FormFactor,
			tabList = TabList,
			isClientView = ActiveState,
			onClientButton = p5.onClientButton,
			onServerButton = p5.onServerButton,
			refForParent = p5.utilRef,
			onHeightChanged = p5.onUtilTabHeightChanged,
			onSearchTermChanged = p5.onSearchTermChanged
		}, {
			RoactModule.createElement(BoxButtonModule, {
				text = "Create Snapshot",
				onClicked = p5.onCreateSnapshot
			}),
			RoactModule.createElement(BoxButtonModule, {
				text = "Clear Snapshots",
				onClicked = p5.onClearSnapshots
			})
		}),
		LuauHeapView = RoactModule.createElement(LuauHeapViewModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -UtilTabHeight),
			data = p5.filterSnapshots(ActiveState2.snapshots, p5.state.searchTerm, p5.version),
			activeSnapshot = ActiveState2.active,
			compareSnapshot = ActiveState2.compare
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p5, _)
	return {
		isClientView = p5.LuauHeap.isClientView,
		client = p5.LuauHeap.client,
		server = p5.LuauHeap.server
	}
end, function(Callback)
	-- upvalues: SetLuauHeapStateModule (copy), SetLuauHeapProfileTargetModule (copy)
	return {
		dispatchSetLuauHeapState = function(p5, p6)
			-- upvalues: Callback (copy), SetLuauHeapStateModule (upval)
			Callback(SetLuauHeapStateModule(p5, p6))
		end,
		dispatchSetLuauHeapProfileTarget = function(p5)
			-- upvalues: Callback (copy), SetLuauHeapProfileTargetModule (upval)
			Callback(SetLuauHeapProfileTargetModule(p5))
		end
	}
end)(DataConsumerModule(MainViewLuauHeap, "LuauHeapData"))