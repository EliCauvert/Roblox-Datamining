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

function logButton.init(p1)
	function p0.onAction()
		-- upvalues: p1 (ref)
		local var1 = if p1.props.isClientView then p1.props.ClientMemoryData else p1.props.ServerMemoryData
		local var2 = "\n"
		
		local function _(p2)
			-- upvalues: var2 (write)
			var2 ..= p2 .. "\n"
		end
		
		var2 = (var2 .. "Name                                       Min   Max" .. "\n") .. "----------------------------------------   ---   ---" .. "\n"
		
		local function recurseMemoryTree(p2, p3, p4)
			-- upvalues: var2 (write), recurseMemoryTree (ref)
			var2 ..= string.format("%s %s %s %3d   %3d", string.rep(" ", p4), p2, string.rep(" ", 40 - p4 - #p2), p3.min, p3.max) .. "\n"
			
			if p3.children then
				for i, v in pairs(p3.children) do
					recurseMemoryTree(i, v, p4 + 2)
				end
			end
		end
		
		recurseMemoryTree("Memory", var1._memoryData.Memory, 0)
		print(var2)
	end
end

function logButton.render(p2)
	-- upvalues: roactModule (ref), constantsModule (ref)
	return roactModule.createElement("TextButton", {
		Text = "Log",
		Visible = true,
		BorderSizePixel = 1,
		BackgroundColor3 = constantsModule.Color.UnselectedGray,
		TextColor3 = constantsModule.Color.Text,
		[roactModule.Event.Activated] = p2.onAction
	})
end

logButton = dataConsumerModule(logButton, "ClientMemoryData", "ServerMemoryData")
local mainViewMemory = roactModule.Component:extend("MainViewMemory")

function mainViewMemory.init(p2)
	-- upvalues: roactModule (ref)
	function p6.onUtilTabHeightChanged(p3)
		-- upvalues: p2 (ref)
		p2:setState({ utilTabHeight = p3 })
	end
	
	function p6.onClientButton()
		-- upvalues: p2 (ref)
		p2:setState({ isClientView = true })
	end
	
	function p6.onServerButton()
		-- upvalues: p2 (ref)
		p2:setState({ isClientView = false })
	end
	
	function p6.onSearchTermChanged(p3)
		-- upvalues: p2 (ref)
		if p2.state.isClientView then
			p2.props.dispatchClientMemoryUpdateSearchFilter(p3, {})
			
			return
		end
		p2.props.dispatchServerMemoryUpdateSearchFilter(p3, {})
	end
	
	p2.utilRef = roactModule.createRef()
	p2.state = { utilTabHeight = 0, isClientView = true }
end

function mainViewMemory.didMount(p2)
	p2:setState({ utilTabHeight = p2.utilRef.current.Size.Y.Offset })
end

function mainViewMemory.didUpdate(p2)
	local offset = p2.utilRef.current.Size.Y.Offset
	
	if offset ~= p2.state.utilTabHeight then
		p2:setState({ utilTabHeight = offset })
	end
end

local function _()
	-- upvalues: statsService (ref)
	return not statsService.MemoryTrackingEnabled
end

function mainViewMemory.render(p2)
	-- upvalues: devConsoleMemoryTrackingAlert (ref), statsService (ref), roactModule (ref), mainRowPadding (ref), utilAndTabModule (ref), logButton (write), constantsModule (ref), clientMemoryModule (ref), serverMemoryModule (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		})
	}
	local size = p2.props.size
	local isDeveloperView = p2.props.isDeveloperView
	local formFactor = p2.props.formFactor
	local tabList = p2.props.tabList
	local utilTabHeight = p2.state.utilTabHeight
	local isClientView = p2.state.isClientView
	local var1 = if isClientView then p2.props.clientSearchTerm else p2.props.serverSearchTerm
	local var2 = if devConsoleMemoryTrackingAlert then not statsService.MemoryTrackingEnabled else false
	t.UtilAndTab = roactModule.createElement(utilAndTabModule, {
		layoutOrder = 1,
		windowWidth = size.X.Offset,
		formFactor = formFactor,
		tabList = tabList,
		isClientView = isClientView,
		searchTerm = var1,
		refForParent = p2.utilRef,
		onHeightChanged = p2.onUtilTabHeightChanged,
		onClientButton = isDeveloperView and p2.onClientButton,
		onServerButton = isDeveloperView and p2.onServerButton,
		onSearchTermChanged = p2.onSearchTermChanged
	}, {
		logButton and roactModule.createElement(logButton, { isClientView = isClientView })
	})
	
	if var2 then
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
				searchTerm = var1
			})
		else
			t.ServerMemory = roactModule.createElement(serverMemoryModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 1, -utilTabHeight),
				searchTerm = var1
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

return roactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return {
		clientSearchTerm = p2.MemoryData.clientSearchTerm,
		clientTypeFilters = p2.MemoryData.clientTypeFilters,
		serverSearchTerm = p2.MemoryData.serverSearchTerm,
		serverTypeFilters = p2.MemoryData.serverTypeFilters
	}
end, function(p2)
	-- upvalues: clientMemoryUpdateSearchFilterModule (ref), serverMemoryUpdateSearchFilterModule (ref)
	return {
		dispatchClientMemoryUpdateSearchFilter = function(p3, p4)
			-- upvalues: p2 (ref), clientMemoryUpdateSearchFilterModule (copy)
			p2(clientMemoryUpdateSearchFilterModule(p3, p4))
		end,
		dispatchServerMemoryUpdateSearchFilter = function(p3, p4)
			-- upvalues: p2 (ref), serverMemoryUpdateSearchFilterModule (copy)
			p2(serverMemoryUpdateSearchFilterModule(p3, p4))
		end
	}
end)(mainViewMemory)