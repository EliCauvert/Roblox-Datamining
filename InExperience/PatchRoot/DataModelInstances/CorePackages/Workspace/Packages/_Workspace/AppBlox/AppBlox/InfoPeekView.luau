local parent = script:FindFirstAncestor("AppBlox").Parent
local foundationModule = require(parent.Foundation)
local peekViewModule = require(parent.PeekView)
local peekView = peekViewModule.PeekView
local peekViewState = peekViewModule.PeekViewState
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useNavigationProps (ref), reactModule (ref), useNavigation (ref), useTokens (ref), peekViewState (ref), peekView (ref)
	local var1 = useNavigationProps(function(_, p2)
		return { title = p2.title, body = p2.body }
	end)
	local var2 = reactModule.useRef(nil)
	local var3 = useNavigation()
	local var4 = useTokens()
	local title = p1.title or var1.title
	local body = p1.body or var1.body
	local headingSmall = var4.Typography.HeadingSmall
	local emphasis = var4.Color.Content.Emphasis
	local bodyLarge = var4.Typography.BodyLarge
	local default = var4.Color.Content.Default
	
	return reactModule.createElement(peekView, {
		hasScrim = true,
		mountAsFullView = true,
		returnToFullView = true,
		showDraggerInClosedState = false,
		thumbstickScrollEnabled = true,
		briefViewContentHeight = UDim.new(0, 0),
		contentFrameRef = var2,
		viewStateChanged = reactModule.useCallback(function(p2, _)
			-- upvalues: peekViewState (copy), var3 (ref)
			if p2 == peekViewState.Closed or p2 == peekViewState.Hidden then
				var3.goBack()
			end
		end, { var3 })
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var4.Padding.Medium)
		}),
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var4.Padding.XXLarge),
			PaddingLeft = UDim.new(0, var4.Padding.XXLarge),
			PaddingRight = UDim.new(0, var4.Padding.XXLarge),
			PaddingBottom = UDim.new(0, var4.Padding.XXLarge)
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