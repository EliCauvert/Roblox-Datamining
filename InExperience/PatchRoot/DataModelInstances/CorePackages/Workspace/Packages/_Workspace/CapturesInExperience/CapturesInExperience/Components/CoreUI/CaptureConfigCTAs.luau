local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local GetTextSizeFunction = require(Parent1.Style).GetTextSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseStyleFunction = require(Parent1.UIBlox).Core.Style.useStyle
local Text = require(Parent1.AppCommonLib).Text
local CapturesContextModule = require(Parent.Context.CapturesContext)
local OnOffButtonModule = require(Parent.Components.CoreUI.OnOffButton)
local VideoCaptureCTAModule = require(Parent.Components.CoreUI.VideoCaptureCTA)
local UseKeyboardEnabledModule = require(Parent.Hooks.useKeyboardEnabled)
local _UDim = UDim.new(0, 8)
local Opt: string = if UserInputService:GetPlatform() == Enum.Platform.OSX then "Opt" else "Alt"

return (require(Parent.App.CapturesPolicy).connect(function(p1)
	return { eligibleForVideoCapture = p1.eligibleForVideoCapture() }
end)(function(Frame)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), CapturesContextModule (copy), GuiService (copy), UseLocalizationFunction (copy), Opt (copy), UserInputService (copy), UseKeyboardEnabledModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), _UDim (copy), NormalizeFontFaceFunction (copy), OnOffButtonModule (copy), VideoCaptureCTAModule (copy)
	local UseStyleResult = UseStyleFunction()
	local ChromeEnabled = ReactModule.useContext(CapturesContextModule).chromeEnabled
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(GuiService.PreferredTextSize)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), GuiService (upval)
		local Connection = GuiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
			-- upvalues: UseStateResult2_1 (upval), GuiService (upval)
			UseStateResult2_1(GuiService.PreferredTextSize)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		capturesTitle = "Feature.Captures.Title.Captures",
		educationalText = "Feature.Captures.Label.EducationalText",
		hotkeyEducationalText = {
			"Feature.Captures.Label.HotkeyEducationalText",
			keyOne = Opt,
			keyTwo = UserInputService:GetStringForKeyCode(Enum.KeyCode.One)
		}
	})
	local HotkeyEducationalText = if UseKeyboardEnabledModule() then UseLocalizationResult.hotkeyEducationalText else UseLocalizationResult.educationalText
	local Color = UseStyleResult.Theme.BackgroundDefault.Color
	local Transparency = UseStyleResult.Theme.BackgroundDefault.Transparency
	local Color1 = UseStyleResult.Theme.TextDefault.Color
	local BodySmallFont = if FoundationFontFaceMigration then UseStyleResult.Tokens.Typography.BodySmall.Font else UseStyleResult.Font.CaptionBody.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local Color2 = UseStyleResult.Theme.TextEmphasis.Color
	local TitleLargeFont = if FoundationFontFaceMigration then UseStyleResult.Tokens.Typography.TitleLarge.Font else UseStyleResult.Font.Header2.Font
	local ScaledBaseSize1 = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize
	local UseResult = ReactModule.useCallback(function(Frame1: Frame)
		-- upvalues: UseStateResult2 (copy), Frame (copy)
		UseStateResult2(Frame1.AbsoluteSize)
		
		if Frame.onAbsoluteSizeChanged then
			Frame.onAbsoluteSizeChanged(Frame1.AbsoluteSize)
		end
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), HotkeyEducationalText (copy), ScaledBaseSize (copy), BodySmallFont (copy), Text (upval)
		return if FoundationFontFaceMigration then GetTextSizeFunction(HotkeyEducationalText, ScaledBaseSize, BodySmallFont, Vector2.new(10000, 10000)).X else Text.GetTextWidth(HotkeyEducationalText, BodySmallFont, ScaledBaseSize)
	end, {
		BodySmallFont,
		ScaledBaseSize,
		UseStateResult1,
		HotkeyEducationalText
	})
	local X: number = UseStateResult.X
	local IsUseMemoResultBelow = UseMemoResult < X - 224 - 24
	local YOffset = 20
	
	if not IsUseMemoResultBelow and UseMemoResult >= X - 24 then
		YOffset = (if FoundationFontFaceMigration then GetTextSizeFunction(HotkeyEducationalText, ScaledBaseSize, BodySmallFont, Vector2.new(X - 24, 10000)).Y else Text.GetTextHeight(HotkeyEducationalText, BodySmallFont, ScaledBaseSize, X - 24)) + 10
	end
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color,
		BackgroundTransparency = Transparency,
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(1, 0),
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 12)
		}),
		Layout = if ChromeEnabled then nil else ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		CapturesToggleCTA = if ChromeEnabled then nil else ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color,
			BackgroundTransparency = Transparency,
			Size = UDim2.fromScale(1, 0)
		}, {
			TextFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Title = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Font = if FoundationFontFaceMigration then nil else TitleLargeFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleLargeFont) else nil,
					Size = UDim2.new(1, 0, 0, 30),
					Text = UseLocalizationResult.capturesTitle,
					TextColor3 = Color2,
					TextSize = ScaledBaseSize1,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				EducationalLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					TextWrapped = true,
					Font = if FoundationFontFaceMigration then nil else BodySmallFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodySmallFont) else nil,
					Size = UDim2.new(1, 0, 0, YOffset),
					Text = HotkeyEducationalText,
					TextColor3 = Color1,
					TextSize = ScaledBaseSize,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			CapturesToggleFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = if IsUseMemoResultBelow then Vector2.new(1, 0.5) else Vector2.new(1, 0),
				Position = if IsUseMemoResultBelow then UDim2.fromScale(1, 0.5) else UDim2.new(1, 0, 0, -10),
				Size = UDim2.fromOffset(224, 44)
			}, {
				OnOffButton = ReactModule.createElement(OnOffButtonModule, { height = 44, width = 224 })
			})
		}),
		Space = if Frame.eligibleForVideoCapture and not ChromeEnabled then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 20)
		}) else nil,
		VideoCaptureCTA = if Frame.eligibleForVideoCapture then ReactModule.createElement(VideoCaptureCTAModule, {
			LayoutOrder = 3,
			closeSettingsMenu = Frame.closeSettingsMenu
		}) else nil
	})
end))