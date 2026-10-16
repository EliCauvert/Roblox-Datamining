local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local ScrollToTopFunction = require(Parent.AppPageShell).scrollToTop
local BackToTopClickEventFunction = require(Parent.DiscoveryAnalytics).Events.backToTopClickEvent
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local CursorType = FoundationModule.Enums.CursorType
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FFlagAppPageShellScrollToTopFocus = require(Parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local SelectionOrder: number = if FFlagAppPageShellScrollToTopFocus then 1000000 else 1e999

local function scrollBackWithFocus(Target) --[[ Line: 40 ]]
	-- upvalues: TweenService (copy), GuiService (copy)
	local Tween = TweenService:Create(Target, TweenInfo.new(0.3), { CanvasPosition = Vector2.new(0, 0) })
	Tween:Play()
	Tween.Completed:Connect(function() --[[ Line: 45 ]]
		-- upvalues: GuiService (upval), Target (copy)
		GuiService:Select(Target)
	end)
end

return function(p1) --[[ Line: 50 | Named "BackToTopButton" ]]
	-- upvalues: UseTokensFunction (copy), UseCursorFunction (copy), CursorType (copy), FFlagAppPageShellScrollToTopFocus (copy), ResponsiveModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ScrollToTopFunction (copy), UserGameSettings (copy), scrollBackWithFocus (copy), BackToTopClickEventFunction (copy), SelectionOrder (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseLastInputResultMatch = if FFlagAppPageShellScrollToTopFocus then nil else ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 70),
		LayoutOrder = p1.layoutOrder
	}, {
		BackToTopButton = ReactModule.createElement("TextButton", {
			Size = UDim2.new(0.5, 0, 0, 30),
			Position = UDim2.new(0.25, 0, 0, 20),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			SelectionOrder = SelectionOrder,
			Text = UseLocalizationFunction({ backToTop = "Feature.GamePage.Action.BackToTop" }).backToTop,
			Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.BodyLarge.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodyLarge.Font) else nil,
			TextSize = UseTokensResult.Typography.BodyLarge.FontSize,
			TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
			TextTransparency = UseTokensResult.Color.Content.Emphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			SelectionImageObject = UseCursorFunction(CursorType.RoundedRect),
			[ReactModule.Event.Activated] = ReactModule.useCallback(function() --[[ Line: 60 ]]
				-- upvalues: p1 (copy), FFlagAppPageShellScrollToTopFocus (upval), ScrollToTopFunction (upval), UserGameSettings (upval), IsUseLastInputResultMatch (copy), scrollBackWithFocus (upval), BackToTopClickEventFunction (upval)
				local Current = p1.scrollingFrameRef.current
				
				if not Current then return end
				if FFlagAppPageShellScrollToTopFocus then
					ScrollToTopFunction(Current)
				elseif UserGameSettings.ReducedMotion then
					Current.CanvasPosition = Vector2.new(0, 0)
				elseif IsUseLastInputResultMatch then
					scrollBackWithFocus(Current)
				else
					Current:ScrollToTop()
				end
				BackToTopClickEventFunction(p1.pageContext)
			end, {
				p1.scrollingFrameRef,
				p1.pageContext,
				IsUseLastInputResultMatch
			})
		})
	})
end