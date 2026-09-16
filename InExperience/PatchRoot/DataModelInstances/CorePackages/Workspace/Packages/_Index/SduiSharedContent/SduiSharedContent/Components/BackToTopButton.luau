local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local guiService = game:GetService("GuiService")
local tweenService = game:GetService("TweenService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local appPageShellModule = require(parent.AppPageShell)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local scrollToTop = appPageShellModule.scrollToTop
local backToTopClickEvent = discoveryAnalyticsModule.Events.backToTopClickEvent
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local cursorType = foundationModule.Enums.CursorType
local useLocalization = localizationModule.Hooks.useLocalization
local fFlagAppPageShellScrollToTopFocus = require(parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local var1 = if fFlagAppPageShellScrollToTopFocus then 1000000 else 1e999

local function scrollBackWithFocus(p1)
	-- upvalues: tweenService (ref), guiService (ref)
	local var2 = tweenService:Create(p1, TweenInfo.new(0.3), { CanvasPosition = Vector2.new(0, 0) })
	var2:Play()
	var2.Completed:Connect(function()
		-- upvalues: guiService (copy), p1 (ref)
		guiService:Select(p1)
	end)
end

return function(p1)
	-- upvalues: useTokens (ref), useCursor (ref), cursorType (ref), fFlagAppPageShellScrollToTopFocus (ref), responsiveModule (ref), useLocalization (ref), reactModule (ref), scrollToTop (ref), userGameSettingsService (ref), scrollBackWithFocus (ref), backToTopClickEvent (ref), var1 (ref)
	local var2 = useTokens()
	local var3 = if fFlagAppPageShellScrollToTopFocus then nil else responsiveModule.useLastInput() == responsiveModule.Input.Directional
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 70),
		LayoutOrder = p1.layoutOrder
	}, {
		BackToTopButton = reactModule.createElement("TextButton", {
			Size = UDim2.new(0.5, 0, 0, 30),
			Position = UDim2.new(0.25, 0, 0, 20),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			SelectionOrder = var1,
			Text = useLocalization({ backToTop = "Feature.GamePage.Action.BackToTop" }).backToTop,
			Font = var2.Typography.BodyLarge.Font,
			TextSize = var2.Typography.BodyLarge.FontSize,
			TextColor3 = var2.Color.Content.Emphasis.Color3,
			TextTransparency = var2.Color.Content.Emphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			SelectionImageObject = useCursor(cursorType.RoundedRect),
			[reactModule.Event.Activated] = reactModule.useCallback(function()
				-- upvalues: p1 (ref), fFlagAppPageShellScrollToTopFocus (copy), scrollToTop (copy), userGameSettingsService (copy), var3 (ref), scrollBackWithFocus (copy), backToTopClickEvent (copy)
				local current = p1.scrollingFrameRef.current
				
				if not current then return end
				if fFlagAppPageShellScrollToTopFocus then
					scrollToTop(current)
				elseif userGameSettingsService.ReducedMotion then
					current.CanvasPosition = Vector2.new(0, 0)
				elseif var3 then
					scrollBackWithFocus(current)
				else
					current:ScrollToTop()
				end
				backToTopClickEvent(p1.pageContext)
			end, { p1.scrollingFrameRef, p1.pageContext, var3 })
		})
	})
end