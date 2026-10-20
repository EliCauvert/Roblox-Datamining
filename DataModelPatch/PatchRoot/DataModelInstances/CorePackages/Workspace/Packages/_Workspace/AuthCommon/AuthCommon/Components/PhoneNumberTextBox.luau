local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local CoreGui = game:GetService("CoreGui")
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Text = require(Parent.AppCommonLib).Text
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local CountryCodeSelectorModule = require(AuthCommon.Components.CountryCodeSelector)
local PhoneNumberTextBox = RoactModule.Component:extend("PhoneNumberTextBox")
PhoneNumberTextBox.defaultProps = { CountryCodeSize = 70, InnerPadding = 12 }

function PhoneNumberTextBox.init(p1)
	p1:setState({
		CountryCodeHover = false,
		CountryCodeSearchVisible = false
	})
	
	function p1.CountryCodeMouseEnter()
		-- upvalues: p1 (copy)
		p1:setState({ CountryCodeHover = true })
	end
	
	function p1.CountryCodeMouseLeave()
		-- upvalues: p1 (copy)
		p1:setState({ CountryCodeHover = false })
	end
	
	function p1.OpenCountryCode()
		-- upvalues: p1 (copy)
		p1:setState({ CountryCodeSearchVisible = true })
		
		if p1.props.phoneCountryCodeSelectorCallback then
			p1.props.phoneCountryCodeSelectorCallback(true)
		end
	end
	
	function p1.CloseCountryCode()
		-- upvalues: p1 (copy)
		p1:setState({ CountryCodeSearchVisible = false })
		
		if p1.props.phoneCountryCodeSelectorCallback then
			p1.props.phoneCountryCodeSelectorCallback(false)
		end
	end
	
	function p1.SelectCountryCode(p2)
		-- upvalues: p1 (copy)
		if p1.props.SetCountryCode then
			p1.props.SetCountryCode(p2)
		end
		p1.CloseCountryCode()
	end
end

function PhoneNumberTextBox.render(p1)
	-- upvalues: WithStyleFunction (copy), Text (copy), RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), CoreGui (copy), CountryCodeSelectorModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), Text (upval), RoactModule (upval), ImageSetLabel (upval), GetImageDataFunction (upval), CoreGui (upval), CountryCodeSelectorModule (upval)
		local Color = p1.props.Color
		local Color1 = p2.Theme.BackgroundMuted.Color
		local Transparency = p1.props.Transparency
		local BodyFont = p2.Font.Body.Font
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
		local Color2 = p2.Theme.TextDefault.Color
		local _ = p1.props.PlaceholderText or ""
		local Text1 = " +" .. p1.props.CountryCode.prefix
		local Largest = math.max(Text.GetTextWidth(Text1, BodyFont, ScaledBaseSize) + p1.props.InnerPadding * 2, p1.props.CountryCodeSize)
		
		return RoactModule.createElement("TextButton", {
			Size = p1.props.Size,
			Position = p1.props.Position,
			AnchorPoint = p1.props.AnchorPoint,
			LayoutOrder = p1.props.LayoutOrder,
			BackgroundTransparency = 1,
			Text = "",
			[RoactModule.Event.MouseEnter] = p1.props.onMouseEnter,
			[RoactModule.Event.MouseLeave] = p1.props.onMouseLeave
		}, {
			InputWrapper = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, -Largest - 2, 1, 0),
				Position = UDim2.new(0, Largest + 2, 0, 0)
			}, {
				Background = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 18, 1, 0),
					Position = UDim2.new(0, -18, 0, 0),
					Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = Color,
					ImageTransparency = Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				InputField = RoactModule.createElement("TextBox", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.new(1, -p1.props.InnerPadding * 2, 1, 0),
					Position = UDim2.new(0, p1.props.InnerPadding, 0, 0),
					PlaceholderColor3 = p2.Theme.UIDefault.Color,
					PlaceholderText = p1.props.PlaceholderText,
					Text = p1.props.Text or "",
					TextXAlignment = Enum.TextXAlignment.Left,
					TextColor3 = Color2,
					TextSize = ScaledBaseSize,
					TextInputType = p1.props.TextInputTypeOverride or Enum.TextInputType.Phone,
					Font = BodyFont,
					ClearTextOnFocus = false,
					[RoactModule.Event.Focused] = p1.props.onFocused,
					[RoactModule.Event.FocusLost] = p1.props.onFocusLost,
					[RoactModule.Change.Text] = p1.props.onChangeText
				})
			}),
			CountryCodeButton = RoactModule.createElement("TextButton", {
				Size = UDim2.new(0, Largest, 1, 0),
				ZIndex = 2,
				Text = "",
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[RoactModule.Event.MouseEnter] = p1.CountryCodeMouseEnter,
				[RoactModule.Event.MouseLeave] = p1.CountryCodeMouseLeave,
				[RoactModule.Event.Activated] = p1.OpenCountryCode
			}, {
				Background = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 18, 1, 0),
					Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = p1.state.CountryCodeHover and Color1 or Color,
					ImageTransparency = Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				Prefix = RoactModule.createElement("TextLabel", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					RichText = true,
					Size = UDim2.new(1, -p1.props.InnerPadding, 1, 0),
					TextXAlignment = Enum.TextXAlignment.Right,
					Font = BodyFont,
					Text = "<u>" .. Text1 .. "</u>",
					TextSize = ScaledBaseSize,
					TextColor3 = Color2,
					TextTransparency = p2.Theme.TextDefault.Transparency
				})
			}),
			Divider = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = Color1,
				Size = UDim2.new(0, 2, 1, 0),
				Position = UDim2.new(0, Largest, 0, 0),
				BackgroundTransparency = Transparency
			}),
			CountryCodePortal = RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
				CountryCodeSelectionGui = RoactModule.createElement("ScreenGui", {
					Enabled = true,
					DisplayOrder = 13,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				}, {
					CountryCodeSelector = RoactModule.createElement(CountryCodeSelectorModule, {
						WidgetVisible = p1.state.CountryCodeSearchVisible,
						CloseCallback = p1.CloseCountryCode,
						SelectionCallback = p1.SelectCountryCode
					})
				})
			})
		})
	end)
end

return PhoneNumberTextBox