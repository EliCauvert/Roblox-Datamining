local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local getBuildPromptDraftStoreModule = require(buildExperience.Stores.GetBuildPromptDraftStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local formatErrorModule = require(buildExperience.utils.formatError)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceManageDevProduct = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct) or fFlagBuildExperienceMonetizationNativeUIModule
local _ = require(script.Parent.MonetizationPageView)
local t = {}

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
	local var1 = reactModule.useRef(if p1 ~= nil then nil else p1.id)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(nil)
	local var10, var11 = reactModule.useState(if p1 ~= nil then "" else p1.name)
	local var12, var13 = reactModule.useState(if p1 ~= nil then "" else p1.description)
	local useState = reactModule.useState
	local var14 = if p1 == nil or p1.priceInRobux == nil then "" else tostring(p1.priceInRobux)
	useState, var29 = useState(var14)
	
	return {
		selectedProductIdRef = var1,
		isProductSaleStatusPending = var2,
		setIsProductSaleStatusPending = var3,
		productSaleStatusError = var4,
		setProductSaleStatusError = var5,
		isProductEditPending = var6,
		setIsProductEditPending = var7,
		productEditError = var8,
		setProductEditError = var9,
		editName = var10,
		setEditName = var11,
		editDescription = var12,
		setEditDescription = var13,
		editPrice = useState,
		setEditPrice = var14
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
	local var1 = 0
	
	for i, v in p3 do
		if v.isManagedPricingEnabled == true then
			var1 += 1
		end
	end
	return if var1 == 0 then "AllOff" elseif var1 == #p3 then "AllOn" else "Mixed"
end

local function getShopButtonEnabled(p4)
	local var2 = if p4 ~= nil then nil else p4[1]
	
	for i, v in if var2 == nil or var2.entryPoints == nil then {} else var2.entryPoints do
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
	local var3
	local var4 = useLocalization({
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
	local var5 = getEligibleProducts(p7)
	local managedPricingStatus = p6.managedPricingStatus
	
	if managedPricingStatus == nil or managedPricingStatus == "Disabled" then
		var3 = "Unavailable"
	else
		local var6 = 0
		
		for i, v in var5 do
			if v.isManagedPricingEnabled == true then
				var6 += 1
			end
		end
		var3 = if var6 == 0 then "AllOff" elseif var6 == #var5 then "AllOn" else "Mixed"
	end
	local var7, v
	managedPricingStatus = getShopButtonEnabled(p6.shops)
	local list = {
		p6.managedPricingLoadStatus or "NotReady",
		p6.shopsLoadStatus or "NotReady",
		p6.permissionLoadStatus or "NotReady"
	}
	
	for i, v in list do
		if v == "Failed" then
			var7 = "Failed"
			local var8 = var7 == "Ready" and p6.permissionCanMonetize == true
			local var9, var10 = reactModule.useState(false)
			var42, v = reactModule.useState(false)
			local var11, var12 = reactModule.useState(nil)
			local var13, var14 = reactModule.useState(nil)
			local var15, var16 = reactModule.useState(nil)
			local var17, var18 = reactModule.useState(nil)
			local var19, var20 = reactModule.useState(false)
			local var21 = reactModule.useRef(nil)
			local var22 = reactModule.useRef(nil)
			reactModule.useLayoutEffect(function()
				-- upvalues: var21 (ref), var22 (ref), var10 (ref), v (ref), var12 (ref), var14 (ref), var16 (ref), var18 (ref), var20 (ref)
				var21.current = nil
				var22.current = nil
				var10(false)
				v(false)
				var12(nil)
				var14(nil)
				var16(nil)
				var18(nil)
				var20(false)
			end, { p6.universeId or 0 })
			reactModule.useEffect(function()
				-- upvalues: var11 (ref), var3 (ref), var12 (ref)
				if var11 ~= nil and (var11 and var3 == "AllOn" or not var11 and var3 == "AllOff") then
					var12(nil)
				end
			end, { var3, var11 })
			reactModule.useEffect(function()
				-- upvalues: var13 (ref), managedPricingStatus (ref), var14 (ref)
				if var13 ~= nil and var13 == managedPricingStatus then
					var14(nil)
				end
			end, { var13, managedPricingStatus })
			local var23 = reactModule.useCallback(function(p11, p12)
				-- upvalues: p6 (ref), p9 (ref), p10 (ref), var21 (ref), var9 (ref), var8 (ref), var5 (ref), var20 (ref), var16 (ref), var12 (ref), var10 (ref), p8 (ref), sendBuildExperienceEventModule (copy), var4 (ref), formatErrorModule (copy)
				local onUpdateManagedPricing = p6.onUpdateManagedPricing
				
				if p9.current ~= p10 or var21.current ~= nil or (var9 or not var8) or (onUpdateManagedPricing == nil or p6.managedPricingStatus == nil or (p6.managedPricingStatus == "Disabled" or #var5 == 0)) then return end
				local t = {}
				
				for i, v in var5 do
					local var24 = tonumber(v.id)
					
					if var24 ~= nil then
						table.insert(t, var24)
					end
				end
				if #t == 0 then
					var20(false)
					
					return
				end
				local t_1 = {}
				var21.current = t_1
				var16(nil)
				var12(p11)
				var10(true);
				(if p12 and p6.onAcceptManagedPricing ~= nil then p6.onAcceptManagedPricing():andThen(function()
					-- upvalues: p9 (copy), p10 (copy), var21 (copy), t_1 (ref), onUpdateManagedPricing (ref), t (ref), p11 (ref)
					return if p9.current == p10 and var21.current == t_1 then onUpdateManagedPricing(t, p11) else nil
				end) else onUpdateManagedPricing(t, p11)):andThen(function(p13)
					-- upvalues: p9 (copy), p10 (copy), var21 (copy), t_1 (ref), var20 (copy), p8 (copy), sendBuildExperienceEventModule (copy), var12 (copy), var16 (copy), var4 (copy)
					if p9.current ~= p10 or var21.current ~= t_1 then return end
					var20(false)
					
					if type(p13) == "table" and type(p13.errors) == "table" and #p13.errors > 0 then
						warn(`[MonetizationOptions] Managed Pricing update partially failed (universeId={tostring(p8.universeId)})`)
						local t = { action = "managed_pricing", failureType = "partial" }
						
						if t == nil then
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8)
						else
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8, t)
						end
						var12(nil)
						var16(var4.partialUpdateError)
						
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
					-- upvalues: p9 (copy), p10 (copy), var21 (copy), t_1 (ref), p8 (copy), formatErrorModule (copy), sendBuildExperienceEventModule (copy), var20 (copy), var12 (copy), var16 (copy), var4 (copy)
					if p9.current ~= p10 or var21.current ~= t_1 then return end
					warn(`[MonetizationOptions] Managed Pricing update failed (universeId={tostring(p8.universeId)}): {string.sub(string.gsub(formatErrorModule(p13), "[\r\n]+", " "), 1, 200)}`)
					local t = { action = "managed_pricing", failureType = "request" }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8)
					else
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8, t)
					end
					var20(false)
					var12(nil)
					var16(var4.optionsUpdateError)
				end):finally(function()
					-- upvalues: p9 (copy), p10 (copy), var21 (copy), t_1 (ref), var10 (copy)
					if p9.current == p10 and var21.current == t_1 then
						var21.current = nil
						var10(false)
					end
				end)
			end, {
				var8, var5, var9, var4.optionsUpdateError, var4.partialUpdateError,
				p6.managedPricingStatus, p6.onAcceptManagedPricing,
				p6.onUpdateManagedPricing, p8, p10
			})
			local var25 = if var11 == nil then var3 elseif var11 then "AllOn" else "AllOff"
			
			return {
				loadStatus = var7,
				canMonetize = var8,
				canChangeManagedPricing = var8 and (p6.onUpdateManagedPricing ~= nil and (#var5 > 0 and var25 ~= "Unavailable")),
				managedPricingState = var25,
				managedPricingSupportingText = if #var5 == 0 and var25 ~= "Unavailable" then var4.noEligibleProducts else nil,
				shopButtonEnabled = if var13 ~= nil then managedPricingStatus else var13,
				isManagedPricingPending = var9,
				isShopButtonPending = var42,
				managedPricingError = var15,
				shopButtonError = var17,
				showAcknowledgement = var19,
				onManagedPricingChanged = reactModule.useCallback(function(p13)
					-- upvalues: p9 (ref), p10 (ref), var8 (ref), p6 (ref), var5 (ref), var20 (ref), var23 (ref)
					if p9.current ~= p10 or not var8 or (p6.onUpdateManagedPricing == nil or p6.managedPricingStatus == nil) or (p6.managedPricingStatus == "Disabled" or #var5 == 0) then return end
					if p6.managedPricingStatus == "Pending" and p13 then
						var20(true)
						
						return
					end
					var23(p13, false)
				end, {
					var8,
					var5,
					p6.managedPricingStatus,
					p6.onUpdateManagedPricing,
					var23
				}),
				onShopButtonChanged = reactModule.useCallback(function(p13)
					-- upvalues: p6 (ref), p9 (ref), p10 (ref), var22 (ref), var42 (ref), var8 (ref), var18 (ref), var14 (ref), v (ref), p8 (ref), sendBuildExperienceEventModule (copy), formatErrorModule (copy), var4 (ref)
					local onSetShopButton = p6.onSetShopButton
					
					if p9.current == p10 and var22.current == nil and (not var42 and var8) and onSetShopButton ~= nil then
						local t = {}
						var22.current = t
						var18(nil)
						var14(p13)
						v(true)
						onSetShopButton(p13):andThen(function()
							-- upvalues: p9 (copy), p10 (copy), var22 (copy), t (ref), p8 (copy), sendBuildExperienceEventModule (copy)
							if p9.current ~= p10 or var22.current ~= t then return end
							local t_1 = { action = "shop_button" }
							
							if t_1 == nil then
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p8)
								
								return
							end
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p8, t_1)
						end):catch(function(p14)
							-- upvalues: p9 (copy), p10 (copy), var22 (copy), t (ref), p8 (copy), formatErrorModule (copy), sendBuildExperienceEventModule (copy), var14 (copy), var18 (copy), var4 (copy)
							if p9.current ~= p10 or var22.current ~= t then return end
							warn(`[MonetizationOptions] Shop button update failed (universeId={tostring(p8.universeId)}): {string.sub(string.gsub(formatErrorModule(p14), "[\r\n]+", " "), 1, 200)}`)
							local t_1 = { action = "shop_button", failureType = "request" }
							
							if t_1 == nil then
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8)
							else
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p8, t_1)
							end
							var14(nil)
							var18(var4.optionsUpdateError)
						end):finally(function()
							-- upvalues: p9 (copy), p10 (copy), var22 (copy), t (ref), v (copy)
							if p9.current == p10 and var22.current == t then
								var22.current = nil
								v(false)
							end
						end)
						
						return
					end
				end, {
					var8, var42, var4.optionsUpdateError, p6.onSetShopButton, p8, p10
				}),
				onConfirmManagedPricing = function()
					-- upvalues: var23 (ref)
					var23(true, true)
				end,
				onCancelManagedPricing = function()
					-- upvalues: var9 (ref), var20 (ref)
					if not var9 then
						var20(false)
					end
				end,
				onRetry = p6.onRetryOptions or function() end,
				labels = var4
			}
		end
	end
	for i_1, v in list do
		if v ~= "Ready" then
			var7 = "NotReady"
		end
	end
	var7 = "Ready"
end

return function(p11)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), t (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), reactModule (ref), t_2 (ref), useOptionsState (ref), fFlagBuildExperienceManageDevProduct (ref), t_1 (ref), useManageProductState (ref), sendBuildExperienceEventModule (ref), formatErrorModule (ref), getBuildPromptDraftStoreModule (ref)
	local var24 = useLocalization({
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
	local var25 = if fFlagBuildExperienceMonetizationNativeUIModule or p11.initialMode ~= "options" then p11.initialMode else nil
	local var26 = reactModule.useMemo(function()
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
	local var27 = reactModule.useMemo(function()
		return {}
	end, { p11.universeId or 0 })
	local var28 = reactModule.useRef(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var28 (ref), var27 (ref)
		var28.current = var27
		
		return function()
			-- upvalues: var28 (copy), var27 (copy)
			if var28.current == var27 then
				var28.current = nil
			end
		end
	end, { var27 })
	local var29 = if fFlagBuildExperienceMonetizationNativeUIModule then useOptionsState(p11, products, var26, var28, var27) else t_2
	local var30 = if #products > 0 then "catalog" else "empty"
	local var31 = if var25 == "detail" or fFlagBuildExperienceManageDevProduct and var25 == "edit" then products[1] else nil
	local var32, var33 = reactModule.useState(var25 or var30)
	local var34, var35 = reactModule.useState(var31)
	local var36, var37 = reactModule.useState(false)
	local var38, var39 = reactModule.useState(false)
	local var40 = reactModule.useRef(nil)
	local var41 = if fFlagBuildExperienceManageDevProduct then useManageProductState(var31) else t_1
	local selectedProductIdRef = var41.selectedProductIdRef
	local isProductSaleStatusPending = var41.isProductSaleStatusPending
	local setIsProductSaleStatusPending = var41.setIsProductSaleStatusPending
	local productSaleStatusError = var41.productSaleStatusError
	local setProductSaleStatusError = var41.setProductSaleStatusError
	local isProductEditPending = var41.isProductEditPending
	local setIsProductEditPending = var41.setIsProductEditPending
	local productEditError = var41.productEditError
	local setProductEditError = var41.setProductEditError
	local editName = var41.editName
	local setEditName = var41.setEditName
	local editDescription = var41.editDescription
	local setEditDescription = var41.setEditDescription
	local editPrice = var41.editPrice
	local setEditPrice = var41.setEditPrice
	reactModule.useLayoutEffect(function()
		-- upvalues: var40 (ref), var33 (ref), var25 (ref), var30 (ref), var35 (ref), var31 (ref), var37 (ref), var39 (ref), fFlagBuildExperienceManageDevProduct (copy), selectedProductIdRef (ref), setIsProductSaleStatusPending (ref), setProductSaleStatusError (ref), setIsProductEditPending (ref), setProductEditError (ref), setEditName (ref), setEditDescription (ref), setEditPrice (ref)
		var40.current = nil
		var33(var25 or var30)
		var35(var31)
		var37(false)
		var39(false)
		
		if fFlagBuildExperienceManageDevProduct then
			selectedProductIdRef.current = if var31 ~= nil then nil else var31.id
			setIsProductSaleStatusPending(false)
			setProductSaleStatusError(false)
			setIsProductEditPending(false)
			setProductEditError(nil)
			setEditName(if var31 ~= nil then "" else var31.name)
			setEditDescription(if var31 ~= nil then "" else var31.description)
			setEditPrice(if var31 == nil or var31.priceInRobux == nil then "" else tostring(var31.priceInRobux))
		end
	end, { p11.universeId or 0 })
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), sendBuildExperienceEventModule (copy)
		local t = { source = "monetization_page" }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var26)
		else
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var26, t)
		end
		sendBuildExperienceEventModule("MONETIZATION_PAGE_IMPRESSION", var26)
	end, { var26 })
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), var32 (ref), var30 (ref), var33 (ref)
		if var25 == nil and (var32 == "catalog" or var32 == "empty") and var32 ~= var30 then
			var33(var30)
		end
	end, { var30, var25, var32 })
	local onComposerActivated = p11.onComposerActivated or p11.onClose
	
	return {
		mode = var32,
		products = products,
		showOptions = fFlagBuildExperienceMonetizationNativeUIModule and p11.showOptions == true,
		optionsLoadStatus = var29.loadStatus,
		canMonetize = var29.canMonetize,
		canChangeManagedPricing = var29.canChangeManagedPricing,
		managedPricingState = var29.managedPricingState,
		managedPricingSupportingText = var29.managedPricingSupportingText,
		shopButtonEnabled = var29.shopButtonEnabled,
		isOptionsManagedPricingPending = var29.isManagedPricingPending,
		isShopButtonPending = var29.isShopButtonPending,
		managedPricingError = var29.managedPricingError,
		shopButtonError = var29.shopButtonError,
		showManagedPricingAcknowledgement = var29.showAcknowledgement,
		disableDialogPortal = p11.disableDialogPortal,
		selectedProduct = var34,
		isProductDisabled = if p11.isProductDisabled ~= true then var34 ~= nil and (if var34.isArchived ~= true then if var34.isImmutable ~= true then var34.isInActivePriceOptimizationExperiment == true else true else true) else true,
		isProductManagedPricingPending = var36,
		isProductSaleStatusPending = isProductSaleStatusPending,
		isProductEditPending = isProductEditPending,
		canUpdateProductManagedPricing = p11.onUpdateProductManagedPricing ~= nil,
		canManageProduct = fFlagBuildExperienceManageDevProduct and (p11.onUpdateProductSaleStatus ~= nil and p11.onUpdateProduct ~= nil),
		productManagedPricingError = var38,
		productSaleStatusError = productSaleStatusError,
		productEditError = productEditError,
		editName = editName,
		editDescription = editDescription,
		editPrice = editPrice,
		catalogStatus = p11.catalogStatus or "Ready",
		emptyTitle = var24.emptyTitle,
		emptyDescription = var24.emptyDescription,
		onClose = reactModule.useCallback(function()
			-- upvalues: var26 (ref), var32 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceManageDevProduct (copy), isProductEditPending (ref), var40 (ref), setProductEditError (ref), var33 (ref), selectedProductIdRef (ref), var35 (ref), var30 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var25 (ref), p11 (ref)
			local t = { mode = tostring(var32) }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var26)
			else
				sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var26, t)
			end
			if fFlagBuildExperienceManageDevProduct and var32 == "edit" then
				if isProductEditPending or var40.current ~= nil then
					return
				end
				setProductEditError(nil)
				var33("detail")
				
				return
			elseif var32 == "detail" then
				if fFlagBuildExperienceManageDevProduct then
					selectedProductIdRef.current = nil
				end
				var35(nil)
				var33(var30)
				
				return
			elseif fFlagBuildExperienceMonetizationNativeUIModule and var32 == "options" and var25 ~= "options" then
				var33(var30)
				
				return
			end
			p11.onClose()
		end, {
			var30,
			if fFlagBuildExperienceManageDevProduct then isProductEditPending else nil,
			var32, var25, p11.onClose, var26, setProductEditError
		}),
		onOpenCreate = reactModule.useCallback(function()
			-- upvalues: var26 (ref), sendBuildExperienceEventModule (copy), p11 (ref), getBuildPromptDraftStoreModule (copy), var24 (ref), onComposerActivated (ref)
			sendBuildExperienceEventModule("MONETIZATION_CREATE_CLICK", var26)
			
			if p11.onCreateProduct == nil then
				getBuildPromptDraftStoreModule().queueDraft({
					autoSend = true,
					universeId = p11.universeId,
					sessionId = p11.sessionId,
					text = var24.createProductPrompt
				})
				onComposerActivated()
				
				return
			end
			p11.onCreateProduct()
		end, {
			onComposerActivated, var24.createProductPrompt, p11.onCreateProduct,
			p11.sessionId, p11.universeId, var26
		}),
		onOpenOptions = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useCallback(function()
			-- upvalues: var33 (ref)
			var33("options")
		end, {}) else function() end,
		onManagedPricingChanged = var29.onManagedPricingChanged,
		onShopButtonChanged = var29.onShopButtonChanged,
		onConfirmManagedPricing = var29.onConfirmManagedPricing,
		onCancelManagedPricing = var29.onCancelManagedPricing,
		onRetryOptions = var29.onRetry,
		onProductActivated = reactModule.useCallback(function(p12)
			-- upvalues: products (ref), var26 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceManageDevProduct (copy), var39 (ref), setProductSaleStatusError (ref), setProductEditError (ref), selectedProductIdRef (ref), var35 (ref), var33 (ref)
			for i, v in products do
				if v.id == p12 then
					local t = { productId = v.id }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var26)
					else
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var26, t)
					end
					if fFlagBuildExperienceManageDevProduct then
						var39(false)
						setProductSaleStatusError(false)
						setProductEditError(nil)
					end
					if fFlagBuildExperienceManageDevProduct then
						selectedProductIdRef.current = v.id
					end
					var35(v)
					var33("detail")
					
					return
				end
			end
		end, { products, var26 }),
		onProductManagedPricingChanged = reactModule.useCallback(function(p13)
			-- upvalues: var34 (ref), p11 (ref), var28 (ref), var27 (ref), var40 (ref), var36 (ref), fFlagBuildExperienceManageDevProduct (copy), isProductSaleStatusPending (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var39 (ref), var26 (ref), sendBuildExperienceEventModule (copy), var35 (ref), var37 (ref), formatErrorModule (copy), selectedProductIdRef (ref)
			local var42 = if var34 ~= nil then nil else tonumber(var34.id)
			local onUpdateProductManagedPricing = p11.onUpdateProductManagedPricing
			
			if var28.current == var27 and var40.current == nil and (var34 ~= nil and var42 ~= nil) and (onUpdateProductManagedPricing ~= nil and not var36 and (not fFlagBuildExperienceManageDevProduct or not isProductSaleStatusPending)) then
				if var34 ~= nil and (if var34.isArchived ~= true then if var34.isImmutable ~= true then var34.isInActivePriceOptimizationExperiment == true else true else true) then return end
				if fFlagBuildExperienceMonetizationNativeUIModule and p13 and var34.priceInRobux == nil then
					var39(true)
					
					return
				end
				local t = {}
				var40.current = t
				local t_1 = { isEnabled = tostring(p13), productId = var34.id }
				
				if t_1 == nil then
					sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var26)
				else
					sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var26, t_1)
				end
				local cloned = table.clone(var34)
				cloned.isManagedPricingEnabled = p13
				var35(cloned)
				var39(false)
				var37(true)
				onUpdateProductManagedPricing(var42, p13):andThen(function()
					-- upvalues: var28 (copy), var27 (copy), var40 (copy), t (ref), var26 (copy), var34 (ref), sendBuildExperienceEventModule (copy)
					if var28.current ~= var27 or var40.current ~= t then return end
					local t_1 = { action = "managed_pricing", productId = var34.id }
					
					if t_1 == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var26)
						
						return
					end
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var26, t_1)
				end):catch(function(p14)
					-- upvalues: var28 (copy), var27 (copy), var40 (copy), t (ref), var34 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), var26 (copy), sendBuildExperienceEventModule (copy), fFlagBuildExperienceManageDevProduct (copy), selectedProductIdRef (copy), var35 (copy), var39 (copy)
					if var28.current ~= var27 or var40.current ~= t then return end
					local id = var34.id
					
					if fFlagBuildExperienceMonetizationNativeUIModule then
						warn(`[DeveloperProduct] action=managed_pricing productId={id} failed={string.sub(string.gsub(formatErrorModule(p14), "[\r\n]+", " "), 1, 200)}`)
					end
					local t_1 = { action = "managed_pricing", productId = var34.id }
					
					if t_1 == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var26)
					else
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var26, t_1)
					end
					if not fFlagBuildExperienceManageDevProduct or selectedProductIdRef.current == var34.id then
						var35(var34)
						var39(true)
					end
				end):finally(function()
					-- upvalues: var28 (copy), var27 (copy), var40 (copy), t (ref), var37 (copy)
					if var28.current == var27 and var40.current == t then
						var40.current = nil
						var37(false)
					end
				end)
				
				return
			end
		end, {
			var36,
			if fFlagBuildExperienceManageDevProduct then isProductSaleStatusPending else nil,
			p11.onUpdateProductManagedPricing, var34, var26, var27
		}),
		onProductSaleStatusChanged = reactModule.useCallback(function(p13)
			-- upvalues: var34 (ref), p11 (ref), fFlagBuildExperienceManageDevProduct (copy), var28 (ref), var27 (ref), var40 (ref), isProductSaleStatusPending (ref), var36 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), setProductSaleStatusError (ref), var26 (ref), sendBuildExperienceEventModule (copy), var35 (ref), setIsProductSaleStatusPending (ref), formatErrorModule (copy), selectedProductIdRef (ref)
			local var42 = if var34 ~= nil then nil else tonumber(var34.id)
			local onUpdateProductSaleStatus = p11.onUpdateProductSaleStatus
			
			if fFlagBuildExperienceManageDevProduct and var28.current == var27 and (var40.current == nil and var34 ~= nil) and (var42 ~= nil and onUpdateProductSaleStatus ~= nil and (not isProductSaleStatusPending and not var36)) then
				if var34 ~= nil and (if var34.isArchived ~= true then if var34.isImmutable ~= true then var34.isInActivePriceOptimizationExperiment == true else true else true) then return end
				if fFlagBuildExperienceMonetizationNativeUIModule and p13 and var34.priceInRobux == nil then
					setProductSaleStatusError(true)
					
					return
				end
				local t = {}
				var40.current = t
				local t_1 = { isEnabled = tostring(p13), productId = var34.id }
				
				if t_1 == nil then
					sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var26)
				else
					sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var26, t_1)
				end
				local cloned = table.clone(var34)
				cloned.isForSale = p13
				var35(cloned)
				setProductSaleStatusError(false)
				setIsProductSaleStatusPending(true)
				onUpdateProductSaleStatus(var42, p13):andThen(function()
					-- upvalues: var28 (copy), var27 (copy), var40 (copy), t (ref), var26 (copy), var34 (ref), sendBuildExperienceEventModule (copy)
					if var28.current ~= var27 or var40.current ~= t then return end
					local t_1 = { action = "sale_status", productId = var34.id }
					
					if t_1 == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var26)
						
						return
					end
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var26, t_1)
				end):catch(function(p14)
					-- upvalues: var28 (copy), var27 (copy), var40 (copy), t (ref), var34 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), var26 (copy), sendBuildExperienceEventModule (copy), selectedProductIdRef (copy), var35 (copy), setProductSaleStatusError (copy)
					if var28.current ~= var27 or var40.current ~= t then return end
					local id = var34.id
					
					if fFlagBuildExperienceMonetizationNativeUIModule then
						warn(`[DeveloperProduct] action=sale_status productId={id} failed={string.sub(string.gsub(formatErrorModule(p14), "[\r\n]+", " "), 1, 200)}`)
					end
					local t_1 = { action = "sale_status", productId = var34.id }
					
					if t_1 == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var26)
					else
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var26, t_1)
					end
					if selectedProductIdRef.current == var34.id then
						var35(var34)
						setProductSaleStatusError(true)
					end
				end):finally(function()
					-- upvalues: var28 (copy), var27 (copy), var40 (copy), t (ref), setIsProductSaleStatusPending (copy)
					if var28.current == var27 and var40.current == t then
						var40.current = nil
						setIsProductSaleStatusPending(false)
					end
				end)
				
				return
			end
		end, {
			var36, isProductSaleStatusPending, p11.onUpdateProductSaleStatus, var34, var26,
			var27
		}),
		onOpenProductEdit = reactModule.useCallback(function()
			-- upvalues: var34 (ref), fFlagBuildExperienceManageDevProduct (copy), var26 (ref), sendBuildExperienceEventModule (copy), setEditName (ref), setEditDescription (ref), setEditPrice (ref), setProductEditError (ref), var33 (ref)
			if fFlagBuildExperienceManageDevProduct and var34 ~= nil then
				if var34 ~= nil and (if var34.isArchived ~= true then if var34.isImmutable ~= true then var34.isInActivePriceOptimizationExperiment == true else true else true) then return end
				local t = { productId = var34.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var26)
				else
					sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var26, t)
				end
				setEditName(var34.name)
				setEditDescription(var34.description)
				setEditPrice(if var34.priceInRobux ~= nil then "" else tostring(var34.priceInRobux))
				setProductEditError(nil)
				var33("edit")
				
				return
			end
		end, { var34, var26 }),
		onEditNameChanged = reactModule.useCallback(function(p13)
			-- upvalues: setEditName (ref), setProductEditError (ref)
			setEditName(p13)
			setProductEditError(nil)
		end, {}),
		onEditDescriptionChanged = reactModule.useCallback(function(p13)
			-- upvalues: setEditDescription (ref), setProductEditError (ref)
			setEditDescription(p13)
			setProductEditError(nil)
		end, {}),
		onEditPriceChanged = reactModule.useCallback(function(p13)
			-- upvalues: setEditPrice (ref), setProductEditError (ref)
			setEditPrice(p13)
			setProductEditError(nil)
		end, {}),
		onCancelProductEdit = reactModule.useCallback(function()
			-- upvalues: isProductEditPending (ref), var40 (ref), var34 (ref), var26 (ref), sendBuildExperienceEventModule (copy), setProductEditError (ref), var33 (ref)
			if isProductEditPending or var40.current ~= nil then return end
			local var42 = if var34 ~= nil then nil else { productId = var34.id }
			
			if var42 == nil then
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var26)
			else
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var26, var42)
			end
			setProductEditError(nil)
			var33("detail")
		end, { isProductEditPending, var34, var26 }),
		onSaveProductEdit = reactModule.useCallback(function()
			-- upvalues: var34 (ref), p11 (ref), fFlagBuildExperienceManageDevProduct (copy), var28 (ref), var27 (ref), var40 (ref), isProductEditPending (ref), var26 (ref), sendBuildExperienceEventModule (copy), editName (ref), setProductEditError (ref), var24 (ref), editDescription (ref), editPrice (ref), setIsProductEditPending (ref), var35 (ref), var39 (ref), setProductSaleStatusError (ref), var33 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy)
			local var42 = if var34 ~= nil then nil else tonumber(var34.id)
			local onUpdateProduct = p11.onUpdateProduct
			
			if not fFlagBuildExperienceManageDevProduct or var28.current ~= var27 or (var40.current ~= nil or var34 == nil) or (var42 == nil or onUpdateProduct == nil or isProductEditPending) then return end
			local t = { productId = var34.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var26)
			else
				sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var26, t)
			end
			local var43 = string.match(editName, "^%s*(.-)%s*$") or ""
			
			if var43 == "" then
				setProductEditError(var24.nameRequiredError)
				
				return
			elseif (utf8.len(var43) or #var43) > 50 then
				setProductEditError(var24.nameLengthError)
				
				return
			elseif (utf8.len(editDescription) or #editDescription) > 1000 then
				setProductEditError(var24.descriptionLengthError)
				
				return
			end
			local var44 = tonumber(editPrice)
			
			if editPrice == "" and var34.isForSale == true or editPrice ~= "" and var44 == nil or (var44 ~= nil and var44 % 1 ~= 0 or var44 ~= nil and var44 < 1) or var44 ~= nil and var44 > 1000000000 then
				setProductEditError(var24.priceError)
				
				return
			end
			local t_1 = {}
			var40.current = t_1
			setProductEditError(nil)
			setIsProductEditPending(true)
			onUpdateProduct(var42, {
				name = var43,
				description = editDescription,
				priceInRobux = var44
			}):andThen(function(p13)
				-- upvalues: var28 (copy), var27 (copy), var40 (copy), t_1 (ref), var26 (copy), var34 (ref), sendBuildExperienceEventModule (copy), var43 (ref), editDescription (copy), var44 (ref), var35 (copy), var39 (copy), setProductSaleStatusError (copy), setProductEditError (copy), var24 (copy), var33 (copy)
				if var28.current ~= var27 or var40.current ~= t_1 then return end
				local t = { action = "product_details", productId = var34.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var26)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var26, t)
				end
				local cloned = table.clone(var34)
				cloned.name = p13.name or var43
				cloned.description = if p13.description ~= nil then editDescription else p13.description
				local var45 = (if p13.priceInformation ~= nil then nil else p13.priceInformation.defaultPriceInRobux) or (var44 or var34.priceInRobux)
				cloned.priceInRobux = var45
				cloned.price = if var45 ~= nil then var34.price else tostring(var45)
				var35(cloned)
				var39(false)
				setProductSaleStatusError(false)
				
				if (p13.name == nil or p13.name == var43) and (p13.description == nil or p13.description == editDescription) then
					var33("detail")
					
					return
				end
				setProductEditError(var24.moderationError)
			end):catch(function(p13)
				-- upvalues: var28 (copy), var27 (copy), var40 (copy), t_1 (ref), var34 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), var26 (copy), sendBuildExperienceEventModule (copy), setProductEditError (copy), var24 (copy)
				if var28.current ~= var27 or var40.current ~= t_1 then return end
				local id = var34.id
				
				if fFlagBuildExperienceMonetizationNativeUIModule then
					warn(`[DeveloperProduct] action=product_details productId={id} failed={string.sub(string.gsub(formatErrorModule(p13), "[\r\n]+", " "), 1, 200)}`)
				end
				local t = { action = "product_details", productId = var34.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var26)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var26, t)
				end
				setProductEditError(var24.updateError)
			end):finally(function()
				-- upvalues: var28 (copy), var27 (copy), var40 (copy), t_1 (ref), setIsProductEditPending (copy)
				if var28.current == var27 and var40.current == t_1 then
					var40.current = nil
					setIsProductEditPending(false)
				end
			end)
		end, {
			editDescription, editName, editPrice, isProductEditPending,
			var24.descriptionLengthError, var24.moderationError, var24.nameLengthError,
			var24.nameRequiredError, var24.priceError, var24.updateError,
			p11.onUpdateProduct, var34, var26, var27
		}),
		onRetryCatalog = reactModule.useCallback(function()
			-- upvalues: var26 (ref), sendBuildExperienceEventModule (copy), p11 (ref)
			sendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", var26)
			
			if p11.onRetryCatalog ~= nil then
				p11.onRetryCatalog()
			end
		end, { p11.onRetryCatalog, var26 }),
		labels = {
			title = var24.title,
			options = var29.labels.options,
			pricingOptions = var29.labels.pricingOptions,
			pricingOptionsDescription = var29.labels.pricingOptionsDescription,
			managedPricing = var29.labels.managedPricing,
			managedPricingDescription = var29.labels.managedPricingDescription,
			shopUI = var29.labels.shopUI,
			shopButton = var29.labels.shopButton,
			shopButtonDescription = var29.labels.shopButtonDescription,
			optionsLoadError = var29.labels.optionsLoadError,
			permissionDenied = var29.labels.permissionDenied,
			mixed = var29.labels.mixed,
			unavailable = var29.labels.unavailable,
			noEligibleProducts = var29.labels.noEligibleProducts,
			optionsUpdateError = var29.labels.optionsUpdateError,
			partialUpdateError = var29.labels.partialUpdateError,
			acknowledgementTitle = var29.labels.acknowledgementTitle,
			acknowledgementDescription = var29.labels.acknowledgementDescription,
			agree = var29.labels.agree,
			emptyCreateProduct = var24.emptyCreateProduct,
			pricing = var24.pricing,
			regionalPricing = var24.regionalPricing,
			loading = var24.loading,
			loadErrorTitle = var24.loadErrorTitle,
			loadErrorDescription = var24.loadErrorDescription,
			retry = var24.retry,
			updateError = var24.updateError,
			availableForPurchase = var24.availableForPurchase,
			edit = var24.edit,
			editProduct = var24.editProduct,
			name = var24.name,
			description = var24.description,
			price = var24.price,
			priceError = var24.priceError,
			priceRequiredForSale = var24.priceRequiredForSale,
			cancel = var24.cancel,
			save = var24.save
		}
	}
end