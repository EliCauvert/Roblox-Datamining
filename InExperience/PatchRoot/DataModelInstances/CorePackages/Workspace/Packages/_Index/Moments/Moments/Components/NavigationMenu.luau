local parent = script:FindFirstAncestor("Moments").Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local threeDotsHorizontal = builderIconsModule.Icon.ThreeDotsHorizontal
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local useLocalization = localizationModule.Hooks.useLocalization
local useToggleState = momentsCommonModule.Hooks.useToggleState
local t = {
	trending = "Feature.Moments.Label.FeedTrending",
	myMoments = "Feature.Moments.Label.FeedMyMoments"
}

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), useToggleState (ref), reactModule (ref), iconButton (ref), threeDotsHorizontal (ref), buttonVariant (ref), inputSize (ref), menu (ref), foundationModule (ref)
	local var6 = useLocalization(t)
	local var7 = useToggleState()
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		if var7.enabled then
			var7.disable()
			
			return
		end
		var7.enable()
	end, { var7.enabled, var7.enable, var7.disable })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), p0 (ref)
		var7.disable()
		p0.onNavigateToTrending()
	end, { var7.disable, p0.onNavigateToTrending })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), p0 (ref)
		var7.disable()
		p0.onNavigateToMyMoments()
	end, { var7.disable, p0.onNavigateToMyMoments })
	
	return reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var7.enabled,
		items = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var9 (ref), var10 (ref)
			return {
				{
					id = "trending",
					text = var6.trending,
					onActivated = var9
				},
				{
					id = "myMoments",
					text = var6.myMoments,
					onActivated = var10
				}
			}
		end, { var9, var10, var6 }),
		LayoutOrder = p0.layoutOrder,
		onPressedOutside = var7.disable,
		side = foundationModule.Enums.PopoverSide.Bottom
	}, {
		MoreMenuButton = reactModule.createElement(iconButton, {
			isCircular = true,
			Selectable = true,
			LayoutOrder = p0.layoutOrder,
			icon = threeDotsHorizontal,
			onActivated = var8,
			variant = p0.buttonVariant or buttonVariant.OverMedia,
			size = inputSize.Medium,
			testId = p0.buttonTestId or "--moments-navigation-menu-button"
		})
	})
end