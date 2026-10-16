local UserInputService = game:GetService("UserInputService")
local LogService = game:GetService("LogService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local DataConsumerModule = require(script.Parent.Parent.DataConsumer)
local ScrollingTextBoxModule = require(script.Parent.Parent.ScrollingTextBox)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local CommandLineIndent = ConstantsModule.LogFormatting.CommandLineIndent
local CommandLine = ConstantsModule.DefaultFontSize.CommandLine
local Log = ConstantsModule.Font.Log
local DevConsoleCommandLine = RoactModule.PureComponent:extend("DevConsoleCommandLine")

function DevConsoleCommandLine.init(p1) --[[ Line: 17 ]]
	-- upvalues: LogService (copy), RoactModule (copy)
	function p1.onFocusLost(TextBox, p2, _) --[[ Line: 18 ]]
		-- upvalues: LogService (upval)
		if p2 then
			LogService:ExecuteScript(TextBox.Text)
			TextBox:CaptureFocus()
		end
	end
	
	p1.textbox = RoactModule.createRef()
end

function DevConsoleCommandLine.didMount(p1) --[[ Line: 28 ]]
	-- upvalues: UserInputService (copy)
	if not p1.onFocusConnection then
		p1.onFocusConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 30 ]]
			-- upvalues: p1 (copy)
			if p1.textbox.current and p1.textbox.current:IsFocused() then
				local Current = p1.textbox.current
				local ServerLogData = p1.props.ServerLogData
				local CommandLineHistory = ServerLogData:getCommandLineHistory()
				local CommandLineIndex = ServerLogData:getCommandLineIndex()
				
				if Input.KeyCode == Enum.KeyCode.Up then
					local Smallest = math.min(CommandLineHistory:getSize(), CommandLineIndex + 1)
					CommandLineIndex = Smallest
					Current.Text = CommandLineHistory:reverseAt(Smallest) or ""
				elseif Input.KeyCode == Enum.KeyCode.Down then
					local Largest = math.max(0, CommandLineIndex - 1)
					CommandLineIndex = Largest
					Current.Text = CommandLineHistory:reverseAt(Largest) or ""
				elseif Input.KeyCode == Enum.KeyCode.Return then
					if #Current.Text:gsub("%s+", "") > 0 and CommandLineHistory:reverseAt(1) ~= Current.Text then
						CommandLineHistory:push_back(Current.Text)
					end
					CommandLineIndex = 0
				elseif CommandLineIndex ~= 0 then
					CommandLineIndex = 0
				end
				ServerLogData:setCommandLineIndex(CommandLineIndex)
			end
		end)
	end
	if not p1.fixUnwantedReturnCapture then
		p1.fixUnwantedReturnCapture = UserInputService.InputEnded:Connect(function(Input) --[[ Line: 70 ]]
			-- upvalues: p1 (copy)
			if p1.textbox.current and p1.textbox.current:IsFocused() and Input.KeyCode == Enum.KeyCode.Return then
				p1.textbox.current.Text = ""
			end
		end)
	end
end

function DevConsoleCommandLine.willUnmount(p1) --[[ Line: 80 ]]
	if p1.onFocusConnection then
		p1.onFocusConnection:Disconnect()
		p1.onFocusConnection = nil
	end
	if p1.fixUnwantedReturnCapture then
		p1.fixUnwantedReturnCapture:Disconnect()
		p1.fixUnwantedReturnCapture = nil
	end
end

function DevConsoleCommandLine.render(p1) --[[ Line: 91 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), CommandLineIndent (copy), CommandLine (copy), Log (copy), ScrollingTextBoxModule (copy)
	local Height = p1.props.height
	local Pos = p1.props.pos
	local ReverseAtResult = ""
	local CommandLineIndex = p1.props.ServerLogData:getCommandLineIndex()
	
	if CommandLineIndex ~= 0 then
		ReverseAtResult = p1.props.ServerLogData:getCommandLineHistory():reverseAt(CommandLineIndex) or ""
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 1,
		Position = Pos,
		Size = UDim2.new(1, 0, 0, Height),
		BackgroundColor3 = ConstantsModule.Color.TextBoxGray,
		BorderColor3 = ConstantsModule.Color.BorderGray
	}, {
		Arrow = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = "> ",
			Size = UDim2.new(0, CommandLineIndent, 1, 0),
			TextSize = CommandLine,
			Font = Log,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Right
		}),
		InputField = RoactModule.createElement(ScrollingTextBoxModule, {
			Position = UDim2.new(0, CommandLineIndent, 0, 0),
			Size = UDim2.new(1, -CommandLineIndent, 0, Height),
			ShowNativeInput = true,
			ClearTextOnFocus = false,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = 0,
			TextSize = CommandLine,
			Text = ReverseAtResult,
			Font = Log,
			PlaceholderText = "command line",
			[RoactModule.Ref] = p1.textbox,
			TextBoxFocusLost = p1.onFocusLost
		})
	})
end

return DataConsumerModule(DevConsoleCommandLine, "ServerLogData")