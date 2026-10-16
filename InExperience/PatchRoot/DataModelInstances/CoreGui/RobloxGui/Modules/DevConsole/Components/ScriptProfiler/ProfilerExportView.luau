local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = game:GetService("ScriptContext")
local ScriptProfilerService = game:GetService("ScriptProfilerService")
local _ = require(script.Parent.ProfilerDataFormatV2)
local ScrollingTextBoxModule = require(script.Parent.Parent.Parent.Components.ScrollingTextBox)
local _ = script.Parent.Parent.Parent.Actions
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local MainWindow = ConstantsModule.Font.MainWindow
local ButtonTextSize = ConstantsModule.MicroProfilerFormatting.ButtonTextSize
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local ButtonWidth = ConstantsModule.MicroProfilerFormatting.ButtonWidth
local ProfilerExportView = RoactModule.PureComponent:extend("ProfilerExportView")

local function _(p1, p2, Text): string --[[ Line: 31 | Named "generateDefaultExportName" ]]
	local DateInfo = ""
	local Client: string = if p1 then "client" else "server"
	local SessionStartTime = p2 and p2.SessionStartTime
	
	if SessionStartTime then
		DateInfo = os.date("%Y%b%d-%H%M%S-", SessionStartTime / 1000) or ""
	end
	return "scriptprofiler-" .. DateInfo .. Client .. Text
end

function ProfilerExportView:init() --[[ Line: 45 ]] end

function ProfilerExportView.didMount(p1) --[[ Line: 47 ]]
	local t = {}
	local Data = p1.props.client.data
	local DateInfo = ""
	local SessionStartTime = Data and Data.SessionStartTime
	
	if SessionStartTime then
		DateInfo = os.date("%Y%b%d-%H%M%S-", SessionStartTime / 1000) or ""
	end
	t.exportFilenameClient = "scriptprofiler-" .. DateInfo .. "client" .. ".json"
	local Data1 = p1.props.server.data
	local DateInfo1 = ""
	local SessionStartTime1 = Data1 and Data1.SessionStartTime
	
	if SessionStartTime1 then
		DateInfo1 = os.date("%Y%b%d-%H%M%S-", SessionStartTime1 / 1000) or ""
	end
	t.exportFilenameServer = "scriptprofiler-" .. DateInfo1 .. "server" .. ".json"
	p1:setState(t)
end

function ProfilerExportView:didUpdate() --[[ Line: 54 ]] end

function ProfilerExportView.renderExportInputAndButton(p1, p2, Text, SerializedData) --[[ Line: 56 ]]
	-- upvalues: RoactModule (copy), UnselectedGray (copy), ButtonTextSize (copy), MainWindow (copy), ConstantsModule (copy), ScrollingTextBoxModule (copy), MainWindowHeader (copy), ScriptProfilerService (copy)
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 0,
		Size = UDim2.new(0.9, 0, 0, 30),
		Position = UDim2.new(0.05, 0, 0, 37.5),
		BackgroundColor3 = UnselectedGray,
		Text = if SerializedData then "" else "Complete a profiling session to export data",
		TextSize = ButtonTextSize,
		Font = MainWindow,
		TextColor3 = ConstantsModule.Color.Text
	}, if SerializedData then {
		InputField = RoactModule.createElement(ScrollingTextBoxModule, {
			ShowNativeInput = true,
			ClearTextOnFocus = false,
			PlaceholderText = "Filename for export",
			Text = Text,
			TextSize = ButtonTextSize,
			Font = MainWindow,
			Size = UDim2.new(0.8, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextBoxFocusLost = function(p3, _, _) --[[ Line: 86 ]]
				-- upvalues: p2 (copy), p1 (copy)
				if p2 then
					p1:setState({ exportFilenameClient = p3.text })
					
					return
				else
					p1:setState({ exportFilenameServer = p3.text })
				end
			end
		}),
		ExportButton = RoactModule.createElement("TextButton", {
			Size = UDim2.new(0.2, 0, 1, 0),
			Position = UDim2.new(0.8, 0, 0, 0),
			Text = "Export",
			Font = MainWindowHeader,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray,
			[RoactModule.Event.Activated] = function() --[[ Line: 110 ]]
				-- upvalues: ScriptProfilerService (upval), SerializedData (copy), Text (copy), p2 (copy), p1 (copy)
				local SaveScriptProfilingDataResult = ScriptProfilerService:SaveScriptProfilingData(SerializedData, Text)
				
				if p2 then
					p1:setState({ clientSavePath = SaveScriptProfilingDataResult })
					
					return
				else
					p1:setState({ serverSavePath = SaveScriptProfilingDataResult })
				end
			end
		})
	} else {})
end

function ProfilerExportView.renderExportSection(p1, p2, Text) --[[ Line: 129 ]]
	-- upvalues: RoactModule (copy), ButtonWidth (copy), MainWindowHeader (copy), ButtonTextSize (copy), ConstantsModule (copy), UnselectedGray (copy)
	local ExportFilenameClient = nil
	local SerializedData = nil
	local ClientSavePath = nil
	if p2 then
		ExportFilenameClient = p1.state.exportFilenameClient
		SerializedData = p1.props.client.serializedData
		ClientSavePath = p1.state.clientSavePath
	else
		ExportFilenameClient = p1.state.exportFilenameServer
		SerializedData = p1.props.server.serializedData
		ClientSavePath = p1.state.serverSavePath
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 90)
	}, {
		Label = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ButtonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = Text,
			Font = MainWindowHeader,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray
		}),
		HorizontalLine = RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, 30)
		}),
		Export = p1:renderExportInputAndButton(p2, ExportFilenameClient, SerializedData),
		SavedPath = if ClientSavePath then RoactModule.createElement("TextBox", {
			BackgroundTransparency = 1,
			TextEditable = false,
			ClearTextOnFocus = false,
			Size = UDim2.new(0.95, 0, 0, 30),
			Position = UDim2.new(0.05, 0, 0, 75),
			Text = "Saved to " .. ClientSavePath,
			Font = MainWindowHeader,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray
		}) else nil
	})
end

function ProfilerExportView.render(p1) --[[ Line: 188 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = p1.props.size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, MainRowPadding * 2),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Row = p1:renderExportSection(true, "Client"),
		HorizontalLine = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, MainRowPadding)
		}),
		Row2 = p1:renderExportSection(false, "Server")
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 212 | Named "mapStateToProps" ]]
	return {
		client = p1.ScriptProfiler.client,
		server = p1.ScriptProfiler.server
	}
end, nil)(ProfilerExportView)