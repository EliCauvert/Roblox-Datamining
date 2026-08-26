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

function devConsoleCommandLine.init(p1)
	-- upvalues: logService (ref), roactModule (ref)
	function p0.onFocusLost(p2, p3, _)
		-- upvalues: logService (copy)
		if p3 then
			logService:ExecuteScript(p2.Text)
			p2:CaptureFocus()
		end
	end
	
	p1.textbox = roactModule.createRef()
end

function devConsoleCommandLine.didMount(p1)
	-- upvalues: userInputService (ref)
	if not p1.onFocusConnection then
		p1.onFocusConnection = userInputService.InputBegan:Connect(function(p2)
			-- upvalues: p1 (ref)
			if p1.textbox.current and p1.textbox.current:IsFocused() then
				local current = p1.textbox.current
				local serverLogData = p1.props.ServerLogData
				local commandLineHistory = serverLogData:getCommandLineHistory()
				local commandLineIndex = serverLogData:getCommandLineIndex()
				
				if p2.KeyCode == Enum.KeyCode.Up then
					local minValue = math.min(commandLineHistory:getSize(), commandLineIndex + 1)
					commandLineIndex = minValue
					current.Text = commandLineHistory:reverseAt(minValue) or ""
				elseif p2.KeyCode == Enum.KeyCode.Down then
					local maxValue = math.max(0, commandLineIndex - 1)
					commandLineIndex = maxValue
					current.Text = commandLineHistory:reverseAt(maxValue) or ""
				elseif p2.KeyCode == Enum.KeyCode.Return then
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
	if not p1.fixUnwantedReturnCapture then
		p1.fixUnwantedReturnCapture = userInputService.InputEnded:Connect(function(p2)
			-- upvalues: p1 (ref)
			if p1.textbox.current and p1.textbox.current:IsFocused() and p2.KeyCode == Enum.KeyCode.Return then
				p1.textbox.current.Text = ""
			end
		end)
	end
end

function devConsoleCommandLine.willUnmount(p1)
	if p1.onFocusConnection then
		p1.onFocusConnection:Disconnect()
		p1.onFocusConnection = nil
	end
	if p1.fixUnwantedReturnCapture then
		p1.fixUnwantedReturnCapture:Disconnect()
		p1.fixUnwantedReturnCapture = nil
	end
end

function devConsoleCommandLine.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), commandLineIndent (ref), commandLine (ref), log (ref), scrollingTextBoxModule (ref)
	local height = p1.props.height
	local pos = p1.props.pos
	local var1 = ""
	local commandLineIndex = p1.props.ServerLogData:getCommandLineIndex()
	
	if commandLineIndex ~= 0 then
		var1 = p1.props.ServerLogData:getCommandLineHistory():reverseAt(commandLineIndex) or ""
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
			Text = var1,
			Font = log,
			PlaceholderText = "command line",
			[roactModule.Ref] = p1.textbox,
			TextBoxFocusLost = p1.onFocusLost
		})
	})
end

return dataConsumerModule(devConsoleCommandLine, "ServerLogData")