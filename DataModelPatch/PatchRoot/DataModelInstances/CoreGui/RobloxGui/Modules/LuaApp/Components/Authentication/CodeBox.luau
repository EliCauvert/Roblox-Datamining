local CorePackages = game:GetService("CorePackages")
local RoactModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local GenericTextBox = AuthCommonModule.Components.GenericTextBox
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local CodeBox = RoactModule.PureComponent:extend("CodeBox")
CodeBox.defaultProps = { TextInputType = Enum.TextInputType.Number }

function CodeBox.init(p1)
	-- upvalues: RoactModule (copy)
	p1:setState({ isFocused = false })
	p1.CurrentText, p1.UpdateCurrentText = RoactModule.createBinding("")
	p1.textBoxRef = RoactModule.createRef()
	
	function p1.onChangeText(p2)
		-- upvalues: p1 (copy)
		local Text = p2.Text
		
		if p1.props.textFilter then
			Text = Text:gsub(p1.props.textFilter, "")
		end
		if p1.props.characterCount and p1.props.characterCount < #Text then
			Text = Text:sub(1, p1.props.characterCount)
		end
		if Text ~= p2.Text then
			p2.Text = Text
			
			return
		end
		if p1.props.onValueChanged then
			p1.props.onValueChanged(p2.Text)
		end
	end
	
	function p1.onFocused(p2)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), p2 (copy)
			if p1.isMounted then
				p1:setState({ isFocused = p2:isFocused() })
			end
		end)
		
		if p1.props.onFocused then
			p1.props.onFocused(p2)
		end
	end
	
	function p1.onFocusLost(p2, p3, p4)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), p2 (copy)
			if p1.isMounted then
				p1:setState({ isFocused = p2:isFocused() })
			end
		end)
		
		if p1.props.onFocusLost then
			p1.props.onFocusLost(p2, p3, p4)
		end
	end
end

function CodeBox.didMount(p1)
	p1.isMounted = true
	spawn(function()
		-- upvalues: p1 (copy)
		if p1.isMounted and p1.props.shouldFocus and p1.textBoxRef.current then
			p1.textBoxRef.current:CaptureFocus()
		end
	end)
end

function CodeBox.willUnmount(p1)
	p1.isMounted = false
end

function CodeBox.didUpdate(p1, p2, _)
	if p1.textBoxRef.current and not p2.shouldFocus and p1.props.shouldFocus then
		p1.UpdateCurrentText("")
		p1.textBoxRef.current:CaptureFocus()
	end
end

function CodeBox.render(p1)
	-- upvalues: WithStyleFunction (copy), AuthStatefulRoundCornerBorder (copy), RoactModule (copy), GenericTextBox (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), AuthStatefulRoundCornerBorder (upval), RoactModule (upval), GenericTextBox (upval)
		return RoactModule.createElement(AuthStatefulRoundCornerBorder, {
			size = UDim2.new(1, 0, 0, 36),
			borderState = p1.props.errorState and AuthStatefulRoundCornerBorder.BorderState.Error or (p1.state.isFocused and AuthStatefulRoundCornerBorder.BorderState.Focused or AuthStatefulRoundCornerBorder.BorderState.Default)
		}, {
			RoactModule.createElement(GenericTextBox, {
				Active = false,
				TextSize = 16,
				ClearTextOnFocus = false,
				Size = UDim2.new(1, 0, 1, 0),
				Color = p2.Theme.BackgroundUIContrast.Color,
				Font = p2.Font.Body.Font,
				Transparency = p2.Theme.BackgroundUIContrast.Transparency,
				TextColor = p2.Theme.TextDefault.Color,
				PlaceholderColor = p2.Theme.BackgroundUIDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				Text = p1.CurrentText,
				TextEditable = p1.props.TextEditable,
				PlaceholderText = p1.props.PlaceholderText,
				TextInputType = p1.props.TextInputType,
				TextBoxRef = p1.textBoxRef,
				onChangeText = p1.onChangeText,
				onFocused = p1.onFocused,
				onFocusLost = p1.onFocusLost,
				ManualFocusRelease = p1.props.ManualFocusRelease
			})
		})
	end)
end

return CodeBox