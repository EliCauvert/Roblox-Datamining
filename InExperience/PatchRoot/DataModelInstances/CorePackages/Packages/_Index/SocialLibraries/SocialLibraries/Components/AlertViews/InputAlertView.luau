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
	onActivated = function() --[[ line: 23 ]] end,
	onModalClose = function() --[[ line: 25 ]] end,
	screenSize = Vector2.new(0, 0),
	soakAreaColor3 = Color3.fromRGB(0, 0, 255)
}

function inputAlertView.init(p0) --[[ line: 34 ]]
	-- upvalues: roact (ref), userInputService (ref)
	p0.ref = roact.createRef()
	
	function p0.onTextChanged(p1) --[[ line: 36 ]]
		-- upvalues: p0 (ref)
		p0:setState({
			inputText = p1,
			inputLengthExceeded = p0.props.maxCharacters < #p1
		})
	end
	
	function p0.onButtonActivated() --[[ line: 43 ]]
		-- upvalues: p0 (ref)
		p0.closing = true
	end
	
	function p0.updateModalPosition() --[[ line: 47 ]]
		-- upvalues: p0 (ref), userInputService (copy)
		p0:setState({
			keyboardOffset = if userInputService.OnScreenKeyboardVisible then p0.state.yPosition + p0.ref:getValue().AbsoluteSize.Y - userInputService.OnScreenKeyboardPosition.Y else 0
		})
	end
	
	function p0.onModalStayOpen() --[[ line: 57 ]]
		-- upvalues: p0 (ref)
		p0.closing = false
		
		if p0.props.shouldAdjustForKeyboard then
			p0.updateModalPosition()
		end
	end
	
	if p0.props.shouldAdjustForKeyboard then
		p0.keyboardConnection = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ line: 69 ]]
			-- upvalues: p0 (ref)
			spawn(function() --[[ line: 71 ]]
				-- upvalues: p0 (copy)
				if p0.isMounted and not p0.closing then
					p0.updateModalPosition()
					
					return
				end
			end)
		end)
	end
	function p0.onPositionChanged(p2) --[[ line: 82 ]]
		-- upvalues: p0 (ref)
		if not p0.isMounted then return end
		if p2.AbsolutePosition.Y ~= p0.state.yPosition then
			p0:setState({ yPosition = p2.AbsolutePosition.Y })
		end
	end
	
	p0.closing = false
	p0.state = {
		inputLengthExceeded = false,
		keyboardOffset = 0,
		yPosition = 0,
		inputText = p0.props.inputText
	}
end

function inputAlertView.render(p3) --[[ line: 102 ]]
	-- upvalues: buttonType (ref), roact (ref), alertViewBuilderModule (ref)
	local props = p3.props
	local _ = nil
	local maxCharacters = props.maxCharacters
	
	return roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, -p3.state.keyboardOffset),
		Transparency = 1,
		[roact.Change.AbsolutePosition] = p3.onPositionChanged,
		[roact.Ref] = p3.ref
	}, {
		AlertView = roact.createElement(alertViewBuilderModule, {
			buttons = if not props.displayFailed then {
				{
					buttonType = buttonType.Secondary,
					props = {
						text = props.cancelText,
						onActivated = function() --[[ line: 113 ]] end
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						text = props.confirmText,
						isDisabled = p3.state.inputLengthExceeded,
						onActivated = props.onActivated
					}
				}
			} else {
				{
					buttonType = buttonType.Alert,
					props = { text = props.failedText, onActivated = props.onActivated }
				}
			},
			inputLengthExceeded = p3.state.inputLengthExceeded,
			onActivated = p3.onButtonActivated,
			onModalClose = props.onModalClose,
			onModalStayOpen = p3.onModalStayOpen,
			soakAreaColor3 = p3.props.soakAreaColor3,
			soakAreaTransparency = p3.props.soakAreaTransparency,
			textboxes = {
				InputBox = {
					LayoutOrder = 1,
					belowText = maxCharacters and #p3.state.inputText .. "/" .. maxCharacters,
					belowTextAlignment = Enum.TextXAlignment.Right,
					onTextChanged = p3.onTextChanged,
					PlaceholderText = props.placeholderText,
					Text = props.inputText,
					warningText = p3.props.warningText
				}
			},
			title = props.titleText,
			screenSize = props.screenSize
		})
	})
end

function inputAlertView.didMount(p4) --[[ line: 168 ]]
	p4.isMounted = true
end

function inputAlertView.willUnmount(p5) --[[ line: 172 ]]
	p5.isMounted = false
	
	if p5.keyboardConnection then
		p5.keyboardConnection:Disconnect()
		p5.keyboardConnection = nil
	end
end

return inputAlertView