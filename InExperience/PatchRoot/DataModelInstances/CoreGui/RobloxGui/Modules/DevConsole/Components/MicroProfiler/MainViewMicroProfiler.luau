local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("LogService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local gameSettings = UserSettings().GameSettings
local roactModule = require(corePackagesService.Packages.Roact)
local utilAndTabModule = require(script.Parent.Parent.Parent.Components.UtilAndTab)
local serverProfilerInterfaceModule = require(script.Parent.ServerProfilerInterface)
local microProfilerViewModule = require(script.Parent.MicroProfilerView)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local buttonWidth = constantsModule.MicroProfilerFormatting.ButtonWidth
local buttonTextSize = constantsModule.MicroProfilerFormatting.ButtonTextSize
local _ = constantsModule.Font.MainWindow
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local unselectedGray = constantsModule.Color.UnselectedGray
local selectedBlue = constantsModule.Color.SelectedBlue
local unselectedGray_1 = constantsModule.Color.UnselectedGray
local fFlagDevConsoleMicroProfilerImproveWordingModule = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording)
local devConsoleMicroProfilerNewLayout = game:DefineFastFlag("DevConsoleMicroProfilerNewLayout", false)
local mainViewProfiler = roactModule.Component:extend("MainViewProfiler")

function mainViewProfiler.init(p1)
	-- upvalues: gameSettings (ref), rbxAnalyticsService (ref), roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.changeProfilerState(p2)
		-- upvalues: gameSettings (copy), p1 (ref), rbxAnalyticsService (copy)
		return function()
			-- upvalues: gameSettings (copy), p2 (ref), p1 (copy), rbxAnalyticsService (copy)
			gameSettings.OnScreenProfilerEnabled = p2
			p1:setState({ clientProfilerEnabled = p2 })
			rbxAnalyticsService:ReportCounter("MicroprofilerDevConsolePressed")
		end
	end
	
	p1.microProfilerChangedConnection = gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
		-- upvalues: p1 (ref), gameSettings (copy)
		p1:setState({
			clientProfilerEnabled = gameSettings.OnScreenProfilerEnabled
		})
	end)
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function mainViewProfiler.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewProfiler.willUnmount(p1)
	if p1.microProfilerChangedConnection then
		p1.microProfilerChangedConnection:Disconnect()
		p1.microProfilerChangedConnection = nil
	end
end

function mainViewProfiler.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewProfiler.renderNewLayout(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), microProfilerViewModule (ref)
	local size = p1.props.size
	
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
			formFactor = p1.props.formFactor,
			tabList = p1.props.tabList,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged
		}),
		MicroProfilerView = roactModule.createElement(microProfilerViewModule, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, -p1.state.utilTabHeight)
		})
	})
end

function mainViewProfiler.render(p1)
	-- upvalues: devConsoleMicroProfilerNewLayout (ref), buttonWidth (ref), roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), fFlagDevConsoleMicroProfilerImproveWordingModule (ref), mainWindowHeader (ref), buttonTextSize (ref), unselectedGray_1 (ref), unselectedGray (ref), selectedBlue (ref), serverProfilerInterfaceModule (ref)
	if devConsoleMicroProfilerNewLayout then
		return p1:renderNewLayout()
	end
	local size = p1.props.size
	local formFactor = p1.props.formFactor
	local tabList = p1.props.tabList
	local utilTabHeight = p1.state.utilTabHeight
	local _ = p1.state.frameRate
	local _ = p1.state.timeFrame
	local _ = p1.state.waitingForData
	local clientProfilerEnabled = p1.state.clientProfilerEnabled
	local _ = p1.state.outputPath
	local _ = UDim2.new(0.8, -buttonWidth, 0, 30)
	local _ = UDim2.new(0.6, buttonWidth, 0, 0)
	
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
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged
		}),
		MainFrame = roactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, -utilTabHeight),
			CanvasSize = UDim2.new(1, 0, 1, -utilTabHeight)
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, mainRowPadding * 2),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			MicroProfilerRow = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 90)
			}, {
				Label = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, buttonWidth, 0, 30),
					Position = UDim2.new(0.1, 0, 0, 0),
					Text = if fFlagDevConsoleMicroProfilerImproveWordingModule then "Client MicroProfiler" else "MicroProfiler",
					Font = mainWindowHeader,
					TextSize = buttonTextSize,
					TextColor3 = constantsModule.Color.Text,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					BackgroundColor3 = unselectedGray_1
				}),
				HorizontalLine = roactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 0, 30)
				}),
				ToggleButton = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0.8, -buttonWidth, 0, 30),
					Position = UDim2.new(0.1, buttonWidth, 0, 37.5)
				}, {
					OffButton = roactModule.createElement("TextButton", {
						Size = UDim2.new(0.5, 0, 1, 0),
						Text = "Off",
						Font = mainWindowHeader,
						TextSize = buttonTextSize,
						TextColor3 = constantsModule.Color.Text,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						BackgroundColor3 = if clientProfilerEnabled then unselectedGray else selectedBlue,
						[roactModule.Event.Activated] = p1.changeProfilerState(false)
					}),
					ClientButton = roactModule.createElement("TextButton", {
						Size = UDim2.new(0.5, 0, 1, 0),
						Position = UDim2.new(0.5, 0, 0, 0),
						Text = if fFlagDevConsoleMicroProfilerImproveWordingModule then "On" else "Client",
						Font = mainWindowHeader,
						TextSize = buttonTextSize,
						TextColor3 = constantsModule.Color.Text,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						BackgroundColor3 = if clientProfilerEnabled then selectedBlue else unselectedGray,
						[roactModule.Event.Activated] = p1.changeProfilerState(true)
					})
				})
			}),
			HorizontalLine = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, mainRowPadding)
			}),
			ServerProfiler = roactModule.createElement(serverProfilerInterfaceModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 135)
			})
		})
	})
end

return mainViewProfiler