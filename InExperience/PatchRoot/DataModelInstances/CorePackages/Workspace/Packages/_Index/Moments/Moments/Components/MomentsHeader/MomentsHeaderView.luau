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

local function renderAction(p0, p1, p2, p3)
	-- upvalues: reactModule (ref), iconButton (ref), buttonVariant (ref), inputSize (ref)
	return reactModule.createElement(iconButton, {
		isCircular = true,
		Selectable = true,
		LayoutOrder = p3,
		icon = p1,
		onActivated = p2,
		variant = buttonVariant.Utility,
		size = inputSize.Medium,
		testId = `--moments-header--actions--{p0}`
	})
end

return function(p4)
	-- upvalues: renderAction (ref), chevronLargeLeft (ref), plusLarge (ref), flyoutSidePanelIXP (ref), reactModule (ref), flyoutLeftHeader (ref), view (ref), text (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), foundationModule (ref), coachmark (ref), navigationMenuModule (ref), headerBar (ref), gradientBackdrop (ref), constantsModule (ref)
	local var8 = nil
	local var9 = nil
	
	if p4.variant == "back" then
		var8 = function()
			-- upvalues: renderAction (copy), chevronLargeLeft (copy), p4 (ref)
			return renderAction("back", chevronLargeLeft, p4.onBack, 1)
		end
		
		if p4.showInteractiveButtons and p4.showCreateButton then
			var9 = function()
				-- upvalues: renderAction (copy), plusLarge (copy), p4 (ref)
				return renderAction("create", plusLarge, p4.onCreateMomentButtonPressed, 1)
			end
		end
	elseif p4.variant == "base" then
		local var10 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled()
		local var10_1 = p4.showInteractiveButtons and (p4.showHamburger and var10)
		
		var8 = function()
			-- upvalues: var10_1 (ref), reactModule (copy), flyoutLeftHeader (copy), p4 (ref), var10 (ref), flyoutSidePanelIXP (copy), view (copy), text (copy)
			return if var10_1 then reactModule.createElement(flyoutLeftHeader, {
				isRobloxLogoEnabled = false,
				titleText = p4.title,
				isFlyoutEntrypointEnabled = var10,
				isAlternateEntryPointEnabled = flyoutSidePanelIXP.isAlternateEntryPointEnabled()
			}) else reactModule.createElement(view, { tag = "row align-x-left align-y-center auto-xy" }, {
				Title = reactModule.createElement(text, {
					tag = "auto-xy text-heading-large",
					Text = p4.title,
					textStyle = p4.titleTextStyle
				})
			})
		end
		
		if p4.showInteractiveButtons then
			local var12 = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				Selectable = true,
				testId = "--moments-header--actions--create",
				icon = plusLarge,
				onActivated = p4.onCreateMomentButtonPressed,
				variant = buttonVariant.Utility,
				size = inputSize.Medium
			})
			local var13 = if p4.showFtuxTooltip then reactModule.createElement(coachmark, {
				LayoutOrder = 1,
				title = "Share Your First Moment",
				text = "Tap + to share a moment from your captures",
				isOpen = p4.showFtuxTooltip,
				onClose = p4.onFtuxTooltipClosed,
				side = foundationModule.Enums.PopoverSide.Bottom,
				align = foundationModule.Enums.PopoverAlign.End
			}, var12) else reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy" }, { Action = var12 })
			
			var9 = function()
				-- upvalues: reactModule (copy), view (copy), var13 (write), navigationMenuModule (copy), buttonVariant (copy), p4 (ref)
				return reactModule.createElement(view, { tag = "row align-y-center gap-xsmall auto-xy" }, {
					CreateMomentButton = var13,
					NavigationMenu = reactModule.createElement(navigationMenuModule, {
						layoutOrder = 2,
						buttonTestId = "--moments-header--actions--more",
						buttonVariant = buttonVariant.Utility,
						onNavigateToTrending = p4.onNavigateToTrending,
						onNavigateToMyMoments = p4.onNavigateToMyMoments
					})
				})
			end
		end
	elseif p4.variant == "close" then
		var9 = function()
			-- upvalues: renderAction (copy), p4 (ref)
			return renderAction("close", "icons/navigation/close_small", p4.onClose, 1)
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
				padding = p4.headerPadding
			}, {
				HeaderBarContainer = reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					testId = "--moments-header",
					Size = UDim2.new(1, 0, 0, p4.headerHeight)
				}, {
					HeaderBar = reactModule.createElement(headerBar, {
						isTitleCentered = false,
						isOnMedia = false,
						backgroundTransparency = 1,
						zIndex = 2,
						barHeight = p4.headerHeight,
						paddingLeft = UDim.new(0, 0),
						paddingRight = UDim.new(0, 0),
						renderLeft = var8,
						renderRight = var9
					})
				})
			})
		})
	}
	
	if p4.showTopScrim then
		t.GradientScrim = reactModule.createElement(gradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, p4.scrimHeight)
		})
	end
	return reactModule.createElement(view, {
		tag = "size-full-0",
		testId = "--moments-header-root",
		LayoutOrder = p4.layoutOrder,
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}, t)
end