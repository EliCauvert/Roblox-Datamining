local parent = script:FindFirstAncestor("AppBlox").Parent
local foundationModule = require(parent.Foundation)
local peekViewModule = require(parent.PeekView)
local peekView = peekViewModule.PeekView
local peekViewState = peekViewModule.PeekViewState
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 24 | named "InfoPeekView" ]]
	-- upvalues: useNavigationProps (ref), reactModule (ref), useNavigation (ref), useTokens (ref), peekViewState (ref), peekView (ref)
	local var3 = useNavigationProps(function(_, p1) --[[ line: 25 ]]
		return { title = p1.title, body = p1.body }
	end)
	local var4 = reactModule.useRef(nil)
	local var5 = useNavigation()
	local var6 = useTokens()
	local title = p0.title or var3.title
	local body = p0.body or var3.body
	local headingSmall = var6.Typography.HeadingSmall
	local emphasis = var6.Color.Content.Emphasis
	local bodyLarge = var6.Typography.BodyLarge
	local default = var6.Color.Content.Default
	
	return reactModule.createElement(peekView, {
		hasScrim = true,
		mountAsFullView = true,
		returnToFullView = true,
		showDraggerInClosedState = false,
		thumbstickScrollEnabled = true,
		briefViewContentHeight = UDim.new(0, 0),
		contentFrameRef = var4,
		viewStateChanged = reactModule.useCallback(function(p2, _) --[[ line: 45 ]]
			-- upvalues: peekViewState (copy), var5 (ref)
			if p2 == peekViewState.Closed or p2 == peekViewState.Hidden then
				var5.goBack()
			end
		end, { var5 })
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var6.Padding.Medium)
		}),
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var6.Padding.XXLarge),
			PaddingLeft = UDim.new(0, var6.Padding.XXLarge),
			PaddingRight = UDim.new(0, var6.Padding.XXLarge),
			PaddingBottom = UDim.new(0, var6.Padding.XXLarge)
		}),
		TitleText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Text = title,
			Font = headingSmall.Font,
			TextSize = headingSmall.FontSize,
			TextColor3 = emphasis.Color3,
			TextTransparency = emphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		BodyText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Text = body,
			Font = bodyLarge.Font,
			TextSize = bodyLarge.FontSize,
			TextColor3 = default.Color3,
			TextTransparency = default.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})
end