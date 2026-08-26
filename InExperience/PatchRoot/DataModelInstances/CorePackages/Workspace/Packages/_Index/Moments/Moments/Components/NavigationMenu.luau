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

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), useToggleState (ref), reactModule (ref), iconButton (ref), threeDotsHorizontal (ref), buttonVariant (ref), inputSize (ref), menu (ref), foundationModule (ref)
	local var1 = useLocalization(t)
	local var2 = useToggleState()
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		if var2.enabled then
			var2.disable()
			
			return
		end
		var2.enable()
	end, { var2.enabled, var2.enable, var2.disable })
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.disable()
		p1.onNavigateToTrending()
	end, { var2.disable, p1.onNavigateToTrending })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.disable()
		p1.onNavigateToMyMoments()
	end, { var2.disable, p1.onNavigateToMyMoments })
	
	return reactModule.createElement(menu, {
		align = foundationModule.Enums.PopoverAlign.End,
		isOpen = var2.enabled,
		items = reactModule.useMemo(function()
			-- upvalues: var1 (ref), var4 (ref), var5 (ref)
			return {
				{
					id = "trending",
					text = var1.trending,
					onActivated = var4
				},
				{
					id = "myMoments",
					text = var1.myMoments,
					onActivated = var5
				}
			}
		end, { var4, var5, var1 }),
		LayoutOrder = p1.layoutOrder,
		onPressedOutside = var2.disable,
		side = foundationModule.Enums.PopoverSide.Bottom
	}, {
		MoreMenuButton = reactModule.createElement(iconButton, {
			isCircular = true,
			Selectable = true,
			LayoutOrder = p1.layoutOrder,
			icon = threeDotsHorizontal,
			onActivated = var3,
			variant = p1.buttonVariant or buttonVariant.OverMedia,
			size = inputSize.Medium,
			testId = p1.buttonTestId or "--moments-navigation-menu-button"
		})
	})
end