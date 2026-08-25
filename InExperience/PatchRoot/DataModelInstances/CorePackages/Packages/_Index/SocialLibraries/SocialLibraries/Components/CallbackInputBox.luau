local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local imageSetLabel = dependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local callbackInputBox = roact.PureComponent:extend("CallbackInputBox")
callbackInputBox.defaultProps = {
	initialInputText = "",
	inputTextFont = Enum.Font.BuilderSans,
	inputTextColor3 = Color3.new(1, 0, 1),
	inputTextSize = 14,
	inputTextYAlignment = Enum.TextYAlignment.Center,
	inputTextXAlignment = Enum.TextXAlignment.Center,
	inputTextTransparency = 0,
	placeholderTextTransparency = 0.6,
	placeholderTextColor3 = Color3.new(1, 0, 0),
	placeholderText = "Test placeholder text",
	clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png",
	clearIconColor3 = Color3.new(1, 1, 0),
	clearIconTransparency = 0,
	clearButtonSize = 24,
	clipsDescendants = true,
	manualFocusRelease = false,
	captureFocusOnMount = false,
	multiLine = false,
	textWrapped = false,
	showCancelIconOnLoad = false,
	textInputType = Enum.TextInputType.Default,
	returnKeyType = Enum.ReturnKeyType.Default,
	inputBoxSelectionImageObject = nil,
	clearButtonSelectionImageObject = nil,
	clearButtonDisabled = nil,
	textChangedCallback = nil,
	focusChangedCallback = function() end,
	onSelectCallback = function() end,
	returnPressedFromOnScreenKeyboardCallback = function() end,
	inputBoxRef = nil,
	[roact.Change.AbsoluteSize] = function() end
}

function callbackInputBox.init(p0)
	-- upvalues: roact (ref)
	p0.clearRef = roact.createRef()
	p0.inputBoxRef = p0.props.inputBoxRef or roact.createRef()
	p0.inputText = p0.props.initialInputText
	p0.textChangedEventUnlocked = false
	
	function p0.focusTextbox()
		-- upvalues: p0 (ref)
		p0.props.onSelectCallback()
		
		if not p0.inputBoxRef.current:IsFocused() then
			p0.inputBoxRef.current:captureFocus()
		end
	end
end

function callbackInputBox.render(p1)
	-- upvalues: roact (ref), imageSetLabel (ref)
	local placeholderTextTransparency = p1.props.placeholderTextTransparency
	local inputTextTransparency = p1.props.inputTextTransparency
	local _ = nil
	
	return roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		inputBox = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			layout = roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			inputTextBox = roact.createElement("TextBox", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -p1.props.clearButtonSize, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				TextColor3 = p1.props.inputTextColor3,
				TextSize = p1.props.inputTextSize,
				TextTransparency = if p1.inputText and p1.inputText ~= "" then inputTextTransparency else placeholderTextTransparency,
				Font = p1.props.inputTextFont,
				PlaceholderText = p1.props.placeholderText,
				PlaceholderColor3 = p1.props.placeholderTextColor3,
				TextXAlignment = p1.props.inputTextXAlignment,
				TextYAlignment = p1.props.inputTextYAlignment,
				OverlayNativeInput = true,
				ClearTextOnFocus = false,
				ClipsDescendants = p1.props.clipsDescendants,
				LayoutOrder = 1,
				ManualFocusRelease = p1.props.manualFocusRelease,
				MultiLine = p1.props.multiLine,
				TextWrapped = p1.props.textWrapped,
				TextInputType = p1.props.textInputType,
				ReturnKeyType = p1.props.returnKeyType,
				SelectionImageObject = p1.props.inputBoxSelectionImageObject,
				[roact.Event.ReturnPressedFromOnScreenKeyboard] = p1.props.returnPressedFromOnScreenKeyboardCallback,
				[roact.Event.TouchTap] = p1.focusTextbox,
				[roact.Event.Focused] = function(p2)
					-- upvalues: p1 (ref), inputTextTransparency (ref), placeholderTextTransparency (ref)
					if p1.inputBoxRef.current and p1.inputBoxRef.current.Text ~= "" then
						if p1.clearRef.current and not p1.props.clearButtonDisabled then
							p1.clearRef.current.Visible = true
						end
						p2.TextColor3 = p1.props.inputTextColor3
						p2.TextTransparency = inputTextTransparency
					else
						p2.TextColor3 = p1.props.placeholderTextColor3
						p2.TextTransparency = placeholderTextTransparency
					end
					p1.props.focusChangedCallback(true)
				end,
				[roact.Event.FocusLost] = function(p3, p4)
					-- upvalues: p1 (ref), placeholderTextTransparency (ref)
					if p1.inputBoxRef.current and p1.inputBoxRef.current.Text == "" then
						p3.TextColor3 = p1.props.placeholderTextColor3
						p3.TextTransparency = placeholderTextTransparency
					end
					p1.props.focusChangedCallback(false, p4)
				end,
				[roact.Change.Text] = function(p5)
					-- upvalues: p1 (ref), inputTextTransparency (ref), placeholderTextTransparency (ref)
					if p5.Text ~= "" or p1.textChangedEventUnlocked then
						if p5.Text == "" then
							if p1.clearRef.current then
								p1.clearRef.current.Visible = false
							end
							p5.TextColor3 = p1.props.placeholderTextColor3
							p5.TextTransparency = placeholderTextTransparency
						elseif p1.clearRef.current and not p1.props.clearButtonDisabled then
							p1.clearRef.current.Visible = true
						end
						p5.TextColor3 = p1.props.inputTextColor3
						p5.TextTransparency = inputTextTransparency
						p1.inputText = p5.Text
						
						if p1.props.textChangedCallback then
							p1.props.textChangedCallback(p5.Text)
						end
					end
					p1.textChangedEventUnlocked = true
				end,
				[roact.Ref] = p1.inputBoxRef,
				[roact.Change.AbsoluteSize] = p1.props[roact.Change.AbsoluteSize]
			}),
			Clear = roact.createElement("ImageButton", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.props.clearButtonSize, 0, p1.props.clearButtonSize),
				AutoButtonColor = false,
				LayoutOrder = 2,
				Visible = not p1.props.clearButtonDisabled,
				SelectionImageObject = p1.props.clearButtonSelectionImageObject,
				Selectable = p1.clearRef.current and p1.clearRef.current.Visible == true,
				[roact.Event.Activated] = function()
					-- upvalues: p1 (ref)
					if p1.inputBoxRef.current then
						p1.inputBoxRef.current.Text = ""
					end
					p1.inputText = ""
					
					if p1.clearRef.current then
						p1.clearRef.current.Visible = false
					end
				end
			}, {
				layout = roact.createElement("UIListLayout", {
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center"
				}),
				Icon = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p1.props.clearButtonSize, 0, p1.props.clearButtonSize),
					Image = p1.props.clearIcon,
					ImageColor3 = p1.props.clearIconColor3,
					ImageTransparency = p1.props.clearIconTransparency,
					Visible = p1.props.showCancelIconOnLoad,
					[roact.Ref] = p1.clearRef
				})
			})
		})
	})
end

function callbackInputBox.didMount(p6)
	if p6.inputBoxRef.current then
		p6.inputBoxRef.current.Text = p6.inputText
		
		if p6.props.captureFocusOnMount then
			spawn(function()
				-- upvalues: p6 (ref)
				if p6.inputBoxRef and p6.inputBoxRef.current then
					p6.inputBoxRef.current:captureFocus()
				end
			end)
		end
	end
end

return callbackInputBox