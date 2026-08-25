local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local guiService = game:GetService("GuiService")
local tweenService = game:GetService("TweenService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local backToTopClickEvent = discoveryAnalyticsModule.Events.backToTopClickEvent
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local cursorType = foundationModule.Enums.CursorType
local useLocalization = localizationModule.Hooks.useLocalization

local function scrollBackWithFocus(p0)
	-- upvalues: tweenService (ref), guiService (ref)
	local var9 = tweenService:Create(p0, TweenInfo.new(0.3), { CanvasPosition = Vector2.new(0, 0) })
	var9:Play()
	var9.Completed:Connect(function()
		-- upvalues: guiService (copy), p0 (ref)
		guiService:Select(p0)
	end)
end

return function(p1)
	-- upvalues: useTokens (ref), useCursor (ref), cursorType (ref), responsiveModule (ref), useLocalization (ref), reactModule (ref), userGameSettingsService (ref), scrollBackWithFocus (ref), backToTopClickEvent (ref)
	local var10 = useTokens()
	local var11 = responsiveModule.useLastInput() == responsiveModule.Input.Directional
	
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
			SelectionOrder = 1e999,
			Text = useLocalization({ backToTop = "Feature.GamePage.Action.BackToTop" }).backToTop,
			Font = var10.Typography.BodyLarge.Font,
			TextSize = var10.Typography.BodyLarge.FontSize,
			TextColor3 = var10.Color.Content.Emphasis.Color3,
			TextTransparency = var10.Color.Content.Emphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			SelectionImageObject = useCursor(cursorType.RoundedRect),
			[reactModule.Event.Activated] = reactModule.useCallback(function()
				-- upvalues: p1 (ref), userGameSettingsService (copy), var11 (ref), scrollBackWithFocus (copy), backToTopClickEvent (copy)
				local current = p1.scrollingFrameRef.current
				
				if not current then return end
				if userGameSettingsService.ReducedMotion then
					current.CanvasPosition = Vector2.new(0, 0)
				elseif var11 then
					scrollBackWithFocus(current)
				else
					current:ScrollToTop()
				end
				backToTopClickEvent(p1.pageContext)
			end, { p1.scrollingFrameRef, p1.pageContext, var11 })
		})
	})
end