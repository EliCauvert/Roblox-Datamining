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

local function selectTryOnItems(p0) --[[ line: 30 ]]
	return p0.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

return function(p1, p2) --[[ line: 34 | named "useCheckoutActionBarProps" ]]
	-- upvalues: useNavigation (ref), useDispatch (ref), useMultiItemShoppingFtuxModule (ref), useAvatarRoute (ref), reactModule (ref), useSelector (ref), selectTryOnItems (ref), tutilsModule (ref), avatarScreen (ref), clearTryOns (ref), AXCheckoutButtonTooltipFtuxDelay (ref), AXCheckoutButtonTooltipExpireTime (ref), fFlagStackedBottomNavMarketplaceCTA (ref)
	local var8 = useNavigation()
	local var9 = useDispatch()
	local var10 = useMultiItemShoppingFtuxModule()
	local var11 = useAvatarRoute()
	local name = var11 and (var11.opaque and var11.opaque.name)
	local routeName = var8.state.routeName
	local var13, var14 = reactModule.useState(false)
	local var15 = reactModule.useRef(nil)
	local var16 = tutilsModule.fieldCount(useSelector(selectTryOnItems, tutilsModule.deepEqual))
	local var17 = reactModule.useCallback(function() --[[ line: 51 ]]
		-- upvalues: p1 (ref), var10 (ref), var8 (ref), avatarScreen (copy), var9 (ref), clearTryOns (copy)
		if p1.onClearButtonActivated then
			p1.onClearButtonActivated()
		end
		if var10.shouldShowClearAllItemsPrompt() then
			var8.navigate(avatarScreen.ClearAllItemsOnAvatarPrompt, {
				onConfirm = function(p3) --[[ line: 58 ]]
					-- upvalues: var9 (copy), clearTryOns (copy), var10 (copy)
					var9(clearTryOns())
					
					if p3 then
						var10.hideClearAllItemsPrompt()
					end
				end
			})
			
			return
		end
		var9(clearTryOns())
	end, { p1.onClearButtonActivated, var8, var10, var9 })
	local var18 = reactModule.useCallback(function() --[[ line: 72 ]]
		-- upvalues: var8 (ref), p1 (ref), var10 (ref), var15 (ref), var14 (ref)
		var8.navigate("Checkout")
		
		if p1.onCheckoutButtonActivated then
			p1.onCheckoutButtonActivated()
		end
		var10.setSeenTooltipOnCheckoutButton()
		
		if var15.current then
			task.cancel(var15.current)
		end
		var14(false)
	end, { p1.onCheckoutButtonActivated, var14, var8, var10 })
	local var19 = reactModule.useCallback(function() --[[ line: 88 ]]
		-- upvalues: var10 (ref), var15 (ref), var14 (ref)
		var10.setSeenTooltipOnCheckoutButton()
		
		if var15.current then
			task.cancel(var15.current)
		end
		var14(false)
	end, {})
	local var20 = reactModule.useCallback(function() --[[ line: 97 ]]
		-- upvalues: AXCheckoutButtonTooltipFtuxDelay (copy), var14 (ref), AXCheckoutButtonTooltipExpireTime (copy), var10 (ref)
		return task.delay(AXCheckoutButtonTooltipFtuxDelay / 1000, function() --[[ line: 98 ]]
			-- upvalues: var14 (copy), AXCheckoutButtonTooltipExpireTime (copy), var10 (copy)
			var14(true)
			task.delay(AXCheckoutButtonTooltipExpireTime / 1000, function() --[[ line: 101 ]]
				-- upvalues: var10 (copy), var14 (copy)
				var10.setSeenTooltipOnCheckoutButton()
				var14(false)
			end)
		end)
	end, { var10 })
	reactModule.useEffect(function() --[[ line: 109 ]]
		-- upvalues: var10 (ref), var11 (ref), name (ref), avatarScreen (copy), routeName (ref), var15 (ref), var20 (ref)
		if var10.shouldShowTooltipOnCheckoutButton() and var11.isVisible and (name == avatarScreen.Catalog or name == avatarScreen.CatalogSearch) and routeName == name then
			var15.current = var20()
		end
	end, { var10, name, routeName, var11 })
	reactModule.useEffect(function() --[[ line: 130 ]]
		-- upvalues: p1 (ref), routeName (ref), name (ref), var11 (ref), var14 (ref)
		if not p1.Visible or routeName ~= name or not var11.isVisible then
			var14(false)
		end
	end, {
		p1.Visible,
		var14,
		var11,
		routeName,
		name
	})
	
	return {
		onCheckoutButtonActivated = var18,
		onClearButtonActivated = var17,
		itemCount = var16,
		ref = p2,
		Visible = p1.Visible,
		showCheckoutButtonTooltip = var13,
		onTooltipButtonActivated = var19,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		footerVisibilityBinding = if fFlagStackedBottomNavMarketplaceCTA then p1.footerVisibilityBinding else nil
	}
end