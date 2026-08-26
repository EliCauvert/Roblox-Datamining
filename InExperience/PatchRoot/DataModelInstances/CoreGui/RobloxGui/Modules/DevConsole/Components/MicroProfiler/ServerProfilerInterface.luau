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

function serverProfilerInteraface.init(p1)
	-- upvalues: gameSettings (ref), getClientReplicatorModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onFocusLostFrameRate(p2, _, _)
		-- upvalues: gameSettings (copy)
		gameSettings.RCCProfilerRecordFrameRate = p2.Text
		p2.Text = gameSettings.RCCProfilerRecordFrameRate
	end
	
	function p0.onFocusLostTimeFrame(p2, _, _)
		-- upvalues: gameSettings (copy)
		gameSettings.RCCProfilerRecordTimeFrame = p2.Text
		p2.Text = gameSettings.RCCProfilerRecordTimeFrame
	end
	
	function p0.requestRCCProfilerData(_)
		-- upvalues: getClientReplicatorModule (copy), gameSettings (copy), p1 (ref)
		local var1 = getClientReplicatorModule()
		
		if var1 then
			var1:RequestRCCProfilerData(gameSettings.RCCProfilerRecordFrameRate, gameSettings.RCCProfilerRecordTimeFrame)
			p1.props.dispatchSetRCCProfilerState(true)
		end
	end
	
	function p0.changeProfilerState(p2)
		-- upvalues: gameSettings (copy), p1 (ref)
		return function()
			-- upvalues: gameSettings (copy), p2 (ref), p1 (copy)
			gameSettings.OnScreenProfilerEnabled = p2
			p1:setState({ clientProfilerEnabled = p2 })
		end
	end
	
	p1.state = {
		frameRate = gameSettings.RCCProfilerRecordFrameRate,
		timeFrame = gameSettings.RCCProfilerRecordTimeFrame
	}
end

function serverProfilerInteraface.render(p1)
	-- upvalues: buttonWidth (ref), roactModule (ref), fFlagDevConsoleMicroProfilerImproveWordingModule (ref), mainWindowHeader (ref), buttonTextSize (ref), constantsModule (ref), unselectedGray_1 (ref), mainWindow (ref), devConsoleMicroProfilerFixAutoTextClear (ref), unselectedGray (ref), selectedBlue (ref)
	local _ = p1.props.size
	local _ = p1.props.formFactor
	local _ = p1.props.tabList
	local waitingForRecording = p1.props.waitingForRecording
	local lastFileOutputLocation = p1.props.lastFileOutputLocation
	local _ = p1.state.utilTabHeight
	local frameRate = p1.state.frameRate
	local timeFrame = p1.state.timeFrame
	local _ = p1.state.clientProfilerEnabled
	local var1 = not waitingForRecording and #lastFileOutputLocation > 0
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
			[roactModule.Event.FocusLost] = p1.onFocusLostFrameRate
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
			[roactModule.Event.FocusLost] = p1.onFocusLostTimeFrame
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
				[roactModule.Event.Activated] = p1.requestRCCProfilerData
			})
		}),
		OutputPath = var1 and roactModule.createElement("TextLabel", {
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

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		waitingForRecording = p1.MicroProfiler.waitingForRecording,
		lastFileOutputLocation = p1.MicroProfiler.lastFileOutputLocation
	}
end, function(p1)
	-- upvalues: setRCCProfilerStateModule (ref)
	return {
		dispatchSetRCCProfilerState = function(value, p2)
			-- upvalues: p1 (ref), setRCCProfilerStateModule (copy)
			p1(setRCCProfilerStateModule(value, p2))
		end
	}
end)(serverProfilerInteraface)