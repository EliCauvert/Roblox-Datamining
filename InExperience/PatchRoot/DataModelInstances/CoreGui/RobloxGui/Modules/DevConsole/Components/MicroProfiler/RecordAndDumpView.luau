local corePackagesService = game:GetService("CorePackages")
local microProfilerService = game:GetService("MicroProfilerService")
local telemetryService = game:GetService("TelemetryService")
local boxButtonModule = require(script.Parent.Parent.BoxButton)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local microProfilerPanelModule = require(script.Parent.MicroProfilerPanel)
local numberInputModule = require(script.Parent.Parent.NumberInput)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local gameSettings = UserSettings().GameSettings
local actions = script.Parent.Parent.Parent.Actions
local appendRecentDumpPathModule = require(actions.AppendRecentDumpPath)
local setRCCProfilerStateModule = require(actions.SetRCCProfilerState)
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local recordAndDumpView = roactModule.Component:extend("RecordAndDumpView")
local t = {
	eventName = "DevConsoleMpRecordAndDumpCounter",
	description = "\t\tCounter to track the action of using the Developer Console to record and save MicroProfiler\n\t\tdumps for either the client or server.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 11, 24 }
}

function recordAndDumpView.logRecordAndDumpAction(p0, p1)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogCounter(t, {
		customFields = {
			context = p1,
			secondsToDelay = p0.state[`{p1}SecondsToDelay`],
			framesToRecord = p0.state[`{p1}FramesToRecord`]
		}
	}, 1)
end

function recordAndDumpView.numericInputRow(_, p2)
	-- upvalues: roactModule (ref), constantsModule (ref), numberInputModule (ref)
	return {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 8),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 4),
			PaddingLeft = UDim.new(0, constantsModule.MicroProfilerFormatting.OptionTextPadding),
			PaddingRight = UDim.new(0, 4),
			PaddingTop = UDim.new(0, 4)
		}),
		OptionLabel = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Font = constantsModule.Font.MainWindow,
			Text = p2.Text,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = constantsModule.MicroProfilerFormatting.OptionTextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Position = UDim2.fromOffset(8, 0),
			Size = UDim2.fromScale(0, 1)
		}, {
			UIFlexItem = roactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
		}),
		NumberInput = roactModule.createElement(numberInputModule, {
			LayoutOrder = 3,
			Size = UDim2.new(0, 72, 1, 0),
			OnNumberInputChanged = p2.OnNumberInputChanged,
			Range = p2.Range,
			DefaultValue = p2.DefaultValue,
			IntegerOnly = p2.IntegerOnly
		}),
		NumberLimitsHint = roactModule.createElement("TextLabel", {
			TextSize = 12,
			TextTransparency = 0.5,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Font = constantsModule.Font.Log,
			Text = `({p2.Range.Min}-{p2.Range.Max})`,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 32, 1, 0),
			TextXAlignment = Enum.TextXAlignment.Right
		})
	}
end

function recordAndDumpView.recordAndDumpRows(p3, p4)
	-- upvalues: gameSettings (ref), roactModule (ref), boxButtonModule (ref)
	local isClient = p4.Context == "Client"
	
	return {
		p3:numericInputRow({
			Text = "Number of frames to record",
			IntegerOnly = true,
			Context = p4.Context,
			DefaultValue = if isClient then p3.state.ClientFramesToRecord else p3.state.ServerFramesToRecord,
			Range = NumberRange.new(1, 60),
			OnNumberInputChanged = function(p5)
				-- upvalues: isClient (ref), p3 (ref), gameSettings (copy)
				if isClient then
					p3:setState({ ClientFramesToRecord = p5 })
					
					return
				end
				gameSettings.RCCProfilerRecordFrameRate = p5
				p3:setState({ ServerFramesToRecord = p5 })
			end
		}),
		p3:numericInputRow({
			Text = "Seconds to delay",
			IntegerOnly = true,
			Context = p4.Context,
			DefaultValue = if isClient then p3.state.ClientSecondsToDelay else p3.state.ServerSecondsToDelay,
			Range = NumberRange.new(1, 4),
			OnNumberInputChanged = function(p6)
				-- upvalues: isClient (ref), p3 (ref), gameSettings (copy)
				if isClient then
					p3:setState({ ClientSecondsToDelay = p6 })
					
					return
				end
				gameSettings.RCCProfilerRecordTimeFrame = p6
				p3:setState({ ServerSecondsToDelay = p6 })
			end
		}),
		{
			UIPadding = roactModule.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 2),
				PaddingLeft = UDim.new(0, 2),
				PaddingRight = UDim.new(0, 2),
				PaddingTop = UDim.new(0, 2)
			}),
			Button = roactModule.createElement(boxButtonModule, {
				text = if isClient then if p3.state.IsClientRecording then p4.RecordButtonText.Recording else p4.RecordButtonText.Idle elseif p3.props.IsServerRecording then p4.RecordButtonText.Recording else p4.RecordButtonText.Idle,
				size = UDim2.fromScale(1, 1),
				pos = UDim2.new(0, 0, 0, 0),
				onClicked = p4.OnRecordButtonClicked,
				enabled = if isClient then not p3.state.IsClientRecording else not p3.props.IsServerRecording
			})
		}
	}
end

function recordAndDumpView.init(p7)
	-- upvalues: gameSettings (ref)
	p7.state = {
		IsClientRecording = false,
		ClientFramesToRecord = 32,
		ClientSecondsToDelay = 1,
		ServerFramesToRecord = gameSettings.RCCProfilerRecordFrameRate,
		ServerSecondsToDelay = gameSettings.RCCProfilerRecordTimeFrame
	}
	p7.RecordingTasks = { Client = nil }
end

function recordAndDumpView.willUnmount(p8)
	if p8.RecordingTasks.Client and coroutine.status(p8.RecordingTasks.Client) ~= "dead" then
		task.cancel(p8.RecordingTasks.Client)
	end
end

function recordAndDumpView.render(p9)
	-- upvalues: roactModule (ref), microProfilerPanelModule (ref), microProfilerService (ref), getClientReplicatorModule (ref)
	return roactModule.createElement(microProfilerPanelModule, {
		Title = "Record and dump",
		LayoutOrder = p9.props.LayoutOrder,
		Sections = {
			{
				Name = "Client",
				Rows = p9:recordAndDumpRows({
					Context = "Client",
					RecordButtonText = {
						Idle = "Begin client recording",
						Recording = "Recording client..."
					},
					OnRecordButtonClicked = function()
						-- upvalues: p9 (ref), microProfilerService (copy)
						if p9.state.IsClientRecording then
							return
						end
						p9:logRecordAndDumpAction("Client")
						p9:setState({ IsClientRecording = true })
						p9.RecordingTasks.Client = task.spawn(function()
							-- upvalues: microProfilerService (copy), p9 (copy)
							p9.props.dispatchAppendRecentDumpPath(microProfilerService:DumpToFileAsync(p9.state.ClientSecondsToDelay, p9.state.ClientFramesToRecord))
							p9:setState(function(_)
								return { IsClientRecording = false }
							end)
							p9.RecordingTasks.Client = nil
						end)
					end
				})
			},
			{
				Name = "Server",
				Rows = p9:recordAndDumpRows({
					Context = "Server",
					RecordButtonText = {
						Idle = "Begin server recording",
						Recording = "Recording server..."
					},
					OnRecordButtonClicked = function()
						-- upvalues: p9 (ref), getClientReplicatorModule (copy)
						if p9.props.IsServerRecording then return end
						local var15 = getClientReplicatorModule()
						
						if var15 then
							p9:logRecordAndDumpAction("Server")
							var15:RequestRCCProfilerData(p9.state.ServerFramesToRecord, p9.state.ServerSecondsToDelay)
							p9.props.dispatchSetRCCProfilerState(true)
							
							return
						end
					end
				})
			}
		}
	})
end

return roactRoduxModule.connect(function(p10, _)
	return {
		IsServerRecording = p10.MicroProfiler.waitingForRecording
	}
end, function(p11)
	-- upvalues: appendRecentDumpPathModule (ref), setRCCProfilerStateModule (ref)
	return {
		dispatchAppendRecentDumpPath = function(p12)
			-- upvalues: p11 (ref), appendRecentDumpPathModule (copy)
			p11(appendRecentDumpPathModule(p12))
		end,
		dispatchSetRCCProfilerState = function(value, p13)
			-- upvalues: p11 (ref), setRCCProfilerStateModule (copy)
			p11(setRCCProfilerStateModule(value, p13))
		end
	}
end)(recordAndDumpView)