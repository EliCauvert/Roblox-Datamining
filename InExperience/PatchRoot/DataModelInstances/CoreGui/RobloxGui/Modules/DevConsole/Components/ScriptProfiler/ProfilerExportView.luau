local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local _ = game:GetService("ScriptContext")
local scriptProfilerService = game:GetService("ScriptProfilerService")
local _ = require(script.Parent.ProfilerDataFormatV2)
local scrollingTextBoxModule = require(script.Parent.Parent.Parent.Components.ScrollingTextBox)
local _ = script.Parent.Parent.Parent.Actions
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local mainWindow = constantsModule.Font.MainWindow
local buttonTextSize = constantsModule.MicroProfilerFormatting.ButtonTextSize
local unselectedGray = constantsModule.Color.UnselectedGray
local buttonWidth = constantsModule.MicroProfilerFormatting.ButtonWidth
local profilerExportView = roactModule.PureComponent:extend("ProfilerExportView")

local function _(p0, p1, p2) --[[ line: 31 | named "generateDefaultExportName" ]]
	local var7 = ""
	local var8 = if p0 then "client" else "server"
	local sessionStartTime = p1 and p1.SessionStartTime
	
	if sessionStartTime then
		var7 = os.date("%Y%b%d-%H%M%S-", sessionStartTime / 1000) or ""
	end
	return "scriptprofiler-" .. var7 .. var8 .. p2
end

function profilerExportView.init(_) --[[ line: 45 ]] end

function profilerExportView.didMount(p3) --[[ line: 47 ]]
	local t = {}
	local data = p3.props.client.data
	local var11 = ""
	local sessionStartTime = data and data.SessionStartTime
	
	if sessionStartTime then
		var11 = os.date("%Y%b%d-%H%M%S-", sessionStartTime / 1000) or ""
	end
	t.exportFilenameClient = "scriptprofiler-" .. var11 .. "client" .. ".json"
	local data_1 = p3.props.server.data
	local var13 = ""
	local sessionStartTime_1 = data_1 and data_1.SessionStartTime
	
	if sessionStartTime_1 then
		var13 = os.date("%Y%b%d-%H%M%S-", sessionStartTime_1 / 1000) or ""
	end
	t.exportFilenameServer = "scriptprofiler-" .. var13 .. "server" .. ".json"
	p3:setState(t)
end

function profilerExportView.didUpdate(_) --[[ line: 54 ]] end

function profilerExportView.renderExportInputAndButton(p4, p5, p6, p7) --[[ line: 56 ]]
	-- upvalues: roactModule (ref), unselectedGray (ref), buttonTextSize (ref), mainWindow (ref), constantsModule (ref), scrollingTextBoxModule (ref), mainWindowHeader (ref), scriptProfilerService (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 0,
		Size = UDim2.new(0.9, 0, 0, 30),
		Position = UDim2.new(0.05, 0, 0, 37.5),
		BackgroundColor3 = unselectedGray,
		Text = if p7 then "" else "Complete a profiling session to export data",
		TextSize = buttonTextSize,
		Font = mainWindow,
		TextColor3 = constantsModule.Color.Text
	}, if p7 then {
		InputField = roactModule.createElement(scrollingTextBoxModule, {
			ShowNativeInput = true,
			ClearTextOnFocus = false,
			PlaceholderText = "Filename for export",
			Text = p6,
			TextSize = buttonTextSize,
			Font = mainWindow,
			Size = UDim2.new(0.8, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextBoxFocusLost = function(p8, _, _) --[[ line: 86 ]]
				-- upvalues: p5 (ref), p4 (ref)
				if p5 then
					p4:setState({ exportFilenameClient = p8.text })
					
					return
				end
				p4:setState({ exportFilenameServer = p8.text })
			end
		}),
		ExportButton = roactModule.createElement("TextButton", {
			Size = UDim2.new(0.2, 0, 1, 0),
			Position = UDim2.new(0.8, 0, 0, 0),
			Text = "Export",
			Font = mainWindowHeader,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray,
			[roactModule.Event.Activated] = function() --[[ line: 110 ]]
				-- upvalues: scriptProfilerService (copy), p7 (ref), p6 (ref), p5 (ref), p4 (ref)
				local var15 = scriptProfilerService:SaveScriptProfilingData(p7, p6)
				
				if p5 then
					p4:setState({ clientSavePath = var15 })
					
					return
				end
				p4:setState({ serverSavePath = var15 })
			end
		})
	} else {})
end

function profilerExportView.renderExportSection(p9, p10, p11) --[[ line: 129 ]]
	-- upvalues: roactModule (ref), buttonWidth (ref), mainWindowHeader (ref), buttonTextSize (ref), constantsModule (ref), unselectedGray (ref)
	local exportFilenameClient, serializedData, clientSavePath
	local _ = nil
	local _ = nil
	local _ = nil
	
	if p10 then
		exportFilenameClient = p9.state.exportFilenameClient
		serializedData = p9.props.client.serializedData
		clientSavePath = p9.state.clientSavePath
	else
		exportFilenameClient = p9.state.exportFilenameServer
		serializedData = p9.props.server.serializedData
		clientSavePath = p9.state.serverSavePath
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 90)
	}, {
		Label = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth, 0, 30),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = p11,
			Font = mainWindowHeader,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray
		}),
		HorizontalLine = roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, 30)
		}),
		Export = p9:renderExportInputAndButton(p10, exportFilenameClient, serializedData),
		SavedPath = if not clientSavePath then nil else roactModule.createElement("TextBox", {
			BackgroundTransparency = 1,
			TextEditable = false,
			ClearTextOnFocus = false,
			Size = UDim2.new(0.95, 0, 0, 30),
			Position = UDim2.new(0.05, 0, 0, 75),
			Text = "Saved to " .. clientSavePath,
			Font = mainWindowHeader,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray
		})
	})
end

function profilerExportView.render(p12) --[[ line: 188 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = p12.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding * 2),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Row = p12:renderExportSection(true, "Client"),
		HorizontalLine = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, mainRowPadding)
		}),
		Row2 = p12:renderExportSection(false, "Server")
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p13, _) --[[ line: 212 | named "mapStateToProps" ]]
	return {
		client = p13.ScriptProfiler.client,
		server = p13.ScriptProfiler.server
	}
end, nil)(profilerExportView)