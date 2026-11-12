local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FooterCornerButtonStyle = require(Parent.GameTile).FooterCornerButtonStyle

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), FooterCornerButtonStyle (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		joinEvent = "Feature.VirtualEvents.JoinEvent"
	})
	local BackgroundColor3 = UseDesignTokensResult.Color.ActionEmphasis.Background.Color3
	local ForegroundColor3 = UseDesignTokensResult.Color.ActionEmphasis.Foreground.Color3
	local JoinEvent = UseLocalizationResult.joinEvent
	
	if p1.buttonStyle == FooterCornerButtonStyle.Follow then
		BackgroundColor3 = UseTokensResult.Color.ActionSubEmphasis.Background.Color3
		ForegroundColor3 = UseTokensResult.Color.ActionSubEmphasis.Foreground.Color3
		JoinEvent = UseLocalizationResult.notifyMe
	elseif p1.buttonStyle == FooterCornerButtonStyle.Following then
		ForegroundColor3 = UseTokensResult.Color.ActionStandard.Foreground.Color3
		JoinEvent = UseLocalizationResult.unfollowEvent
	end
	local IsButtonStyleMatch = p1.buttonStyle == FooterCornerButtonStyle.Following
	local TextTransparency: number = if p1.disabled then 0.5 else 0
	
	return ReactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_700),
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		TextSize = UseDesignTokensResult.Size.Size_350,
		Font = if FoundationFontFaceMigration then nil else UseDesignTokensResult.Typography.HeadingSmall.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.HeadingSmall.Font) else nil,
		BackgroundColor3 = BackgroundColor3,
		TextColor3 = ForegroundColor3,
		AutoButtonColor = false,
		Text = JoinEvent,
		BackgroundTransparency = if IsButtonStyleMatch then 1 else TextTransparency,
		TextTransparency = TextTransparency,
		[ReactModule.Event.Activated] = p1.onActivated
	}, {
		EventButtonCorners = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		OutlineFrame = if IsButtonStyleMatch then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -2, 1, -2),
			Position = UDim2.new(0, 1, 0, 1)
		}, {
			OutlineCorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseDesignTokensResult.Size.Size_200 - 2)
			}),
			OutlineStroke = ReactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = ForegroundColor3,
				Transparency = TextTransparency
			})
		}) else nil
	})
end