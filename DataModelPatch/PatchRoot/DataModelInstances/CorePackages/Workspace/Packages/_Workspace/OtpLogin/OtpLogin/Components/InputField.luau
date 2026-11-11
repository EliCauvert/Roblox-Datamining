local DependenciesModule = require(script.Parent.Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseCursorFunction = UIBlox.App.SelectionCursor.useCursor
local Foundation = DependenciesModule.Foundation
local FFlagLuaAppFixCursorHooks = DependenciesModule.SharedFlags.FFlagLuaAppFixCursorHooks

return function(Frame)
	-- upvalues: UseStyleFunction (copy), Foundation (copy), React (copy), FFlagLuaAppFixCursorHooks (copy), UseCursorFunction (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = Foundation.Hooks.useTokens()
	local HelperText = UseStyleResult.Tokens.Component.HelperText
	local Typography = HelperText.Base.Typography
	local UseRefResult = React.useRef(nil)
	local UseStateResult, UseStateResult2 = React.useState(false)
	local TextField = UseStyleResult.Tokens.Component.TextField
	local UseCursorResult = if FFlagLuaAppFixCursorHooks then UseCursorFunction(UDim.new(0, TextField.Base.Field.BorderRadius), 2, 2) else nil
	
	local function _(): boolean
		-- upvalues: Frame (copy)
		return Frame.errorMessage and string.len(Frame.errorMessage) > 0
	end
	
	local config = {
		Thickness = 1,
		Color = if IsLengthAbove then TextField.Error.Field.BorderColor.Color3 else TextField.Base.Field.BorderColor.Color3,
		Transparency = if IsLengthAbove1 then TextField.Error.Field.BorderColor.Transparency elseif UseStateResult then 0 else TextField.Base.Field.BorderColor.Transparency
	}
	local IsLengthAbove: boolean = Frame.errorMessage and string.len(Frame.errorMessage) > 0
	local IsLengthAbove1: boolean = Frame.errorMessage and string.len(Frame.errorMessage) > 0
	local IsLengthAbove2: boolean = Frame.errorMessage and string.len(Frame.errorMessage) > 0
	
	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseStyleResult.Tokens.Size.Size_100)
		}),
		InputCanvas = React.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 48),
			GroupTransparency = if Frame.disabled then 1 - TextField.Disabled.Field.Opacity else 0
		}, {
			Input = React.createElement("ImageButton", {
				Size = UDim2.new(1, -2, 1, -2),
				Position = UDim2.new(0, 1, 0, 1),
				BackgroundTransparency = 1,
				Selectable = not Frame.disabled,
				Image = "",
				ImageColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
				SelectionImageObject = if FFlagLuaAppFixCursorHooks then UseCursorResult else UseCursorFunction(UDim.new(0, TextField.Base.Field.BorderRadius), 2, 2),
				[React.Event.Activated] = function()
					-- upvalues: UseRefResult (copy)
					if UseRefResult.current then
						UseRefResult.current:CaptureFocus()
					end
				end
			}, {
				Corner = React.createElement("UICorner", {
					CornerRadius = UDim.new(0, TextField.Base.Field.BorderRadius)
				}),
				Border = React.createElement("UIStroke", config),
				BorderFrame = React.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -4, 1, -4),
					Position = UDim2.new(0, 2, 0, 2)
				}, {
					Corner = React.createElement("UICorner", {
						CornerRadius = UDim.new(0, TextField.Base.Field.BorderRadius - 2)
					}),
					Focus = if Frame.disabled or not UseStateResult then nil else React.createElement("UIStroke", {
						Transparency = 0.88,
						Thickness = 3,
						Color = TextField.Base.Field.BorderColor.Color3
					}),
					Padding = React.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, TextField.Base.Field.Spacing.Leading),
						PaddingRight = UDim.new(0, TextField.Base.Field.Spacing.Trailing)
					}),
					Layout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, TextField.Base.Field.Gap * 2)
					}),
					TextBox = React.createElement("TextBox", {
						ref = UseRefResult,
						Text = Frame.text,
						TextInputType = Frame.textInputType or Enum.TextInputType.Default,
						ClearTextOnFocus = false,
						Size = UDim2.new(1, 0, 1, 0),
						TextEditable = not Frame.disabled,
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						Font = TextField.Base.Field.Typography.Font,
						TextSize = TextField.Base.Field.Typography.FontSize,
						LineHeight = 1,
						TextColor3 = TextField.Base.FieldValue.ContentColor.Color3,
						TextTransparency = TextField.Base.FieldValue.ContentColor.Transparency,
						PlaceholderText = Frame.placeholder,
						ClipsDescendants = true,
						LayoutOrder = 1,
						[React.Event.Focused] = function()
							-- upvalues: Frame (copy), UseRefResult (copy), UseStateResult2 (copy)
							if Frame.disabled and UseRefResult.current then
								UseRefResult.current:ReleaseFocus()
								
								return
							else
								UseStateResult2(true)
							end
						end,
						[React.Event.FocusLost] = function()
							-- upvalues: UseStateResult2 (copy)
							UseStateResult2(false)
						end,
						[React.Change.Text] = Frame.onChange
					})
				})
			})
		}),
		HelperText = if IsLengthAbove2 then React.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Text = Frame.errorMessage,
			TextTransparency = HelperText.Base.ContentColor.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = UseTokensResult.Color.System.Alert.Color3,
			Font = Typography.Font,
			TextSize = Typography.FontSize,
			LineHeight = Typography.LineHeight,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}) else nil
	})
end