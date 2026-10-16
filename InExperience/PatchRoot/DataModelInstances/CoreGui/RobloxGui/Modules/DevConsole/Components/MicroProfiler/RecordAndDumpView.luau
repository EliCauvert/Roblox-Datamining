local CorePackages = game:GetService("CorePackages")
local MicroProfilerService = game:GetService("MicroProfilerService")
local TelemetryService = game:GetService("TelemetryService")
local BoxButtonModule = require(script.Parent.Parent.BoxButton)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MicroProfilerPanelModule = require(script.Parent.MicroProfilerPanel)
local NumberInputModule = require(script.Parent.Parent.NumberInput)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local GameSettings = UserSettings().GameSettings
local Actions = script.Parent.Parent.Parent.Actions
local AppendRecentDumpPathModule = require(Actions.AppendRecentDumpPath)
local SetRCCProfilerStateModule = require(Actions.SetRCCProfilerState)
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local RecordAndDumpView = RoactModule.Component:extend("RecordAndDumpView")
local config = {
	eventName = "DevConsoleMpRecordAndDumpCounter",
	description = "\t\tCounter to track the action of using the Developer Console to record and save MicroProfiler\n\t\tdumps for either the client or server.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 11, 24 }
}

function RecordAndDumpView.logRecordAndDumpAction(p1, Context) --[[ Line: 41 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogCounter(config, {
		customFields = {
			context = Context,
			secondsToDelay = p1.state[`{Context}SecondsToDelay`],
			framesToRecord = p1.state[`{Context}FramesToRecord`]
		}
	}, 1)
end

function RecordAndDumpView:numericInputRow(p1) --[[ Line: 51 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), NumberInputModule (copy)
	return {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 8),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 4),
			PaddingLeft = UDim.new(0, ConstantsModule.MicroProfilerFormatting.OptionTextPadding),
			PaddingRight = UDim.new(0, 4),
			PaddingTop = UDim.new(0, 4)
		}),
		OptionLabel = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Font = ConstantsModule.Font.MainWindow,
			Text = p1.Text,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = ConstantsModule.MicroProfilerFormatting.OptionTextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Position = UDim2.fromOffset(8, 0),
			Size = UDim2.fromScale(0, 1)
		}, {
			UIFlexItem = RoactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
		}),
		NumberInput = RoactModule.createElement(NumberInputModule, {
			LayoutOrder = 3,
			Size = UDim2.new(0, 72, 1, 0),
			OnNumberInputChanged = p1.OnNumberInputChanged,
			Range = p1.Range,
			DefaultValue = p1.DefaultValue,
			IntegerOnly = p1.IntegerOnly
		}),
		NumberLimitsHint = RoactModule.createElement("TextLabel", {
			TextSize = 12,
			TextTransparency = 0.5,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Font = ConstantsModule.Font.Log,
			Text = `({p1.Range.Min}-{p1.Range.Max})`,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 32, 1, 0),
			TextXAlignment = Enum.TextXAlignment.Right
		})
	}
end

function RecordAndDumpView.recordAndDumpRows(p1, p2) --[[ Line: 104 ]]
	-- upvalues: GameSettings (copy), RoactModule (copy), BoxButtonModule (copy)
	local IsClient = p2.Context == "Client"
	
	return {
		p1:numericInputRow({
			Text = "Number of frames to record",
			IntegerOnly = true,
			Context = p2.Context,
			DefaultValue = if IsClient then p1.state.ClientFramesToRecord else p1.state.ServerFramesToRecord,
			Range = NumberRange.new(1, 60),
			OnNumberInputChanged = function(ClientFramesToRecord) --[[ Line: 114 ]]
				-- upvalues: IsClient (copy), p1 (copy), GameSettings (upval)
				if IsClient then
					p1:setState({ ClientFramesToRecord = ClientFramesToRecord })
					
					return
				else
					GameSettings.RCCProfilerRecordFrameRate = ClientFramesToRecord
					p1:setState({ ServerFramesToRecord = ClientFramesToRecord })
				end
			end
		}),
		p1:numericInputRow({
			Text = "Seconds to delay",
			IntegerOnly = true,
			Context = p2.Context,
			DefaultValue = if IsClient then p1.state.ClientSecondsToDelay else p1.state.ServerSecondsToDelay,
			Range = NumberRange.new(1, 4),
			OnNumberInputChanged = function(ClientSecondsToDelay) --[[ Line: 133 ]]
				-- upvalues: IsClient (copy), p1 (copy), GameSettings (upval)
				if IsClient then
					p1:setState({ ClientSecondsToDelay = ClientSecondsToDelay })
					
					return
				else
					GameSettings.RCCProfilerRecordTimeFrame = ClientSecondsToDelay
					p1:setState({ ServerSecondsToDelay = ClientSecondsToDelay })
				end
			end
		}),
		{
			UIPadding = RoactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 2),
				PaddingLeft = UDim.new(0, 2),
				PaddingRight = UDim.new(0, 2),
				PaddingTop = UDim.new(0, 2)
			}),
			Button = RoactModule.createElement(BoxButtonModule, {
				text = if IsClient then if p1.state.IsClientRecording then p2.RecordButtonText.Recording else p2.RecordButtonText.Idle elseif p1.props.IsServerRecording then p2.RecordButtonText.Recording else p2.RecordButtonText.Idle,
				size = UDim2.fromScale(1, 1),
				pos = UDim2.new(0, 0, 0, 0),
				onClicked = p2.OnRecordButtonClicked,
				enabled = if IsClient then not p1.state.IsClientRecording else not p1.props.IsServerRecording
			})
		}
	}
end

function RecordAndDumpView.init(p1) --[[ Line: 170 ]]
	-- upvalues: GameSettings (copy)
	p1.state = {
		IsClientRecording = false,
		ClientFramesToRecord = 32,
		ClientSecondsToDelay = 1,
		ServerFramesToRecord = GameSettings.RCCProfilerRecordFrameRate,
		ServerSecondsToDelay = GameSettings.RCCProfilerRecordTimeFrame
	}
	p1.RecordingTasks = { Client = nil }
end

function RecordAndDumpView.willUnmount(p1) --[[ Line: 187 ]]
	if p1.RecordingTasks.Client and coroutine.status(p1.RecordingTasks.Client) ~= "dead" then
		task.cancel(p1.RecordingTasks.Client)
	end
end

function RecordAndDumpView.render(p1) --[[ Line: 193 ]]
	-- upvalues: RoactModule (copy), MicroProfilerPanelModule (copy), MicroProfilerService (copy), GetClientReplicatorModule (copy)
	return RoactModule.createElement(MicroProfilerPanelModule, {
		Title = "Record and dump",
		LayoutOrder = p1.props.LayoutOrder,
		Sections = {
			{
				Name = "Client",
				Rows = p1:recordAndDumpRows({
					Context = "Client",
					RecordButtonText = {
						Idle = "Begin client recording",
						Recording = "Recording client..."
					},
					OnRecordButtonClicked = function() --[[ Line: 203 ]]
						-- upvalues: p1 (copy), MicroProfilerService (upval)
						if not p1.state.IsClientRecording then
							p1:logRecordAndDumpAction("Client")
							p1:setState({ IsClientRecording = true })
							p1.RecordingTasks.Client = task.spawn(function() --[[ Line: 211 ]]
								-- upvalues: MicroProfilerService (upval), p1 (upval)
								p1.props.dispatchAppendRecentDumpPath((MicroProfilerService:DumpToFileAsync(p1.state.ClientSecondsToDelay, p1.state.ClientFramesToRecord)))
								p1:setState(function(_) --[[ Line: 219 ]]
									return { IsClientRecording = false }
								end)
								p1.RecordingTasks.Client = nil
							end)
							
							return
						end
					end
				})
			},
			{
				Name = "Server",
				Rows = p1:recordAndDumpRows({
					Context = "Server",
					RecordButtonText = {
						Idle = "Begin server recording",
						Recording = "Recording server..."
					},
					OnRecordButtonClicked = function() --[[ Line: 235 ]]
						-- upvalues: p1 (copy), GetClientReplicatorModule (upval)
						if p1.props.IsServerRecording then return end
						local ClientReplicatorModule = GetClientReplicatorModule()
						
						if ClientReplicatorModule then
							p1:logRecordAndDumpAction("Server")
							ClientReplicatorModule:RequestRCCProfilerData(p1.state.ServerFramesToRecord, p1.state.ServerSecondsToDelay)
							p1.props.dispatchSetRCCProfilerState(true)
							
							return
						end
					end
				})
			}
		}
	})
end

return RoactRoduxModule.connect(function(p1, _) --[[ Line: 260 | Named "mapStateToProps" ]]
	return {
		IsServerRecording = p1.MicroProfiler.waitingForRecording
	}
end, function(Callback) --[[ Line: 266 | Named "mapDispatchToProps" ]]
	-- upvalues: AppendRecentDumpPathModule (copy), SetRCCProfilerStateModule (copy)
	return {
		dispatchAppendRecentDumpPath = function(p1) --[[ Line: 268 ]]
			-- upvalues: Callback (copy), AppendRecentDumpPathModule (upval)
			Callback(AppendRecentDumpPathModule(p1))
		end,
		dispatchSetRCCProfilerState = function(p1, p2) --[[ Line: 271 ]]
			-- upvalues: Callback (copy), SetRCCProfilerStateModule (upval)
			Callback(SetRCCProfilerStateModule(p1, p2))
		end
	}
end)(RecordAndDumpView)