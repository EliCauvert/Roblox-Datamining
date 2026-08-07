local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local appCommonLibModule = require(parent_1.AppCommonLib)
local reactModule = require(parent_1.React)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local useStyle = require(parent_1.UIBlox).Core.Style.useStyle
local text = appCommonLibModule.Text
local capturesContextModule = require(parent.Context.CapturesContext)
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local onOffButtonModule = require(parent.Components.CoreUI.OnOffButton)
local videoCaptureCTAModule = require(parent.Components.CoreUI.VideoCaptureCTA)
local useKeyboardEnabledModule = require(parent.Hooks.useKeyboardEnabled)
local uDim = UDim.new(0, 8)
local var10 = if userInputService:GetPlatform() == Enum.Platform.OSX then "Opt" else "Alt"

return capturesPolicyModule.connect(function(p2) --[[ line: 222 ]]
	return { eligibleForVideoCapture = p2.eligibleForVideoCapture() }
end)(function(p0) --[[ line: 44 ]]
	-- upvalues: useStyle (ref), reactModule (ref), capturesContextModule (ref), guiService (ref), useLocalization (ref), var10 (ref), userInputService (ref), useKeyboardEnabledModule (ref), text (ref), uDim (ref), onOffButtonModule (ref), videoCaptureCTAModule (ref)
	local var11 = useStyle()
	local chromeEnabled = reactModule.useContext(capturesContextModule).chromeEnabled
	local var12, var13 = reactModule.useState(Vector2.new(0, 0))
	local var14, var15 = reactModule.useState(guiService.PreferredTextSize)
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: var15 (ref), guiService (copy)
		local var23 = guiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ line: 52 | named "onPreferredTextSizeChangedSignal" ]]
			-- upvalues: var15 (copy), guiService (copy)
			var15(guiService.PreferredTextSize)
		end)
		
		return function() --[[ line: 58 ]]
			-- upvalues: var23 (ref)
			var23:Disconnect()
		end
	end, {})
	local var16 = useLocalization({
		capturesTitle = "Feature.Captures.Title.Captures",
		educationalText = "Feature.Captures.Label.EducationalText",
		hotkeyEducationalText = {
			"Feature.Captures.Label.HotkeyEducationalText",
			keyOne = var10,
			keyTwo = userInputService:GetStringForKeyCode(Enum.KeyCode.One)
		}
	})
	local var17 = if useKeyboardEnabledModule() then var16.hotkeyEducationalText else var16.educationalText
	local color = var11.Theme.BackgroundDefault.Color
	local transparency = var11.Theme.BackgroundDefault.Transparency
	local color_1 = var11.Theme.TextDefault.Color
	local font = var11.Font.CaptionBody.Font
	local var18 = var11.Font.BaseSize * var11.Font.CaptionBody.RelativeSize
	local color_2 = var11.Theme.TextEmphasis.Color
	local font_1 = var11.Font.Header2.Font
	local var19 = var11.Font.BaseSize * var11.Font.Header2.RelativeSize
	local var20 = reactModule.useCallback(function(p1) --[[ line: 89 ]]
		-- upvalues: var13 (ref), p0 (ref)
		var13(p1.AbsoluteSize)
		
		if p0.onAbsoluteSizeChanged then
			p0.onAbsoluteSizeChanged(p1.AbsoluteSize)
		end
	end, {})
	local var21 = reactModule.useMemo(function() --[[ line: 96 ]]
		-- upvalues: text (copy), var17 (ref), font (ref), var18 (ref)
		return text.GetTextWidth(var17, font, var18)
	end, { font, var18, var14, var17 })
	local x = var12.X
	local var22 = var21 < x - 224 - 24
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = color,
		BackgroundTransparency = transparency,
		BorderSizePixel = 0,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		[reactModule.Change.AbsoluteSize] = var20
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 12)
		}),
		Layout = if not chromeEnabled then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}) else nil,
		CapturesToggleCTA = if not chromeEnabled then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = color,
			BackgroundTransparency = transparency,
			Size = UDim2.fromScale(1, 0)
		}, {
			TextFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Title = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Font = font_1,
					Size = UDim2.new(1, 0, 0, 30),
					Text = var16.capturesTitle,
					TextColor3 = color_2,
					TextSize = var19,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				EducationalLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					TextWrapped = true,
					Font = font,
					Size = UDim2.new(1, 0, 0, if not (var22 or var21 < x - 24) then text.GetTextHeight(var17, font, var18, x - 24) + 10 else 20),
					Text = var17,
					TextColor3 = color_1,
					TextSize = var18,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			CapturesToggleFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = if var22 then Vector2.new(1, 0.5) else Vector2.new(1, 0),
				Position = if var22 then UDim2.fromScale(1, 0.5) else UDim2.new(1, 0, 0, -10),
				Size = UDim2.fromOffset(224, 44)
			}, {
				OnOffButton = reactModule.createElement(onOffButtonModule, { height = 44, width = 224 })
			})
		}) else nil,
		Space = if p0.eligibleForVideoCapture and not chromeEnabled then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 20)
		}) else nil,
		VideoCaptureCTA = if p0.eligibleForVideoCapture then reactModule.createElement(videoCaptureCTAModule, {
			LayoutOrder = 3,
			closeSettingsMenu = p0.closeSettingsMenu
		}) else nil
	})
end)