local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local tutilsModule = require(parent.tutils)
local useNavigation = require(parent.Navigation).useNavigation
local useMultiItemShoppingFtuxModule = require(avatarExperienceCatalog.Hooks.useMultiItemShoppingFtux)
local _ = require(avatarExperienceCatalog.Components.Checkout.CheckoutActionBar)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local clearTryOns = require(parent.AvatarExperienceRodux).Actions.ClearTryOns
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local AXCheckoutButtonTooltipFtuxDelay = game:DefineFastInt("AXCheckoutButtonTooltipFtuxDelay", 500)
local AXCheckoutButtonTooltipExpireTime = game:DefineFastInt("AXCheckoutButtonTooltipExpireTime", 5000)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local fFlagStackedBottomNavMarketplaceCTA = require(parent.SharedFlags).FFlagStackedBottomNavMarketplaceCTA

local function selectTryOnItems(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

return function(p1, p2)
	-- upvalues: useNavigation (ref), useDispatch (ref), useMultiItemShoppingFtuxModule (ref), useAvatarRoute (ref), reactModule (ref), useSelector (ref), selectTryOnItems (ref), tutilsModule (ref), avatarScreen (ref), clearTryOns (ref), AXCheckoutButtonTooltipFtuxDelay (ref), AXCheckoutButtonTooltipExpireTime (ref), fFlagStackedBottomNavMarketplaceCTA (ref)
	local var1 = useNavigation()
	local var2 = useDispatch()
	local var3 = useMultiItemShoppingFtuxModule()
	local var4 = useAvatarRoute()
	local name = var4 and (var4.opaque and var4.opaque.name)
	local routeName = var1.state.routeName
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(nil)
	local var8 = tutilsModule.fieldCount(useSelector(selectTryOnItems, tutilsModule.deepEqual))
	local var9 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var3 (ref), var1 (ref), avatarScreen (copy), var2 (ref), clearTryOns (copy)
		if p1.onClearButtonActivated then
			p1.onClearButtonActivated()
		end
		if var3.shouldShowClearAllItemsPrompt() then
			var1.navigate(avatarScreen.ClearAllItemsOnAvatarPrompt, {
				onConfirm = function(p3)
					-- upvalues: var2 (copy), clearTryOns (copy), var3 (copy)
					var2(clearTryOns())
					
					if p3 then
						var3.hideClearAllItemsPrompt()
					end
				end
			})
			
			return
		end
		var2(clearTryOns())
	end, { p1.onClearButtonActivated, var1, var3, var2 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), var3 (ref), var7 (ref), var6 (ref)
		var1.navigate("Checkout")
		
		if p1.onCheckoutButtonActivated then
			p1.onCheckoutButtonActivated()
		end
		var3.setSeenTooltipOnCheckoutButton()
		
		if var7.current then
			task.cancel(var7.current)
		end
		var6(false)
	end, { p1.onCheckoutButtonActivated, var6, var1, var3 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var7 (ref), var6 (ref)
		var3.setSeenTooltipOnCheckoutButton()
		
		if var7.current then
			task.cancel(var7.current)
		end
		var6(false)
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: AXCheckoutButtonTooltipFtuxDelay (copy), var6 (ref), AXCheckoutButtonTooltipExpireTime (copy), var3 (ref)
		return task.delay(AXCheckoutButtonTooltipFtuxDelay / 1000, function()
			-- upvalues: var6 (copy), AXCheckoutButtonTooltipExpireTime (copy), var3 (copy)
			var6(true)
			task.delay(AXCheckoutButtonTooltipExpireTime / 1000, function()
				-- upvalues: var3 (copy), var6 (copy)
				var3.setSeenTooltipOnCheckoutButton()
				var6(false)
			end)
		end)
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), name (ref), avatarScreen (copy), routeName (ref), var7 (ref), var12 (ref)
		if var3.shouldShowTooltipOnCheckoutButton() and var4.isVisible and (name == avatarScreen.Catalog or name == avatarScreen.CatalogSearch) and routeName == name then
			var7.current = var12()
		end
	end, { var3, name, routeName, var4 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), routeName (ref), name (ref), var4 (ref), var6 (ref)
		if not p1.Visible or routeName ~= name or not var4.isVisible then
			var6(false)
		end
	end, {
		p1.Visible,
		var6,
		var4,
		routeName,
		name
	})
	
	return {
		onCheckoutButtonActivated = var10,
		onClearButtonActivated = var9,
		itemCount = var8,
		ref = p2,
		Visible = p1.Visible,
		showCheckoutButtonTooltip = var5,
		onTooltipButtonActivated = var11,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		footerVisibilityBinding = if fFlagStackedBottomNavMarketplaceCTA then p1.footerVisibilityBinding else nil
	}
end