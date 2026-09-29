local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local appCommonLibModule = require(parent_1.AppCommonLib)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local foundationModule = require(parent_1.Foundation)
local getTextSize = require(parent_1.Style).GetTextSize
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local useLocalization = localizationModule.Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local text = appCommonLibModule.Text
local capturesContextModule = require(parent.Context.CapturesContext)
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local onOffButtonModule = require(parent.Components.CoreUI.OnOffButton)
local videoCaptureCTAModule = require(parent.Components.CoreUI.VideoCaptureCTA)
local useKeyboardEnabledModule = require(parent.Hooks.useKeyboardEnabled)
local uDim = UDim.new(0, 8)
local var1 = if userInputService:GetPlatform() == Enum.Platform.OSX then "Opt" else "Alt"

return capturesPolicyModule.connect(function(p1)
	return { eligibleForVideoCapture = p1.eligibleForVideoCapture() }
end)(function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), capturesContextModule (ref), guiService (ref), useLocalization (ref), var1 (ref), userInputService (ref), useKeyboardEnabledModule (ref), foundationFontFaceMigration (ref), getTextSize (ref), text (ref), uDim (ref), normalizeFontFace (ref), onOffButtonModule (ref), videoCaptureCTAModule (ref)
	local var2 = useStyle()
	local chromeEnabled = reactModule.useContext(capturesContextModule).chromeEnabled
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	local var5, var6 = reactModule.useState(guiService.PreferredTextSize)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), guiService (copy)
		local var7 = guiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
			-- upvalues: var6 (copy), guiService (copy)
			var6(guiService.PreferredTextSize)
		end)
		
		return function()
			-- upvalues: var7 (ref)
			var7:Disconnect()
		end
	end, {})
	local var7 = useLocalization({
		capturesTitle = "Feature.Captures.Title.Captures",
		educationalText = "Feature.Captures.Label.EducationalText",
		hotkeyEducationalText = {
			"Feature.Captures.Label.HotkeyEducationalText",
			keyOne = var1,
			keyTwo = userInputService:GetStringForKeyCode(Enum.KeyCode.One)
		}
	})
	local var8 = if useKeyboardEnabledModule() then var7.hotkeyEducationalText else var7.educationalText
	local color = var2.Theme.BackgroundDefault.Color
	local transparency = var2.Theme.BackgroundDefault.Transparency
	local color_1 = var2.Theme.TextDefault.Color
	local var9 = if foundationFontFaceMigration then var2.Tokens.Typography.BodySmall.Font else var2.Font.CaptionBody.Font
	local var10 = var2.Font.BaseSize * var2.Font.CaptionBody.RelativeSize
	local color_2 = var2.Theme.TextEmphasis.Color
	local var11 = if foundationFontFaceMigration then var2.Tokens.Typography.TitleLarge.Font else var2.Font.Header2.Font
	local var12 = var2.Font.BaseSize * var2.Font.Header2.RelativeSize
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), p1 (ref)
		var4(p2.AbsoluteSize)
		
		if p1.onAbsoluteSizeChanged then
			p1.onAbsoluteSizeChanged(p2.AbsoluteSize)
		end
	end, {})
	local var14 = reactModule.useMemo(function()
		-- upvalues: foundationFontFaceMigration (copy), getTextSize (copy), var8 (ref), var10 (ref), var9 (ref), text (copy)
		return if foundationFontFaceMigration then getTextSize(var8, var10, var9, Vector2.new(10000, 10000)).X else text.GetTextWidth(var8, var9, var10)
	end, { var9, var10, var5, var8 })
	local x = var3.X
	local var15 = var14 < x - 224 - 24
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = color,
		BackgroundTransparency = transparency,
		BorderSizePixel = 0,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		[reactModule.Change.AbsoluteSize] = var13
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
					Font = if foundationFontFaceMigration then nil else var11,
					FontFace = if foundationFontFaceMigration then normalizeFontFace(var11) else nil,
					Size = UDim2.new(1, 0, 0, 30),
					Text = var7.capturesTitle,
					TextColor3 = color_2,
					TextSize = var12,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				EducationalLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					TextWrapped = true,
					Font = if foundationFontFaceMigration then nil else var9,
					FontFace = if foundationFontFaceMigration then normalizeFontFace(var9) else nil,
					Size = UDim2.new(1, 0, 0, if not (var15 or var14 < x - 24) then (if foundationFontFaceMigration then getTextSize(var8, var10, var9, Vector2.new(x - 24, 10000)).Y else text.GetTextHeight(var8, var9, var10, x - 24)) + 10 else 20),
					Text = var8,
					TextColor3 = color_1,
					TextSize = var10,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			CapturesToggleFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = if var15 then Vector2.new(1, 0.5) else Vector2.new(1, 0),
				Position = if var15 then UDim2.fromScale(1, 0.5) else UDim2.new(1, 0, 0, -10),
				Size = UDim2.fromOffset(224, 44)
			}, {
				OnOffButton = reactModule.createElement(onOffButtonModule, { height = 44, width = 224 })
			})
		}) else nil,
		Space = if p1.eligibleForVideoCapture and not chromeEnabled then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 20)
		}) else nil,
		VideoCaptureCTA = if p1.eligibleForVideoCapture then reactModule.createElement(videoCaptureCTAModule, {
			LayoutOrder = 3,
			closeSettingsMenu = p1.closeSettingsMenu
		}) else nil
	})
end)