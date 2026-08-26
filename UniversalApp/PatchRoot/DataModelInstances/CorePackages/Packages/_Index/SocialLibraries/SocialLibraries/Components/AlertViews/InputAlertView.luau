local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local roact = dependenciesModule.Roact
local buttonType = dependenciesModule.UIBlox.App.Button.Enum.ButtonType
local userInputService = dependenciesModule.UserInputService
local alertViewBuilderModule = require(socialLibraries.Components.AlertViewBuilder.AlertViewBuilder)
local inputAlertView = roact.Component:extend("InputAlertView")
inputAlertView.defaultProps = {
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

function inputAlertView.init(p1)
	-- upvalues: roact (ref), userInputService (ref)
	p1.ref = roact.createRef()
	
	function p0.onTextChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({
			inputText = p2,
			inputLengthExceeded = p1.props.maxCharacters < #p2
		})
	end
	
	function p0.onButtonActivated()
		-- upvalues: p1 (ref)
		p1.closing = true
	end
	
	function p0.updateModalPosition()
		-- upvalues: p1 (ref), userInputService (copy)
		p1:setState({
			keyboardOffset = if userInputService.OnScreenKeyboardVisible then p1.state.yPosition + p1.ref:getValue().AbsoluteSize.Y - userInputService.OnScreenKeyboardPosition.Y else 0
		})
	end
	
	function p0.onModalStayOpen()
		-- upvalues: p1 (ref)
		p1.closing = false
		
		if p1.props.shouldAdjustForKeyboard then
			p1.updateModalPosition()
		end
	end
	
	if p1.props.shouldAdjustForKeyboard then
		p1.keyboardConnection = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
			-- upvalues: p1 (ref)
			spawn(function()
				-- upvalues: p1 (copy)
				if p1.isMounted and not p1.closing then
					p1.updateModalPosition()
					
					return
				end
			end)
		end)
	end
	function p0.onPositionChanged(p2)
		-- upvalues: p1 (ref)
		if not p1.isMounted then return end
		if p2.AbsolutePosition.Y ~= p1.state.yPosition then
			p1:setState({ yPosition = p2.AbsolutePosition.Y })
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

function inputAlertView.render(p1)
	-- upvalues: buttonType (ref), roact (ref), alertViewBuilderModule (ref)
	local props = p1.props
	local _ = nil
	local maxCharacters = props.maxCharacters
	
	return roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, -p1.state.keyboardOffset),
		Transparency = 1,
		[roact.Change.AbsolutePosition] = p1.onPositionChanged,
		[roact.Ref] = p1.ref
	}, {
		AlertView = roact.createElement(alertViewBuilderModule, {
			buttons = if not props.displayFailed then {
				{
					buttonType = buttonType.Secondary,
					props = {
						text = props.cancelText,
						onActivated = function() end
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						text = props.confirmText,
						isDisabled = p1.state.inputLengthExceeded,
						onActivated = props.onActivated
					}
				}
			} else {
				{
					buttonType = buttonType.Alert,
					props = { text = props.failedText, onActivated = props.onActivated }
				}
			},
			inputLengthExceeded = p1.state.inputLengthExceeded,
			onActivated = p1.onButtonActivated,
			onModalClose = props.onModalClose,
			onModalStayOpen = p1.onModalStayOpen,
			soakAreaColor3 = p1.props.soakAreaColor3,
			soakAreaTransparency = p1.props.soakAreaTransparency,
			textboxes = {
				InputBox = {
					LayoutOrder = 1,
					belowText = maxCharacters and #p1.state.inputText .. "/" .. maxCharacters,
					belowTextAlignment = Enum.TextXAlignment.Right,
					onTextChanged = p1.onTextChanged,
					PlaceholderText = props.placeholderText,
					Text = props.inputText,
					warningText = p1.props.warningText
				}
			},
			title = props.titleText,
			screenSize = props.screenSize
		})
	})
end

function inputAlertView.didMount(p1)
	p1.isMounted = true
end

function inputAlertView.willUnmount(p1)
	p1.isMounted = false
	
	if p1.keyboardConnection then
		p1.keyboardConnection:Disconnect()
		p1.keyboardConnection = nil
	end
end

return inputAlertView