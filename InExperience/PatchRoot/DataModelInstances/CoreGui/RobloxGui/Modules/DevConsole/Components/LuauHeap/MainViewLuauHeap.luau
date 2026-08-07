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

local function filterNode(p0, p1) --[[ line: 34 ]]
	-- upvalues: filterNode (ref)
	if p1 == nil then
		return false
	end
	local cloned = table.clone(p0)
	local var24 = cloned.Name ~= nil and string.find(string.lower(cloned.Name), string.lower(p1), 1, true) ~= nil
	
	if cloned.Source ~= nil then
		var24 = var24 or string.find(string.lower(cloned.Source), string.lower(p1), 1, true) ~= nil
	end
	if cloned.Paths ~= nil then
		for i, v in cloned.Paths do
			for i_1, v_1 in v do
				var24 = var24 or string.find(string.lower(v_1), string.lower(p1), 1, true) ~= nil
			end
		end
	end
	if cloned.Roots ~= nil then
		local t = {}
		
		for i, v in cloned.Roots do
			local cloned_1 = table.clone(v)
			local var27 = filterNode(cloned_1, p1)
			
			if var27 then
				table.insert(t, cloned_1)
			end
			var24 = var24 or var27
		end
		cloned.Roots = t
	end
	if cloned.Children ~= nil then
		local t = {}
		
		for i, v in cloned.Children do
			local var29 = filterNode(table.clone(v), p1)
			
			if var29 then
				table.insert(t, v)
			end
			var24 = var24 or var29
		end
		cloned.Children = t
	end
	return if var24 then cloned else nil
end

local function filterHeapReportsStatEntryList(p2, p3) --[[ line: 93 ]]
	if p3 == nil then
		return p2
	end
	local t = {}
	
	for i, v in p2 do
		if string.find(string.lower(v.Name), string.lower(p3), 1, true) ~= nil then
			table.insert(t, table.clone(v))
		end
	end
	return t
end

local function filterHeapReportGraph(p4, p5, p6) --[[ line: 112 ]]
	-- upvalues: filterHeapReportGraph (ref)
	if p5 == nil then
		return p4
	end
	local cloned = table.clone(p4)
	local t = {}
	
	for i, v in cloned.Children do
		local var33 = filterHeapReportGraph(v, p5, p6 + 1)
		
		if var33 then
			table.insert(t, var33)
		end
	end
	cloned.Children = t
	
	return if p6 == 0 then cloned elseif string.find(string.lower(cloned.Name), string.lower(p5), 1, true) ~= nil or #t > 0 then cloned else nil
end

local function filterUniqueRefEntryPath(p7, p8) --[[ line: 143 ]]
	if p8 == nil then
		return p7
	end
	local t = {}
	
	for i, v in p7 do
		if string.find(string.lower(v), string.lower(p8), 1, true) ~= nil then
			table.insert(t, v)
		end
	end
	return if #t > 0 then t else nil
end

local function filterUniqueRefEntryPathList(p9, p10) --[[ line: 162 ]]
	-- upvalues: filterUniqueRefEntryPath (ref)
	if p10 == nil then
		return p9
	end
	local t = {}
	
	for i, v in p9 do
		local var36 = filterUniqueRefEntryPath(v, p10)
		
		if var36 then
			table.insert(t, var36)
		end
	end
	return t
end

local function filterUniqueRefEntry(p11, p12) --[[ line: 182 ]]
	-- upvalues: filterUniqueRefEntryPathList (ref)
	if p12 == nil then
		return p11
	end
	local cloned = table.clone(p11)
	local var38 = string.find(string.lower(cloned.Name), string.lower(p12), 1, true) ~= nil and true
	local var39 = filterUniqueRefEntryPathList(cloned.Paths, p12)
	cloned.Paths = var39
	
	if #var39 > 0 then
		var38 = true
	end
	return if var38 then cloned else nil
end

local function filterUniqueRefReport(p13, p14) --[[ line: 211 ]]
	-- upvalues: filterUniqueRefEntry (ref)
	if p14 == nil or p13 == nil then
		return p13
	end
	local cloned = table.clone(p13)
	local t = {}
	
	for i, v in cloned.Roots do
		local var42 = filterUniqueRefEntry(v, p14)
		
		if var42 then
			table.insert(t, var42)
		end
	end
	cloned.Roots = t
	
	return cloned
end

local function filterSnapshots(p15, p16, _) --[[ line: 230 ]]
	-- upvalues: filterHeapReportsStatEntryList (ref), filterHeapReportGraph (ref), filterUniqueRefReport (ref)
	if p16 == nil then
		return p15
	end
	local t = {}
	
	for i, v in p15 do
		local cloned = table.clone(v)
		cloned.TagBreakdown = filterHeapReportsStatEntryList(cloned.TagBreakdown, p16)
		cloned.MemcatBreakdown = filterHeapReportsStatEntryList(cloned.MemcatBreakdown, p16)
		cloned.UserdataBreakdown = filterHeapReportsStatEntryList(cloned.UserdataBreakdown, p16)
		cloned.Graph = filterHeapReportGraph(cloned.Graph, p16, 0)
		
		if cloned.Refs then
			cloned.Refs = filterUniqueRefReport(cloned.Refs, p16)
		end
		table.insert(t, cloned)
	end
	return t
end

function mainViewLuauHeap.getState(p17, p18) --[[ line: 258 ]]
	return if p18 then p17.props.client else p17.props.server
end

function mainViewLuauHeap.getActiveState(p19) --[[ line: 262 ]]
	return p19.props.isClientView, p19:getState(p19.props.isClientView)
end

function mainViewLuauHeap.init(p20) --[[ line: 266 ]]
	-- upvalues: memoize (ref), filterSnapshots (ref), heapProfilerService (ref), playersService (ref), httpService (ref), roactModule (ref)
	function p20.onUtilTabHeightChanged(p21) --[[ line: 267 ]]
		-- upvalues: p20 (ref)
		p20:setState({ utilTabHeight = p21 })
	end
	
	p20.version = 0
	
	function p20.dispatchSetLuauHeapState(p22, p23) --[[ line: 275 ]]
		-- upvalues: p20 (ref)
		p20.version += 1
		p20.props.dispatchSetLuauHeapState(p22, p23)
	end
	
	function p20.onClientButton() --[[ line: 279 ]]
		-- upvalues: p20 (ref)
		p20.props.dispatchSetLuauHeapProfileTarget(true)
	end
	
	function p20.onServerButton() --[[ line: 283 ]]
		-- upvalues: p20 (ref)
		p20.props.dispatchSetLuauHeapProfileTarget(false)
	end
	
	p20.filterSnapshots = memoize(filterSnapshots)
	
	function p20.onCreateSnapshot() --[[ line: 289 ]]
		-- upvalues: p20 (ref), heapProfilerService (copy), playersService (copy), httpService (copy)
		local var47, var48
		local activeState, activeState_1 = p20:getActiveState()
		local _ = nil
		local _ = nil
		
		if activeState then
			local ok, status = pcall(heapProfilerService.ClientRequestDataAsync, heapProfilerService, playersService.LocalPlayer)
			var47 = ok
			var48 = status
		else
			local ok, status = pcall(heapProfilerService.ServerRequestDataAsync, heapProfilerService)
			var47 = ok
			var48 = status
		end
		if var47 then
			local var49 = httpService:JSONDecode(var48)
			local report = var49.Report
			report.Refs = var49.Refs
			local cloned = table.clone(activeState_1)
			table.insert(cloned.snapshots, report)
			cloned.active = #cloned.snapshots
			p20.dispatchSetLuauHeapState(activeState, cloned)
			
			return
		end
		warn(var48)
	end
	
	function p20.onClearSnapshots() --[[ line: 317 ]]
		-- upvalues: p20 (ref)
		local activeState, activeState_1 = p20:getActiveState()
		local cloned = table.clone(activeState_1)
		table.clear(cloned.snapshots)
		cloned.active = 0
		p20.dispatchSetLuauHeapState(activeState, cloned)
	end
	
	p20.utilRef = roactModule.createRef()
	p20.state = { searchTerm = nil, utilTabHeight = 0 }
	
	function p20.onSearchTermChanged(p24) --[[ line: 335 ]]
		-- upvalues: p20 (ref), roactModule (copy)
		if p24 == nil or p24 == "" then
			p20:setState({ searchTerm = roactModule.None })
			
			return
		end
		p20:setState({ searchTerm = p24 })
	end
end

function mainViewLuauHeap.didMount(p25) --[[ line: 348 ]]
	p25:setState({ utilTabHeight = p25.utilRef.current.Size.Y.Offset })
end

function mainViewLuauHeap.willUnmount(_) --[[ line: 355 ]] end

function mainViewLuauHeap.didUpdate(p26) --[[ line: 358 ]]
	local size = p26.utilRef.current.Size
	
	if size.Y.Offset ~= p26.state.utilTabHeight then
		p26:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewLuauHeap.render(p27) --[[ line: 367 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), boxButtonModule (ref), luauHeapViewModule (ref)
	local size = p27.props.size
	local formFactor = p27.props.formFactor
	local tabList = p27.props.tabList
	local utilTabHeight = p27.state.utilTabHeight
	local activeState, activeState_1 = p27:getActiveState()
	
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
			onClientButton = p27.onClientButton,
			onServerButton = p27.onServerButton,
			refForParent = p27.utilRef,
			onHeightChanged = p27.onUtilTabHeightChanged,
			onSearchTermChanged = p27.onSearchTermChanged
		}, {
			roactModule.createElement(boxButtonModule, {
				text = "Create Snapshot",
				onClicked = p27.onCreateSnapshot
			}),
			roactModule.createElement(boxButtonModule, {
				text = "Clear Snapshots",
				onClicked = p27.onClearSnapshots
			})
		}),
		LuauHeapView = roactModule.createElement(luauHeapViewModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			data = p27.filterSnapshots(activeState_1.snapshots, p27.state.searchTerm, p27.version),
			activeSnapshot = activeState_1.active,
			compareSnapshot = activeState_1.compare
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p28, _) --[[ line: 423 | named "mapStateToProps" ]]
	return {
		isClientView = p28.LuauHeap.isClientView,
		client = p28.LuauHeap.client,
		server = p28.LuauHeap.server
	}
end, function(p29) --[[ line: 432 | named "mapDispatchToProps" ]]
	-- upvalues: setLuauHeapStateModule (ref), setLuauHeapProfileTargetModule (ref)
	return {
		dispatchSetLuauHeapState = function(value, p30) --[[ line: 434 ]]
			-- upvalues: p29 (ref), setLuauHeapStateModule (copy)
			p29(setLuauHeapStateModule(value, p30))
		end,
		dispatchSetLuauHeapProfileTarget = function(value) --[[ line: 437 ]]
			-- upvalues: p29 (ref), setLuauHeapProfileTargetModule (copy)
			p29(setLuauHeapProfileTargetModule(value))
		end
	}
end)(dataConsumerModule(mainViewLuauHeap, "LuauHeapData"))