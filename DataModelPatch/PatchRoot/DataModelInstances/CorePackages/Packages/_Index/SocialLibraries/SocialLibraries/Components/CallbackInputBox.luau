local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local ImageSetLabel = DependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local CallbackInputBox = Roact.PureComponent:extend("CallbackInputBox")
CallbackInputBox.defaultProps = {
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
	[Roact.Change.AbsoluteSize] = function() end
}

function CallbackInputBox.init(p1)
	-- upvalues: Roact (copy)
	p1.clearRef = Roact.createRef()
	p1.inputBoxRef = p1.props.inputBoxRef or Roact.createRef()
	p1.inputText = p1.props.initialInputText
	p1.textChangedEventUnlocked = false
	
	function p1.focusTextbox()
		-- upvalues: p1 (copy)
		p1.props.onSelectCallback()
		
		if not p1.inputBoxRef.current:IsFocused() then
			p1.inputBoxRef.current:captureFocus()
		end
	end
end

function CallbackInputBox.render(p1)
	-- upvalues: Roact (copy), ImageSetLabel (copy)
	local PlaceholderTextTransparency = p1.props.placeholderTextTransparency
	local InputTextTransparency = p1.props.inputTextTransparency
	
	return Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = Roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		inputBox = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			layout = Roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			inputTextBox = Roact.createElement("TextBox", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -p1.props.clearButtonSize, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				TextColor3 = p1.props.inputTextColor3,
				TextSize = p1.props.inputTextSize,
				TextTransparency = if p1.inputText and p1.inputText ~= "" then InputTextTransparency else PlaceholderTextTransparency,
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
				[Roact.Event.ReturnPressedFromOnScreenKeyboard] = p1.props.returnPressedFromOnScreenKeyboardCallback,
				[Roact.Event.TouchTap] = p1.focusTextbox,
				[Roact.Event.Focused] = function(Label)
					-- upvalues: p1 (copy), InputTextTransparency (copy), PlaceholderTextTransparency (copy)
					if p1.inputBoxRef.current and p1.inputBoxRef.current.Text ~= "" then
						if p1.clearRef.current and not p1.props.clearButtonDisabled then
							p1.clearRef.current.Visible = true
						end
						Label.TextColor3 = p1.props.inputTextColor3
						Label.TextTransparency = InputTextTransparency
					else
						Label.TextColor3 = p1.props.placeholderTextColor3
						Label.TextTransparency = PlaceholderTextTransparency
					end
					p1.props.focusChangedCallback(true)
				end,
				[Roact.Event.FocusLost] = function(Label, p2)
					-- upvalues: p1 (copy), PlaceholderTextTransparency (copy)
					if p1.inputBoxRef.current and p1.inputBoxRef.current.Text == "" then
						Label.TextColor3 = p1.props.placeholderTextColor3
						Label.TextTransparency = PlaceholderTextTransparency
					end
					p1.props.focusChangedCallback(false, p2)
				end,
				[Roact.Change.Text] = function(Label)
					-- upvalues: p1 (copy), InputTextTransparency (copy), PlaceholderTextTransparency (copy)
					if Label.Text ~= "" or p1.textChangedEventUnlocked then
						if Label.Text == "" then
							if p1.clearRef.current then
								p1.clearRef.current.Visible = false
							end
							Label.TextColor3 = p1.props.placeholderTextColor3
							Label.TextTransparency = PlaceholderTextTransparency
						else
							if p1.clearRef.current and not p1.props.clearButtonDisabled then
								p1.clearRef.current.Visible = true
							end
							Label.TextColor3 = p1.props.inputTextColor3
							Label.TextTransparency = InputTextTransparency
						end
						p1.inputText = Label.Text
						
						if p1.props.textChangedCallback then
							p1.props.textChangedCallback(Label.Text)
						end
					end
					p1.textChangedEventUnlocked = true
				end,
				[Roact.Ref] = p1.inputBoxRef,
				[Roact.Change.AbsoluteSize] = p1.props[Roact.Change.AbsoluteSize]
			}),
			Clear = Roact.createElement("ImageButton", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.props.clearButtonSize, 0, p1.props.clearButtonSize),
				AutoButtonColor = false,
				LayoutOrder = 2,
				Visible = not p1.props.clearButtonDisabled,
				SelectionImageObject = p1.props.clearButtonSelectionImageObject,
				Selectable = p1.clearRef.current and p1.clearRef.current.Visible == true,
				[Roact.Event.Activated] = function()
					-- upvalues: p1 (copy)
					if p1.inputBoxRef.current then
						p1.inputBoxRef.current.Text = ""
					end
					p1.inputText = ""
					
					if p1.clearRef.current then
						p1.clearRef.current.Visible = false
					end
				end
			}, {
				layout = Roact.createElement("UIListLayout", {
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center"
				}),
				Icon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p1.props.clearButtonSize, 0, p1.props.clearButtonSize),
					Image = p1.props.clearIcon,
					ImageColor3 = p1.props.clearIconColor3,
					ImageTransparency = p1.props.clearIconTransparency,
					Visible = p1.props.showCancelIconOnLoad,
					[Roact.Ref] = p1.clearRef
				})
			})
		})
	})
end

function CallbackInputBox.didMount(p1)
	if p1.inputBoxRef.current then
		p1.inputBoxRef.current.Text = p1.inputText
		
		if p1.props.captureFocusOnMount then
			spawn(function()
				-- upvalues: p1 (copy)
				if p1.inputBoxRef and p1.inputBoxRef.current then
					p1.inputBoxRef.current:captureFocus()
				end
			end)
		end
	end
end

return CallbackInputBox