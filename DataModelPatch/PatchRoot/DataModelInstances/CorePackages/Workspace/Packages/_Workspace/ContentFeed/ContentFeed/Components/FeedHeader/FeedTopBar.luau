local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local UIBloxModule = require(Parent1.UIBlox)
local FeedHeaderModule = require(Parent.Components.FeedHeader.FeedHeader)
local View = FoundationModule.View
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local EventNamesModule = require(Parent.Analytics.EventNames)
local FeedContextModule = require(Parent.App.FeedContext)
local Images = UIBloxModule.App.ImageSet.Images
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local RemovePostModule = require(Parent.Thunks.RemovePost)
local UseAnalyticsModule = require(Parent.Hooks.useAnalytics)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSafeZoneOffsetsModule = require(Parent.Hooks.useSafeZoneOffsets)
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MotorOverrideOptions = {
	motorCallback = require(Parent1.Otter).instant,
	open = { targetValue = 1 },
	close = { targetValue = 0 }
}

return function(p1)
	-- upvalues: Players (copy), ReactModule (copy), FeedContextModule (copy), UseLocalizationFunction (copy), UseAnalyticsModule (copy), UseDispatchFunction (copy), UseTokensFunction (copy), UseScreenSizeFunction (copy), UseSafeZoneOffsetsModule (copy), UseAnimatedBindingFunction (copy), ReactOtterModule (copy), EventNamesModule (copy), ContextActionService (copy), RemovePostModule (copy), Images (copy), View (copy), ContextualMenu (copy), MenuDirection (copy), MotorOverrideOptions (copy), FeedHeaderModule (copy)
	local Text: string = if Players and Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
	local UseContextResult = ReactModule.useContext(FeedContextModule)
	local UseLocalizationResult = UseLocalizationFunction({
		removePost = "Feature.ContentFeed.Action.Delete",
		report = "Feature.ContentFeed.Action.Report"
	})
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseSafeZoneOffsetsModuleResult = UseSafeZoneOffsetsModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0)
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if UseContextResult.isZooming then
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, { dampingRatio = 1, frequency = 4 }))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, { dampingRatio = 1, frequency = 4 }))
		end
	end, { UseContextResult.isZooming })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy)
		if not UseContextResult.isZooming then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedExitCtaPressed, { postId = p1.postId })
			UseContextResult.navigateBack(false)
			
			return
		end
	end, {
		UseAnalyticsModuleResult.fireEvent,
		UseContextResult.isZooming,
		UseContextResult.navigateBack
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy), UseContextResult (copy)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedCloseShortcutPressed, { postId = p1.postId })
		UseContextResult.navigateBack(false)
	end, {
		UseAnalyticsModuleResult.fireEvent,
		UseContextResult.navigateBack
	})
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), UseResult2 (copy)
		ContextActionService:BindCoreAction("ContentFeedCloseShortcutAction", function(_, UserInputState)
			-- upvalues: UseResult2 (upval)
			if UserInputState == Enum.UserInputState.End then
				UseResult2()
			end
		end, false, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("ContentFeedCloseShortcutAction")
		end
	end, { UseResult2 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy), UseStateResult2 (copy), UseStateResult (copy)
		if not UseContextResult.isZooming then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedMoreMenuButtonPressed, { postId = p1.postId })
			UseStateResult2(not UseStateResult)
			
			return
		end
	end, {
		UseAnalyticsModuleResult.fireEvent,
		UseContextResult.isZooming,
		UseStateResult,
		p1.postId
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy), UseContextResult (copy), UseStateResult2 (copy)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedReportCtaPressed, { postId = p1.postId })
		UseContextResult.navigateToReportPage(p1.postId)
		UseStateResult2(false)
	end, {
		UseAnalyticsModuleResult.fireEvent,
		UseContextResult.navigateToReportPage,
		p1.postId
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy), UseDispatchResult (copy), RemovePostModule (upval), UseStateResult2 (copy)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedDeleteCtaPressed, { postId = p1.postId })
		UseDispatchResult(RemovePostModule(p1.postId))
		p1.removePostTransition()
		UseStateResult2(false)
	end, {
		UseAnalyticsModuleResult.fireEvent,
		p1.postId,
		p1.removePostTransition
	})
	local List = {}
	
	if p1.creatorId ~= Text then
		table.insert(List, {
			icon = Images["icons/actions/feedback"],
			onActivated = UseResult4,
			text = UseLocalizationResult.report
		})
	end
	if p1.creatorId == Text then
		table.insert(List, {
			icon = Images["icons/actions/edit/delete"],
			onActivated = UseResult5,
			text = UseLocalizationResult.removePost
		})
	end
	return ReactModule.createElement(View, {
		tag = "bg-action-subtle",
		GroupTransparency = if UseContextResult.isZooming then UseAnimatedBindingResult:map(function(p2)
			return p2
		end) else nil,
		Position = UDim2.fromOffset(0, UseSafeZoneOffsetsModuleResult.top),
		Size = UDim2.new(1, 0, 0, 56),
		ZIndex = p1.ZIndex
	}, {
		GradientBackdrop = ReactModule.createElement(View, {
			tag = "col size-full-full bg-contrast",
			ZIndex = 0,
			Position = UDim2.fromOffset(0, -UseSafeZoneOffsetsModuleResult.top),
			Size = UDim2.new(1, 0, 1, UseSafeZoneOffsetsModuleResult.top)
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, UseTokensResult.Color.OverMedia.OverMedia_0.Color3),
					ColorSequenceKeypoint.new(1, UseTokensResult.Color.OverMedia.OverMedia_0.Color3)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0.5),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		ContextualMenu = ReactModule.createElement(ContextualMenu, {
			closeBackgroundVisible = false,
			zIndex = 2,
			buttonProps = List,
			horizontalAlignment = Enum.HorizontalAlignment.Right,
			menuDirection = MenuDirection.Down,
			motorOverrideOptions = MotorOverrideOptions,
			onDismiss = UseResult,
			open = UseStateResult,
			openPositionX = UDim.new(0, -12),
			openPositionY = UDim.new(0, 56),
			screenSize = UseScreenSizeResult
		}),
		FeedHeader = ReactModule.createElement(FeedHeaderModule, {
			ZIndex = 1,
			isContextualMenuOpen = UseStateResult,
			isPlaceholderPost = p1.isPlaceholderPost,
			onBackActivated = UseResult1,
			onMoreActivated = UseResult3
		})
	})
end