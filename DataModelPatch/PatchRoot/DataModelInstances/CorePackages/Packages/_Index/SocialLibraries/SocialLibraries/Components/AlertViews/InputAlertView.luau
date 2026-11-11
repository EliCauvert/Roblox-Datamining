local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Roact = DependenciesModule.Roact
local ButtonType = DependenciesModule.UIBlox.App.Button.Enum.ButtonType
local UserInputService = DependenciesModule.UserInputService
local AlertViewBuilderModule = require(SocialLibraries.Components.AlertViewBuilder.AlertViewBuilder)
local InputAlertView = Roact.Component:extend("InputAlertView")
InputAlertView.defaultProps = {
	titleText = "TestTitle",
	cancelText = "TestCancel",
	confirmText = "TestConfirm",
	warningText = nil,
	inputText = "TestInput",
	maxCharacters = 150,
	soakAreaTransparency = 0.9,
	shouldAdjustForKeyboard = true,
	onActivated = function() end,
	onModalClose = function() end,
	screenSize = Vector2.new(0, 0),
	soakAreaColor3 = Color3.fromRGB(0, 0, 255)
}

function InputAlertView.init(p1)
	-- upvalues: Roact (copy), UserInputService (copy)
	p1.ref = Roact.createRef()
	
	function p1.onTextChanged(InputText)
		-- upvalues: p1 (copy)
		p1:setState({
			inputText = InputText,
			inputLengthExceeded = p1.props.maxCharacters < #InputText
		})
	end
	
	function p1.onButtonActivated()
		-- upvalues: p1 (copy)
		p1.closing = true
	end
	
	function p1.updateModalPosition()
		-- upvalues: p1 (copy), UserInputService (upval)
		p1:setState({
			keyboardOffset = UserInputService.OnScreenKeyboardVisible and p1.state.yPosition + p1.ref:getValue().AbsoluteSize.Y - UserInputService.OnScreenKeyboardPosition.Y or 0
		})
	end
	
	function p1.onModalStayOpen()
		-- upvalues: p1 (copy)
		p1.closing = false
		
		if p1.props.shouldAdjustForKeyboard then
			p1.updateModalPosition()
		end
	end
	
	if p1.props.shouldAdjustForKeyboard then
		p1.keyboardConnection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
			-- upvalues: p1 (copy)
			spawn(function()
				-- upvalues: p1 (upval)
				if p1.isMounted and not p1.closing then
					p1.updateModalPosition()
					
					return
				end
			end)
		end)
	end
	function p1.onPositionChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		if Frame.AbsolutePosition.Y ~= p1.state.yPosition then
			p1:setState({ yPosition = Frame.AbsolutePosition.Y })
		end
	end
	
	p1.closing = false
	p1.state = {
		inputLengthExceeded = false,
		keyboardOffset = 0,
		yPosition = 0,
		inputText = p1.props.inputText
	}
end

function InputAlertView.render(p1)
	-- upvalues: ButtonType (copy), Roact (copy), AlertViewBuilderModule (copy)
	local Props = p1.props
	local MaxCharacters = Props.maxCharacters
	
	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, -p1.state.keyboardOffset),
		Transparency = 1,
		[Roact.Change.AbsolutePosition] = p1.onPositionChanged,
		[Roact.Ref] = p1.ref
	}, {
		AlertView = Roact.createElement(AlertViewBuilderModule, {
			buttons = if Props.displayFailed then {
				{
					buttonType = ButtonType.Alert,
					props = { text = Props.failedText, onActivated = Props.onActivated }
				}
			} else {
				{
					buttonType = ButtonType.Secondary,
					props = {
						text = Props.cancelText,
						onActivated = function() end
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						text = Props.confirmText,
						isDisabled = p1.state.inputLengthExceeded,
						onActivated = Props.onActivated
					}
				}
			},
			inputLengthExceeded = p1.state.inputLengthExceeded,
			onActivated = p1.onButtonActivated,
			onModalClose = Props.onModalClose,
			onModalStayOpen = p1.onModalStayOpen,
			soakAreaColor3 = p1.props.soakAreaColor3,
			soakAreaTransparency = p1.props.soakAreaTransparency,
			textboxes = {
				InputBox = {
					LayoutOrder = 1,
					belowText = MaxCharacters and #p1.state.inputText .. "/" .. MaxCharacters,
					belowTextAlignment = Enum.TextXAlignment.Right,
					onTextChanged = p1.onTextChanged,
					PlaceholderText = Props.placeholderText,
					Text = Props.inputText,
					warningText = p1.props.warningText
				}
			},
			title = Props.titleText,
			screenSize = Props.screenSize
		})
	})
end

function InputAlertView.didMount(p1)
	p1.isMounted = true
end

function InputAlertView.willUnmount(p1)
	p1.isMounted = false
	
	if p1.keyboardConnection then
		p1.keyboardConnection:Disconnect()
		p1.keyboardConnection = nil
	end
end

return InputAlertView