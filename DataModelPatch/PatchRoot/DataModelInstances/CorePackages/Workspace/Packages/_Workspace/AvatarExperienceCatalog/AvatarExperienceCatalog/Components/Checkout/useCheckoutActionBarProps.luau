local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local TutilsModule = require(Parent.tutils)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseMultiItemShoppingFtuxModule = require(AvatarExperienceCatalog.Hooks.useMultiItemShoppingFtux)
local _ = require(AvatarExperienceCatalog.Components.Checkout.CheckoutActionBar)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local ClearTryOnsFunction = require(Parent.AvatarExperienceRodux).Actions.ClearTryOns
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AXCheckoutButtonTooltipFtuxDelay = game:DefineFastInt("AXCheckoutButtonTooltipFtuxDelay", 500)
local AXCheckoutButtonTooltipExpireTime = game:DefineFastInt("AXCheckoutButtonTooltipExpireTime", 5000)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FFlagStackedBottomNavMarketplaceCTA = require(Parent.SharedFlags).FFlagStackedBottomNavMarketplaceCTA

local function selectTryOnItems(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

return function(p1, Ref)
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseMultiItemShoppingFtuxModule (copy), UseAvatarRouteFunction (copy), ReactModule (copy), UseSelectorFunction (copy), selectTryOnItems (copy), TutilsModule (copy), AvatarScreen (copy), ClearTryOnsFunction (copy), AXCheckoutButtonTooltipFtuxDelay (copy), AXCheckoutButtonTooltipExpireTime (copy), FFlagStackedBottomNavMarketplaceCTA (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseMultiItemShoppingFtuxModuleResult = UseMultiItemShoppingFtuxModule()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local Name = UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	local RouteName = UseNavigationResult.state.routeName
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local FieldCountResult = TutilsModule.fieldCount((UseSelectorFunction(selectTryOnItems, TutilsModule.deepEqual)))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseMultiItemShoppingFtuxModuleResult (copy), UseNavigationResult (copy), AvatarScreen (upval), UseDispatchResult (copy), ClearTryOnsFunction (upval)
		if p1.onClearButtonActivated then
			p1.onClearButtonActivated()
		end
		if UseMultiItemShoppingFtuxModuleResult.shouldShowClearAllItemsPrompt() then
			UseNavigationResult.navigate(AvatarScreen.ClearAllItemsOnAvatarPrompt, {
				onConfirm = function(p2)
					-- upvalues: UseDispatchResult (upval), ClearTryOnsFunction (upval), UseMultiItemShoppingFtuxModuleResult (upval)
					UseDispatchResult(ClearTryOnsFunction())
					
					if p2 then
						UseMultiItemShoppingFtuxModuleResult.hideClearAllItemsPrompt()
					end
				end
			})
			
			return
		else
			UseDispatchResult(ClearTryOnsFunction())
		end
	end, {
		p1.onClearButtonActivated,
		UseNavigationResult,
		UseMultiItemShoppingFtuxModuleResult,
		UseDispatchResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), p1 (copy), UseMultiItemShoppingFtuxModuleResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		UseNavigationResult.navigate("Checkout")
		
		if p1.onCheckoutButtonActivated then
			p1.onCheckoutButtonActivated()
		end
		UseMultiItemShoppingFtuxModuleResult.setSeenTooltipOnCheckoutButton()
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseStateResult2(false)
	end, {
		p1.onCheckoutButtonActivated,
		UseStateResult2,
		UseNavigationResult,
		UseMultiItemShoppingFtuxModuleResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseMultiItemShoppingFtuxModuleResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		UseMultiItemShoppingFtuxModuleResult.setSeenTooltipOnCheckoutButton()
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseStateResult2(false)
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: AXCheckoutButtonTooltipFtuxDelay (upval), UseStateResult2 (copy), AXCheckoutButtonTooltipExpireTime (upval), UseMultiItemShoppingFtuxModuleResult (copy)
		return task.delay(AXCheckoutButtonTooltipFtuxDelay / 1000, function()
			-- upvalues: UseStateResult2 (upval), AXCheckoutButtonTooltipExpireTime (upval), UseMultiItemShoppingFtuxModuleResult (upval)
			UseStateResult2(true)
			task.delay(AXCheckoutButtonTooltipExpireTime / 1000, function()
				-- upvalues: UseMultiItemShoppingFtuxModuleResult (upval), UseStateResult2 (upval)
				UseMultiItemShoppingFtuxModuleResult.setSeenTooltipOnCheckoutButton()
				UseStateResult2(false)
			end)
		end)
	end, { UseMultiItemShoppingFtuxModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMultiItemShoppingFtuxModuleResult (copy), UseAvatarRouteResult (copy), Name (copy), AvatarScreen (upval), RouteName (copy), UseRefResult (copy), UseResult3 (copy)
		if UseMultiItemShoppingFtuxModuleResult.shouldShowTooltipOnCheckoutButton() and UseAvatarRouteResult.isVisible and (Name == AvatarScreen.Catalog or Name == AvatarScreen.CatalogSearch) and RouteName == Name then
			UseRefResult.current = UseResult3()
		end
	end, {
		UseMultiItemShoppingFtuxModuleResult,
		Name,
		RouteName,
		UseAvatarRouteResult
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), RouteName (copy), Name (copy), UseAvatarRouteResult (copy), UseStateResult2 (copy)
		if not p1.Visible or RouteName ~= Name or not UseAvatarRouteResult.isVisible then
			UseStateResult2(false)
		end
	end, {
		p1.Visible,
		UseStateResult2,
		UseAvatarRouteResult,
		RouteName,
		Name
	})
	
	return {
		onCheckoutButtonActivated = UseResult1,
		onClearButtonActivated = UseResult,
		itemCount = FieldCountResult,
		ref = Ref,
		Visible = p1.Visible,
		showCheckoutButtonTooltip = UseStateResult,
		onTooltipButtonActivated = UseResult2,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		footerVisibilityBinding = if FFlagStackedBottomNavMarketplaceCTA then p1.footerVisibilityBinding else nil
	}
end