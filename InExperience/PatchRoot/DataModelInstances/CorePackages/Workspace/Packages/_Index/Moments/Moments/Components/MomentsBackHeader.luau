local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local foundationProvider = foundationModule.FoundationProvider
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local theme = foundationModule.Enums.Theme
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(moments.Constants)

return function(p0) --[[ line: 41 | named "MomentsBackHeader" ]]
	-- upvalues: useTokens (ref), useDeviceInsets (ref), reactModule (ref), view (ref), constantsModule (ref), gradientBackdrop (ref), foundationProvider (ref), theme (ref), iconButton (ref), iconName (ref), buttonVariant (ref), inputSize (ref)
	local var5 = useTokens()
	local var6 = useDeviceInsets()
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}, {
		GradientScrim = reactModule.createElement(gradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, var6.top + var5.Size.Size_2000 + var5.Size.Size_1600)
		}),
		HeaderContent = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			ZIndex = 2,
			padding = {
				left = UDim.new(0, var6.left),
				right = UDim.new(0, var6.right),
				top = UDim.new(0, var6.top)
			}
		}, {
			OverMediaTheme = reactModule.createElement(foundationProvider, { theme = theme.Light }, {
				HeaderRow = reactModule.createElement(view, {
					tag = "row align-x-left align-y-center size-full-0 auto-y padding-x-large padding-top-medium"
				}, {
					BackButton = reactModule.createElement(iconButton, {
						isCircular = true,
						Selectable = true,
						testId = "--moments-back-header-back",
						icon = iconName.ChevronLargeLeft,
						onActivated = p0.onBack,
						variant = buttonVariant.OverMedia,
						size = inputSize.Medium
					})
				})
			})
		})
	})
end