local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconButton = FoundationModule.IconButton
local BuilderIconsModule = require(Parent.BuilderIcons)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local SignalsReactModule = require(Parent.SignalsReact)
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local NavButtonType = require(SduiSharedUtilities.SduiIntegrationTypes).NavButtonType
local UseScrollAwayHeaderPositionModule = require(SduiSharedUtilities.useScrollAwayHeaderPosition)

local function calculateSize(p1): UDim2 --[[ Line: 39 ]]
	-- upvalues: GetDisplayStoreFunction (copy)
	local DisplayStore = GetDisplayStoreFunction(p1)
	
	return UDim2.new(1, 0, 0, DisplayStore.getTopBarHeight(p1) - DisplayStore.getGuiInset(p1).top or 0)
end

return ReactModule.memo(function(p1) --[[ Line: 47 | Named "SduiPageNavigationHeader" ]]
	-- upvalues: UseTokensFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), SignalsReactModule (copy), calculateSize (copy), ReactModule (copy), NavButtonType (copy), IconButton (copy), FoundationModule (copy), BuilderIconsModule (copy), AppHeaderBarModule (copy), UseScrollAwayHeaderPositionModule (copy)
	local CloseCallback = p1.closeCallback
	local UseTokensResult = UseTokensFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(calculateSize)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 55 ]]
		-- upvalues: IsUsePreferredInputResultMatch (copy), CloseCallback (copy), p1 (copy), NavButtonType (upval), ReactModule (upval), UseTokensResult (copy), IconButton (upval), FoundationModule (upval), BuilderIconsModule (upval)
		return if IsUsePreferredInputResultMatch or not CloseCallback or p1.navButtonType ~= NavButtonType.back and p1.navButtonType ~= NavButtonType.close then nil else function() --[[ Line: 60 ]]
			-- upvalues: ReactModule (upval), UseTokensResult (upval), IconButton (upval), CloseCallback (upval), FoundationModule (upval), p1 (upval), NavButtonType (upval), BuilderIconsModule (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, UseTokensResult.Size.Size_1400, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, -UseTokensResult.Size.Size_250)
				}),
				IconButton = ReactModule.createElement(IconButton, {
					SelectionOrder = 10,
					isCircular = true,
					onActivated = CloseCallback,
					size = FoundationModule.Enums.InputSize.Large,
					icon = {
						name = if p1.navButtonType == NavButtonType.close then BuilderIconsModule.Icon.X else BuilderIconsModule.Icon.ChevronLargeLeft,
						variant = FoundationModule.Enums.IconVariant.Regular
					}
				})
			})
		end
	end, {
		IsUsePreferredInputResultMatch,
		p1.navButtonType,
		CloseCallback
	})
	
	return ReactModule.createElement("Frame", {
		[ReactModule.Tag] = p1.contentTag,
		Size = UseSignalBindingResult,
		LayoutOrder = p1.layoutOrder or -1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = if UseMemoResult then Enum.AutomaticSize.Y else nil,
		ZIndex = 2,
		ClipsDescendants = false
	}, {
		Content = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
			Size = UseSignalBindingResult,
			Position = UseScrollAwayHeaderPositionModule({
				enabled = p1.scrollAwayHeader,
				scrollAwayHeight = if p1.scrollAwayHeader then UseSignalBindingResult:getValue().Y.Offset else nil
			}),
			AutomaticSize = if UseMemoResult then Enum.AutomaticSize.Y else nil
		}, {
			AppHeaderBarLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			AppHeaderBar = ReactModule.createElement(AppHeaderBarModule.AppHeaderBar, {
				automaticHeight = true,
				shouldRenderTitle = true,
				onMedia = false,
				renderNavigation = UseMemoResult,
				title = p1.title,
				renderUtilities = p1.renderUtilities,
				paddingLeft = UDim.new(0, 0),
				paddingRight = UDim.new(0, 0),
				isTitleCentered = p1.navButtonType ~= NavButtonType.back
			})
		})
	})
end)