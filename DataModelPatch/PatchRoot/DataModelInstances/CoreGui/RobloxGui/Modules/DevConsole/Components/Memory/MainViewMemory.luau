local CorePackages = game:GetService("CorePackages")
local StatsService = game:GetService("Stats")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local ClientMemoryModule = require(Components.Memory.ClientMemory)
local ServerMemoryModule = require(Components.Memory.ServerMemory)
local UtilAndTabModule = require(Components.UtilAndTab)
local DataConsumerModule = require(Components.DataConsumer)
local Actions = script.Parent.Parent.Parent.Actions
local ClientMemoryUpdateSearchFilterModule = require(Actions.ClientMemoryUpdateSearchFilter)
local ServerMemoryUpdateSearchFilterModule = require(Actions.ServerMemoryUpdateSearchFilter)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local DevConsoleMemoryTrackingAlert = game:DefineFastFlag("DevConsoleMemoryTrackingAlert", false)
local LogButton = RoactModule.Component:extend("LogButton")

function LogButton.init(p1)
	function p1.onAction()
		-- upvalues: p1 (copy)
		local Text = "\n"
		
		local function _(Text1)
			-- upvalues: Text (ref)
			Text ..= Text1 .. "\n"
		end
		
		Text ..= "Name                                       Min   Max" .. "\n"
		Text ..= "----------------------------------------   ---   ---" .. "\n"
		
		local function recurseMemoryTree(p2, Memory, Count: number)
			-- upvalues: Text (ref), recurseMemoryTree (copy)
			Text ..= string.format("%s %s %s %3d   %3d", string.rep(" ", Count), p2, string.rep(" ", 40 - Count - #p2), Memory.min, Memory.max) .. "\n"
			
			if Memory.children then
				for i, child in pairs(Memory.children) do
					recurseMemoryTree(i, child, Count + 2)
				end
			end
		end
		
		recurseMemoryTree("Memory", (p1.props.isClientView and p1.props.ClientMemoryData or p1.props.ServerMemoryData)._memoryData.Memory, 0)
		print(Text)
	end
end

function LogButton.render(p2)
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	return RoactModule.createElement("TextButton", {
		Text = "Log",
		Visible = true,
		BorderSizePixel = 1,
		BackgroundColor3 = ConstantsModule.Color.UnselectedGray,
		TextColor3 = ConstantsModule.Color.Text,
		[RoactModule.Event.Activated] = p2.onAction
	})
end

local ClientMemoryData = DataConsumerModule(LogButton, "ClientMemoryData", "ServerMemoryData")
local MainViewMemory = RoactModule.Component:extend("MainViewMemory")

function MainViewMemory.init(p2)
	-- upvalues: RoactModule (copy)
	function p2.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p2 (copy)
		p2:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p2.onClientButton()
		-- upvalues: p2 (copy)
		p2:setState({ isClientView = true })
	end
	
	function p2.onServerButton()
		-- upvalues: p2 (copy)
		p2:setState({ isClientView = false })
	end
	
	function p2.onSearchTermChanged(p3)
		-- upvalues: p2 (copy)
		if p2.state.isClientView then
			p2.props.dispatchClientMemoryUpdateSearchFilter(p3, {})
			
			return
		else
			p2.props.dispatchServerMemoryUpdateSearchFilter(p3, {})
		end
	end
	
	p2.utilRef = RoactModule.createRef()
	p2.state = { utilTabHeight = 0, isClientView = true }
end

function MainViewMemory.didMount(p2)
	p2:setState({ utilTabHeight = p2.utilRef.current.Size.Y.Offset })
end

function MainViewMemory.didUpdate(p2)
	local Offset = p2.utilRef.current.Size.Y.Offset
	
	if Offset ~= p2.state.utilTabHeight then
		p2:setState({ utilTabHeight = Offset })
	end
end

local function _(): boolean
	-- upvalues: StatsService (copy)
	return not StatsService.MemoryTrackingEnabled
end

function MainViewMemory.render(p2)
	-- upvalues: DevConsoleMemoryTrackingAlert (copy), StatsService (copy), RoactModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), ClientMemoryData (ref), ConstantsModule (copy), ClientMemoryModule (copy), ServerMemoryModule (copy)
	local Size = p2.props.size
	local IsDeveloperView = p2.props.isDeveloperView
	local UtilTabHeight: number = p2.state.utilTabHeight
	local IsClientView = p2.state.isClientView
	local ClientSearchTerm = IsClientView and p2.props.clientSearchTerm or p2.props.serverSearchTerm
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		}),
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = p2.props.formFactor,
			tabList = p2.props.tabList,
			isClientView = IsClientView,
			searchTerm = ClientSearchTerm,
			refForParent = p2.utilRef,
			onHeightChanged = p2.onUtilTabHeightChanged,
			onClientButton = IsDeveloperView and p2.onClientButton,
			onServerButton = IsDeveloperView and p2.onServerButton,
			onSearchTermChanged = p2.onSearchTermChanged
		}, {
			ClientMemoryData and RoactModule.createElement(ClientMemoryData, { isClientView = IsClientView })
		})
	}
	
	if if DevConsoleMemoryTrackingAlert then not StatsService.MemoryTrackingEnabled else false then
		config.MemoryHeader = RoactModule.createElement("TextLabel", {
			Text = "Memory category counters are disabled. Restart the client with the MicroProfiler on to guarantee counters are enabled.",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 20),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = ConstantsModule.Color.Text,
			BackgroundColor3 = Color3.new(1, 0, 0)
		})
	end
	if UtilTabHeight > 0 then
		if IsClientView then
			config.ClientMemory = RoactModule.createElement(ClientMemoryModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 1, -UtilTabHeight),
				searchTerm = ClientSearchTerm
			})
		else
			config.ServerMemory = RoactModule.createElement(ServerMemoryModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 1, -UtilTabHeight),
				searchTerm = ClientSearchTerm
			})
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = Size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, config)
end

return RoactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return {
		clientSearchTerm = p2.MemoryData.clientSearchTerm,
		clientTypeFilters = p2.MemoryData.clientTypeFilters,
		serverSearchTerm = p2.MemoryData.serverSearchTerm,
		serverTypeFilters = p2.MemoryData.serverTypeFilters
	}
end, function(Callback)
	-- upvalues: ClientMemoryUpdateSearchFilterModule (copy), ServerMemoryUpdateSearchFilterModule (copy)
	return {
		dispatchClientMemoryUpdateSearchFilter = function(p2, p3)
			-- upvalues: Callback (copy), ClientMemoryUpdateSearchFilterModule (upval)
			Callback(ClientMemoryUpdateSearchFilterModule(p2, p3))
		end,
		dispatchServerMemoryUpdateSearchFilter = function(p2, p3)
			-- upvalues: Callback (copy), ServerMemoryUpdateSearchFilterModule (upval)
			Callback(ServerMemoryUpdateSearchFilterModule(p2, p3))
		end
	}
end)(MainViewMemory)