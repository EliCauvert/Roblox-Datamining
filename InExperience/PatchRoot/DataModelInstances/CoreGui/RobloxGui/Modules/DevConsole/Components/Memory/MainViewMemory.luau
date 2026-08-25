local corePackagesService = game:GetService("CorePackages")
local statsService = game:GetService("Stats")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local clientMemoryModule = require(components.Memory.ClientMemory)
local serverMemoryModule = require(components.Memory.ServerMemory)
local utilAndTabModule = require(components.UtilAndTab)
local dataConsumerModule = require(components.DataConsumer)
local actions = script.Parent.Parent.Parent.Actions
local clientMemoryUpdateSearchFilterModule = require(actions.ClientMemoryUpdateSearchFilter)
local serverMemoryUpdateSearchFilterModule = require(actions.ServerMemoryUpdateSearchFilter)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local devConsoleMemoryTrackingAlert = game:DefineFastFlag("DevConsoleMemoryTrackingAlert", false)
local logButton = roactModule.Component:extend("LogButton")

function logButton.init(p0)
	function p0.onAction()
		-- upvalues: p0 (ref)
		local var14 = if p0.props.isClientView then p0.props.ClientMemoryData else p0.props.ServerMemoryData
		local var15 = "\n"
		
		local function _(p1)
			-- upvalues: var15 (write)
			var15 ..= p1 .. "\n"
		end
		
		var15 = (var15 .. "Name                                       Min   Max" .. "\n") .. "----------------------------------------   ---   ---" .. "\n"
		
		local function recurseMemoryTree(p2, p3, p4)
			-- upvalues: var15 (write), recurseMemoryTree (ref)
			var15 ..= string.format("%s %s %s %3d   %3d", string.rep(" ", p4), p2, string.rep(" ", 40 - p4 - #p2), p3.min, p3.max) .. "\n"
			
			if p3.children then
				for i, v in pairs(p3.children) do
					recurseMemoryTree(i, v, p4 + 2)
				end
			end
		end
		
		recurseMemoryTree("Memory", var14._memoryData.Memory, 0)
		print(var15)
	end
end

function logButton.render(p5)
	-- upvalues: roactModule (ref), constantsModule (ref)
	return roactModule.createElement("TextButton", {
		Text = "Log",
		Visible = true,
		BorderSizePixel = 1,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		TextColor3 = constantsModule.Color.Text,
		[roactModule.Event.Activated] = p5.onAction
	})
end

logButton = dataConsumerModule(logButton, "ClientMemoryData", "ServerMemoryData")
local mainViewMemory = roactModule.Component:extend("MainViewMemory")

function mainViewMemory.init(p6)
	-- upvalues: roactModule (ref)
	function p6.onUtilTabHeightChanged(p7)
		-- upvalues: p6 (ref)
		p6:setState({ utilTabHeight = p7 })
	end
	
	function p6.onClientButton()
		-- upvalues: p6 (ref)
		p6:setState({ isClientView = true })
	end
	
	function p6.onServerButton()
		-- upvalues: p6 (ref)
		p6:setState({ isClientView = false })
	end
	
	function p6.onSearchTermChanged(p8)
		-- upvalues: p6 (ref)
		if p6.state.isClientView then
			p6.props.dispatchClientMemoryUpdateSearchFilter(p8, {})
			
			return
		end
		p6.props.dispatchServerMemoryUpdateSearchFilter(p8, {})
	end
	
	p6.utilRef = roactModule.createRef()
	p6.state = { utilTabHeight = 0, isClientView = true }
end

function mainViewMemory.didMount(p9)
	p9:setState({ utilTabHeight = p9.utilRef.current.Size.Y.Offset })
end

function mainViewMemory.didUpdate(p10)
	local offset = p10.utilRef.current.Size.Y.Offset
	
	if offset ~= p10.state.utilTabHeight then
		p10:setState({ utilTabHeight = offset })
	end
end

local function _()
	-- upvalues: statsService (ref)
	return not statsService.MemoryTrackingEnabled
end

function mainViewMemory.render(p11)
	-- upvalues: devConsoleMemoryTrackingAlert (ref), statsService (ref), roactModule (ref), mainRowPadding (ref), utilAndTabModule (ref), logButton (write), constantsModule (ref), clientMemoryModule (ref), serverMemoryModule (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		})
	}
	local size = p11.props.size
	local isDeveloperView = p11.props.isDeveloperView
	local formFactor = p11.props.formFactor
	local tabList = p11.props.tabList
	local utilTabHeight = p11.state.utilTabHeight
	local isClientView = p11.state.isClientView
	local var18 = if isClientView then p11.props.clientSearchTerm else p11.props.serverSearchTerm
	local var19 = if devConsoleMemoryTrackingAlert then not statsService.MemoryTrackingEnabled else false
	t.UtilAndTab = roactModule.createElement(utilAndTabModule, {
		layoutOrder = 1,
		windowWidth = size.X.Offset,
		formFactor = formFactor,
		tabList = tabList,
		isClientView = isClientView,
		searchTerm = var18,
		refForParent = p11.utilRef,
		onHeightChanged = p11.onUtilTabHeightChanged,
		onClientButton = isDeveloperView and p11.onClientButton,
		onServerButton = isDeveloperView and p11.onServerButton,
		onSearchTermChanged = p11.onSearchTermChanged
	}, {
		logButton and roactModule.createElement(logButton, { isClientView = isClientView })
	})
	
	if var19 then
		t.MemoryHeader = roactModule.createElement("TextLabel", {
			Text = "Memory category counters are disabled. Restart the client with the MicroProfiler on to guarantee counters are enabled.",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 20),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			BackgroundColor3 = Color3.new(1, 0, 0)
		})
	end
	if utilTabHeight > 0 then
		if isClientView then
			t.ClientMemory = roactModule.createElement(clientMemoryModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 1, -utilTabHeight),
				searchTerm = var18
			})
		else
			t.ServerMemory = roactModule.createElement(serverMemoryModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 1, -utilTabHeight),
				searchTerm = var18
			})
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, t)
end

return roactRoduxModule.UNSTABLE_connect2(function(p12, _)
	return {
		clientSearchTerm = p12.MemoryData.clientSearchTerm,
		clientTypeFilters = p12.MemoryData.clientTypeFilters,
		serverSearchTerm = p12.MemoryData.serverSearchTerm,
		serverTypeFilters = p12.MemoryData.serverTypeFilters
	}
end, function(p13)
	-- upvalues: clientMemoryUpdateSearchFilterModule (ref), serverMemoryUpdateSearchFilterModule (ref)
	return {
		dispatchClientMemoryUpdateSearchFilter = function(p14, p15)
			-- upvalues: p13 (ref), clientMemoryUpdateSearchFilterModule (copy)
			p13(clientMemoryUpdateSearchFilterModule(p14, p15))
		end,
		dispatchServerMemoryUpdateSearchFilter = function(p16, p17)
			-- upvalues: p13 (ref), serverMemoryUpdateSearchFilterModule (copy)
			p13(serverMemoryUpdateSearchFilterModule(p16, p17))
		end
	}
end)(mainViewMemory)