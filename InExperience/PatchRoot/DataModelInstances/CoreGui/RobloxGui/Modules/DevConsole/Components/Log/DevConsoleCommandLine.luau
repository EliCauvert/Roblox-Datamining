local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local logService = game:GetService("LogService")
local roactModule = require(corePackagesService.Packages.Roact)
local dataConsumerModule = require(script.Parent.Parent.DataConsumer)
local scrollingTextBoxModule = require(script.Parent.Parent.ScrollingTextBox)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local commandLineIndent = constantsModule.LogFormatting.CommandLineIndent
local commandLine = constantsModule.DefaultFontSize.CommandLine
local log = constantsModule.Font.Log
local devConsoleCommandLine = roactModule.PureComponent:extend("DevConsoleCommandLine")

function devConsoleCommandLine.init(p0) --[[ line: 17 ]]
	-- upvalues: logService (ref), roactModule (ref)
	function p0.onFocusLost(p1, p2, _) --[[ line: 18 ]]
		-- upvalues: logService (copy)
		if p2 then
			logService:ExecuteScript(p1.Text)
			p1:CaptureFocus()
		end
	end
	
	p0.textbox = roactModule.createRef()
end

function devConsoleCommandLine.didMount(p3) --[[ line: 28 ]]
	-- upvalues: userInputService (ref)
	if not p3.onFocusConnection then
		p3.onFocusConnection = userInputService.InputBegan:Connect(function(p4) --[[ line: 30 ]]
			-- upvalues: p3 (ref)
			if p3.textbox.current and p3.textbox.current:IsFocused() then
				local current = p3.textbox.current
				local serverLogData = p3.props.ServerLogData
				local commandLineHistory = serverLogData:getCommandLineHistory()
				local commandLineIndex = serverLogData:getCommandLineIndex()
				
				if p4.KeyCode == Enum.KeyCode.Up then
					local minValue = math.min(commandLineHistory:getSize(), commandLineIndex + 1)
					commandLineIndex = minValue
					current.Text = commandLineHistory:reverseAt(minValue) or ""
				elseif p4.KeyCode == Enum.KeyCode.Down then
					local maxValue = math.max(0, commandLineIndex - 1)
					commandLineIndex = maxValue
					current.Text = commandLineHistory:reverseAt(maxValue) or ""
				elseif p4.KeyCode == Enum.KeyCode.Return then
					if #current.Text:gsub("%s+", "") > 0 and commandLineHistory:reverseAt(1) ~= current.Text then
						commandLineHistory:push_back(current.Text)
					end
					commandLineIndex = 0
				elseif commandLineIndex ~= 0 then
					commandLineIndex = 0
				end
				serverLogData:setCommandLineIndex(commandLineIndex)
			end
		end)
	end
	if not p3.fixUnwantedReturnCapture then
		p3.fixUnwantedReturnCapture = userInputService.InputEnded:Connect(function(p5) --[[ line: 70 ]]
			-- upvalues: p3 (ref)
			if p3.textbox.current and p3.textbox.current:IsFocused() and p5.KeyCode == Enum.KeyCode.Return then
				p3.textbox.current.Text = ""
			end
		end)
	end
end

function devConsoleCommandLine.willUnmount(p6) --[[ line: 80 ]]
	if p6.onFocusConnection then
		p6.onFocusConnection:Disconnect()
		p6.onFocusConnection = nil
	end
	if p6.fixUnwantedReturnCapture then
		p6.fixUnwantedReturnCapture:Disconnect()
		p6.fixUnwantedReturnCapture = nil
	end
end

function devConsoleCommandLine.render(p7) --[[ line: 91 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), commandLineIndent (ref), commandLine (ref), log (ref), scrollingTextBoxModule (ref)
	local height = p7.props.height
	local pos = p7.props.pos
	local var12 = ""
	local commandLineIndex = p7.props.ServerLogData:getCommandLineIndex()
	
	if commandLineIndex ~= 0 then
		var12 = p7.props.ServerLogData:getCommandLineHistory():reverseAt(commandLineIndex) or ""
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 1,
		Position = pos,
		Size = UDim2.new(1, 0, 0, height),
		BackgroundColor3 = constantsModule.Color.TextBoxGray,
		BorderColor3 = constantsModule.Color.BorderGray
	}, {
		Arrow = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = "> ",
			Size = UDim2.new(0, commandLineIndent, 1, 0),
			TextSize = commandLine,
			Font = log,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Right
		}),
		InputField = roactModule.createElement(scrollingTextBoxModule, {
			Position = UDim2.new(0, commandLineIndent, 0, 0),
			Size = UDim2.new(1, -commandLineIndent, 0, height),
			ShowNativeInput = true,
			ClearTextOnFocus = false,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = 0,
			TextSize = commandLine,
			Text = var12,
			Font = log,
			PlaceholderText = "command line",
			[roactModule.Ref] = p7.textbox,
			TextBoxFocusLost = p7.onFocusLost
		})
	})
end

return dataConsumerModule(devConsoleCommandLine, "ServerLogData")