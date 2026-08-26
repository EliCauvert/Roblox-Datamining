local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("ScriptContext")
local httpService = game:GetService("HttpService")
local heapProfilerService = game:GetService("HeapProfilerService")
local playersService = game:GetService("Players")
local appCommonLibModule = require(corePackagesService.Workspace.Packages.AppCommonLib)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local memoize = appCommonLibModule.memoize
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local utilAndTabModule = require(components.UtilAndTab)
local boxButtonModule = require(components.BoxButton)
local luauHeapViewModule = require(script.Parent.LuauHeapView)
local _ = require(script.Parent.LuauHeapTypes)
local actions = script.Parent.Parent.Parent.Actions
local setLuauHeapStateModule = require(actions.SetLuauHeapState)
local setLuauHeapProfileTargetModule = require(actions.SetLuauHeapProfileTarget)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local mainViewLuauHeap = roactModule.PureComponent:extend("MainViewLuauHeap")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")

local function filterNode(p1, p2)
	-- upvalues: filterNode (ref)
	if p2 == nil then
		return false
	end
	local cloned = table.clone(p1)
	local var1 = cloned.Name ~= nil and string.find(string.lower(cloned.Name), string.lower(p2), 1, true) ~= nil
	
	if cloned.Source ~= nil then
		var1 = var1 or string.find(string.lower(cloned.Source), string.lower(p2), 1, true) ~= nil
	end
	if cloned.Paths ~= nil then
		for i, v in cloned.Paths do
			for i_1, v_1 in v do
				var1 = var1 or string.find(string.lower(v_1), string.lower(p2), 1, true) ~= nil
			end
		end
	end
	if cloned.Roots ~= nil then
		local t = {}
		
		for i, v in cloned.Roots do
			local cloned_1 = table.clone(v)
			local var2 = filterNode(cloned_1, p2)
			
			if var2 then
				table.insert(t, cloned_1)
			end
			var1 = var1 or var2
		end
		cloned.Roots = t
	end
	if cloned.Children ~= nil then
		local t = {}
		
		for i, v in cloned.Children do
			local var3 = filterNode(table.clone(v), p2)
			
			if var3 then
				table.insert(t, v)
			end
			var1 = var1 or var3
		end
		cloned.Children = t
	end
	return if var1 then cloned else nil
end

local function filterHeapReportsStatEntryList(p3, p4)
	if p4 == nil then
		return p3
	end
	local t = {}
	
	for i, v in p3 do
		if string.find(string.lower(v.Name), string.lower(p4), 1, true) ~= nil then
			table.insert(t, table.clone(v))
		end
	end
	return t
end

local function filterHeapReportGraph(p5, p6, p7)
	-- upvalues: filterHeapReportGraph (ref)
	if p6 == nil then
		return p5
	end
	local cloned = table.clone(p5)
	local t = {}
	
	for i, v in cloned.Children do
		local var4 = filterHeapReportGraph(v, p6, p7 + 1)
		
		if var4 then
			table.insert(t, var4)
		end
	end
	cloned.Children = t
	
	return if p7 == 0 then cloned elseif string.find(string.lower(cloned.Name), string.lower(p6), 1, true) ~= nil or #t > 0 then cloned else nil
end

local function filterUniqueRefEntryPath(p8, p9)
	if p9 == nil then
		return p8
	end
	local t = {}
	
	for i, v in p8 do
		if string.find(string.lower(v), string.lower(p9), 1, true) ~= nil then
			table.insert(t, v)
		end
	end
	return if #t > 0 then t else nil
end

local function filterUniqueRefEntryPathList(p10, p11)
	-- upvalues: filterUniqueRefEntryPath (ref)
	if p11 == nil then
		return p10
	end
	local t = {}
	
	for i, v in p10 do
		local var5 = filterUniqueRefEntryPath(v, p11)
		
		if var5 then
			table.insert(t, var5)
		end
	end
	return t
end

local function filterUniqueRefEntry(p12, p13)
	-- upvalues: filterUniqueRefEntryPathList (ref)
	if p13 == nil then
		return p12
	end
	local cloned = table.clone(p12)
	local var6 = string.find(string.lower(cloned.Name), string.lower(p13), 1, true) ~= nil and true
	local var7 = filterUniqueRefEntryPathList(cloned.Paths, p13)
	cloned.Paths = var7
	
	if #var7 > 0 then
		var6 = true
	end
	return if var6 then cloned else nil
end

local function filterUniqueRefReport(p12, p13)
	-- upvalues: filterUniqueRefEntry (ref)
	if p13 == nil or p12 == nil then
		return p12
	end
	local cloned = table.clone(p12)
	local t = {}
	
	for i, v in cloned.Roots do
		local var6 = filterUniqueRefEntry(v, p13)
		
		if var6 then
			table.insert(t, var6)
		end
	end
	cloned.Roots = t
	
	return cloned
end

local function filterSnapshots(p14, p15, _)
	-- upvalues: filterHeapReportsStatEntryList (ref), filterHeapReportGraph (ref), filterUniqueRefReport (ref)
	if p15 == nil then
		return p14
	end
	local t = {}
	
	for i, v in p14 do
		local cloned = table.clone(v)
		cloned.TagBreakdown = filterHeapReportsStatEntryList(cloned.TagBreakdown, p15)
		cloned.MemcatBreakdown = filterHeapReportsStatEntryList(cloned.MemcatBreakdown, p15)
		cloned.UserdataBreakdown = filterHeapReportsStatEntryList(cloned.UserdataBreakdown, p15)
		cloned.Graph = filterHeapReportGraph(cloned.Graph, p15, 0)
		
		if cloned.Refs then
			cloned.Refs = filterUniqueRefReport(cloned.Refs, p15)
		end
		table.insert(t, cloned)
	end
	return t
end

function mainViewLuauHeap.getState(p16, p17)
	return if p17 then p16.props.client else p16.props.server
end

function mainViewLuauHeap.getActiveState(p16)
	return p16.props.isClientView, p16:getState(p16.props.isClientView)
end

function mainViewLuauHeap.init(p16)
	-- upvalues: memoize (ref), filterSnapshots (ref), heapProfilerService (ref), playersService (ref), httpService (ref), roactModule (ref)
	function p20.onUtilTabHeightChanged(p17)
		-- upvalues: p16 (ref)
		p16:setState({ utilTabHeight = p17 })
	end
	
	p16.version = 0
	
	function p20.dispatchSetLuauHeapState(p17, p18)
		-- upvalues: p16 (ref)
		p16.version += 1
		p16.props.dispatchSetLuauHeapState(p17, p18)
	end
	
	function p20.onClientButton()
		-- upvalues: p16 (ref)
		p16.props.dispatchSetLuauHeapProfileTarget(true)
	end
	
	function p20.onServerButton()
		-- upvalues: p16 (ref)
		p16.props.dispatchSetLuauHeapProfileTarget(false)
	end
	
	p16.filterSnapshots = memoize(filterSnapshots)
	
	function p20.onCreateSnapshot()
		-- upvalues: p16 (ref), heapProfilerService (copy), playersService (copy), httpService (copy)
		local var7, var8
		local activeState, activeState_1 = p16:getActiveState()
		local _ = nil
		local _ = nil
		
		if activeState then
			local ok, status = pcall(heapProfilerService.ClientRequestDataAsync, heapProfilerService, playersService.LocalPlayer)
			var7 = ok
			var8 = status
		else
			local ok, status = pcall(heapProfilerService.ServerRequestDataAsync, heapProfilerService)
			var7 = ok
			var8 = status
		end
		if var7 then
			local var9 = httpService:JSONDecode(var8)
			local report = var9.Report
			report.Refs = var9.Refs
			local cloned = table.clone(activeState_1)
			table.insert(cloned.snapshots, report)
			cloned.active = #cloned.snapshots
			p16.dispatchSetLuauHeapState(activeState, cloned)
			
			return
		end
		warn(var8)
	end
	
	function p20.onClearSnapshots()
		-- upvalues: p16 (ref)
		local activeState, activeState_1 = p16:getActiveState()
		local cloned = table.clone(activeState_1)
		table.clear(cloned.snapshots)
		cloned.active = 0
		p16.dispatchSetLuauHeapState(activeState, cloned)
	end
	
	p16.utilRef = roactModule.createRef()
	p16.state = { searchTerm = nil, utilTabHeight = 0 }
	
	function p20.onSearchTermChanged(p17)
		-- upvalues: p16 (ref), roactModule (copy)
		if p17 == nil or p17 == "" then
			p16:setState({ searchTerm = roactModule.None })
			
			return
		end
		p16:setState({ searchTerm = p17 })
	end
end

function mainViewLuauHeap.didMount(p16)
	p16:setState({ utilTabHeight = p16.utilRef.current.Size.Y.Offset })
end

function mainViewLuauHeap.willUnmount(_) end

function mainViewLuauHeap.didUpdate(p16)
	local size = p16.utilRef.current.Size
	
	if size.Y.Offset ~= p16.state.utilTabHeight then
		p16:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewLuauHeap.render(p16)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), boxButtonModule (ref), luauHeapViewModule (ref)
	local size = p16.props.size
	local formFactor = p16.props.formFactor
	local tabList = p16.props.tabList
	local utilTabHeight = p16.state.utilTabHeight
	local activeState, activeState_1 = p16:getActiveState()
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = roactModule.createElement(utilAndTabModule, {
			layoutOrder = 1,
			windowWidth = size.X.Offset,
			formFactor = formFactor,
			tabList = tabList,
			isClientView = activeState,
			onClientButton = p16.onClientButton,
			onServerButton = p16.onServerButton,
			refForParent = p16.utilRef,
			onHeightChanged = p16.onUtilTabHeightChanged,
			onSearchTermChanged = p16.onSearchTermChanged
		}, {
			roactModule.createElement(boxButtonModule, {
				text = "Create Snapshot",
				onClicked = p16.onCreateSnapshot
			}),
			roactModule.createElement(boxButtonModule, {
				text = "Clear Snapshots",
				onClicked = p16.onClearSnapshots
			})
		}),
		LuauHeapView = roactModule.createElement(luauHeapViewModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			data = p16.filterSnapshots(activeState_1.snapshots, p16.state.searchTerm, p16.version),
			activeSnapshot = activeState_1.active,
			compareSnapshot = activeState_1.compare
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p16, _)
	return {
		isClientView = p16.LuauHeap.isClientView,
		client = p16.LuauHeap.client,
		server = p16.LuauHeap.server
	}
end, function(p16)
	-- upvalues: setLuauHeapStateModule (ref), setLuauHeapProfileTargetModule (ref)
	return {
		dispatchSetLuauHeapState = function(value, p17)
			-- upvalues: p16 (ref), setLuauHeapStateModule (copy)
			p16(setLuauHeapStateModule(value, p17))
		end,
		dispatchSetLuauHeapProfileTarget = function(value)
			-- upvalues: p16 (ref), setLuauHeapProfileTargetModule (copy)
			p16(setLuauHeapProfileTargetModule(value))
		end
	}
end)(dataConsumerModule(mainViewLuauHeap, "LuauHeapData"))