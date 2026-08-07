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

function mainViewProfiler.init(p0) --[[ line: 35 ]]
	-- upvalues: gameSettings (ref), rbxAnalyticsService (ref), roactModule (ref)
	function p0.onUtilTabHeightChanged(p1) --[[ line: 36 ]]
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.changeProfilerState(p2) --[[ line: 42 ]]
		-- upvalues: gameSettings (copy), p0 (ref), rbxAnalyticsService (copy)
		return function() --[[ line: 43 ]]
			-- upvalues: gameSettings (copy), p2 (ref), p0 (copy), rbxAnalyticsService (copy)
			gameSettings.OnScreenProfilerEnabled = p2
			p0:setState({ clientProfilerEnabled = p2 })
			rbxAnalyticsService:ReportCounter("MicroprofilerDevConsolePressed")
		end
	end
	
	p0.microProfilerChangedConnection = gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ line: 54 ]]
		-- upvalues: p0 (ref), gameSettings (copy)
		p0:setState({
			clientProfilerEnabled = gameSettings.OnScreenProfilerEnabled
		})
	end)
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0 }
end

function mainViewProfiler.didMount(p3) --[[ line: 67 ]]
	p3:setState({ utilTabHeight = p3.utilRef.current.Size.Y.Offset })
end

function mainViewProfiler.willUnmount(p4) --[[ line: 75 ]]
	if p4.microProfilerChangedConnection then
		p4.microProfilerChangedConnection:Disconnect()
		p4.microProfilerChangedConnection = nil
	end
end

function mainViewProfiler.didUpdate(p5) --[[ line: 82 ]]
	local size = p5.utilRef.current.Size
	
	if size.Y.Offset ~= p5.state.utilTabHeight then
		p5:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewProfiler.renderNewLayout(p6) --[[ line: 91 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), microProfilerViewModule (ref)
	local size = p6.props.size
	
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
			formFactor = p6.props.formFactor,
			tabList = p6.props.tabList,
			refForParent = p6.utilRef,
			onHeightChanged = p6.onUtilTabHeightChanged
		}),
		MicroProfilerView = roactModule.createElement(microProfilerViewModule, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, -p6.state.utilTabHeight)
		})
	})
end

function mainViewProfiler.render(p7) --[[ line: 123 ]]
	-- upvalues: devConsoleMicroProfilerNewLayout (ref), buttonWidth (ref), roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), fFlagDevConsoleMicroProfilerImproveWordingModule (ref), mainWindowHeader (ref), buttonTextSize (ref), unselectedGray_1 (ref), unselectedGray (ref), selectedBlue (ref), serverProfilerInterfaceModule (ref)
	if devConsoleMicroProfilerNewLayout then
		return p7:renderNewLayout()
	end
	local size = p7.props.size
	local formFactor = p7.props.formFactor
	local tabList = p7.props.tabList
	local utilTabHeight = p7.state.utilTabHeight
	local _ = p7.state.frameRate
	local _ = p7.state.timeFrame
	local _ = p7.state.waitingForData
	local clientProfilerEnabled = p7.state.clientProfilerEnabled
	local _ = p7.state.outputPath
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
			refForParent = p7.utilRef,
			onHeightChanged = p7.onUtilTabHeightChanged
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
						[roactModule.Event.Activated] = p7.changeProfilerState(false)
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
						[roactModule.Event.Activated] = p7.changeProfilerState(true)
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