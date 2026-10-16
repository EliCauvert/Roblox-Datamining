local Parent = script:FindFirstAncestor("AppBlox").Parent
local FoundationModule = require(Parent.Foundation)
local PeekViewModule = require(Parent.PeekView)
local PeekView = PeekViewModule.PeekView
local PeekViewState = PeekViewModule.PeekViewState
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

return function(p1) --[[ Line: 26 | Named "InfoPeekView" ]]
	-- upvalues: UseNavigationPropsFunction (copy), ReactModule (copy), UseNavigationFunction (copy), UseTokensFunction (copy), PeekViewState (copy), PeekView (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p2) --[[ Line: 27 ]]
		return { title = p2.title, body = p2.body }
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = UseTokensFunction()
	local HeadingSmall = UseTokensResult.Typography.HeadingSmall
	local Emphasis = UseTokensResult.Color.Content.Emphasis
	local BodyLarge = UseTokensResult.Typography.BodyLarge
	local Default = UseTokensResult.Color.Content.Default
	
	return ReactModule.createElement(PeekView, {
		hasScrim = true,
		mountAsFullView = true,
		returnToFullView = true,
		showDraggerInClosedState = false,
		thumbstickScrollEnabled = true,
		briefViewContentHeight = UDim.new(0, 0),
		contentFrameRef = UseRefResult,
		viewStateChanged = ReactModule.useCallback(function(Closed, _) --[[ Line: 47 ]]
			-- upvalues: PeekViewState (upval), UseNavigationResult (copy)
			if Closed == PeekViewState.Closed or Closed == PeekViewState.Hidden then
				UseNavigationResult.goBack()
			end
		end, { UseNavigationResult })
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Padding.Medium)
		}),
		ContentPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.XXLarge),
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.XXLarge),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.XXLarge),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.XXLarge)
		}),
		TitleText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Text = p1.title or UseNavigationPropsResult.title,
			Font = if FoundationFontFaceMigration then nil else HeadingSmall.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(HeadingSmall.Font) else nil,
			TextSize = HeadingSmall.FontSize,
			TextColor3 = Emphasis.Color3,
			TextTransparency = Emphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		BodyText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Text = p1.body or UseNavigationPropsResult.body,
			Font = if FoundationFontFaceMigration then nil else BodyLarge.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodyLarge.Font) else nil,
			TextSize = BodyLarge.FontSize,
			TextColor3 = Default.Color3,
			TextTransparency = Default.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})
end