local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local plusLarge = builderIconsModule.Icon.PlusLarge
local threeBarsHorizontal = builderIconsModule.Icon.ThreeBarsHorizontal
local coachmark = foundationModule.Coachmark
local foundationProvider = foundationModule.FoundationProvider
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local colorMode = foundationModule.Enums.ColorMode
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local navigationMenuModule = require(moments.Components.NavigationMenu)
local constantsModule = require(moments.Constants)
local _ = require(script.Parent.MomentsHeaderView)

return function(p0) --[[ line: 34 | named "MomentsLegacyHeaderView" ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), buttonVariant (ref), inputSize (ref), plusLarge (ref), foundationModule (ref), coachmark (ref), text (ref), threeBarsHorizontal (ref), navigationMenuModule (ref), view (ref), foundationProvider (ref), colorMode (ref), gradientBackdrop (ref), constantsModule (ref)
	local t = nil
	
	if p0.variant == "back" then
		t = {
			BackButton = reactModule.createElement(iconButton, {
				isCircular = true,
				Selectable = true,
				testId = "--moments-back-header-back",
				icon = iconName.ChevronLargeLeft,
				onActivated = p0.onBack,
				variant = buttonVariant.OverMedia,
				size = inputSize.Medium
			})
		}
	elseif p0.variant == "base" then
		local var8 = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			isCircular = true,
			Selectable = true,
			testId = "--moments-top-bar-create",
			icon = plusLarge,
			onActivated = p0.onCreateMomentButtonPressed,
			variant = buttonVariant.OverMedia,
			size = inputSize.Medium
		})
		local var9 = if p0.showFtuxTooltip then reactModule.createElement(coachmark, {
			LayoutOrder = 1,
			title = "Share Your First Moment",
			text = "Tap + to share a moment from your captures",
			isOpen = p0.showFtuxTooltip,
			onClose = p0.onFtuxTooltipClosed,
			side = foundationModule.Enums.PopoverSide.Bottom,
			align = foundationModule.Enums.PopoverAlign.End
		}, var8) else var8
		local t_1 = {
			MomentsTitle = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "shrink auto-xy text-heading-large text-truncate-end",
				Text = p0.title,
				textStyle = p0.titleTextStyle
			})
		}
		
		if p0.showInteractiveButtons and p0.showHamburger then
			t_1.Hamburger = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				Selectable = true,
				testId = "--moments-top-bar-hamburger",
				icon = threeBarsHorizontal,
				onActivated = p0.onHamburgerPressed,
				variant = buttonVariant.OverMedia,
				size = inputSize.Medium
			})
		end
		t = {
			LeftCluster = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center grow gap-small auto-y"
			}, t_1),
			RightCluster = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-x-right align-y-center gap-medium auto-xy"
			}, if p0.showInteractiveButtons then {
				CreateMomentButton = var9,
				NavigationMenu = reactModule.createElement(navigationMenuModule, {
					layoutOrder = 2,
					onNavigateToTrending = p0.onNavigateToTrending,
					onNavigateToMyMoments = p0.onNavigateToMyMoments
				})
			} else nil)
		}
	elseif p0.variant == "close" then
		t = {
			Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "grow auto-y" }),
			CloseButton = reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				icon = "icons/navigation/close_small",
				isCircular = true,
				Selectable = true,
				testId = "--moments-top-bar-close",
				onActivated = p0.onClose,
				variant = buttonVariant.OverMedia,
				size = inputSize.Medium
			})
		}
	end
	local t_1 = {
		HeaderContent = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			ZIndex = 2,
			padding = p0.headerPadding
		}, {
			OverMediaTheme = reactModule.createElement(foundationProvider, { colorMode = colorMode.Light }, {
				HeaderRow = reactModule.createElement(view, {
					tag = "row align-y-center size-full-0 auto-y padding-x-large padding-top-medium"
				}, t)
			})
		})
	}
	
	if p0.showTopScrim then
		t_1.GradientScrim = reactModule.createElement(gradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, p0.scrimHeight)
		})
	end
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}, t_1)
end