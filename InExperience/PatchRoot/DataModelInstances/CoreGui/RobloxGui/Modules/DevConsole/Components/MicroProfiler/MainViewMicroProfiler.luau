local _ = game:GetService("LogService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GameSettings = UserSettings().GameSettings
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local UtilAndTabModule = require(script.Parent.Parent.Parent.Components.UtilAndTab)
local ServerProfilerInterfaceModule = require(script.Parent.ServerProfilerInterface)
local MicroProfilerViewModule = require(script.Parent.MicroProfilerView)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local ButtonWidth = ConstantsModule.MicroProfilerFormatting.ButtonWidth
local ButtonTextSize = ConstantsModule.MicroProfilerFormatting.ButtonTextSize
local _ = ConstantsModule.Font.MainWindow
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local SelectedBlue = ConstantsModule.Color.SelectedBlue
local UnselectedGray1 = ConstantsModule.Color.UnselectedGray
local FFlagDevConsoleMicroProfilerImproveWordingModule = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording)
local DevConsoleMicroProfilerNewLayout = game:DefineFastFlag("DevConsoleMicroProfilerNewLayout", false)
local MainViewProfiler = RoactModule.Component:extend("MainViewProfiler")

function MainViewProfiler.init(p1) --[[ Line: 35 ]]
	-- upvalues: GameSettings (copy), RbxAnalyticsService (copy), RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight) --[[ Line: 36 ]]
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.changeProfilerState(ClientProfilerEnabled) --[[ Line: 42 ]]
		-- upvalues: GameSettings (upval), p1 (copy), RbxAnalyticsService (upval)
		return function() --[[ Line: 43 ]]
			-- upvalues: GameSettings (upval), ClientProfilerEnabled (copy), p1 (upval), RbxAnalyticsService (upval)
			GameSettings.OnScreenProfilerEnabled = ClientProfilerEnabled
			p1:setState({ clientProfilerEnabled = ClientProfilerEnabled })
			RbxAnalyticsService:ReportCounter("MicroprofilerDevConsolePressed")
		end
	end
	
	p1.microProfilerChangedConnection = GameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 54 ]]
		-- upvalues: p1 (copy), GameSettings (upval)
		p1:setState({
			clientProfilerEnabled = GameSettings.OnScreenProfilerEnabled
		})
	end)
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewProfiler.didMount(p1) --[[ Line: 67 ]]
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewProfiler.willUnmount(p1) --[[ Line: 75 ]]
	if p1.microProfilerChangedConnection then
		p1.microProfilerChangedConnection:Disconnect()
		p1.microProfilerChangedConnection = nil
	end
end

function MainViewProfiler.didUpdate(p1) --[[ Line: 82 ]]
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewProfiler.renderNewLayout(p1) --[[ Line: 91 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), MicroProfilerViewModule (copy)
	local Size = p1.props.size
	
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
			formFactor = p1.props.formFactor,
			tabList = p1.props.tabList,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged
		}),
		MicroProfilerView = RoactModule.createElement(MicroProfilerViewModule, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, -p1.state.utilTabHeight)
		})
	})
end

function MainViewProfiler.render(p1) --[[ Line: 123 ]]
	-- upvalues: DevConsoleMicroProfilerNewLayout (copy), ButtonWidth (copy), RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), FFlagDevConsoleMicroProfilerImproveWordingModule (copy), MainWindowHeader (copy), ButtonTextSize (copy), UnselectedGray1 (copy), UnselectedGray (copy), SelectedBlue (copy), ServerProfilerInterfaceModule (copy)
	if DevConsoleMicroProfilerNewLayout then
		return p1:renderNewLayout()
	else
		local Size = p1.props.size
		local UtilTabHeight = p1.state.utilTabHeight
		local _ = p1.state.frameRate
		local _ = p1.state.timeFrame
		local _ = p1.state.waitingForData
		local ClientProfilerEnabled = p1.state.clientProfilerEnabled
		local _ = p1.state.outputPath
		local _ = UDim2.new(0.8, -ButtonWidth, 0, 30)
		local _ = UDim2.new(0.6, ButtonWidth, 0, 0)
		
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
				formFactor = p1.props.formFactor,
				tabList = p1.props.tabList,
				refForParent = p1.utilRef,
				onHeightChanged = p1.onUtilTabHeightChanged
			}),
			MainFrame = RoactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 1, -UtilTabHeight),
				CanvasSize = UDim2.new(1, 0, 1, -UtilTabHeight)
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, MainRowPadding * 2),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				MicroProfilerRow = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 90)
				}, {
					Label = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, ButtonWidth, 0, 30),
						Position = UDim2.new(0.1, 0, 0, 0),
						Text = if FFlagDevConsoleMicroProfilerImproveWordingModule then "Client MicroProfiler" else "MicroProfiler",
						Font = MainWindowHeader,
						TextSize = ButtonTextSize,
						TextColor3 = ConstantsModule.Color.Text,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						BackgroundColor3 = UnselectedGray1
					}),
					HorizontalLine = RoactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, 1),
						Position = UDim2.new(0, 0, 0, 30)
					}),
					ToggleButton = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0.8, -ButtonWidth, 0, 30),
						Position = UDim2.new(0.09999999999999998, ButtonWidth, 0, 37.5)
					}, {
						OffButton = RoactModule.createElement("TextButton", {
							Size = UDim2.new(0.5, 0, 1, 0),
							Text = "Off",
							Font = MainWindowHeader,
							TextSize = ButtonTextSize,
							TextColor3 = ConstantsModule.Color.Text,
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							BackgroundColor3 = ClientProfilerEnabled and UnselectedGray or SelectedBlue,
							[RoactModule.Event.Activated] = p1.changeProfilerState(false)
						}),
						ClientButton = RoactModule.createElement("TextButton", {
							Size = UDim2.new(0.5, 0, 1, 0),
							Position = UDim2.new(0.5, 0, 0, 0),
							Text = if FFlagDevConsoleMicroProfilerImproveWordingModule then "On" else "Client",
							Font = MainWindowHeader,
							TextSize = ButtonTextSize,
							TextColor3 = ConstantsModule.Color.Text,
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							BackgroundColor3 = ClientProfilerEnabled and SelectedBlue or UnselectedGray,
							[RoactModule.Event.Activated] = p1.changeProfilerState(true)
						})
					})
				}),
				HorizontalLine = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, MainRowPadding)
				}),
				ServerProfiler = RoactModule.createElement(ServerProfilerInterfaceModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, 135)
				})
			})
		})
	end
end

return MainViewProfiler