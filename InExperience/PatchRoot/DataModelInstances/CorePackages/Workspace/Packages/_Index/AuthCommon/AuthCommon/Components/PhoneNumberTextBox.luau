local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local text = require(parent.AppCommonLib).Text
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local countryCodeSelectorModule = require(authCommon.Components.CountryCodeSelector)
local phoneNumberTextBox = roactModule.Component:extend("PhoneNumberTextBox")
phoneNumberTextBox.defaultProps = { CountryCodeSize = 70, InnerPadding = 12 }

function phoneNumberTextBox.init(p1)
	p1:setState({
		CountryCodeHover = false,
		CountryCodeSearchVisible = false
	})
	
	function p0.CountryCodeMouseEnter()
		-- upvalues: p1 (ref)
		p1:setState({ CountryCodeHover = true })
	end
	
	function p0.CountryCodeMouseLeave()
		-- upvalues: p1 (ref)
		p1:setState({ CountryCodeHover = false })
	end
	
	function p0.OpenCountryCode()
		-- upvalues: p1 (ref)
		p1:setState({ CountryCodeSearchVisible = true })
		
		if p1.props.phoneCountryCodeSelectorCallback then
			p1.props.phoneCountryCodeSelectorCallback(true)
		end
	end
	
	function p0.CloseCountryCode()
		-- upvalues: p1 (ref)
		p1:setState({ CountryCodeSearchVisible = false })
		
		if p1.props.phoneCountryCodeSelectorCallback then
			p1.props.phoneCountryCodeSelectorCallback(false)
		end
	end
	
	function p0.SelectCountryCode(p2)
		-- upvalues: p1 (ref)
		if p1.props.SetCountryCode then
			p1.props.SetCountryCode(p2)
		end
		p1.CloseCountryCode()
	end
end

function phoneNumberTextBox.render(p1)
	-- upvalues: withStyle (ref), text (ref), roactModule (ref), imageSetLabel (ref), getImageData (ref), coreGuiService (ref), countryCodeSelectorModule (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), text (copy), roactModule (copy), imageSetLabel (copy), getImageData (copy), coreGuiService (copy), countryCodeSelectorModule (copy)
		local color = p1.props.Color
		local color_1 = p2.Theme.BackgroundMuted.Color
		local transparency = p1.props.Transparency
		local font = p2.Font.Body.Font
		local var1 = p2.Font.BaseSize * p2.Font.Body.RelativeSize
		local color_2 = p2.Theme.TextDefault.Color
		local transparency_1 = p2.Theme.TextDefault.Transparency
		local color_3 = p2.Theme.UIDefault.Color
		local _ = p1.props.PlaceholderText or ""
		local text_1 = p1.props.Text or ""
		local textInputTypeOverride = p1.props.TextInputTypeOverride or Enum.TextInputType.Phone
		local text_2 = " +" .. p2.props.CountryCode.prefix
		local maxValue = math.max(text.GetTextWidth(text_2, font, var1) + p1.props.InnerPadding * 2, p1.props.CountryCodeSize)
		
		return roactModule.createElement("TextButton", {
			Size = p1.props.Size,
			Position = p1.props.Position,
			AnchorPoint = p1.props.AnchorPoint,
			LayoutOrder = p1.props.LayoutOrder,
			BackgroundTransparency = 1,
			Text = "",
			[roactModule.Event.MouseEnter] = p1.props.onMouseEnter,
			[roactModule.Event.MouseLeave] = p1.props.onMouseLeave
		}, {
			InputWrapper = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, (-maxValue) - 2, 1, 0),
				Position = UDim2.new(0, maxValue + 2, 0, 0)
			}, {
				Background = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 18, 1, 0),
					Position = UDim2.new(0, -18, 0, 0),
					Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = color,
					ImageTransparency = transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				InputField = roactModule.createElement("TextBox", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.new(1, -p1.props.InnerPadding * 2, 1, 0),
					Position = UDim2.new(0, p1.props.InnerPadding, 0, 0),
					PlaceholderColor3 = color_3,
					PlaceholderText = p1.props.PlaceholderText,
					Text = text_1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextColor3 = color_2,
					TextSize = var1,
					TextInputType = textInputTypeOverride,
					Font = font,
					ClearTextOnFocus = false,
					[roactModule.Event.Focused] = p1.props.onFocused,
					[roactModule.Event.FocusLost] = p1.props.onFocusLost,
					[roactModule.Change.Text] = p1.props.onChangeText
				})
			}),
			CountryCodeButton = roactModule.createElement("TextButton", {
				Size = UDim2.new(0, maxValue, 1, 0),
				ZIndex = 2,
				Text = "",
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[roactModule.Event.MouseEnter] = p1.CountryCodeMouseEnter,
				[roactModule.Event.MouseLeave] = p1.CountryCodeMouseLeave,
				[roactModule.Event.Activated] = p1.OpenCountryCode
			}, {
				Background = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 18, 1, 0),
					Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = if p1.state.CountryCodeHover then color_1 else color,
					ImageTransparency = transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				Prefix = roactModule.createElement("TextLabel", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					RichText = true,
					Size = UDim2.new(1, -p1.props.InnerPadding, 1, 0),
					TextXAlignment = Enum.TextXAlignment.Right,
					Font = font,
					Text = "<u>" .. text_2 .. "</u>",
					TextSize = var1,
					TextColor3 = color_2,
					TextTransparency = transparency_1
				})
			}),
			Divider = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = color_1,
				Size = UDim2.new(0, 2, 1, 0),
				Position = UDim2.new(0, maxValue, 0, 0),
				BackgroundTransparency = transparency
			}),
			CountryCodePortal = roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
				CountryCodeSelectionGui = roactModule.createElement("ScreenGui", {
					Enabled = true,
					DisplayOrder = 13,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				}, {
					CountryCodeSelector = roactModule.createElement(countryCodeSelectorModule, {
						WidgetVisible = p1.state.CountryCodeSearchVisible,
						CloseCallback = p1.CloseCountryCode,
						SelectionCallback = p1.SelectCountryCode
					})
				})
			})
		})
	end)
end

return phoneNumberTextBox