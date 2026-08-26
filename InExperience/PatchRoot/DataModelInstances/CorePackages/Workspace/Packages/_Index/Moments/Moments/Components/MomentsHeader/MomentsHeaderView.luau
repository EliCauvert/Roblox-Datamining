local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local headerBar = require(parent.UIBlox).App.Bar.HeaderBar
local coachmark = foundationModule.Coachmark
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local plusLarge = builderIconsModule.Icon.PlusLarge
local chevronLargeLeft = builderIconsModule.Icon.ChevronLargeLeft
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local flyoutLeftHeader = require(parent.FlyoutSidePanel).Components.FlyoutLeftHeader
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local navigationMenuModule = require(moments.Components.NavigationMenu)
local constantsModule = require(moments.Constants)

local function renderAction(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), iconButton (ref), buttonVariant (ref), inputSize (ref)
	return reactModule.createElement(iconButton, {
		isCircular = true,
		Selectable = true,
		LayoutOrder = p4,
		icon = p2,
		onActivated = p3,
		variant = buttonVariant.Utility,
		size = inputSize.Medium,
		testId = `--moments-header--actions--{p0}`
	})
end

return function(p1)
	-- upvalues: renderAction (ref), chevronLargeLeft (ref), plusLarge (ref), flyoutSidePanelIXP (ref), reactModule (ref), flyoutLeftHeader (ref), view (ref), text (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), foundationModule (ref), coachmark (ref), navigationMenuModule (ref), headerBar (ref), gradientBackdrop (ref), constantsModule (ref)
	local var1 = nil
	local var2 = nil
	
	if p1.variant == "back" then
		var1 = function()
			-- upvalues: renderAction (copy), chevronLargeLeft (copy), p1 (ref)
			return renderAction("back", chevronLargeLeft, p1.onBack, 1)
		end
		
		if p1.showInteractiveButtons and p1.showCreateButton then
			var2 = function()
				-- upvalues: renderAction (copy), plusLarge (copy), p1 (ref)
				return renderAction("create", plusLarge, p1.onCreateMomentButtonPressed, 1)
			end
		end
	elseif p1.variant == "base" then
		local var3 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled()
		local var4 = p1.showInteractiveButtons and (p1.showHamburger and var3)
		
		var1 = function()
			-- upvalues: var4 (ref), reactModule (copy), flyoutLeftHeader (copy), p1 (ref), var3 (ref), flyoutSidePanelIXP (copy), view (copy), text (copy)
			return if var4 then reactModule.createElement(flyoutLeftHeader, {
				isRobloxLogoEnabled = false,
				titleText = p1.title,
				isFlyoutEntrypointEnabled = var3,
				isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
			}) else reactModule.createElement(view, { tag = "row align-x-left align-y-center auto-xy" }, {
				Title = reactModule.createElement(text, {
					tag = "auto-xy text-heading-large",
					Text = p1.title,
					textStyle = p1.titleTextStyle
				})
			})
		end
		
		if p1.showInteractiveButtons then
			local var5 = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				Selectable = true,
				testId = "--moments-header--actions--create",
				icon = plusLarge,
				onActivated = p1.onCreateMomentButtonPressed,
				variant = buttonVariant.Utility,
				size = inputSize.Medium
			})
			local var6 = if p1.showFtuxTooltip then reactModule.createElement(coachmark, {
				LayoutOrder = 1,
				title = "Share Your First Moment",
				text = "Tap + to share a moment from your captures",
				isOpen = p1.showFtuxTooltip,
				onClose = p1.onFtuxTooltipClosed,
				side = foundationModule.Enums.PopoverSide.Bottom,
				align = foundationModule.Enums.PopoverAlign.End
			}, var5) else reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy" }, { Action = var5 })
			
			var2 = function()
				-- upvalues: reactModule (copy), view (copy), var6 (write), navigationMenuModule (copy), buttonVariant (copy), p1 (ref)
				return reactModule.createElement(view, { tag = "row align-y-center gap-xsmall auto-xy" }, {
					CreateMomentButton = var6,
					NavigationMenu = reactModule.createElement(navigationMenuModule, {
						layoutOrder = 2,
						buttonTestId = "--moments-header--actions--more",
						buttonVariant = buttonVariant.Utility,
						onNavigateToTrending = p1.onNavigateToTrending,
						onNavigateToMyMoments = p1.onNavigateToMyMoments
					})
				})
			end
		end
	elseif p1.variant == "close" then
		var2 = function()
			-- upvalues: renderAction (copy), p1 (ref)
			return renderAction("close", "icons/navigation/close_small", p1.onClose, 1)
		end
	end
	local t = {
		HeaderContent = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			testId = "--moments-header-content",
			ZIndex = 2
		}, {
			SafeAreaContent = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				testId = "--moments-header-safe-area",
				padding = p1.headerPadding
			}, {
				HeaderBarContainer = reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					testId = "--moments-header",
					Size = UDim2.new(1, 0, 0, p1.headerHeight)
				}, {
					HeaderBar = reactModule.createElement(headerBar, {
						isTitleCentered = false,
						isOnMedia = false,
						backgroundTransparency = 1,
						zIndex = 2,
						barHeight = p1.headerHeight,
						paddingLeft = UDim.new(0, 0),
						paddingRight = UDim.new(0, 0),
						renderLeft = var1,
						renderRight = var2
					})
				})
			})
		})
	}
	
	if p1.showTopScrim then
		t.GradientScrim = reactModule.createElement(gradientBackdrop, {
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
		tag = "size-full-0",
		testId = "--moments-header-root",
		LayoutOrder = p1.layoutOrder,
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}, t)
end