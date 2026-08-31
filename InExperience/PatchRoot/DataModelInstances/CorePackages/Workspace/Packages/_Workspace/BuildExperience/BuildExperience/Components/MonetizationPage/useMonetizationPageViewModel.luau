local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local getBuildPromptDraftStoreModule = require(buildExperience.Stores.GetBuildPromptDraftStore)
local _ = require(script.Parent.MonetizationPageView)
local t = {}
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), t (ref), reactModule (ref), getBuildPromptDraftStoreModule (ref)
	local var1 = if fFlagBuildLocalization then useLocalization({
		title = localizationStringsModule.MONETIZATION_TITLE,
		options = localizationStringsModule.MONETIZATION_OPTIONS,
		managedPricing = localizationStringsModule.MONETIZATION_MANAGED_PRICING,
		managedPricingDescription = localizationStringsModule.MONETIZATION_MANAGED_PRICING_DESCRIPTION,
		allowIndividualManagedPricing = localizationStringsModule.MONETIZATION_ALLOW_INDIVIDUAL_MANAGED_PRICING,
		allowIndividualManagedPricingDescription = localizationStringsModule.MONETIZATION_ALLOW_INDIVIDUAL_MANAGED_PRICING_DESCRIPTION,
		pricingOptions = localizationStringsModule.MONETIZATION_PRICING_OPTIONS,
		pricingOptionsDescription = localizationStringsModule.MONETIZATION_PRICING_OPTIONS_DESCRIPTION,
		shopUI = localizationStringsModule.MONETIZATION_SHOP_UI,
		shopButton = localizationStringsModule.MONETIZATION_SHOP_BUTTON,
		shopButtonDescription = localizationStringsModule.MONETIZATION_SHOP_BUTTON_DESCRIPTION,
		emptyTitle = localizationStringsModule.MONETIZATION_EMPTY_TITLE,
		emptyDescription = localizationStringsModule.MONETIZATION_EMPTY_DESCRIPTION,
		emptyCreateProduct = localizationStringsModule.MONETIZATION_EMPTY_CREATE_PRODUCT,
		createProductPrompt = localizationStringsModule.MONETIZATION_CREATE_PRODUCT_PROMPT,
		pricing = localizationStringsModule.MONETIZATION_PRICING,
		regionalPricing = localizationStringsModule.MONETIZATION_REGIONAL_PRICING,
		viewAll = localizationStringsModule.MONETIZATION_VIEW_ALL,
		loading = localizationStringsModule.MONETIZATION_LOADING,
		loadError = localizationStringsModule.CHAT_DEFAULT_FAILURE,
		updateError = localizationStringsModule.CHAT_DEFAULT_FAILURE,
		retry = localizationStringsModule.MONETIZATION_RETRY
	}) else {
		title = localizationStringsModule.MONETIZATION_TITLE,
		options = localizationStringsModule.MONETIZATION_OPTIONS,
		managedPricing = localizationStringsModule.MONETIZATION_MANAGED_PRICING,
		managedPricingDescription = localizationStringsModule.MONETIZATION_MANAGED_PRICING_DESCRIPTION,
		allowIndividualManagedPricing = localizationStringsModule.MONETIZATION_ALLOW_INDIVIDUAL_MANAGED_PRICING,
		allowIndividualManagedPricingDescription = localizationStringsModule.MONETIZATION_ALLOW_INDIVIDUAL_MANAGED_PRICING_DESCRIPTION,
		pricingOptions = localizationStringsModule.MONETIZATION_PRICING_OPTIONS,
		pricingOptionsDescription = localizationStringsModule.MONETIZATION_PRICING_OPTIONS_DESCRIPTION,
		shopUI = localizationStringsModule.MONETIZATION_SHOP_UI,
		shopButton = localizationStringsModule.MONETIZATION_SHOP_BUTTON,
		shopButtonDescription = localizationStringsModule.MONETIZATION_SHOP_BUTTON_DESCRIPTION,
		emptyTitle = localizationStringsModule.MONETIZATION_EMPTY_TITLE,
		emptyDescription = localizationStringsModule.MONETIZATION_EMPTY_DESCRIPTION,
		emptyCreateProduct = localizationStringsModule.MONETIZATION_EMPTY_CREATE_PRODUCT,
		createProductPrompt = localizationStringsModule.MONETIZATION_CREATE_PRODUCT_PROMPT,
		pricing = localizationStringsModule.MONETIZATION_PRICING,
		regionalPricing = localizationStringsModule.MONETIZATION_REGIONAL_PRICING,
		viewAll = localizationStringsModule.MONETIZATION_VIEW_ALL,
		loading = localizationStringsModule.MONETIZATION_LOADING,
		loadError = localizationStringsModule.CHAT_DEFAULT_FAILURE,
		updateError = localizationStringsModule.CHAT_DEFAULT_FAILURE,
		retry = localizationStringsModule.MONETIZATION_RETRY
	}
	local products = p1.products or t
	local var2 = if #products > 0 then "catalog" else "empty"
	local var3, var4 = reactModule.useState(p1.initialMode or var2)
	local var5, var6 = reactModule.useState(if p1.initialMode == "detail" then products[1] else nil)
	local var7, var8 = reactModule.useState(true)
	local var9, var10 = reactModule.useState(true)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var2 (ref), var4 (ref)
		if p1.initialMode == nil and (var3 == "catalog" or var3 == "empty") and var3 ~= var2 then
			var4(var2)
		end
	end, { var2, var3, p1.initialMode })
	local onComposerActivated = p1.onComposerActivated or p1.onClose
	
	return {
		mode = var3,
		products = products,
		showOptions = p1.showOptions == true,
		selectedProduct = var5,
		isProductDisabled = p1.isProductDisabled == true,
		isProductManagedPricingPending = var13,
		canUpdateProductManagedPricing = p1.onUpdateProductManagedPricing ~= nil,
		productManagedPricingError = var15,
		catalogStatus = p1.catalogStatus or "Ready",
		managedPricing = var7,
		allowIndividualManagedPricing = var9,
		shopButton = var11,
		emptyTitle = var1.emptyTitle,
		emptyDescription = var1.emptyDescription,
		onClose = reactModule.useCallback(function()
			-- upvalues: var3 (ref), var6 (ref), var4 (ref), var2 (ref), p1 (ref)
			if var3 == "detail" then
				var6(nil)
				var4(var2)
				
				return
			elseif var3 == "options" and p1.initialMode ~= "options" then
				var4(var2)
				
				return
			end
			p1.onClose()
		end, { var2, var3, p1.initialMode, p1.onClose }),
		onOpenCreate = p1.onCreateProduct or reactModule.useCallback(function()
			-- upvalues: getBuildPromptDraftStoreModule (copy), p1 (ref), var1 (ref), onComposerActivated (ref)
			getBuildPromptDraftStoreModule().queueDraft({
				autoSend = true,
				universeId = p1.universeId,
				sessionId = p1.sessionId,
				text = var1.createProductPrompt
			})
			onComposerActivated()
		end, {
			onComposerActivated,
			var1.createProductPrompt,
			p1.sessionId,
			p1.universeId
		}),
		onOpenOptions = reactModule.useCallback(function()
			-- upvalues: var4 (ref)
			var4("options")
		end, {}),
		onProductActivated = reactModule.useCallback(function(p2)
			-- upvalues: products (ref), var6 (ref), var4 (ref)
			for i, v in products do
				if v.id == p2 then
					var6(v)
					var4("detail")
					
					return
				end
			end
		end, { products }),
		onManagedPricingChanged = var8,
		onProductManagedPricingChanged = reactModule.useCallback(function(p3)
			-- upvalues: var5 (ref), p1 (ref), var13 (ref), var6 (ref), var16 (ref), var14 (ref)
			local var17 = if var5 ~= nil then nil else tonumber(var5.id)
			
			if var5 == nil or var17 == nil or (p1.onUpdateProductManagedPricing == nil or var13) then
				return
			end
			local cloned = table.clone(var5)
			cloned.isManagedPricingEnabled = p3
			var6(cloned)
			var16(false)
			var14(true)
			p1.onUpdateProductManagedPricing(var17, p3):catch(function()
				-- upvalues: var6 (copy), var5 (ref), var16 (copy)
				var6(var5)
				var16(true)
			end):finally(function()
				-- upvalues: var14 (copy)
				var14(false)
			end)
		end, { var13, p1.onUpdateProductManagedPricing, var5 }),
		onAllowIndividualManagedPricingChanged = var10,
		onShopButtonChanged = var12,
		onViewAllPrices = p1.onViewAllPrices,
		onRetryCatalog = p1.onRetryCatalog or function() end,
		labels = {
			title = var1.title,
			options = var1.options,
			managedPricing = var1.managedPricing,
			managedPricingDescription = var1.managedPricingDescription,
			allowIndividualManagedPricing = var1.allowIndividualManagedPricing,
			allowIndividualManagedPricingDescription = var1.allowIndividualManagedPricingDescription,
			pricingOptions = var1.pricingOptions,
			pricingOptionsDescription = var1.pricingOptionsDescription,
			shopUI = var1.shopUI,
			shopButton = var1.shopButton,
			shopButtonDescription = var1.shopButtonDescription,
			emptyCreateProduct = var1.emptyCreateProduct,
			pricing = var1.pricing,
			regionalPricing = var1.regionalPricing,
			viewAll = var1.viewAll,
			loading = var1.loading,
			loadError = var1.loadError,
			retry = var1.retry,
			updateError = var1.updateError
		}
	}
end