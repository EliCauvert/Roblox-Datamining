local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(buildExperience.Components.Chat.ChatComposer)
local _ = require(buildExperience.Components.Chat.ChatActions)
local _ = require(buildExperience.Chat.chatTypes)
local useOnScreenKeyboardHeightModule = require(buildExperience.utils.useOnScreenKeyboardHeight)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local getBuildPromptDraftStoreModule = require(buildExperience.Stores.GetBuildPromptDraftStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local formatErrorModule = require(buildExperience.utils.formatError)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceDeveloperProductContextModule = require(buildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local fFlagBuildExperienceMonetizationProductEditingModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationProductEditing)
local fFlagBuildExperienceRemoveDevProductPriceCap = require(parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap
local _ = require(script.Parent.MonetizationPageView)
local t = {}
local var1 = if fFlagBuildExperienceDeveloperProductContextModule then urlBuilder.fromString("apis:developer-products/v2/universes/{universeId}/developer-products/{productId}/creator") else nil

local function _(p1, p2, p3)
	-- upvalues: fFlagBuildExperienceMonetizationNativeUIModule (ref), formatErrorModule (ref)
	if fFlagBuildExperienceMonetizationNativeUIModule then
		warn(`[DeveloperProduct] action={p1} productId={p2} failed={string.sub(string.gsub(formatErrorModule(p3), "[\r\n]+", " "), 1, 200)}`)
		
		return
	end
end

local _ = function(p1)
	-- upvalues: formatErrorModule (ref)
	return string.sub(string.gsub(formatErrorModule(p1), "[\r\n]+", " "), 1, 200)
end

local _ = function(p1, p2, p3)
	-- upvalues: sendBuildExperienceEventModule (ref)
	if p3 == nil then
		sendBuildExperienceEventModule(p1, p2)
		
		return
	end
	sendBuildExperienceEventModule(p1, p2, p3)
end

local function noop(_) end

local t_1 = {
	isProductSaleStatusPending = false,
	productSaleStatusError = false,
	isProductEditPending = false,
	productEditError = nil,
	editName = "",
	editDescription = "",
	editPrice = "",
	selectedProductIdRef = { current = nil },
	setIsProductSaleStatusPending = noop,
	setProductSaleStatusError = noop,
	setIsProductEditPending = noop,
	setProductEditError = noop,
	setEditName = noop,
	setEditDescription = noop,
	setEditPrice = noop
}
local t_2 = {
	loadStatus = "NotReady",
	canMonetize = false,
	canChangeManagedPricing = false,
	managedPricingState = "Unavailable",
	managedPricingSupportingText = nil,
	shopButtonEnabled = false,
	isManagedPricingPending = false,
	isShopButtonPending = false,
	managedPricingError = nil,
	shopButtonError = nil,
	showAcknowledgement = false,
	onManagedPricingChanged = noop,
	onShopButtonChanged = noop,
	onConfirmManagedPricing = function() end,
	onCancelManagedPricing = function() end,
	onRetry = function() end,
	labels = {
		options = localizationStringsModule.MONETIZATION_OPTIONS,
		pricingOptions = localizationStringsModule.MONETIZATION_PRICING_OPTIONS,
		pricingOptionsDescription = localizationStringsModule.MONETIZATION_PRICING_OPTIONS_DESCRIPTION,
		managedPricing = localizationStringsModule.MONETIZATION_MANAGED_PRICING,
		managedPricingDescription = localizationStringsModule.MONETIZATION_MANAGED_PRICING_DESCRIPTION,
		shopUI = localizationStringsModule.MONETIZATION_SHOP_UI,
		shopButton = localizationStringsModule.MONETIZATION_SHOP_BUTTON,
		shopButtonDescription = localizationStringsModule.MONETIZATION_SHOP_BUTTON_DESCRIPTION,
		optionsLoadError = localizationStringsModule.MONETIZATION_OPTIONS_LOAD_ERROR,
		permissionDenied = localizationStringsModule.MONETIZATION_PERMISSION_DENIED,
		mixed = localizationStringsModule.MONETIZATION_MANAGED_PRICING_MIXED,
		unavailable = localizationStringsModule.MONETIZATION_MANAGED_PRICING_UNAVAILABLE,
		noEligibleProducts = localizationStringsModule.MONETIZATION_NO_ELIGIBLE_PRODUCTS,
		optionsUpdateError = localizationStringsModule.MONETIZATION_OPTIONS_UPDATE_ERROR,
		partialUpdateError = localizationStringsModule.MONETIZATION_MANAGED_PRICING_PARTIAL_ERROR,
		acknowledgementTitle = localizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_TITLE,
		acknowledgementDescription = localizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_DESCRIPTION,
		agree = localizationStringsModule.MONETIZATION_AGREE
	}
}

local _ = function(p1)
	return string.match(p1, "^%s*(.-)%s*$") or ""
end

local _ = function(p1)
	return utf8.len(p1) or #p1
end

local function useManageProductState(p1)
	-- upvalues: reactModule (ref)
	local var2 = reactModule.useRef(if p1 ~= nil then nil else p1.id)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(if p1 ~= nil then "" else p1.name)
	local var13, var14 = reactModule.useState(if p1 ~= nil then "" else p1.description)
	local useState = reactModule.useState
	local var15 = if p1 == nil or p1.priceInRobux == nil then "" else tostring(p1.priceInRobux)
	useState, var32 = useState(var15)
	
	return {
		selectedProductIdRef = var2,
		isProductSaleStatusPending = var3,
		setIsProductSaleStatusPending = var4,
		productSaleStatusError = var5,
		setProductSaleStatusError = var6,
		isProductEditPending = var7,
		setIsProductEditPending = var8,
		productEditError = var9,
		setProductEditError = var10,
		editName = var11,
		setEditName = var12,
		editDescription = var13,
		setEditDescription = var14,
		editPrice = useState,
		setEditPrice = var15
	}
end

local function getEligibleProducts(p1)
	local t = {}
	
	for i, v in p1 do
		if v.isForSale == true and v.isArchived ~= true and (v.isImmutable ~= true and v.isInActivePriceOptimizationExperiment ~= true) and (v.priceInRobux ~= nil and v.priceInRobux > 0) then
			table.insert(t, v)
		end
	end
	return t
end

local _ = function(p2)
	return p2 ~= nil and (if p2.isArchived ~= true then if p2.isImmutable ~= true then p2.isInActivePriceOptimizationExperiment == true else true else true)
end

local _ = function(p2, p3)
	if p2 == nil or p2 == "Disabled" then
		return "Unavailable"
	end
	local var2 = 0
	
	for i, v in p3 do
		if v.isManagedPricingEnabled == true then
			var2 += 1
		end
	end
	return if var2 == 0 then "AllOff" elseif var2 == #p3 then "AllOn" else "Mixed"
end

local function getShopButtonEnabled(p4)
	local var3 = if p4 ~= nil then nil else p4[1]
	
	for i, v in if var3 == nil or var3.entryPoints == nil then {} else var3.entryPoints do
		if v.name == "InExperienceGlobalIconEnabled" then
			return v.isEnabled == true
		end
	end
	return false
end

local _ = function(p5)
	for i, v in p5 do
		if v == "Failed" then
			return "Failed"
		end
	end
	for i, v in p5 do
		if v ~= "Ready" then
			return "NotReady"
		end
	end
	return "Ready"
end

local _ = function(p6, p7)
	return if p6 == nil then p7 elseif p6 then "AllOn" else "AllOff"
end

local function useOptionsState(p6, p7, p8, p9, p10)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), getEligibleProducts (ref), getShopButtonEnabled (ref), reactModule (ref), sendBuildExperienceEventModule (ref), formatErrorModule (ref)
	local var4
	local var5 = useLocalization({
		options = localizationStringsModule.MONETIZATION_OPTIONS,
		pricingOptions = localizationStringsModule.MONETIZATION_PRICING_OPTIONS,
		pricingOptionsDescription = localizationStringsModule.MONETIZATION_PRICING_OPTIONS_DESCRIPTION,
		managedPricing = localizationStringsModule.MONETIZATION_MANAGED_PRICING,
		managedPricingDescription = localizationStringsModule.MONETIZATION_MANAGED_PRICING_DESCRIPTION,
		shopUI = localizationStringsModule.MONETIZATION_SHOP_UI,
		shopButton = localizationStringsModule.MONETIZATION_SHOP_BUTTON,
		shopButtonDescription = localizationStringsModule.MONETIZATION_SHOP_BUTTON_DESCRIPTION,
		optionsLoadError = localizationStringsModule.MONETIZATION_OPTIONS_LOAD_ERROR,
		permissionDenied = localizationStringsModule.MONETIZATION_PERMISSION_DENIED,
		mixed = localizationStringsModule.MONETIZATION_MANAGED_PRICING_MIXED,
		unavailable = localizationStringsModule.MONETIZATION_MANAGED_PRICING_UNAVAILABLE,
		noEligibleProducts = localizationStringsModule.MONETIZATION_NO_ELIGIBLE_PRODUCTS,
		optionsUpdateError = localizationStringsModule.MONETIZATION_OPTIONS_UPDATE_ERROR,
		partialUpdateError = localizationStringsModule.MONETIZATION_MANAGED_PRICING_PARTIAL_ERROR,
		acknowledgementTitle = localizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_TITLE,
		acknowledgementDescription = localizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_DESCRIPTION,
		agree = localizationStringsModule.MONETIZATION_AGREE
	})
	local var6 = getEligibleProducts(p7)
	local managedPricingStatus = p6.managedPricingStatus
	
	if managedPricingStatus == nil or managedPricingStatus == "Disabled" then
		var4 = "Unavailable"
	else
		local var7 = 0
		
		for i, v in var6 do
			if v.isManagedPricingEnabled == true then
				var7 += 1
			end
		end
		var4 = if var7 == 0 then "AllOff" elseif var7 == #var6 then "AllOn" else "Mixed"
	end
	local var8, v
	managedPricingStatus = getShopButtonEnabled(p6.shops)
	local list = {
		p6.managedPricingLoadStatus or "NotReady",
		p6.shopsLoadStatus or "NotReady",
		p6.permissionLoadStatus or "NotReady"
	}
	
	for i, v in list do
		if v == "Failed" then
			var8 = "Failed"
			local var9 = var8 == "Ready" and p6.permissionCanMonetize == true
			local var10, var11 = reactModule.useState(false)
			var45, v = reactModule.useState(false)
			local var12, var13 = reactModule.useState(nil)
			local var14, var15 = reactModule.useState(nil)
			local var16, var17 = reactModule.useState(nil)
			local var18, var19 = reactModule.useState(nil)
			local var20, var21 = reactModule.useState(false)
			local var22 = reactModule.useRef(nil)
			local var23 = reactModule.useRef(nil)
			reactModule.useLayoutEffect(function()
				-- upvalues: var22 (ref), var23 (ref), var11 (ref), v (ref), var13 (ref), var15 (ref), var17 (ref), var19 (ref), var21 (ref)
				var22.current = nil
				var23.current = nil
				var11(false)
				v(false)
				var13(nil)
				var15(nil)
				var17(nil)
				var19(nil)
				var21(false)
			end, { p6.universeId or 0 })
			reactModule.useEffect(function()
				-- upvalues: var12 (ref), var4 (ref), var13 (ref)
				if var12 ~= nil and (var12 and var4 == "AllOn" or not var12 and var4 == "AllOff") then
					var13(nil)
				end
			end, { var4, var12 })
			reactModule.useEffect(function()
				-- upvalues: var14 (ref), managedPricingStatus (ref), var15 (ref)
				if var14 ~= nil and var14 == managedPricingStatus then
					var15(nil)
				end
			end, { var14, managedPricingStatus })
			local var24 = reactModule.useCallback(function(p11, p12)
				-- upvalues: p6 (ref), p9 (ref), p10 (ref), var22 (ref), var10 (ref), var9 (ref), var6 (ref), var21 (ref), var17 (ref), var13 (ref), var11 (ref), p8 (ref), sendBuildExperienceEventModule (copy), var5 (ref), formatErrorModule (copy)
				local onUpdateManagedPricing = p6.onUpdateManagedPricing
				
				if p9.current ~= p10 or var22.current ~= nil or (var10 or not var9) or (onUpdateManagedPricing == nil or p6.managedPricingStatus == nil or (p6.managedPricingStatus == "Disabled" or #var6 == 0)) then return end
				local t = {}
				
				for i, v in var6 do
					local var25 = tonumber(v.id)
					
					if var25 ~= nil then
						table.insert(t, var25)
					end
				end
				if #t == 0 then
					var21(false)
					
					return
				end
				local t_1 = {}
				var22.current = t_1
				var17(nil)
				var13(p11)
				var11(true);
				(if p12 and p6.onAcceptManagedPricing ~= nil then p6.onAcceptManagedPricing():andThen(function()
					-- upvalues: p9 (copy), p10 (copy), var22 (copy), t_1 (ref), onUpdateManagedPricing (ref), t (ref), p11 (ref)
					return if p9.current == p10 and var22.current == t_1 then onUpdateManagedPricing(t, p11) else nil
				end) else onUpdateManagedPricing(t, p11)):andThen(function(p13)
					-- upvalues: p9 (copy), p10 (copy), var22 (copy), t_1 (ref), var21 (copy), p8 (copy), sendBuildExperienceEventModule (copy), var13 (copy), var17 (copy), var5 (copy)
					if p9.current ~= p10 or var22.current ~= t_1 then return end
					var21(false)
					
					if type(p13) == "table" and type(p13.errors) == "table" and #p13.errors > 0 then
						warn(`[MonetizationOptions] Managed Pricing update partially failed (universeId={tostring(p8.universeId)})`)
						local t = { action = "managed_pricing", failureType = "partial" }
						
						if t == nil then
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8)
						else
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8, t)
						end
						var13(nil)
						var17(var5.partialUpdateError)
						
						return
					else
						local t = { action = "managed_pricing" }
						
						if t == nil then
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p8)
							
							return
						end
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p8, t)
					end
				end):catch(function(p13)
					-- upvalues: p9 (copy), p10 (copy), var22 (copy), t_1 (ref), p8 (copy), formatErrorModule (copy), sendBuildExperienceEventModule (copy), var21 (copy), var13 (copy), var17 (copy), var5 (copy)
					if p9.current ~= p10 or var22.current ~= t_1 then return end
					warn(`[MonetizationOptions] Managed Pricing update failed (universeId={tostring(p8.universeId)}): {string.sub(string.gsub(formatErrorModule(p13), "[\r\n]+", " "), 1, 200)}`)
					local t = { action = "managed_pricing", failureType = "request" }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8)
					else
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8, t)
					end
					var21(false)
					var13(nil)
					var17(var5.optionsUpdateError)
				end):finally(function()
					-- upvalues: p9 (copy), p10 (copy), var22 (copy), t_1 (ref), var11 (copy)
					if p9.current == p10 and var22.current == t_1 then
						var22.current = nil
						var11(false)
					end
				end)
			end, {
				var9, var6, var10, var5.optionsUpdateError, var5.partialUpdateError,
				p6.managedPricingStatus, p6.onAcceptManagedPricing,
				p6.onUpdateManagedPricing, p8, p10
			})
			local var26 = if var12 == nil then var4 elseif var12 then "AllOn" else "AllOff"
			
			return {
				loadStatus = var8,
				canMonetize = var9,
				canChangeManagedPricing = var9 and (p6.onUpdateManagedPricing ~= nil and (#var6 > 0 and var26 ~= "Unavailable")),
				managedPricingState = var26,
				managedPricingSupportingText = if #var6 == 0 and var26 ~= "Unavailable" then var5.noEligibleProducts else nil,
				shopButtonEnabled = if var14 ~= nil then managedPricingStatus else var14,
				isManagedPricingPending = var10,
				isShopButtonPending = var45,
				managedPricingError = var16,
				shopButtonError = var18,
				showAcknowledgement = var20,
				onManagedPricingChanged = reactModule.useCallback(function(p13)
					-- upvalues: p9 (ref), p10 (ref), var9 (ref), p6 (ref), var6 (ref), var21 (ref), var24 (ref)
					if p9.current ~= p10 or not var9 or (p6.onUpdateManagedPricing == nil or p6.managedPricingStatus == nil) or (p6.managedPricingStatus == "Disabled" or #var6 == 0) then return end
					if p6.managedPricingStatus == "Pending" and p13 then
						var21(true)
						
						return
					end
					var24(p13, false)
				end, {
					var9,
					var6,
					p6.managedPricingStatus,
					p6.onUpdateManagedPricing,
					var24
				}),
				onShopButtonChanged = reactModule.useCallback(function(p13)
					-- upvalues: p6 (ref), p9 (ref), p10 (ref), var23 (ref), var45 (ref), var9 (ref), var19 (ref), var15 (ref), v (ref), p8 (ref), sendBuildExperienceEventModule (copy), formatErrorModule (copy), var5 (ref)
					local onSetShopButton = p6.onSetShopButton
					
					if p9.current == p10 and var23.current == nil and (not var45 and var9) and onSetShopButton ~= nil then
						local t = {}
						var23.current = t
						var19(nil)
						var15(p13)
						v(true)
						onSetShopButton(p13):andThen(function()
							-- upvalues: p9 (copy), p10 (copy), var23 (copy), t (ref), p8 (copy), sendBuildExperienceEventModule (copy)
							if p9.current ~= p10 or var23.current ~= t then return end
							local t_1 = { action = "shop_button" }
							
							if t_1 == nil then
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p8)
								
								return
							end
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p8, t_1)
						end):catch(function(p14)
							-- upvalues: p9 (copy), p10 (copy), var23 (copy), t (ref), p8 (copy), formatErrorModule (copy), sendBuildExperienceEventModule (copy), var15 (copy), var19 (copy), var5 (copy)
							if p9.current ~= p10 or var23.current ~= t then return end
							warn(`[MonetizationOptions] Shop button update failed (universeId={tostring(p8.universeId)}): {string.sub(string.gsub(formatErrorModule(p14), "[\r\n]+", " "), 1, 200)}`)
							local t_1 = { action = "shop_button", failureType = "request" }
							
							if t_1 == nil then
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8)
							else
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8, t_1)
							end
							var15(nil)
							var19(var5.optionsUpdateError)
						end):finally(function()
							-- upvalues: p9 (copy), p10 (copy), var23 (copy), t (ref), v (copy)
							if p9.current == p10 and var23.current == t then
								var23.current = nil
								v(false)
							end
						end)
						
						return
					end
				end, {
					var9, var45, var5.optionsUpdateError, p6.onSetShopButton, p8, p10
				}),
				onConfirmManagedPricing = function()
					-- upvalues: var24 (ref)
					var24(true, true)
				end,
				onCancelManagedPricing = function()
					-- upvalues: var10 (ref), var21 (ref)
					if not var10 then
						var21(false)
					end
				end,
				onRetry = p6.onRetryOptions or function() end,
				labels = var5
			}
		end
	end
	for i_1, v in list do
		if v ~= "Ready" then
			var8 = "NotReady"
		end
	end
	var8 = "Ready"
end

return function(p11)
	-- upvalues: useLocalization (ref), fFlagBuildExperienceDeveloperProductContextModule (ref), localizationStringsModule (ref), t (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), reactModule (ref), t_2 (ref), useOptionsState (ref), fFlagBuildExperienceMonetizationProductEditingModule (ref), t_1 (ref), useManageProductState (ref), sendBuildExperienceEventModule (ref), formatErrorModule (ref), fFlagBuildExperienceRemoveDevProductPriceCap (ref), useOnScreenKeyboardHeightModule (ref), getBuildPromptDraftStoreModule (ref), var1 (ref)
	local var25 = useLocalization({
		composerPlaceholder = if fFlagBuildExperienceDeveloperProductContextModule then localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER else nil,
		title = localizationStringsModule.MONETIZATION_TITLE,
		emptyTitle = localizationStringsModule.MONETIZATION_EMPTY_TITLE,
		emptyDescription = localizationStringsModule.MONETIZATION_EMPTY_DESCRIPTION,
		emptyCreateProduct = localizationStringsModule.MONETIZATION_EMPTY_CREATE_PRODUCT,
		createProductPrompt = localizationStringsModule.MONETIZATION_CREATE_PRODUCT_PROMPT,
		pricing = localizationStringsModule.MONETIZATION_PRICING,
		regionalPricing = localizationStringsModule.MONETIZATION_REGIONAL_PRICING,
		loading = localizationStringsModule.MONETIZATION_LOADING,
		loadErrorTitle = localizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE,
		loadErrorDescription = localizationStringsModule.CHAT_ERROR_UPSTREAM_UNAVAILABLE,
		updateError = localizationStringsModule.CHAT_DEFAULT_FAILURE,
		retry = localizationStringsModule.MONETIZATION_RETRY,
		availableForPurchase = localizationStringsModule.MONETIZATION_AVAILABLE_FOR_PURCHASE,
		edit = localizationStringsModule.MONETIZATION_EDIT,
		editProduct = localizationStringsModule.MONETIZATION_EDIT_PRODUCT,
		name = localizationStringsModule.MONETIZATION_NAME,
		description = localizationStringsModule.MONETIZATION_DESCRIPTION,
		price = localizationStringsModule.MONETIZATION_PRICE,
		cancel = localizationStringsModule.MONETIZATION_CANCEL,
		save = localizationStringsModule.MONETIZATION_SAVE,
		nameRequiredError = localizationStringsModule.MONETIZATION_NAME_REQUIRED_ERROR,
		nameLengthError = localizationStringsModule.MONETIZATION_NAME_LENGTH_ERROR,
		descriptionLengthError = localizationStringsModule.MONETIZATION_DESCRIPTION_LENGTH_ERROR,
		priceError = localizationStringsModule.MONETIZATION_PRICE_ERROR,
		priceRequiredForSale = localizationStringsModule.MONETIZATION_PRICE_REQUIRED_FOR_SALE,
		moderationError = localizationStringsModule.MONETIZATION_MODERATION_ERROR
	})
	local products = p11.products or t
	local var26 = if fFlagBuildExperienceMonetizationNativeUIModule or p11.initialMode ~= "options" then p11.initialMode else nil
	local var27 = reactModule.useMemo(function()
		-- upvalues: p11 (ref)
		return {
			messageId = nil,
			turnId = nil,
			universeId = p11.universeId,
			placeId = p11.placeId,
			conversationId = p11.sessionId
		}
	end, {
		p11.placeId or 0,
		p11.sessionId or "",
		p11.universeId or 0
	})
	local var28 = reactModule.useMemo(function()
		return {}
	end, { p11.universeId or 0 })
	local var29 = reactModule.useRef(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var29 (ref), var28 (ref)
		var29.current = var28
		
		return function()
			-- upvalues: var29 (copy), var28 (copy)
			if var29.current == var28 then
				var29.current = nil
			end
		end
	end, { var28 })
	local var30 = if fFlagBuildExperienceMonetizationNativeUIModule then useOptionsState(p11, products, var27, var29, var28) else t_2
	local var31 = if #products > 0 then "catalog" else "empty"
	local var32 = if var26 == "detail" or fFlagBuildExperienceMonetizationProductEditingModule and var26 == "edit" then products[1] else nil
	local var33, var34 = reactModule.useState(var26 or var31)
	local var35, var36 = reactModule.useState(var32)
	local var37, var38 = reactModule.useState(false)
	local var39, var40 = reactModule.useState(false)
	local var41 = reactModule.useRef(nil)
	local var42 = if fFlagBuildExperienceMonetizationProductEditingModule then useManageProductState(var32) else t_1
	local selectedProductIdRef = var42.selectedProductIdRef
	local isProductSaleStatusPending = var42.isProductSaleStatusPending
	local setIsProductSaleStatusPending = var42.setIsProductSaleStatusPending
	local productSaleStatusError = var42.productSaleStatusError
	local setProductSaleStatusError = var42.setProductSaleStatusError
	local isProductEditPending = var42.isProductEditPending
	local setIsProductEditPending = var42.setIsProductEditPending
	local productEditError = var42.productEditError
	local setProductEditError = var42.setProductEditError
	local editName = var42.editName
	local setEditName = var42.setEditName
	local editDescription = var42.editDescription
	local setEditDescription = var42.setEditDescription
	local editPrice = var42.editPrice
	local setEditPrice = var42.setEditPrice
	reactModule.useLayoutEffect(function()
		-- upvalues: var41 (ref), var34 (ref), var26 (ref), var31 (ref), var36 (ref), var32 (ref), var38 (ref), var40 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), selectedProductIdRef (ref), setIsProductSaleStatusPending (ref), setProductSaleStatusError (ref), setIsProductEditPending (ref), setProductEditError (ref), setEditName (ref), setEditDescription (ref), setEditPrice (ref)
		var41.current = nil
		var34(var26 or var31)
		var36(var32)
		var38(false)
		var40(false)
		
		if fFlagBuildExperienceMonetizationProductEditingModule then
			selectedProductIdRef.current = if var32 ~= nil then nil else var32.id
			setIsProductSaleStatusPending(false)
			setProductSaleStatusError(false)
			setIsProductEditPending(false)
			setProductEditError(nil)
			setEditName(if var32 ~= nil then "" else var32.name)
			setEditDescription(if var32 ~= nil then "" else var32.description)
			setEditPrice(if var32 == nil or var32.priceInRobux == nil then "" else tostring(var32.priceInRobux))
		end
	end, { p11.universeId or 0 })
	reactModule.useEffect(function()
		-- upvalues: var27 (ref), sendBuildExperienceEventModule (copy)
		local t = { source = "monetization_page" }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var27)
		else
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var27, t)
		end
		sendBuildExperienceEventModule("MONETIZATION_PAGE_IMPRESSION", var27)
	end, { var27 })
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var33 (ref), var31 (ref), var34 (ref)
		if var26 == nil and (var33 == "catalog" or var33 == "empty") and var33 ~= var31 then
			var34(var31)
		end
	end, { var31, var26, var33 })
	local var43 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), var33 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationProductEditingModule (copy), isProductEditPending (ref), var41 (ref), setProductEditError (ref), var34 (ref), selectedProductIdRef (ref), var36 (ref), var31 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var26 (ref), p11 (ref)
		local t = { mode = tostring(var33) }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var27)
		else
			sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var27, t)
		end
		if fFlagBuildExperienceMonetizationProductEditingModule and var33 == "edit" then
			if isProductEditPending or var41.current ~= nil then
				return
			end
			setProductEditError(nil)
			var34("detail")
			
			return
		elseif var33 == "detail" then
			if fFlagBuildExperienceMonetizationProductEditingModule then
				selectedProductIdRef.current = nil
			end
			var36(nil)
			var34(var31)
			
			return
		elseif fFlagBuildExperienceMonetizationNativeUIModule and var33 == "options" and var26 ~= "options" then
			var34(var31)
			
			return
		end
		p11.onClose()
	end, {
		var31,
		if fFlagBuildExperienceMonetizationProductEditingModule then isProductEditPending else nil,
		var33, var26, p11.onClose, var27, setProductEditError
	})
	local var44 = reactModule.useCallback(function(p12)
		-- upvalues: products (ref), var27 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationProductEditingModule (copy), var40 (ref), setProductSaleStatusError (ref), setProductEditError (ref), selectedProductIdRef (ref), var36 (ref), var34 (ref)
		for i, v in products do
			if v.id == p12 then
				local t = { productId = v.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var27)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var27, t)
				end
				if fFlagBuildExperienceMonetizationProductEditingModule then
					var40(false)
					setProductSaleStatusError(false)
					setProductEditError(nil)
				end
				if fFlagBuildExperienceMonetizationProductEditingModule then
					selectedProductIdRef.current = v.id
				end
				var36(v)
				var34("detail")
				
				return
			end
		end
	end, { products, var27 })
	local var45 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useCallback(function()
		-- upvalues: var34 (ref)
		var34("options")
	end, {}) else function() end
	local var46 = reactModule.useCallback(function(p13)
		-- upvalues: var35 (ref), p11 (ref), var29 (ref), var28 (ref), var41 (ref), var37 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), isProductSaleStatusPending (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var40 (ref), var27 (ref), sendBuildExperienceEventModule (copy), var36 (ref), var38 (ref), formatErrorModule (copy), selectedProductIdRef (ref)
		local var47 = if var35 ~= nil then nil else tonumber(var35.id)
		local onUpdateProductManagedPricing = p11.onUpdateProductManagedPricing
		
		if var29.current == var28 and var41.current == nil and (var35 ~= nil and var47 ~= nil) and (onUpdateProductManagedPricing ~= nil and not var37 and (not fFlagBuildExperienceMonetizationProductEditingModule or not isProductSaleStatusPending)) then
			if var35 ~= nil and (if var35.isArchived ~= true then if var35.isImmutable ~= true then var35.isInActivePriceOptimizationExperiment == true else true else true) then return end
			if fFlagBuildExperienceMonetizationNativeUIModule and p13 and var35.priceInRobux == nil then
				var40(true)
				
				return
			end
			local t = {}
			var41.current = t
			local t_1 = { isEnabled = tostring(p13), productId = var35.id }
			
			if t_1 == nil then
				sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var27)
			else
				sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var27, t_1)
			end
			local cloned = table.clone(var35)
			cloned.isManagedPricingEnabled = p13
			var36(cloned)
			var40(false)
			var38(true)
			onUpdateProductManagedPricing(var47, p13):andThen(function()
				-- upvalues: var29 (copy), var28 (copy), var41 (copy), t (ref), var27 (copy), var35 (ref), sendBuildExperienceEventModule (copy)
				if var29.current ~= var28 or var41.current ~= t then return end
				local t_1 = { action = "managed_pricing", productId = var35.id }
				
				if t_1 == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var27)
					
					return
				end
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var27, t_1)
			end):catch(function(p14)
				-- upvalues: var29 (copy), var28 (copy), var41 (copy), t (ref), var35 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), var27 (copy), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationProductEditingModule (copy), selectedProductIdRef (copy), var36 (copy), var40 (copy)
				if var29.current ~= var28 or var41.current ~= t then return end
				local id = var35.id
				
				if fFlagBuildExperienceMonetizationNativeUIModule then
					warn(`[DeveloperProduct] action=managed_pricing productId={id} failed={string.sub(string.gsub(formatErrorModule(p14), "[\r\n]+", " "), 1, 200)}`)
				end
				local t_1 = { action = "managed_pricing", productId = var35.id }
				
				if t_1 == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var27)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var27, t_1)
				end
				if not fFlagBuildExperienceMonetizationProductEditingModule or selectedProductIdRef.current == var35.id then
					var36(var35)
					var40(true)
				end
			end):finally(function()
				-- upvalues: var29 (copy), var28 (copy), var41 (copy), t (ref), var38 (copy)
				if var29.current == var28 and var41.current == t then
					var41.current = nil
					var38(false)
				end
			end)
			
			return
		end
	end, {
		var37,
		if fFlagBuildExperienceMonetizationProductEditingModule then isProductSaleStatusPending else nil,
		p11.onUpdateProductManagedPricing, var35, var27, var28
	})
	local var47 = reactModule.useCallback(function(p13)
		-- upvalues: var35 (ref), p11 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), var29 (ref), var28 (ref), var41 (ref), isProductSaleStatusPending (ref), var37 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), setProductSaleStatusError (ref), var27 (ref), sendBuildExperienceEventModule (copy), var36 (ref), setIsProductSaleStatusPending (ref), formatErrorModule (copy), selectedProductIdRef (ref)
		local var48 = if var35 ~= nil then nil else tonumber(var35.id)
		local onUpdateProductSaleStatus = p11.onUpdateProductSaleStatus
		
		if fFlagBuildExperienceMonetizationProductEditingModule and var29.current == var28 and (var41.current == nil and var35 ~= nil) and (var48 ~= nil and onUpdateProductSaleStatus ~= nil and (not isProductSaleStatusPending and not var37)) then
			if var35 ~= nil and (if var35.isArchived ~= true then if var35.isImmutable ~= true then var35.isInActivePriceOptimizationExperiment == true else true else true) then return end
			if fFlagBuildExperienceMonetizationNativeUIModule and p13 and var35.priceInRobux == nil then
				setProductSaleStatusError(true)
				
				return
			end
			local t = {}
			var41.current = t
			local t_1 = { isEnabled = tostring(p13), productId = var35.id }
			
			if t_1 == nil then
				sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var27)
			else
				sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var27, t_1)
			end
			local cloned = table.clone(var35)
			cloned.isForSale = p13
			var36(cloned)
			setProductSaleStatusError(false)
			setIsProductSaleStatusPending(true)
			onUpdateProductSaleStatus(var48, p13):andThen(function()
				-- upvalues: var29 (copy), var28 (copy), var41 (copy), t (ref), var27 (copy), var35 (ref), sendBuildExperienceEventModule (copy)
				if var29.current ~= var28 or var41.current ~= t then return end
				local t_1 = { action = "sale_status", productId = var35.id }
				
				if t_1 == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var27)
					
					return
				end
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var27, t_1)
			end):catch(function(p14)
				-- upvalues: var29 (copy), var28 (copy), var41 (copy), t (ref), var35 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), var27 (copy), sendBuildExperienceEventModule (copy), selectedProductIdRef (copy), var36 (copy), setProductSaleStatusError (copy)
				if var29.current ~= var28 or var41.current ~= t then return end
				local id = var35.id
				
				if fFlagBuildExperienceMonetizationNativeUIModule then
					warn(`[DeveloperProduct] action=sale_status productId={id} failed={string.sub(string.gsub(formatErrorModule(p14), "[\r\n]+", " "), 1, 200)}`)
				end
				local t_1 = { action = "sale_status", productId = var35.id }
				
				if t_1 == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var27)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var27, t_1)
				end
				if selectedProductIdRef.current == var35.id then
					var36(var35)
					setProductSaleStatusError(true)
				end
			end):finally(function()
				-- upvalues: var29 (copy), var28 (copy), var41 (copy), t (ref), setIsProductSaleStatusPending (copy)
				if var29.current == var28 and var41.current == t then
					var41.current = nil
					setIsProductSaleStatusPending(false)
				end
			end)
			
			return
		end
	end, {
		var37, isProductSaleStatusPending, p11.onUpdateProductSaleStatus, var35, var27,
		var28
	})
	local var48 = reactModule.useCallback(function()
		-- upvalues: var35 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), var27 (ref), sendBuildExperienceEventModule (copy), setEditName (ref), setEditDescription (ref), setEditPrice (ref), setProductEditError (ref), var34 (ref)
		if fFlagBuildExperienceMonetizationProductEditingModule and var35 ~= nil then
			if var35 ~= nil and (if var35.isArchived ~= true then if var35.isImmutable ~= true then var35.isInActivePriceOptimizationExperiment == true else true else true) then return end
			local t = { productId = var35.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var27)
			else
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var27, t)
			end
			setEditName(var35.name)
			setEditDescription(var35.description)
			setEditPrice(if var35.priceInRobux ~= nil then "" else tostring(var35.priceInRobux))
			setProductEditError(nil)
			var34("edit")
			
			return
		end
	end, { var35, var27 })
	local var49 = reactModule.useCallback(function(p13)
		-- upvalues: setEditName (ref), setProductEditError (ref)
		setEditName(p13)
		setProductEditError(nil)
	end, {})
	local var50 = reactModule.useCallback(function(p13)
		-- upvalues: setEditDescription (ref), setProductEditError (ref)
		setEditDescription(p13)
		setProductEditError(nil)
	end, {})
	local var51 = reactModule.useCallback(function(p13)
		-- upvalues: setEditPrice (ref), setProductEditError (ref)
		setEditPrice(p13)
		setProductEditError(nil)
	end, {})
	local var52 = reactModule.useCallback(function()
		-- upvalues: isProductEditPending (ref), var41 (ref), var35 (ref), var27 (ref), sendBuildExperienceEventModule (copy), setProductEditError (ref), var34 (ref)
		if isProductEditPending or var41.current ~= nil then return end
		local var53 = if var35 ~= nil then nil else { productId = var35.id }
		
		if var53 == nil then
			sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var27)
		else
			sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var27, var53)
		end
		setProductEditError(nil)
		var34("detail")
	end, { isProductEditPending, var35, var27 })
	local var53 = reactModule.useCallback(function()
		-- upvalues: var35 (ref), p11 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), var29 (ref), var28 (ref), var41 (ref), isProductEditPending (ref), var27 (ref), sendBuildExperienceEventModule (copy), editName (ref), setProductEditError (ref), var25 (ref), editDescription (ref), editPrice (ref), fFlagBuildExperienceRemoveDevProductPriceCap (copy), setIsProductEditPending (ref), var36 (ref), var40 (ref), setProductSaleStatusError (ref), var34 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy)
		local var54 = if var35 ~= nil then nil else tonumber(var35.id)
		local onUpdateProduct = p11.onUpdateProduct
		
		if not fFlagBuildExperienceMonetizationProductEditingModule or var29.current ~= var28 or (var41.current ~= nil or var35 == nil) or (var54 == nil or onUpdateProduct == nil or isProductEditPending) then return end
		local t = { productId = var35.id }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var27)
		else
			sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var27, t)
		end
		local var55 = string.match(editName, "^%s*(.-)%s*$") or ""
		
		if var55 == "" then
			setProductEditError(var25.nameRequiredError)
			
			return
		elseif (utf8.len(var55) or #var55) > 50 then
			setProductEditError(var25.nameLengthError)
			
			return
		elseif (utf8.len(editDescription) or #editDescription) > 1000 then
			setProductEditError(var25.descriptionLengthError)
			
			return
		end
		local var56 = tonumber(editPrice)
		
		if editPrice == "" and var35.isForSale == true or editPrice ~= "" and var56 == nil or (var56 ~= nil and var56 % 1 ~= 0 or var56 ~= nil and var56 < 1) or not fFlagBuildExperienceRemoveDevProductPriceCap and var56 ~= nil and var56 > 1000000000 then
			setProductEditError(var25.priceError)
			
			return
		end
		local t_1 = {}
		var41.current = t_1
		setProductEditError(nil)
		setIsProductEditPending(true)
		onUpdateProduct(var54, {
			name = var55,
			description = editDescription,
			priceInRobux = var56
		}):andThen(function(p13)
			-- upvalues: var29 (copy), var28 (copy), var41 (copy), t_1 (ref), var27 (copy), var35 (ref), sendBuildExperienceEventModule (copy), var55 (ref), editDescription (copy), var56 (ref), var36 (copy), var40 (copy), setProductSaleStatusError (copy), setProductEditError (copy), var25 (copy), var34 (copy)
			if var29.current ~= var28 or var41.current ~= t_1 then return end
			local t = { action = "product_details", productId = var35.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var27)
			else
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var27, t)
			end
			local cloned = table.clone(var35)
			cloned.name = p13.name or var55
			cloned.description = if p13.description ~= nil then editDescription else p13.description
			local var57 = (if p13.priceInformation ~= nil then nil else p13.priceInformation.defaultPriceInRobux) or (var56 or var35.priceInRobux)
			cloned.priceInRobux = var57
			cloned.price = if var57 ~= nil then var35.price else tostring(var57)
			var36(cloned)
			var40(false)
			setProductSaleStatusError(false)
			
			if (p13.name == nil or p13.name == var55) and (p13.description == nil or p13.description == editDescription) then
				var34("detail")
				
				return
			end
			setProductEditError(var25.moderationError)
		end):catch(function(p13)
			-- upvalues: var29 (copy), var28 (copy), var41 (copy), t_1 (ref), var35 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), var27 (copy), sendBuildExperienceEventModule (copy), setProductEditError (copy), var25 (copy)
			if var29.current ~= var28 or var41.current ~= t_1 then return end
			local id = var35.id
			
			if fFlagBuildExperienceMonetizationNativeUIModule then
				warn(`[DeveloperProduct] action=product_details productId={id} failed={string.sub(string.gsub(formatErrorModule(p13), "[\r\n]+", " "), 1, 200)}`)
			end
			local t = { action = "product_details", productId = var35.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var27)
			else
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var27, t)
			end
			setProductEditError(var25.updateError)
		end):finally(function()
			-- upvalues: var29 (copy), var28 (copy), var41 (copy), t_1 (ref), setIsProductEditPending (copy)
			if var29.current == var28 and var41.current == t_1 then
				var41.current = nil
				setIsProductEditPending(false)
			end
		end)
	end, {
		editDescription, editName, editPrice, isProductEditPending,
		var25.descriptionLengthError, var25.moderationError, var25.nameLengthError,
		var25.nameRequiredError, var25.priceError, var25.updateError,
		p11.onUpdateProduct, var35, var27, var28
	})
	local onComposerActivated = p11.onComposerActivated or p11.onClose
	local var54 = nil
	local var55 = nil
	
	if fFlagBuildExperienceDeveloperProductContextModule then
		local var56, var57 = reactModule.useBinding("")
		local var58 = reactModule.useRef(nil)
		var55 = useOnScreenKeyboardHeightModule()
		reactModule.useEffect(function()
			-- upvalues: var57 (ref)
			var57("")
		end, {
			p11.universeId or 0,
			p11.sessionId or "",
			if var35 ~= nil then "" else var35.id,
			var57
		})
		var54 = if var33 == "detail" and var35 ~= nil and p11.universeId ~= nil then {
			isAssistantResponding = false,
			canSendWhileResponding = false,
			allowImageAttachments = false,
			tracksExternalText = true,
			composerText = var56,
			onComposerChanged = var57,
			placeholder = var25.composerPlaceholder,
			textBoxRef = var58,
			onSend = reactModule.useCallback(function()
				-- upvalues: var56 (ref), var33 (ref), var35 (ref), p11 (ref), getBuildPromptDraftStoreModule (copy), var1 (copy), var57 (ref), var58 (ref), onComposerActivated (ref)
				local var59 = string.match(var56:getValue(), "^%s*(.-)%s*$") or ""
				
				if var59 == "" or var33 ~= "detail" or (var35 == nil or p11.universeId == nil) then
					return false
				end
				getBuildPromptDraftStoreModule().queueDraft({
					autoSend = true,
					universeId = p11.universeId,
					sessionId = p11.sessionId,
					text = var59,
					resourceAttachments = {
						{
							type = "resource_link",
							mimeType = "application/json",
							name = var35.name,
							uri = var1({ universeId = p11.universeId, productId = var35.id })
						}
					}
				})
				var57("")
				
				if var58.current ~= nil then
					var58.current.releaseFocus()
				end
				onComposerActivated()
				
				return true
			end, {
				var56, onComposerActivated, var33, p11.sessionId, p11.universeId, var35,
				var57
			}),
			onStop = function() end
		} else nil
	end
	return {
		mode = var33,
		keyboardHeight = if fFlagBuildExperienceDeveloperProductContextModule then if var33 == "detail" then var55 else 0 else nil,
		chatActions = var54,
		products = products,
		showOptions = fFlagBuildExperienceMonetizationNativeUIModule and p11.showOptions == true,
		optionsLoadStatus = var30.loadStatus,
		canMonetize = var30.canMonetize,
		canChangeManagedPricing = var30.canChangeManagedPricing,
		managedPricingState = var30.managedPricingState,
		managedPricingSupportingText = var30.managedPricingSupportingText,
		shopButtonEnabled = var30.shopButtonEnabled,
		isOptionsManagedPricingPending = var30.isManagedPricingPending,
		isShopButtonPending = var30.isShopButtonPending,
		managedPricingError = var30.managedPricingError,
		shopButtonError = var30.shopButtonError,
		showManagedPricingAcknowledgement = var30.showAcknowledgement,
		disableDialogPortal = p11.disableDialogPortal,
		selectedProduct = var35,
		isProductDisabled = if p11.isProductDisabled ~= true then var35 ~= nil and (if var35.isArchived ~= true then if var35.isImmutable ~= true then var35.isInActivePriceOptimizationExperiment == true else true else true) else true,
		isProductManagedPricingPending = var37,
		isProductSaleStatusPending = isProductSaleStatusPending,
		isProductEditPending = isProductEditPending,
		canUpdateProductManagedPricing = p11.onUpdateProductManagedPricing ~= nil,
		canManageProduct = fFlagBuildExperienceMonetizationProductEditingModule and (p11.onUpdateProductSaleStatus ~= nil and p11.onUpdateProduct ~= nil),
		productManagedPricingError = var39,
		productSaleStatusError = productSaleStatusError,
		productEditError = productEditError,
		editName = editName,
		editDescription = editDescription,
		editPrice = editPrice,
		catalogStatus = p11.catalogStatus or "Ready",
		emptyTitle = var25.emptyTitle,
		emptyDescription = var25.emptyDescription,
		onClose = var43,
		onOpenCreate = reactModule.useCallback(function()
			-- upvalues: var27 (ref), sendBuildExperienceEventModule (copy), p11 (ref), getBuildPromptDraftStoreModule (copy), var25 (ref), onComposerActivated (ref)
			sendBuildExperienceEventModule("MONETIZATION_CREATE_CLICK", var27)
			
			if p11.onCreateProduct == nil then
				getBuildPromptDraftStoreModule().queueDraft({
					universeId = p11.universeId,
					sessionId = p11.sessionId,
					text = var25.createProductPrompt
				})
				onComposerActivated()
				
				return
			end
			p11.onCreateProduct()
		end, {
			onComposerActivated, var25.createProductPrompt, p11.onCreateProduct,
			p11.sessionId, p11.universeId, var27
		}),
		onOpenOptions = var45,
		onManagedPricingChanged = var30.onManagedPricingChanged,
		onShopButtonChanged = var30.onShopButtonChanged,
		onConfirmManagedPricing = var30.onConfirmManagedPricing,
		onCancelManagedPricing = var30.onCancelManagedPricing,
		onRetryOptions = var30.onRetry,
		onProductActivated = var44,
		onProductManagedPricingChanged = var46,
		onProductSaleStatusChanged = var47,
		onOpenProductEdit = var48,
		onEditNameChanged = var49,
		onEditDescriptionChanged = var50,
		onEditPriceChanged = var51,
		onCancelProductEdit = var52,
		onSaveProductEdit = var53,
		onRetryCatalog = reactModule.useCallback(function()
			-- upvalues: var27 (ref), sendBuildExperienceEventModule (copy), p11 (ref)
			sendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", var27)
			
			if p11.onRetryCatalog ~= nil then
				p11.onRetryCatalog()
			end
		end, { p11.onRetryCatalog, var27 }),
		labels = {
			title = var25.title,
			options = var30.labels.options,
			pricingOptions = var30.labels.pricingOptions,
			pricingOptionsDescription = var30.labels.pricingOptionsDescription,
			managedPricing = var30.labels.managedPricing,
			managedPricingDescription = var30.labels.managedPricingDescription,
			shopUI = var30.labels.shopUI,
			shopButton = var30.labels.shopButton,
			shopButtonDescription = var30.labels.shopButtonDescription,
			optionsLoadError = var30.labels.optionsLoadError,
			permissionDenied = var30.labels.permissionDenied,
			mixed = var30.labels.mixed,
			unavailable = var30.labels.unavailable,
			noEligibleProducts = var30.labels.noEligibleProducts,
			optionsUpdateError = var30.labels.optionsUpdateError,
			partialUpdateError = var30.labels.partialUpdateError,
			acknowledgementTitle = var30.labels.acknowledgementTitle,
			acknowledgementDescription = var30.labels.acknowledgementDescription,
			agree = var30.labels.agree,
			emptyCreateProduct = var25.emptyCreateProduct,
			pricing = var25.pricing,
			regionalPricing = var25.regionalPricing,
			loading = var25.loading,
			loadErrorTitle = var25.loadErrorTitle,
			loadErrorDescription = var25.loadErrorDescription,
			retry = var25.retry,
			updateError = var25.updateError,
			availableForPurchase = var25.availableForPurchase,
			edit = var25.edit,
			editProduct = var25.editProduct,
			name = var25.name,
			description = var25.description,
			price = var25.price,
			priceError = var25.priceError,
			priceRequiredForSale = var25.priceRequiredForSale,
			cancel = var25.cancel,
			save = var25.save
		}
	}
end