local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagMomentsFollowingFeedModule = require(Moments.Flags.FFlagMomentsFollowingFeed)
local UseTrendingFeedLabelModule = require(Moments.Hooks.useTrendingFeedLabel)
local ThreeDotsHorizontal = require(Parent.BuilderIcons).Icon.ThreeDotsHorizontal
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseToggleStateFunction = require(Parent.MomentsCommon).Hooks.useToggleState
local config = {
	trending = "Feature.Moments.Label.FeedTrending",
	myMoments = "Feature.Moments.Label.FeedMyMoments"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), FFlagMomentsFollowingFeedModule (copy), UseTrendingFeedLabelModule (copy), UseToggleStateFunction (copy), ReactModule (copy), IconButton (copy), ThreeDotsHorizontal (copy), ButtonVariant (copy), InputSize (copy), Menu (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseTrendingFeedLabelModuleResult = if FFlagMomentsFollowingFeedModule then UseTrendingFeedLabelModule() else UseLocalizationResult.trending
	local UseToggleStateResult = UseToggleStateFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), p1 (copy)
		UseToggleStateResult.disable()
		p1.onNavigateToTrending()
	end, { UseToggleStateResult.disable, p1.onNavigateToTrending })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), p1 (copy)
		UseToggleStateResult.disable()
		p1.onNavigateToMyMoments()
	end, { UseToggleStateResult.disable, p1.onNavigateToMyMoments })
	
	return ReactModule.createElement(Menu, {
		align = FoundationModule.Enums.PopoverAlign.End,
		isOpen = UseToggleStateResult.enabled,
		items = ReactModule.useMemo(function()
			-- upvalues: UseTrendingFeedLabelModuleResult (ref), UseResult (copy), UseLocalizationResult (copy), UseResult1 (copy)
			return {
				{
					id = "trending",
					text = UseTrendingFeedLabelModuleResult,
					onActivated = UseResult
				},
				{
					id = "myMoments",
					text = UseLocalizationResult.myMoments,
					onActivated = UseResult1
				}
			}
		end, {
			UseResult,
			UseResult1,
			UseLocalizationResult,
			UseTrendingFeedLabelModuleResult
		}),
		LayoutOrder = p1.layoutOrder,
		onPressedOutside = UseToggleStateResult.disable,
		side = FoundationModule.Enums.PopoverSide.Bottom
	}, {
		MoreMenuButton = ReactModule.createElement(IconButton, {
			isCircular = true,
			Selectable = true,
			LayoutOrder = p1.layoutOrder,
			icon = ThreeDotsHorizontal,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseToggleStateResult (copy)
				if UseToggleStateResult.enabled then
					UseToggleStateResult.disable()
					
					return
				else
					UseToggleStateResult.enable()
				end
			end, {
				UseToggleStateResult.enabled,
				UseToggleStateResult.enable,
				UseToggleStateResult.disable
			}),
			variant = p1.buttonVariant or ButtonVariant.OverMedia,
			size = InputSize.Medium,
			testId = p1.buttonTestId or "--moments-navigation-menu-button"
		})
	})
end