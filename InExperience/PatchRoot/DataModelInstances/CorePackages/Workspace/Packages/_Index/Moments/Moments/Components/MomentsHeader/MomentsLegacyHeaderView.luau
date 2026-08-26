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

return function(p1)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), buttonVariant (ref), inputSize (ref), view (ref), plusLarge (ref), foundationModule (ref), coachmark (ref), text (ref), threeBarsHorizontal (ref), navigationMenuModule (ref), foundationProvider (ref), colorMode (ref), gradientBackdrop (ref), constantsModule (ref)
	local t = nil
	
	if p1.variant == "back" then
		local t_1 = {
			BackButton = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				Selectable = true,
				testId = "--moments-back-header-back",
				icon = iconName.ChevronLargeLeft,
				onActivated = p1.onBack,
				variant = buttonVariant.OverMedia,
				size = inputSize.Medium
			})
		}
		
		if p1.showInteractiveButtons and p1.showCreateButton then
			t_1.Spacer = reactModule.createElement(view, { LayoutOrder = 2, tag = "grow auto-y" })
			t_1.CreateButton = reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				isCircular = true,
				Selectable = true,
				testId = "--moments-top-bar-create",
				icon = plusLarge,
				onActivated = p1.onCreateMomentButtonPressed,
				variant = buttonVariant.OverMedia,
				size = inputSize.Medium
			})
		end
		t = t_1
	elseif p1.variant == "base" then
		local var1 = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			isCircular = true,
			Selectable = true,
			testId = "--moments-top-bar-create",
			icon = plusLarge,
			onActivated = p1.onCreateMomentButtonPressed,
			variant = buttonVariant.OverMedia,
			size = inputSize.Medium
		})
		local var2 = if p1.showFtuxTooltip then reactModule.createElement(coachmark, {
			LayoutOrder = 1,
			title = "Share Your First Moment",
			text = "Tap + to share a moment from your captures",
			isOpen = p1.showFtuxTooltip,
			onClose = p1.onFtuxTooltipClosed,
			side = foundationModule.Enums.PopoverSide.Bottom,
			align = foundationModule.Enums.PopoverAlign.End
		}, var1) else var1
		local t_1 = {
			MomentsTitle = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "shrink auto-xy text-heading-large text-truncate-end",
				Text = p1.title,
				textStyle = p1.titleTextStyle
			})
		}
		
		if p1.showInteractiveButtons and p1.showHamburger then
			t_1.Hamburger = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				Selectable = true,
				testId = "--moments-top-bar-hamburger",
				icon = threeBarsHorizontal,
				onActivated = p1.onHamburgerPressed,
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
			}, if p1.showInteractiveButtons then {
				CreateMomentButton = var2,
				NavigationMenu = reactModule.createElement(navigationMenuModule, {
					layoutOrder = 2,
					onNavigateToTrending = p1.onNavigateToTrending,
					onNavigateToMyMoments = p1.onNavigateToMyMoments
				})
			} else nil)
		}
	elseif p1.variant == "close" then
		t = {
			Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "grow auto-y" }),
			CloseButton = reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				icon = "icons/navigation/close_small",
				isCircular = true,
				Selectable = true,
				testId = "--moments-top-bar-close",
				onActivated = p1.onClose,
				variant = buttonVariant.OverMedia,
				size = inputSize.Medium
			})
		}
	end
	local t_1 = {
		HeaderContent = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			ZIndex = 2,
			padding = p1.headerPadding
		}, {
			OverMediaTheme = reactModule.createElement(foundationProvider, { colorMode = colorMode.Light }, {
				HeaderRow = reactModule.createElement(view, {
					tag = "row align-y-center size-full-0 auto-y padding-x-large padding-top-medium"
				}, t)
			})
		})
	}
	
	if p1.showTopScrim then
		t_1.GradientScrim = reactModule.createElement(gradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, p1.scrimHeight)
		})
	end
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}, t_1)
end