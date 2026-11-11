local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local TextInputBoxWithBorder = AuthCommonModule.Components.TextInputBoxWithBorder
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local MonthDropdownModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Authentication.Birthday.MonthDropdown)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AuthStatefulRoundCornerBorder (copy), MonthDropdownModule (copy), TextInputBoxWithBorder (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		Age = "Authentication.SignUp.Label.Age",
		Month = "Authentication.SignUp.Label.Month"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	
	local function _()
		-- upvalues: p1 (copy), AuthStatefulRoundCornerBorder (upval), UseStateResult4 (copy)
		return if p1.errorText == "" then if UseStateResult4 then AuthStatefulRoundCornerBorder.BorderState.Focused else AuthStatefulRoundCornerBorder.BorderState.Default else AuthStatefulRoundCornerBorder.BorderState.Error
	end
	
	local function OnMonthSelected(p2)
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p2)
		p1.onMonthInputConfirmed()
	end
	
	local function OnChangeTextCallback(_)
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy), p1 (copy), UseStateResult2_1 (copy)
		if not UseStateResult3 then
			UseStateResult2_2(true)
		end
		if p1.textBoxRef and p1.textBoxRef.current then
			local Text: string = p1.textBoxRef.current.Text
			
			if string.len(Text) > 2 then
				p1.textBoxRef.current.Text = string.sub(Text, 1, 2)
			end
		end
		UseStateResult2_1(p1.textBoxRef.current.Text)
	end
	
	local function OnFocused()
		-- upvalues: UseStateResult2_3 (copy), p1 (copy)
		UseStateResult2_3(true)
		p1.onFocused()
	end
	
	local function OnFocusLost()
		-- upvalues: UseStateResult2_3 (copy), p1 (copy)
		UseStateResult2_3(false)
		p1.onFocusLost()
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult3 (copy), UseStateResult (copy), p1 (copy), UseStateResult1 (copy)
		if UseStateResult3 and UseStateResult > 0 then
			p1.onAgeAndMonthChange(tonumber(UseStateResult1), UseStateResult)
		end
	end, { UseStateResult, UseStateResult1, UseStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		if p1.textBoxRef and p1.textBoxRef.current then
			p1.textBoxRef.current:CaptureFocus()
		end
	end, { p1.textBoxRef.current })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 0)
		}),
		InputFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, 0)
			}),
			MonthFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				LayoutOrder = 3,
				Size = UDim2.new(0.5, -18, 0, p1.textInputHeight + 24)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 2) }),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 6)
				}),
				MonthLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					ZIndex = 0,
					LayoutOrder = 0,
					Text = UseLocalizationResult.Month,
					Font = UseStyleResult.Font.CaptionHeader.Font,
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				MonthDropdown = ReactModule.createElement(MonthDropdownModule, {
					layoutOrder = 1,
					shouldExpandRight = false,
					size = UDim2.new(1, 0, 0, p1.textInputHeight),
					textInputHeight = p1.textInputHeight,
					onMonthSelected = OnMonthSelected,
					screenSize = p1.screenSize
				})
			}),
			Padding = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, 36, 0, p1.textInputHeight + 24)
			}),
			AgeFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0.5, -18, 0, p1.textInputHeight + 24)
			}, {
				AgeInput = ReactModule.createElement(TextInputBoxWithBorder, {
					textInputListPadding = 6,
					layoutOrder = 2,
					textInputType = Enum.TextInputType.Number,
					textInputHeight = p1.textInputHeight,
					placeholderText = UseLocalizationResult.Age,
					labelText = UseLocalizationResult.Age,
					borderState = if p1.errorText == "" then if UseStateResult4 then AuthStatefulRoundCornerBorder.BorderState.Focused else AuthStatefulRoundCornerBorder.BorderState.Default else AuthStatefulRoundCornerBorder.BorderState.Error,
					onChangeTextCallback = OnChangeTextCallback,
					onFocused = OnFocused,
					onFocusLost = OnFocusLost,
					textBoxRef = p1.textBoxRef
				})
			})
		}),
		ErrorText = p1.errorText ~= "" and ReactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 0,
			LayoutOrder = 2,
			Text = p1.errorText,
			Font = UseStyleResult.Font.CaptionBody.Font,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize,
			TextColor3 = UseStyleResult.Theme.Alert.Color,
			TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		ValuePropPadding = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = if p1.errorText == "" then UDim2.new(0, 0, 0, 21) else UDim2.new(0, 0, 0, 6)
		})
	})
end