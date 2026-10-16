local CorePackages = game:GetService("CorePackages")
local GameSettings = UserSettings().GameSettings
local FFlagDevConsoleMicroProfilerImproveWordingModule = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording)
local DevConsoleMicroProfilerFixAutoTextClear = game:DefineFastFlag("DevConsoleMicroProfilerFixAutoTextClear", false)
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = script.Parent.Parent.Parent.Components
local SetRCCProfilerStateModule = require(script.Parent.Parent.Parent.Actions.SetRCCProfilerState)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local _ = ConstantsModule.GeneralFormatting.MainRowPadding
local ButtonWidth = ConstantsModule.MicroProfilerFormatting.ButtonWidth
local ButtonTextSize = ConstantsModule.MicroProfilerFormatting.ButtonTextSize
local MainWindow = ConstantsModule.Font.MainWindow
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local SelectedBlue = ConstantsModule.Color.SelectedBlue
local UnselectedGray1 = ConstantsModule.Color.UnselectedGray
local ServerProfilerInteraface = RoactModule.Component:extend("ServerProfilerInteraface")

function ServerProfilerInteraface.init(p1) --[[ Line: 35 ]]
	-- upvalues: GameSettings (copy), GetClientReplicatorModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight) --[[ Line: 36 ]]
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onFocusLostFrameRate(p2, _, _) --[[ Line: 42 ]]
		-- upvalues: GameSettings (upval)
		GameSettings.RCCProfilerRecordFrameRate = p2.Text
		p2.Text = GameSettings.RCCProfilerRecordFrameRate
	end
	
	function p1.onFocusLostTimeFrame(p2, _, _) --[[ Line: 50 ]]
		-- upvalues: GameSettings (upval)
		GameSettings.RCCProfilerRecordTimeFrame = p2.Text
		p2.Text = GameSettings.RCCProfilerRecordTimeFrame
	end
	
	function p1:requestRCCProfilerData() --[[ Line: 58 ]]
		-- upvalues: GetClientReplicatorModule (upval), GameSettings (upval), p1 (copy)
		local ClientReplicatorModule = GetClientReplicatorModule()
		
		if ClientReplicatorModule then
			ClientReplicatorModule:RequestRCCProfilerData(GameSettings.RCCProfilerRecordFrameRate, GameSettings.RCCProfilerRecordTimeFrame)
			p1.props.dispatchSetRCCProfilerState(true)
		end
	end
	
	function p1.changeProfilerState(ClientProfilerEnabled) --[[ Line: 71 ]]
		-- upvalues: GameSettings (upval), p1 (copy)
		return function() --[[ Line: 72 ]]
			-- upvalues: GameSettings (upval), ClientProfilerEnabled (copy), p1 (upval)
			GameSettings.OnScreenProfilerEnabled = ClientProfilerEnabled
			p1:setState({ clientProfilerEnabled = ClientProfilerEnabled })
		end
	end
	
	p1.state = {
		frameRate = GameSettings.RCCProfilerRecordFrameRate,
		timeFrame = GameSettings.RCCProfilerRecordTimeFrame
	}
end

function ServerProfilerInteraface.render(p1) --[[ Line: 86 ]]
	-- upvalues: ButtonWidth (copy), RoactModule (copy), FFlagDevConsoleMicroProfilerImproveWordingModule (copy), MainWindowHeader (copy), ButtonTextSize (copy), ConstantsModule (copy), UnselectedGray1 (copy), MainWindow (copy), DevConsoleMicroProfilerFixAutoTextClear (copy), UnselectedGray (copy), SelectedBlue (copy)
	local _ = p1.props.size
	local _ = p1.props.formFactor
	local _ = p1.props.tabList
	local WaitingForRecording = p1.props.waitingForRecording
	local LastFileOutputLocation = p1.props.lastFileOutputLocation
	local _ = p1.state.utilTabHeight
	local _ = p1.state.clientProfilerEnabled
	local _UDim2 = UDim2.new(0.8, -ButtonWidth, 0, 30)
	local _ = UDim2.new(0.6, ButtonWidth, 0, 0)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 135)
	}, {
		Label = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ButtonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = if FFlagDevConsoleMicroProfilerImproveWordingModule then "Server MicroProfiler" else "ServerProfiler",
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
		LabelFPS = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ButtonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 37.5),
			Text = if FFlagDevConsoleMicroProfilerImproveWordingModule then "Frames to dump" else "Frames Per Second",
			Font = MainWindow,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray1
		}),
		FPSTextBox = RoactModule.createElement("TextBox", {
			Size = _UDim2,
			Position = UDim2.new(0.09999999999999998, ButtonWidth, 0, 37.5),
			Text = p1.state.frameRate,
			Font = MainWindow,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray1,
			BackgroundTransparency = 0,
			ClearTextOnFocus = not DevConsoleMicroProfilerFixAutoTextClear,
			[RoactModule.Event.FocusLost] = p1.onFocusLostFrameRate
		}),
		LabelTimeFrame = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ButtonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 67.5),
			Text = if FFlagDevConsoleMicroProfilerImproveWordingModule then "Seconds to delay" else "Seconds to Record",
			Font = MainWindow,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		TimeFrameTextBox = RoactModule.createElement("TextBox", {
			Size = _UDim2,
			Position = UDim2.new(0.09999999999999998, ButtonWidth, 0, 67.5),
			Text = p1.state.timeFrame,
			Font = MainWindow,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray1,
			BackgroundTransparency = 0,
			ClearTextOnFocus = not DevConsoleMicroProfilerFixAutoTextClear,
			[RoactModule.Event.FocusLost] = p1.onFocusLostTimeFrame
		}, {
			GetDumpButton = RoactModule.createElement("TextButton", {
				Size = UDim2.new(0, ButtonWidth * 0.7, 0, 30),
				Position = UDim2.new(1, -ButtonWidth * 0.7, 1, 30),
				Text = if WaitingForRecording then "Recording" else "Start Recording",
				Font = MainWindow,
				TextSize = ButtonTextSize,
				TextColor3 = ConstantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = WaitingForRecording and UnselectedGray or SelectedBlue,
				BackgroundTransparency = if WaitingForRecording then 0.3 else 0,
				AutoButtonColor = not WaitingForRecording,
				Active = not WaitingForRecording,
				[RoactModule.Event.Activated] = p1.requestRCCProfilerData
			})
		}),
		OutputPath = not WaitingForRecording and #LastFileOutputLocation > 0 and RoactModule.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 30),
			Position = UDim2.new(0, 0, 0, 97.5),
			Text = LastFileOutputLocation,
			Font = MainWindow,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 215 | Named "mapStateToProps" ]]
	return {
		waitingForRecording = p1.MicroProfiler.waitingForRecording,
		lastFileOutputLocation = p1.MicroProfiler.lastFileOutputLocation
	}
end, function(Callback) --[[ Line: 222 | Named "mapDispatchToProps" ]]
	-- upvalues: SetRCCProfilerStateModule (copy)
	return {
		dispatchSetRCCProfilerState = function(p1, p2) --[[ Line: 224 ]]
			-- upvalues: Callback (copy), SetRCCProfilerStateModule (upval)
			Callback(SetRCCProfilerStateModule(p1, p2))
		end
	}
end)(ServerProfilerInteraface)