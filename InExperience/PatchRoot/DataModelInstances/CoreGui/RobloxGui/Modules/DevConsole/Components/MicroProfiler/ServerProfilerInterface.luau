local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local fFlagDevConsoleMicroProfilerImproveWordingModule = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording)
local devConsoleMicroProfilerFixAutoTextClear = game:DefineFastFlag("DevConsoleMicroProfilerFixAutoTextClear", false)
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local _ = script.Parent.Parent.Parent.Components
local setRCCProfilerStateModule = require(script.Parent.Parent.Parent.Actions.SetRCCProfilerState)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local _ = constantsModule.GeneralFormatting.MainRowPadding
local buttonWidth = constantsModule.MicroProfilerFormatting.ButtonWidth
local buttonTextSize = constantsModule.MicroProfilerFormatting.ButtonTextSize
local mainWindow = constantsModule.Font.MainWindow
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local unselectedGray = constantsModule.Color.UnselectedGray
local selectedBlue = constantsModule.Color.SelectedBlue
local unselectedGray_1 = constantsModule.Color.UnselectedGray
local serverProfilerInteraface = roactModule.Component:extend("ServerProfilerInteraface")

function serverProfilerInteraface.init(p0)
	-- upvalues: gameSettings (ref), getClientReplicatorModule (ref)
	function p0.onUtilTabHeightChanged(p1)
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onFocusLostFrameRate(p2, _, _)
		-- upvalues: gameSettings (copy)
		gameSettings.RCCProfilerRecordFrameRate = p2.Text
		p2.Text = gameSettings.RCCProfilerRecordFrameRate
	end
	
	function p0.onFocusLostTimeFrame(p3, _, _)
		-- upvalues: gameSettings (copy)
		gameSettings.RCCProfilerRecordTimeFrame = p3.Text
		p3.Text = gameSettings.RCCProfilerRecordTimeFrame
	end
	
	function p0.requestRCCProfilerData(_)
		-- upvalues: getClientReplicatorModule (copy), gameSettings (copy), p0 (ref)
		local var9 = getClientReplicatorModule()
		
		if var9 then
			var9:RequestRCCProfilerData(gameSettings.RCCProfilerRecordFrameRate, gameSettings.RCCProfilerRecordTimeFrame)
			p0.props.dispatchSetRCCProfilerState(true)
		end
	end
	
	function p0.changeProfilerState(p4)
		-- upvalues: gameSettings (copy), p0 (ref)
		return function()
			-- upvalues: gameSettings (copy), p4 (ref), p0 (copy)
			gameSettings.OnScreenProfilerEnabled = p4
			p0:setState({ clientProfilerEnabled = p4 })
		end
	end
	
	p0.state = {
		frameRate = gameSettings.RCCProfilerRecordFrameRate,
		timeFrame = gameSettings.RCCProfilerRecordTimeFrame
	}
end

function serverProfilerInteraface.render(p5)
	-- upvalues: buttonWidth (ref), roactModule (ref), fFlagDevConsoleMicroProfilerImproveWordingModule (ref), mainWindowHeader (ref), buttonTextSize (ref), constantsModule (ref), unselectedGray_1 (ref), mainWindow (ref), devConsoleMicroProfilerFixAutoTextClear (ref), unselectedGray (ref), selectedBlue (ref)
	local _ = p5.props.size
	local _ = p5.props.formFactor
	local _ = p5.props.tabList
	local waitingForRecording = p5.props.waitingForRecording
	local lastFileOutputLocation = p5.props.lastFileOutputLocation
	local _ = p5.state.utilTabHeight
	local frameRate = p5.state.frameRate
	local timeFrame = p5.state.timeFrame
	local _ = p5.state.clientProfilerEnabled
	local var10 = not waitingForRecording and #lastFileOutputLocation > 0
	local uDim2 = UDim2.new(0.8, -buttonWidth, 0, 30)
	local _ = UDim2.new(0.6, buttonWidth, 0, 0)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 135)
	}, {
		Label = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = if fFlagDevConsoleMicroProfilerImproveWordingModule then "Server MicroProfiler" else "ServerProfiler",
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
		LabelFPS = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 37.5),
			Text = if fFlagDevConsoleMicroProfilerImproveWordingModule then "Frames to dump" else "Frames Per Second",
			Font = mainWindow,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray_1
		}),
		FPSTextBox = roactModule.createElement("TextBox", {
			Size = uDim2,
			Position = UDim2.new(0.1, buttonWidth, 0, 37.5),
			Text = frameRate,
			Font = mainWindow,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray_1,
			BackgroundTransparency = 0,
			ClearTextOnFocus = if devConsoleMicroProfilerFixAutoTextClear then false else true,
			[roactModule.Event.FocusLost] = p5.onFocusLostFrameRate
		}),
		LabelTimeFrame = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 67.5),
			Text = if fFlagDevConsoleMicroProfilerImproveWordingModule then "Seconds to delay" else "Seconds to Record",
			Font = mainWindow,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		TimeFrameTextBox = roactModule.createElement("TextBox", {
			Size = uDim2,
			Position = UDim2.new(0.1, buttonWidth, 0, 67.5),
			Text = timeFrame,
			Font = mainWindow,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray_1,
			BackgroundTransparency = 0,
			ClearTextOnFocus = if devConsoleMicroProfilerFixAutoTextClear then false else true,
			[roactModule.Event.FocusLost] = p5.onFocusLostTimeFrame
		}, {
			GetDumpButton = roactModule.createElement("TextButton", {
				Size = UDim2.new(0, buttonWidth * 0.7, 0, 30),
				Position = UDim2.new(1, -buttonWidth * 0.7, 1, 30),
				Text = if waitingForRecording then "Recording" else "Start Recording",
				Font = mainWindow,
				TextSize = buttonTextSize,
				TextColor3 = constantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = if waitingForRecording then unselectedGray else selectedBlue,
				BackgroundTransparency = if waitingForRecording then 0.3 else 0,
				AutoButtonColor = not waitingForRecording,
				Active = not waitingForRecording,
				[roactModule.Event.Activated] = p5.requestRCCProfilerData
			})
		}),
		OutputPath = var10 and roactModule.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 30),
			Position = UDim2.new(0, 0, 0, 97.5),
			Text = lastFileOutputLocation,
			Font = mainWindow,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _)
	return {
		waitingForRecording = p6.MicroProfiler.waitingForRecording,
		lastFileOutputLocation = p6.MicroProfiler.lastFileOutputLocation
	}
end, function(p7)
	-- upvalues: setRCCProfilerStateModule (ref)
	return {
		dispatchSetRCCProfilerState = function(value, p8)
			-- upvalues: p7 (ref), setRCCProfilerStateModule (copy)
			p7(setRCCProfilerStateModule(value, p8))
		end
	}
end)(serverProfilerInteraface)