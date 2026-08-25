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

function phoneNumberTextBox.init(p0)
	p0:setState({
		CountryCodeHover = false,
		CountryCodeSearchVisible = false
	})
	
	function p0.CountryCodeMouseEnter()
		-- upvalues: p0 (ref)
		p0:setState({ CountryCodeHover = true })
	end
	
	function p0.CountryCodeMouseLeave()
		-- upvalues: p0 (ref)
		p0:setState({ CountryCodeHover = false })
	end
	
	function p0.OpenCountryCode()
		-- upvalues: p0 (ref)
		p0:setState({ CountryCodeSearchVisible = true })
		
		if p0.props.phoneCountryCodeSelectorCallback then
			p0.props.phoneCountryCodeSelectorCallback(true)
		end
	end
	
	function p0.CloseCountryCode()
		-- upvalues: p0 (ref)
		p0:setState({ CountryCodeSearchVisible = false })
		
		if p0.props.phoneCountryCodeSelectorCallback then
			p0.props.phoneCountryCodeSelectorCallback(false)
		end
	end
	
	function p0.SelectCountryCode(p1)
		-- upvalues: p0 (ref)
		if p0.props.SetCountryCode then
			p0.props.SetCountryCode(p1)
		end
		p0.CloseCountryCode()
	end
end

function phoneNumberTextBox.render(p2)
	-- upvalues: withStyle (ref), text (ref), roactModule (ref), imageSetLabel (ref), getImageData (ref), coreGuiService (ref), countryCodeSelectorModule (ref)
	return withStyle(function(p3)
		-- upvalues: p2 (ref), text (copy), roactModule (copy), imageSetLabel (copy), getImageData (copy), coreGuiService (copy), countryCodeSelectorModule (copy)
		local color = p2.props.Color
		local color_1 = p3.Theme.BackgroundMuted.Color
		local transparency = p2.props.Transparency
		local font = p3.Font.Body.Font
		local var6 = p3.Font.BaseSize * p3.Font.Body.RelativeSize
		local color_2 = p3.Theme.TextDefault.Color
		local transparency_1 = p3.Theme.TextDefault.Transparency
		local color_3 = p3.Theme.UIDefault.Color
		local _ = p2.props.PlaceholderText or ""
		local text_1 = p2.props.Text or ""
		local textInputTypeOverride = p2.props.TextInputTypeOverride or Enum.TextInputType.Phone
		local text_2 = " +" .. p2.props.CountryCode.prefix
		local maxValue = math.max(text.GetTextWidth(text_2, font, var6) + p2.props.InnerPadding * 2, p2.props.CountryCodeSize)
		
		return roactModule.createElement("TextButton", {
			Size = p2.props.Size,
			Position = p2.props.Position,
			AnchorPoint = p2.props.AnchorPoint,
			LayoutOrder = p2.props.LayoutOrder,
			BackgroundTransparency = 1,
			Text = "",
			[roactModule.Event.MouseEnter] = p2.props.onMouseEnter,
			[roactModule.Event.MouseLeave] = p2.props.onMouseLeave
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
					Size = UDim2.new(1, -p2.props.InnerPadding * 2, 1, 0),
					Position = UDim2.new(0, p2.props.InnerPadding, 0, 0),
					PlaceholderColor3 = color_3,
					PlaceholderText = p2.props.PlaceholderText,
					Text = text_1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextColor3 = color_2,
					TextSize = var6,
					TextInputType = textInputTypeOverride,
					Font = font,
					ClearTextOnFocus = false,
					[roactModule.Event.Focused] = p2.props.onFocused,
					[roactModule.Event.FocusLost] = p2.props.onFocusLost,
					[roactModule.Change.Text] = p2.props.onChangeText
				})
			}),
			CountryCodeButton = roactModule.createElement("TextButton", {
				Size = UDim2.new(0, maxValue, 1, 0),
				ZIndex = 2,
				Text = "",
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[roactModule.Event.MouseEnter] = p2.CountryCodeMouseEnter,
				[roactModule.Event.MouseLeave] = p2.CountryCodeMouseLeave,
				[roactModule.Event.Activated] = p2.OpenCountryCode
			}, {
				Background = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 18, 1, 0),
					Image = getImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = if p2.state.CountryCodeHover then color_1 else color,
					ImageTransparency = transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				Prefix = roactModule.createElement("TextLabel", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					RichText = true,
					Size = UDim2.new(1, -p2.props.InnerPadding, 1, 0),
					TextXAlignment = Enum.TextXAlignment.Right,
					Font = font,
					Text = "<u>" .. text_2 .. "</u>",
					TextSize = var6,
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
						WidgetVisible = p2.state.CountryCodeSearchVisible,
						CloseCallback = p2.CloseCountryCode,
						SelectionCallback = p2.SelectCountryCode
					})
				})
			})
		})
	end)
end

return phoneNumberTextBox