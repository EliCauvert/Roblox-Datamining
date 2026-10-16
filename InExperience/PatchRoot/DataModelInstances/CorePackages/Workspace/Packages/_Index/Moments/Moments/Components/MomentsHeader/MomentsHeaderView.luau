local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local HeaderBar = require(Parent.UIBlox).App.Bar.HeaderBar
local Coachmark = FoundationModule.Coachmark
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local PlusLarge = BuilderIconsModule.Icon.PlusLarge
local ChevronLargeLeft = BuilderIconsModule.Icon.ChevronLargeLeft
local GradientBackdrop = require(Parent.MomentsCommon).Components.GradientBackdrop
local FlyoutLeftHeader = require(Parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local NavigationMenuModule = require(Moments.Components.NavigationMenu)
local ConstantsModule = require(Moments.Constants)
local FFlagMomentsFtuxTooltipCreateCopyModule = require(Moments.Flags.FFlagMomentsFtuxTooltipCreateCopy)
local FFlagMomentsCreationFeatureGate = require(Parent.SharedFlags).FFlagMomentsCreationFeatureGate

local function renderAction(p1, Icon, OnActivated, LayoutOrder) --[[ Line: 67 ]]
	-- upvalues: ReactModule (copy), IconButton (copy), ButtonVariant (copy), InputSize (copy)
	return ReactModule.createElement(IconButton, {
		isCircular = true,
		Selectable = true,
		LayoutOrder = LayoutOrder,
		icon = Icon,
		onActivated = OnActivated,
		variant = ButtonVariant.Utility,
		size = InputSize.Medium,
		testId = `--moments-header--actions--{p0}`
	})
end

return function(p1) --[[ Line: 80 | Named "MomentsHeaderView" ]]
	-- upvalues: renderAction (copy), ChevronLargeLeft (copy), PlusLarge (copy), ReactModule (copy), IconButton (copy), ButtonVariant (copy), InputSize (copy), NavigationMenuModule (copy), View (copy), FlyoutSidePanelIXP (copy), FlyoutLeftHeader (copy), Text (copy), FFlagMomentsCreationFeatureGate (copy), FoundationModule (copy), FFlagMomentsFtuxTooltipCreateCopyModule (copy), Coachmark (copy), HeaderBar (copy), GradientBackdrop (copy), ConstantsModule (copy)
	local RenderLeft: (() -> any)? = nil
	local RenderRight: (() -> any)? = nil
	
	if p1.variant == "back" then
		RenderLeft = function() --[[ Line: 85 ]]
			-- upvalues: renderAction (upval), ChevronLargeLeft (upval), p1 (copy)
			return renderAction("back", ChevronLargeLeft, p1.onBack, 1)
		end
		
		if p1.showInteractiveButtons and p1.showNavigationMenu then
			local t = {}
			
			if p1.showCreateButton then
				t.CreateMomentButton = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					Selectable = true,
					testId = "--moments-header--actions--create",
					icon = PlusLarge,
					onActivated = p1.onCreateMomentButtonPressed,
					variant = ButtonVariant.Utility,
					size = InputSize.Medium
				})
			end
			t.NavigationMenu = ReactModule.createElement(NavigationMenuModule, {
				layoutOrder = 2,
				buttonTestId = "--moments-header--actions--more",
				buttonVariant = ButtonVariant.Utility,
				onNavigateToTrending = p1.onNavigateToTrending,
				onNavigateToMyMoments = p1.onNavigateToMyMoments
			})
			
			RenderRight = function() --[[ Line: 104 ]]
				-- upvalues: ReactModule (upval), View (upval), t (copy)
				return ReactModule.createElement(View, { tag = "row align-y-center gap-xsmall auto-xy" }, t)
			end
		elseif p1.showInteractiveButtons and p1.showCreateButton then
			RenderRight = function() --[[ Line: 110 ]]
				-- upvalues: renderAction (upval), PlusLarge (upval), p1 (copy)
				return renderAction("create", PlusLarge, p1.onCreateMomentButtonPressed, 1)
			end
		end
	elseif p1.variant == "base" then
		local IsFlyoutSidePanelEnabled = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()
		local IsFlyoutSidePanelEnabled1 = p1.showInteractiveButtons and (p1.showHamburger and IsFlyoutSidePanelEnabled)
		
		RenderLeft = function() --[[ Line: 120 ]]
			-- upvalues: IsFlyoutSidePanelEnabled1 (copy), ReactModule (upval), FlyoutLeftHeader (upval), p1 (copy), IsFlyoutSidePanelEnabled (copy), FlyoutSidePanelIXP (upval), View (upval), Text (upval)
			return if IsFlyoutSidePanelEnabled1 then ReactModule.createElement(FlyoutLeftHeader, {
				isRobloxLogoEnabled = false,
				titleText = p1.title,
				isFlyoutEntrypointEnabled = IsFlyoutSidePanelEnabled,
				isAlternateEntryPointEnabled = FlyoutSidePanelIXP.isAlternateEntryPointEnabled()
			}) else ReactModule.createElement(View, { tag = "row align-x-left align-y-center auto-xy" }, {
				Title = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-large",
					Text = p1.title,
					textStyle = p1.titleTextStyle
				})
			})
		end
		
		if p1.showInteractiveButtons then
			local Element = nil
			
			if p1.showCreateButton or not FFlagMomentsCreationFeatureGate then
				local Element1 = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					Selectable = true,
					testId = "--moments-header--actions--create",
					icon = PlusLarge,
					onActivated = p1.onCreateMomentButtonPressed,
					variant = ButtonVariant.Utility,
					size = InputSize.Medium
				})
				Element = if p1.showFtuxTooltip then ReactModule.createElement(Coachmark, {
					LayoutOrder = 1,
					isOpen = p1.showFtuxTooltip,
					onClose = p1.onFtuxTooltipClosed,
					side = FoundationModule.Enums.PopoverSide.Bottom,
					title = if FFlagMomentsFtuxTooltipCreateCopyModule then p1.ftuxTooltipTitle else "Share Your First Moment",
					text = if FFlagMomentsFtuxTooltipCreateCopyModule then p1.ftuxTooltipText else "Tap + to share a moment from your captures",
					align = FoundationModule.Enums.PopoverAlign.End
				}, Element1) else ReactModule.createElement(View, { LayoutOrder = 1, tag = "auto-xy" }, { Action = Element1 })
			end
			RenderRight = function() --[[ Line: 178 ]]
				-- upvalues: ReactModule (upval), View (upval), Element (ref), NavigationMenuModule (upval), ButtonVariant (upval), p1 (copy)
				return ReactModule.createElement(View, { tag = "row align-y-center gap-xsmall auto-xy" }, {
					CreateMomentButton = Element,
					NavigationMenu = ReactModule.createElement(NavigationMenuModule, {
						layoutOrder = 2,
						buttonTestId = "--moments-header--actions--more",
						buttonVariant = ButtonVariant.Utility,
						onNavigateToTrending = p1.onNavigateToTrending,
						onNavigateToMyMoments = p1.onNavigateToMyMoments
					})
				})
			end
		end
	elseif p1.variant == "close" then
		RenderRight = function() --[[ Line: 194 ]]
			-- upvalues: renderAction (upval), p1 (copy)
			return renderAction("close", "icons/navigation/close_small", p1.onClose, 1)
		end
	end
	local config = {
		HeaderContent = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			testId = "--moments-header-content",
			ZIndex = 2
		}, {
			SafeAreaContent = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				testId = "--moments-header-safe-area",
				padding = p1.headerPadding
			}, {
				HeaderBarContainer = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y",
					testId = "--moments-header",
					Size = UDim2.new(1, 0, 0, p1.headerHeight)
				}, {
					HeaderBar = ReactModule.createElement(HeaderBar, {
						isTitleCentered = false,
						isOnMedia = false,
						backgroundTransparency = 1,
						zIndex = 2,
						barHeight = p1.headerHeight,
						paddingLeft = UDim.new(0, 0),
						paddingRight = UDim.new(0, 0),
						renderLeft = RenderLeft,
						renderRight = RenderRight
					})
				})
			})
		})
	}
	
	if p1.showTopScrim then
		config.GradientScrim = ReactModule.createElement(GradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, p1.scrimHeight)
		})
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0",
		testId = "--moments-header-root",
		LayoutOrder = p1.layoutOrder,
		ZIndex = ConstantsModule.DisplayOrder.FeedTopBar
	}, config)
end