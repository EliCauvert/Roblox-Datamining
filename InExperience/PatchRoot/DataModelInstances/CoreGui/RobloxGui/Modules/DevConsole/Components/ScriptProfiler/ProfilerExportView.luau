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

local function _(p1, p2, p3)
	local var1 = ""
	local var2 = if p1 then "client" else "server"
	local sessionStartTime = p2 and p2.SessionStartTime
	
	if sessionStartTime then
		var1 = os.date("%Y%b%d-%H%M%S-", sessionStartTime / 1000) or ""
	end
	return "scriptprofiler-" .. var7 .. var8 .. p2
end

function profilerExportView.init(_) end

function profilerExportView.didMount(p1)
	local t = {}
	local data = p1.props.client.data
	local var1 = ""
	local sessionStartTime = data and data.SessionStartTime
	
	if sessionStartTime then
		var1 = os.date("%Y%b%d-%H%M%S-", sessionStartTime / 1000) or ""
	end
	t.exportFilenameClient = "scriptprofiler-" .. var11 .. "client" .. ".json"
	local data_1 = p1.props.server.data
	local var2 = ""
	local sessionStartTime_1 = data_1 and data_1.SessionStartTime
	
	if sessionStartTime_1 then
		var2 = os.date("%Y%b%d-%H%M%S-", sessionStartTime_1 / 1000) or ""
	end
	t.exportFilenameServer = "scriptprofiler-" .. var13 .. "server" .. ".json"
	p1:setState(t)
end

function profilerExportView.didUpdate(_) end

function profilerExportView.renderExportInputAndButton(p1, p2, p3, p4)
	-- upvalues: roactModule (ref), unselectedGray (ref), buttonTextSize (ref), mainWindow (ref), constantsModule (ref), scrollingTextBoxModule (ref), mainWindowHeader (ref), scriptProfilerService (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 0,
		Size = UDim2.new(0.9, 0, 0, 30),
		Position = UDim2.new(0.05, 0, 0, 37.5),
		BackgroundColor3 = unselectedGray,
		Text = if p4 then "" else "Complete a profiling session to export data",
		TextSize = buttonTextSize,
		Font = mainWindow,
		TextColor3 = constantsModule.Color.Text
	}, if p4 then {
		InputField = roactModule.createElement(scrollingTextBoxModule, {
			ShowNativeInput = true,
			ClearTextOnFocus = false,
			PlaceholderText = "Filename for export",
			Text = p3,
			TextSize = buttonTextSize,
			Font = mainWindow,
			Size = UDim2.new(0.8, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextBoxFocusLost = function(p5, _, _)
				-- upvalues: p2 (ref), p1 (ref)
				if p2 then
					p1:setState({ exportFilenameClient = p5.text })
					
					return
				end
				p1:setState({ exportFilenameServer = p5.text })
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
			[roactModule.Event.Activated] = function()
				-- upvalues: scriptProfilerService (copy), p4 (ref), p3 (ref), p2 (ref), p1 (ref)
				local var1 = scriptProfilerService:SaveScriptProfilingData(p4, p3)
				
				if p2 then
					p1:setState({ clientSavePath = var1 })
					
					return
				end
				p1:setState({ serverSavePath = var1 })
			end
		})
	} else {})
end

function profilerExportView.renderExportSection(p1, p2, p3)
	-- upvalues: roactModule (ref), buttonWidth (ref), mainWindowHeader (ref), buttonTextSize (ref), constantsModule (ref), unselectedGray (ref)
	local exportFilenameClient, serializedData, clientSavePath
	local _ = nil
	local _ = nil
	local _ = nil
	
	if p2 then
		exportFilenameClient = p1.state.exportFilenameClient
		serializedData = p1.props.client.serializedData
		clientSavePath = p1.state.clientSavePath
	else
		exportFilenameClient = p1.state.exportFilenameServer
		serializedData = p1.props.server.serializedData
		clientSavePath = p1.state.serverSavePath
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
			Text = p3,
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
		Export = p1:renderExportInputAndButton(p2, exportFilenameClient, serializedData),
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

function profilerExportView.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = p1.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding * 2),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Row = p1:renderExportSection(true, "Client"),
		HorizontalLine = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, mainRowPadding)
		}),
		Row2 = p1:renderExportSection(false, "Server")
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		client = p1.ScriptProfiler.client,
		server = p1.ScriptProfiler.server
	}
end, nil)(profilerExportView)