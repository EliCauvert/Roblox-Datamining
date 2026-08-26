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

function recordAndDumpView.logRecordAndDumpAction(p1, p2)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogCounter(t, {
		customFields = {
			context = p2,
			secondsToDelay = p1.state[`{p2}SecondsToDelay`],
			framesToRecord = p1.state[`{p2}FramesToRecord`]
		}
	}, 1)
end

function recordAndDumpView.numericInputRow(_, p1)
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
			Text = p1.Text,
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
			OnNumberInputChanged = p1.OnNumberInputChanged,
			Range = p1.Range,
			DefaultValue = p1.DefaultValue,
			IntegerOnly = p1.IntegerOnly
		}),
		NumberLimitsHint = roactModule.createElement("TextLabel", {
			TextSize = 12,
			TextTransparency = 0.5,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			Font = constantsModule.Font.Log,
			Text = `({p1.Range.Min}-{p1.Range.Max})`,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 32, 1, 0),
			TextXAlignment = Enum.TextXAlignment.Right
		})
	}
end

function recordAndDumpView.recordAndDumpRows(p1, p2)
	-- upvalues: gameSettings (ref), roactModule (ref), boxButtonModule (ref)
	local isClient = p2.Context == "Client"
	
	return {
		p1:numericInputRow({
			Text = "Number of frames to record",
			IntegerOnly = true,
			Context = p2.Context,
			DefaultValue = if isClient then p1.state.ClientFramesToRecord else p1.state.ServerFramesToRecord,
			Range = NumberRange.new(1, 60),
			OnNumberInputChanged = function(p3)
				-- upvalues: isClient (ref), p1 (ref), gameSettings (copy)
				if isClient then
					p1:setState({ ClientFramesToRecord = p3 })
					
					return
				end
				gameSettings.RCCProfilerRecordFrameRate = p3
				p1:setState({ ServerFramesToRecord = p3 })
			end
		}),
		p1:numericInputRow({
			Text = "Seconds to delay",
			IntegerOnly = true,
			Context = p2.Context,
			DefaultValue = if isClient then p1.state.ClientSecondsToDelay else p1.state.ServerSecondsToDelay,
			Range = NumberRange.new(1, 4),
			OnNumberInputChanged = function(p3)
				-- upvalues: isClient (ref), p1 (ref), gameSettings (copy)
				if isClient then
					p1:setState({ ClientSecondsToDelay = p3 })
					
					return
				end
				gameSettings.RCCProfilerRecordTimeFrame = p3
				p1:setState({ ServerSecondsToDelay = p3 })
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
				text = if isClient then if p1.state.IsClientRecording then p2.RecordButtonText.Recording else p2.RecordButtonText.Idle elseif p1.props.IsServerRecording then p2.RecordButtonText.Recording else p2.RecordButtonText.Idle,
				size = UDim2.fromScale(1, 1),
				pos = UDim2.new(0, 0, 0, 0),
				onClicked = p2.OnRecordButtonClicked,
				enabled = if isClient then not p1.state.IsClientRecording else not p1.props.IsServerRecording
			})
		}
	}
end

function recordAndDumpView.init(p1)
	-- upvalues: gameSettings (ref)
	p1.state = {
		IsClientRecording = false,
		ClientFramesToRecord = 32,
		ClientSecondsToDelay = 1,
		ServerFramesToRecord = gameSettings.RCCProfilerRecordFrameRate,
		ServerSecondsToDelay = gameSettings.RCCProfilerRecordTimeFrame
	}
	p1.RecordingTasks = { Client = nil }
end

function recordAndDumpView.willUnmount(p1)
	if p1.RecordingTasks.Client and coroutine.status(p1.RecordingTasks.Client) ~= "dead" then
		task.cancel(p1.RecordingTasks.Client)
	end
end

function recordAndDumpView.render(p1)
	-- upvalues: roactModule (ref), microProfilerPanelModule (ref), microProfilerService (ref), getClientReplicatorModule (ref)
	return roactModule.createElement(microProfilerPanelModule, {
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
					OnRecordButtonClicked = function()
						-- upvalues: p1 (ref), microProfilerService (copy)
						if p1.state.IsClientRecording then
							return
						end
						p1:logRecordAndDumpAction("Client")
						p1:setState({ IsClientRecording = true })
						p1.RecordingTasks.Client = task.spawn(function()
							-- upvalues: microProfilerService (copy), p1 (copy)
							p1.props.dispatchAppendRecentDumpPath(microProfilerService:DumpToFileAsync(p1.state.ClientSecondsToDelay, p1.state.ClientFramesToRecord))
							p1:setState(function(_)
								return { IsClientRecording = false }
							end)
							p1.RecordingTasks.Client = nil
						end)
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
					OnRecordButtonClicked = function()
						-- upvalues: p1 (ref), getClientReplicatorModule (copy)
						if p1.props.IsServerRecording then return end
						local var1 = getClientReplicatorModule()
						
						if var1 then
							p1:logRecordAndDumpAction("Server")
							var1:RequestRCCProfilerData(p1.state.ServerFramesToRecord, p1.state.ServerSecondsToDelay)
							p1.props.dispatchSetRCCProfilerState(true)
							
							return
						end
					end
				})
			}
		}
	})
end

return roactRoduxModule.connect(function(p1, _)
	return {
		IsServerRecording = p1.MicroProfiler.waitingForRecording
	}
end, function(p1)
	-- upvalues: appendRecentDumpPathModule (ref), setRCCProfilerStateModule (ref)
	return {
		dispatchAppendRecentDumpPath = function(p2)
			-- upvalues: p1 (ref), appendRecentDumpPathModule (copy)
			p1(appendRecentDumpPathModule(p2))
		end,
		dispatchSetRCCProfilerState = function(value, p2)
			-- upvalues: p1 (ref), setRCCProfilerStateModule (copy)
			p1(setRCCProfilerStateModule(value, p2))
		end
	}
end)(recordAndDumpView)