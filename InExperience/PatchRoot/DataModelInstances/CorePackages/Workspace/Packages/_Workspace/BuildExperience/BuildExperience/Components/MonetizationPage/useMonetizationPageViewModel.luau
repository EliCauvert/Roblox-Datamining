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
local fFlagBuildExperienceMonetizationMultiKindModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationMultiKind)
local fFlagBuildExperienceDeveloperProductContextModule = require(buildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local fFlagBuildExperienceMonetizationProductEditingModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationProductEditing)
local fFlagBuildExperienceRemoveDevProductPriceCap = require(parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap
local _ = require(script.Parent.MonetizationPageView)
local t = {}
local var1 = if fFlagBuildExperienceDeveloperProductContextModule then urlBuilder.fromString("apis:developer-products/v2/universes/{universeId}/developer-products/{productId}/creator") else nil
local fFlagBuildExperienceDevProductModerationReadbackModule = require(buildExperience.Flags.FFlagBuildExperienceDevProductModerationReadback)
local wasDeveloperProductTextModeratedModule = require(buildExperience.utils.wasDeveloperProductTextModerated)

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

local _ = function(p1)
	return p1.identity or p1.id
end

local _ = function(p1)
	return not (p1 == nil or p1.productKind == nil) and (p1.productKind == "DeveloperProduct" and p1.canManage ~= false)
end

local _ = function(p1, p2)
	if p2 == nil then
		return nil
	end
	for i, v in p1 do
		if (v.identity or v.id) == p2 then
			return v
		end
	end
	return nil
end

local t_3 = {
	managedPricing = { "isManagedPricingEnabled" },
	saleStatus = { "isForSale" },
	details = { "name", "description", "priceInRobux", "price" }
}

local _ = function(p3, p4)
	return function(p5)
		-- upvalues: p3 (ref), p4 (ref)
		local identity = p3.identity or p3.id
		local cloned = table.clone(p5[identity] or {})
		cloned[p4] = p3
		local cloned_1 = table.clone(p5)
		cloned_1[identity] = cloned
		
		return cloned_1
	end
end

local _ = function(p3, p4)
	return function(p5)
		-- upvalues: p3 (ref), p4 (ref)
		if (p5[p3] or {})[p4] == nil then
			return p5
		end
		local cloned = table.clone(p5[p3])
		cloned[p4] = nil
		local cloned_1 = table.clone(p5)
		cloned_1[p3] = cloned
		
		if next(cloned) == nil then
			cloned_1[p3] = nil
		end
		return cloned_1
	end
end

local function withoutToggleOverrides(p3)
	local var2 = p3
	
	for i in p3 do
		local var3 = "saleStatus"
		local var4 = "managedPricing"
		var2 = (function(p4)
			-- upvalues: i (ref), var3 (ref)
			if (p4[i] or {})[var3] == nil then
				return p4
			end
			local cloned = table.clone(p4[i])
			cloned[var3] = nil
			local cloned_1 = table.clone(p4)
			cloned_1[i] = cloned
			
			if next(cloned) == nil then
				cloned_1[i] = nil
			end
			return cloned_1
		end)((function(p4)
			-- upvalues: i (ref), var4 (ref)
			if (p4[i] or {})[var4] == nil then
				return p4
			end
			local cloned = table.clone(p4[i])
			cloned[var4] = nil
			local cloned_1 = table.clone(p4)
			cloned_1[i] = cloned
			
			if next(cloned) == nil then
				cloned_1[i] = nil
			end
			return cloned_1
		end)(var2))
	end
	return var2
end

local function applyProductOverrides(p4, p5)
	-- upvalues: t_3 (ref)
	if p5 == nil then
		return p4
	end
	local cloned = table.clone(p4)
	
	for i, v in p5 do
		for i_1, v_1 in t_3[i] do
			cloned[v_1] = v[v_1]
		end
	end
	return cloned
end

local function useManageProductState(p6)
	-- upvalues: reactModule (ref)
	local var5 = reactModule.useRef(if p6 ~= nil then nil else p6.identity or p6.id)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(if p6 ~= nil then "" else p6.name)
	local var16, var17 = reactModule.useState(if p6 ~= nil then "" else p6.description)
	local useState = reactModule.useState
	local var18 = if p6 == nil or p6.priceInRobux == nil then "" else tostring(p6.priceInRobux)
	useState, var47 = useState(var18)
	
	return {
		selectedProductIdRef = var5,
		isProductSaleStatusPending = var6,
		setIsProductSaleStatusPending = var7,
		productSaleStatusError = var8,
		setProductSaleStatusError = var9,
		isProductEditPending = var10,
		setIsProductEditPending = var11,
		productEditError = var12,
		setProductEditError = var13,
		editName = var14,
		setEditName = var15,
		editDescription = var16,
		setEditDescription = var17,
		editPrice = useState,
		setEditPrice = var18
	}
end

local function getEligibleProducts(p6)
	local t = {}
	
	for i, v in p6 do
		if (not (v == nil or v.productKind == nil) and (v.productKind == "DeveloperProduct" and v.canManage ~= false)) and v.isForSale == true and (v.isArchived ~= true and v.isImmutable ~= true) and (v.isInActivePriceOptimizationExperiment ~= true and v.priceInRobux ~= nil and v.priceInRobux > 0) then
			table.insert(t, v)
		end
	end
	return t
end

local _ = function(p7)
	return p7 ~= nil and (if p7.isArchived ~= true then if p7.isImmutable ~= true then p7.isInActivePriceOptimizationExperiment == true else true else true)
end

local _ = function(p7, p8)
	if p7 == nil or p7 == "Disabled" then
		return "Unavailable"
	end
	local var5 = 0
	
	for i, v in p8 do
		if v.isManagedPricingEnabled == true then
			var5 += 1
		end
	end
	return if var5 == 0 then "AllOff" elseif var5 == #p8 then "AllOn" else "Mixed"
end

local function getShopButtonEnabled(p9)
	local var6 = if p9 ~= nil then nil else p9[1]
	
	for i, v in if var6 == nil or var6.entryPoints == nil then {} else var6.entryPoints do
		if v.name == "InExperienceGlobalIconEnabled" then
			return v.isEnabled == true
		end
	end
	return false
end

local _ = function(p10)
	for i, v in p10 do
		if v == "Failed" then
			return "Failed"
		end
	end
	for i, v in p10 do
		if v ~= "Ready" then
			return "NotReady"
		end
	end
	return "Ready"
end

local _ = function(p11, p12)
	return if p11 == nil then p12 elseif p11 then "AllOn" else "AllOff"
end

local function useOptionsState(p11, p12, p13, p14, p15)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), getEligibleProducts (ref), getShopButtonEnabled (ref), reactModule (ref), sendBuildExperienceEventModule (ref), formatErrorModule (ref)
	local var7
	local var8 = useLocalization({
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
	local var9 = getEligibleProducts(p12)
	local managedPricingStatus = p11.managedPricingStatus
	
	if managedPricingStatus == nil or managedPricingStatus == "Disabled" then
		var7 = "Unavailable"
	else
		local var10 = 0
		
		for i, v in var9 do
			if v.isManagedPricingEnabled == true then
				var10 += 1
			end
		end
		var7 = if var10 == 0 then "AllOff" elseif var10 == #var9 then "AllOn" else "Mixed"
	end
	local var11, v
	managedPricingStatus = getShopButtonEnabled(p11.shops)
	local list = {
		p11.managedPricingLoadStatus or "NotReady",
		p11.shopsLoadStatus or "NotReady",
		p11.permissionLoadStatus or "NotReady"
	}
	
	for i, v in list do
		if v == "Failed" then
			var11 = "Failed"
			local var12 = var11 == "Ready" and p11.permissionCanMonetize == true
			local var13, var14 = reactModule.useState(false)
			var60, v = reactModule.useState(false)
			local var15, var16 = reactModule.useState(nil)
			local var17, var18 = reactModule.useState(nil)
			local var19, var20 = reactModule.useState(nil)
			local var21, var22 = reactModule.useState(nil)
			local var23, var24 = reactModule.useState(false)
			local var25 = reactModule.useRef(nil)
			local var26 = reactModule.useRef(nil)
			reactModule.useLayoutEffect(function()
				-- upvalues: var25 (ref), var26 (ref), var14 (ref), v (ref), var16 (ref), var18 (ref), var20 (ref), var22 (ref), var24 (ref)
				var25.current = nil
				var26.current = nil
				var14(false)
				v(false)
				var16(nil)
				var18(nil)
				var20(nil)
				var22(nil)
				var24(false)
			end, { p11.universeId or 0 })
			reactModule.useEffect(function()
				-- upvalues: var15 (ref), var7 (ref), var16 (ref)
				if var15 ~= nil and (var15 and var7 == "AllOn" or not var15 and var7 == "AllOff") then
					var16(nil)
				end
			end, { var7, var15 })
			reactModule.useEffect(function()
				-- upvalues: var17 (ref), managedPricingStatus (ref), var18 (ref)
				if var17 ~= nil and var17 == managedPricingStatus then
					var18(nil)
				end
			end, { var17, managedPricingStatus })
			local var27 = reactModule.useCallback(function(p16, p17)
				-- upvalues: p11 (ref), p14 (ref), p15 (ref), var25 (ref), var13 (ref), var12 (ref), var9 (ref), var24 (ref), var20 (ref), var16 (ref), var14 (ref), p13 (ref), sendBuildExperienceEventModule (copy), var8 (ref), formatErrorModule (copy)
				local onUpdateManagedPricing = p11.onUpdateManagedPricing
				
				if p14.current ~= p15 or var25.current ~= nil or (var13 or not var12) or (onUpdateManagedPricing == nil or p11.managedPricingStatus == nil or (p11.managedPricingStatus == "Disabled" or #var9 == 0)) then return end
				local t = {}
				
				for i, v in var9 do
					local var28 = tonumber(v.id)
					
					if var28 ~= nil then
						table.insert(t, var28)
					end
				end
				if #t == 0 then
					var24(false)
					
					return
				end
				local t_1 = {}
				var25.current = t_1
				var20(nil)
				var16(p16)
				var14(true);
				(if p17 and p11.onAcceptManagedPricing ~= nil then p11.onAcceptManagedPricing():andThen(function()
					-- upvalues: p14 (copy), p15 (copy), var25 (copy), t_1 (ref), onUpdateManagedPricing (ref), t (ref), p16 (ref)
					return if p14.current == p15 and var25.current == t_1 then onUpdateManagedPricing(t, p16) else nil
				end) else onUpdateManagedPricing(t, p16)):andThen(function(p18)
					-- upvalues: p14 (copy), p15 (copy), var25 (copy), t_1 (ref), var24 (copy), p13 (copy), sendBuildExperienceEventModule (copy), var16 (copy), var20 (copy), var8 (copy)
					if p14.current ~= p15 or var25.current ~= t_1 then return end
					var24(false)
					
					if type(p18) == "table" and type(p18.errors) == "table" and #p18.errors > 0 then
						warn(`[MonetizationOptions] Managed Pricing update partially failed (universeId={tostring(p13.universeId)})`)
						local t = { action = "managed_pricing", failureType = "partial" }
						
						if t == nil then
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p13)
						else
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p13, t)
						end
						var16(nil)
						var20(var8.partialUpdateError)
						
						return
					else
						local t = { action = "managed_pricing" }
						
						if t == nil then
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p13)
							
							return
						end
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p13, t)
					end
				end):catch(function(p18)
					-- upvalues: p14 (copy), p15 (copy), var25 (copy), t_1 (ref), p13 (copy), formatErrorModule (copy), sendBuildExperienceEventModule (copy), var24 (copy), var16 (copy), var20 (copy), var8 (copy)
					if p14.current ~= p15 or var25.current ~= t_1 then return end
					warn(`[MonetizationOptions] Managed Pricing update failed (universeId={tostring(p13.universeId)}): {string.sub(string.gsub(formatErrorModule(p18), "[\r\n]+", " "), 1, 200)}`)
					local t = { action = "managed_pricing", failureType = "request" }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p13)
					else
						sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p13, t)
					end
					var24(false)
					var16(nil)
					var20(var8.optionsUpdateError)
				end):finally(function()
					-- upvalues: p14 (copy), p15 (copy), var25 (copy), t_1 (ref), var14 (copy)
					if p14.current == p15 and var25.current == t_1 then
						var25.current = nil
						var14(false)
					end
				end)
			end, {
				var12, var9, var13, var8.optionsUpdateError, var8.partialUpdateError,
				p11.managedPricingStatus, p11.onAcceptManagedPricing,
				p11.onUpdateManagedPricing, p13, p15
			})
			local var29 = if var15 == nil then var7 elseif var15 then "AllOn" else "AllOff"
			
			return {
				loadStatus = var11,
				canMonetize = var12,
				canChangeManagedPricing = var12 and (p11.onUpdateManagedPricing ~= nil and (#var9 > 0 and var29 ~= "Unavailable")),
				managedPricingState = var29,
				managedPricingSupportingText = if #var9 == 0 and var29 ~= "Unavailable" then var8.noEligibleProducts else nil,
				shopButtonEnabled = if var17 ~= nil then managedPricingStatus else var17,
				isManagedPricingPending = var13,
				isShopButtonPending = var60,
				managedPricingError = var19,
				shopButtonError = var21,
				showAcknowledgement = var23,
				onManagedPricingChanged = reactModule.useCallback(function(p18)
					-- upvalues: p14 (ref), p15 (ref), var12 (ref), p11 (ref), var9 (ref), var24 (ref), var27 (ref)
					if p14.current ~= p15 or not var12 or (p11.onUpdateManagedPricing == nil or p11.managedPricingStatus == nil) or (p11.managedPricingStatus == "Disabled" or #var9 == 0) then return end
					if p11.managedPricingStatus == "Pending" and p18 then
						var24(true)
						
						return
					end
					var27(p18, false)
				end, {
					var12,
					var9,
					p11.managedPricingStatus,
					p11.onUpdateManagedPricing,
					var27
				}),
				onShopButtonChanged = reactModule.useCallback(function(p18)
					-- upvalues: p11 (ref), p14 (ref), p15 (ref), var26 (ref), var60 (ref), var12 (ref), var22 (ref), var18 (ref), v (ref), p13 (ref), sendBuildExperienceEventModule (copy), formatErrorModule (copy), var8 (ref)
					local onSetShopButton = p11.onSetShopButton
					
					if p14.current == p15 and var26.current == nil and (not var60 and var12) and onSetShopButton ~= nil then
						local t = {}
						var26.current = t
						var22(nil)
						var18(p18)
						v(true)
						onSetShopButton(p18):andThen(function()
							-- upvalues: p14 (copy), p15 (copy), var26 (copy), t (ref), p13 (copy), sendBuildExperienceEventModule (copy)
							if p14.current ~= p15 or var26.current ~= t then return end
							local t_1 = { action = "shop_button" }
							
							if t_1 == nil then
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p13)
								
								return
							end
							sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", p13, t_1)
						end):catch(function(p19)
							-- upvalues: p14 (copy), p15 (copy), var26 (copy), t (ref), p13 (copy), formatErrorModule (copy), sendBuildExperienceEventModule (copy), var18 (copy), var22 (copy), var8 (copy)
							if p14.current ~= p15 or var26.current ~= t then return end
							warn(`[MonetizationOptions] Shop button update failed (universeId={tostring(p13.universeId)}): {string.sub(string.gsub(formatErrorModule(p19), "[\r\n]+", " "), 1, 200)}`)
							local t_1 = { action = "shop_button", failureType = "request" }
							
							if t_1 == nil then
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p13)
							else
								sendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", p13, t_1)
							end
							var18(nil)
							var22(var8.optionsUpdateError)
						end):finally(function()
							-- upvalues: p14 (copy), p15 (copy), var26 (copy), t (ref), v (copy)
							if p14.current == p15 and var26.current == t then
								var26.current = nil
								v(false)
							end
						end)
						
						return
					end
				end, {
					var12, var60, var8.optionsUpdateError, p11.onSetShopButton, p13, p15
				}),
				onConfirmManagedPricing = function()
					-- upvalues: var27 (ref)
					var27(true, true)
				end,
				onCancelManagedPricing = function()
					-- upvalues: var13 (ref), var24 (ref)
					if not var13 then
						var24(false)
					end
				end,
				onRetry = p11.onRetryOptions or function() end,
				labels = var8
			}
		end
	end
	for i_1, v in list do
		if v ~= "Ready" then
			var11 = "NotReady"
		end
	end
	var11 = "Ready"
end

return function(p16)
	-- upvalues: useLocalization (ref), fFlagBuildExperienceDeveloperProductContextModule (ref), localizationStringsModule (ref), t (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), reactModule (ref), t_2 (ref), useOptionsState (ref), fFlagBuildExperienceMonetizationMultiKindModule (ref), fFlagBuildExperienceMonetizationProductEditingModule (ref), noop (ref), applyProductOverrides (ref), t_1 (ref), useManageProductState (ref), sendBuildExperienceEventModule (ref), withoutToggleOverrides (ref), formatErrorModule (ref), fFlagBuildExperienceRemoveDevProductPriceCap (ref), fFlagBuildExperienceDevProductModerationReadbackModule (ref), wasDeveloperProductTextModeratedModule (ref), useOnScreenKeyboardHeightModule (ref), getBuildPromptDraftStoreModule (ref), var1 (ref)
	local var28, var29, v
	local var30 = useLocalization({
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
	local products = p16.products or t
	local var31 = if fFlagBuildExperienceMonetizationNativeUIModule or p16.initialMode ~= "options" then p16.initialMode else nil
	local var32 = reactModule.useMemo(function()
		-- upvalues: p16 (ref)
		return {
			messageId = nil,
			turnId = nil,
			universeId = p16.universeId,
			placeId = p16.placeId,
			conversationId = p16.sessionId
		}
	end, {
		p16.placeId or 0,
		p16.sessionId or "",
		p16.universeId or 0
	})
	local var33 = reactModule.useMemo(function()
		return {}
	end, { p16.universeId or 0 })
	local var34 = reactModule.useRef(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var34 (ref), var33 (ref)
		var34.current = var33
		
		return function()
			-- upvalues: var34 (copy), var33 (copy)
			if var34.current == var33 then
				var34.current = nil
			end
		end
	end, { var33 })
	local var35 = if fFlagBuildExperienceMonetizationNativeUIModule then useOptionsState(p16, products, var32, var34, var33) else t_2
	local var36 = not fFlagBuildExperienceMonetizationMultiKindModule or (p16.permissionLoadStatus == "Ready" and p16.permissionCanMonetize == true)
	local var37 = if #products > 0 then "catalog" else "empty"
	local var38 = if var31 == "detail" or fFlagBuildExperienceMonetizationProductEditingModule and var31 == "edit" then products[1] else nil
	local var39, var40 = reactModule.useState(var31 or var37)
	local var41, var42 = reactModule.useState(var38)
	local var43 = nil
	local var44 = noop
	local t_3 = {}
	local var45 = noop
	
	if fFlagBuildExperienceMonetizationMultiKindModule then
		local var46, var47 = reactModule.useState(if var38 ~= nil then nil else var38.identity or var38.id)
		var43 = var46
		var44 = var47
		local var48, var49 = reactModule.useState({})
		t_3 = var48
		var45 = var49
	end
	if fFlagBuildExperienceMonetizationMultiKindModule then
		var28 = var43
		
		if var28 == nil then
			var29 = nil
		else
			for i, v in products do
				if (v.identity or v.id) == var28 then
					var29 = v
				end
			end
			var29 = nil
		end
	else
		var29 = nil
	end
	var28 = if fFlagBuildExperienceMonetizationMultiKindModule then if var29 ~= nil then nil else applyProductOverrides(var29, if var43 ~= nil then nil else t_3[var43]) else var41
	local var50, var51 = reactModule.useState(false)
	local var52, var53 = reactModule.useState(false)
	v = reactModule.useRef(nil)
	local var54 = if fFlagBuildExperienceMonetizationProductEditingModule then useManageProductState(var38) else t_1
	local selectedProductIdRef = var54.selectedProductIdRef
	local isProductSaleStatusPending = var54.isProductSaleStatusPending
	local setIsProductSaleStatusPending = var54.setIsProductSaleStatusPending
	local productSaleStatusError = var54.productSaleStatusError
	local setProductSaleStatusError = var54.setProductSaleStatusError
	local isProductEditPending = var54.isProductEditPending
	local setIsProductEditPending = var54.setIsProductEditPending
	local productEditError = var54.productEditError
	local setProductEditError = var54.setProductEditError
	local editName = var54.editName
	local setEditName = var54.setEditName
	local editDescription = var54.editDescription
	local setEditDescription = var54.setEditDescription
	local editPrice = var54.editPrice
	local setEditPrice = var54.setEditPrice
	reactModule.useLayoutEffect(function()
		-- upvalues: v (ref), var40 (ref), var31 (ref), var37 (ref), fFlagBuildExperienceMonetizationMultiKindModule (copy), var44 (write), var38 (ref), var45 (write), var42 (ref), var51 (ref), var53 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), selectedProductIdRef (ref), setIsProductSaleStatusPending (ref), setProductSaleStatusError (ref), setIsProductEditPending (ref), setProductEditError (ref), setEditName (ref), setEditDescription (ref), setEditPrice (ref)
		v.current = nil
		var40(var31 or var37)
		
		if fFlagBuildExperienceMonetizationMultiKindModule then
			local var55 = if var38 == nil then var38 else nil
			local identity = var38 == nil and (var55.identity or var55.id)
			var44(identity)
			var45({})
		else
			var42(var38)
		end
		var51(false)
		var53(false)
		
		if fFlagBuildExperienceMonetizationProductEditingModule then
			local var56 = if var38 == nil then var38 else nil
			local identity = var38 == nil and (var56.identity or var56.id)
			selectedProductIdRef.current = identity
			setIsProductSaleStatusPending(false)
			setProductSaleStatusError(false)
			setIsProductEditPending(false)
			setProductEditError(nil)
			setEditName(if var38 ~= nil then "" else var38.name)
			setEditDescription(if var38 ~= nil then "" else var38.description)
			setEditPrice(if var38 == nil or var38.priceInRobux == nil then "" else tostring(var38.priceInRobux))
		end
	end, { p16.universeId or 0 })
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), sendBuildExperienceEventModule (copy)
		local t = { source = "monetization_page" }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var32)
		else
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var32, t)
		end
		sendBuildExperienceEventModule("MONETIZATION_PAGE_IMPRESSION", var32)
	end, { var32 })
	reactModule.useEffect(function()
		-- upvalues: var31 (ref), var39 (ref), var37 (ref), var40 (ref)
		if var31 == nil and (var39 == "catalog" or var39 == "empty") and var39 ~= var37 then
			var40(var37)
		end
	end, { var37, var31, var39 })
	
	if fFlagBuildExperienceMonetizationMultiKindModule then
		reactModule.useEffect(function()
			-- upvalues: var43 (write), products (ref), selectedProductIdRef (ref), var44 (write), var40 (ref), var37 (ref), t_3 (write), var45 (write)
			if var43 ~= nil then
				local var55
				local var56 = products
				local var57 = var43
				
				if var57 == nil then
					var55 = nil
				else
					for i, v in var56 do
						if (v.identity or v.id) == var57 then
							var55 = v
						end
					end
					var55 = nil
				end
				if var55 == nil then
					selectedProductIdRef.current = nil
					var44(nil)
					var40(var37)
				end
			end
			for i, v in t_3 do
				local var58
				if i == nil then
					var58 = nil
					local details = v.details
					
					if var58 ~= nil and details ~= nil and (var58.name == details.name and var58.description == details.description) and var58.priceInRobux == details.priceInRobux then
						local var59 = "details"
						var45(function(p17)
							-- upvalues: i (ref), var59 (ref)
							if (p17[i] or {})[var59] == nil then
								return p17
							end
							local cloned = table.clone(p17[i])
							cloned[var59] = nil
							local cloned_1 = table.clone(p17)
							cloned_1[i] = cloned
							
							if next(cloned) == nil then
								cloned_1[i] = nil
							end
							return cloned_1
						end)
					end
				end
				for i_1, v_1 in products do
					if (v_1.identity or v_1.id) == i then
						var58 = v_1
					end
				end
				var58 = nil
			end
		end, { var37, t_3, products, var43 })
		reactModule.useEffect(function()
			-- upvalues: var50 (ref), isProductSaleStatusPending (ref), var45 (write), withoutToggleOverrides (copy)
			if not var50 and not isProductSaleStatusPending then
				var45(withoutToggleOverrides)
			end
		end, { products })
	end
	local var60
	local var61 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), var39 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationProductEditingModule (copy), isProductEditPending (ref), v (ref), setProductEditError (ref), var40 (ref), selectedProductIdRef (ref), fFlagBuildExperienceMonetizationMultiKindModule (copy), var44 (write), var42 (ref), var37 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var31 (ref), p16 (ref)
		local t = { mode = tostring(var39) }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var32)
		else
			sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var32, t)
		end
		if fFlagBuildExperienceMonetizationProductEditingModule and var39 == "edit" then
			if isProductEditPending or v.current ~= nil then
				return
			end
			setProductEditError(nil)
			var40("detail")
			
			return
		elseif var39 == "detail" then
			if fFlagBuildExperienceMonetizationProductEditingModule then
				selectedProductIdRef.current = nil
			end
			if fFlagBuildExperienceMonetizationMultiKindModule then
				var44(nil)
			else
				var42(nil)
			end
			var40(var37)
			
			return
		elseif fFlagBuildExperienceMonetizationNativeUIModule and var39 == "options" and var31 ~= "options" then
			var40(var37)
			
			return
		end
		p16.onClose()
	end, {
		var37,
		if fFlagBuildExperienceMonetizationProductEditingModule then isProductEditPending else nil,
		var39, var31, p16.onClose, var32, setProductEditError
	})
	local var62 = reactModule.useCallback(function(p17)
		-- upvalues: products (ref), fFlagBuildExperienceMonetizationMultiKindModule (copy), var32 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationProductEditingModule (copy), var53 (ref), setProductSaleStatusError (ref), setProductEditError (ref), selectedProductIdRef (ref), var44 (write), var42 (ref), var40 (ref)
		for i, v in products do
			if (v.identity or v.id) == p17 then
				local t = { productId = v.id }
				
				if fFlagBuildExperienceMonetizationMultiKindModule then
					t.productKind = v.productKind
				end
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var32)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var32, t)
				end
				if fFlagBuildExperienceMonetizationProductEditingModule then
					var53(false)
					setProductSaleStatusError(false)
					setProductEditError(nil)
				end
				if fFlagBuildExperienceMonetizationProductEditingModule then
					selectedProductIdRef.current = v.identity or v.id
				end
				if fFlagBuildExperienceMonetizationMultiKindModule then
					var44(p17)
				else
					var42(v)
				end
				var40("detail")
				
				return
			end
		end
	end, {
		products,
		setProductEditError,
		setProductSaleStatusError,
		var32
	})
	local var63 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useCallback(function()
		-- upvalues: var40 (ref)
		var40("options")
	end, {}) else function() end
	local var64 = reactModule.useCallback(function(p18)
		-- upvalues: var28 (ref), p16 (ref), var34 (ref), var33 (ref), v (ref), var36 (ref), var50 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), isProductSaleStatusPending (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var53 (ref), var32 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationMultiKindModule (copy), var45 (write), var42 (ref), var51 (ref), formatErrorModule (copy), selectedProductIdRef (ref)
		local var65
		local var66 = if var28 ~= nil then nil else tonumber(var28.id)
		local onUpdateProductManagedPricing = p16.onUpdateProductManagedPricing
		
		if var34.current == var33 and v.current == nil and var28 ~= nil then
			var65 = not (var28 == nil or var28.productKind == nil) and (var28.productKind == "DeveloperProduct" and var28.canManage ~= false)
			
			if var65 and var36 and (var66 ~= nil and onUpdateProductManagedPricing ~= nil) and (not var50 and (not fFlagBuildExperienceMonetizationProductEditingModule or not isProductSaleStatusPending)) then
				var65 = var28 ~= nil and (if var28.isArchived ~= true then if var28.isImmutable ~= true then var28.isInActivePriceOptimizationExperiment == true else true else true)
				
				if var65 then return end
				if fFlagBuildExperienceMonetizationNativeUIModule and p18 and var28.priceInRobux == nil then
					var53(true)
					
					return
				end
				var65 = {}
				v.current = var65
				local t = { isEnabled = tostring(p18), productId = var28.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var32)
				else
					sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var32, t)
				end
				local cloned = table.clone(var28)
				cloned.isManagedPricingEnabled = p18
				
				if fFlagBuildExperienceMonetizationMultiKindModule then
					local var67 = "managedPricing"
					var45(function(p19)
						-- upvalues: cloned (ref), var67 (ref)
						local identity = cloned.identity or cloned.id
						local cloned = table.clone(p19[identity] or {})
						cloned[var67] = cloned
						local cloned_1 = table.clone(p19)
						cloned_1[identity] = cloned
						
						return cloned_1
					end)
				else
					var42(cloned)
				end
				var53(false)
				var51(true)
				onUpdateProductManagedPricing(var66, p18):andThen(function()
					-- upvalues: var34 (copy), var33 (copy), v (copy), var65 (ref), var32 (copy), var28 (ref), sendBuildExperienceEventModule (copy)
					if var34.current ~= var33 or v.current ~= var65 then return end
					local t = { action = "managed_pricing", productId = var28.id }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var32)
						
						return
					end
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var32, t)
				end):catch(function(p19)
					-- upvalues: var34 (copy), var33 (copy), v (copy), var65 (ref), var28 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), fFlagBuildExperienceMonetizationMultiKindModule (copy), var45 (copy), var32 (copy), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationProductEditingModule (copy), selectedProductIdRef (copy), var42 (copy), var53 (copy)
					if var34.current ~= var33 or v.current ~= var65 then return end
					local id = var28.id
					
					if fFlagBuildExperienceMonetizationNativeUIModule then
						warn(`[DeveloperProduct] action=managed_pricing productId={id} failed={string.sub(string.gsub(formatErrorModule(p19), "[\r\n]+", " "), 1, 200)}`)
					end
					if fFlagBuildExperienceMonetizationMultiKindModule then
						local var68 = var45
						local identity = var28.identity or var28.id
						local var69 = "managedPricing"
						var68(function(p20)
							-- upvalues: identity (ref), var69 (ref)
							if (p20[identity] or {})[var69] == nil then
								return p20
							end
							local cloned = table.clone(p20[identity])
							cloned[var69] = nil
							local cloned_1 = table.clone(p20)
							cloned_1[identity] = cloned
							
							if next(cloned) == nil then
								cloned_1[identity] = nil
							end
							return cloned_1
						end)
					end
					local t = { action = "managed_pricing", productId = var28.id }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var32)
					else
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var32, t)
					end
					if fFlagBuildExperienceMonetizationProductEditingModule then
						local var70 = var28
						
						if selectedProductIdRef.current == (var70.identity or var70.id) then
							if not fFlagBuildExperienceMonetizationMultiKindModule then
								var42(var28)
							end
							var53(true)
						end
					end
				end):finally(function()
					-- upvalues: var34 (copy), var33 (copy), v (copy), var65 (ref), var51 (copy)
					if var34.current == var33 and v.current == var65 then
						v.current = nil
						var51(false)
					end
				end)
				
				return
			end
		end
	end, {
		var36, var50,
		if fFlagBuildExperienceMonetizationProductEditingModule then isProductSaleStatusPending else nil,
		p16.onUpdateProductManagedPricing, var28, var32, var33
	})
	local var65 = reactModule.useCallback(function(p18)
		-- upvalues: var28 (ref), p16 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), var34 (ref), var33 (ref), v (ref), var36 (ref), isProductSaleStatusPending (ref), var50 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), setProductSaleStatusError (ref), var32 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceMonetizationMultiKindModule (copy), var45 (write), var42 (ref), setIsProductSaleStatusPending (ref), formatErrorModule (copy), selectedProductIdRef (ref)
		local var66
		local var67 = if var28 ~= nil then nil else tonumber(var28.id)
		local onUpdateProductSaleStatus = p16.onUpdateProductSaleStatus
		
		if fFlagBuildExperienceMonetizationProductEditingModule and var34.current == var33 and (v.current == nil and var28 ~= nil) then
			var66 = not (var28 == nil or var28.productKind == nil) and (var28.productKind == "DeveloperProduct" and var28.canManage ~= false)
			
			if var66 and var36 and (var67 ~= nil and onUpdateProductSaleStatus ~= nil) and (not isProductSaleStatusPending and not var50) then
				var66 = var28 ~= nil and (if var28.isArchived ~= true then if var28.isImmutable ~= true then var28.isInActivePriceOptimizationExperiment == true else true else true)
				
				if var66 then return end
				if fFlagBuildExperienceMonetizationNativeUIModule and p18 and var28.priceInRobux == nil then
					setProductSaleStatusError(true)
					
					return
				end
				var66 = {}
				v.current = var66
				local t = { isEnabled = tostring(p18), productId = var28.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var32)
				else
					sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var32, t)
				end
				local cloned = table.clone(var28)
				cloned.isForSale = p18
				
				if fFlagBuildExperienceMonetizationMultiKindModule then
					local var68 = "saleStatus"
					var45(function(p19)
						-- upvalues: cloned (ref), var68 (ref)
						local identity = cloned.identity or cloned.id
						local cloned = table.clone(p19[identity] or {})
						cloned[var68] = cloned
						local cloned_1 = table.clone(p19)
						cloned_1[identity] = cloned
						
						return cloned_1
					end)
				else
					var42(cloned)
				end
				setProductSaleStatusError(false)
				setIsProductSaleStatusPending(true)
				onUpdateProductSaleStatus(var67, p18):andThen(function()
					-- upvalues: var34 (copy), var33 (copy), v (copy), var66 (ref), var32 (copy), var28 (ref), sendBuildExperienceEventModule (copy)
					if var34.current ~= var33 or v.current ~= var66 then return end
					local t = { action = "sale_status", productId = var28.id }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var32)
						
						return
					end
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var32, t)
				end):catch(function(p19)
					-- upvalues: var34 (copy), var33 (copy), v (copy), var66 (ref), var28 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), fFlagBuildExperienceMonetizationMultiKindModule (copy), var45 (copy), var32 (copy), sendBuildExperienceEventModule (copy), selectedProductIdRef (copy), var42 (copy), setProductSaleStatusError (copy)
					if var34.current ~= var33 or v.current ~= var66 then return end
					local id = var28.id
					
					if fFlagBuildExperienceMonetizationNativeUIModule then
						warn(`[DeveloperProduct] action=sale_status productId={id} failed={string.sub(string.gsub(formatErrorModule(p19), "[\r\n]+", " "), 1, 200)}`)
					end
					if fFlagBuildExperienceMonetizationMultiKindModule then
						local var69 = var45
						local identity = var28.identity or var28.id
						local var70 = "saleStatus"
						var69(function(p20)
							-- upvalues: identity (ref), var70 (ref)
							if (p20[identity] or {})[var70] == nil then
								return p20
							end
							local cloned = table.clone(p20[identity])
							cloned[var70] = nil
							local cloned_1 = table.clone(p20)
							cloned_1[identity] = cloned
							
							if next(cloned) == nil then
								cloned_1[identity] = nil
							end
							return cloned_1
						end)
					end
					local t = { action = "sale_status", productId = var28.id }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var32)
					else
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var32, t)
					end
					if selectedProductIdRef.current == (var28.identity or var28.id) then
						if not fFlagBuildExperienceMonetizationMultiKindModule then
							var42(var28)
						end
						setProductSaleStatusError(true)
					end
				end):finally(function()
					-- upvalues: var34 (copy), var33 (copy), v (copy), var66 (ref), setIsProductSaleStatusPending (copy)
					if var34.current == var33 and v.current == var66 then
						v.current = nil
						setIsProductSaleStatusPending(false)
					end
				end)
				
				return
			end
		end
	end, {
		var36, var50, isProductSaleStatusPending, p16.onUpdateProductSaleStatus,
		var28, setIsProductSaleStatusPending, setProductSaleStatusError, var32, var33
	})
	local var66 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), var36 (ref), var32 (ref), sendBuildExperienceEventModule (copy), setEditName (ref), setEditDescription (ref), setEditPrice (ref), setProductEditError (ref), var40 (ref)
		if fFlagBuildExperienceMonetizationProductEditingModule and var28 ~= nil then
			local var67 = not (var28 == nil or var28.productKind == nil) and (var28.productKind == "DeveloperProduct" and var28.canManage ~= false)
			
			if var67 and var36 then
				var67 = var28 ~= nil and (if var28.isArchived ~= true then if var28.isImmutable ~= true then var28.isInActivePriceOptimizationExperiment == true else true else true)
				
				if var67 then return end
				local t = { productId = var28.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var32)
				else
					sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var32, t)
				end
				setEditName(var28.name)
				setEditDescription(var28.description)
				setEditPrice(if var28.priceInRobux ~= nil then "" else tostring(var28.priceInRobux))
				setProductEditError(nil)
				var40("edit")
				
				return
			end
		end
	end, {
		var36, var28, setEditDescription, setEditName, setEditPrice,
		setProductEditError, var32
	})
	local var67 = reactModule.useCallback(function(p18)
		-- upvalues: setEditName (ref), setProductEditError (ref)
		setEditName(p18)
		setProductEditError(nil)
	end, {})
	local var68 = reactModule.useCallback(function(p18)
		-- upvalues: setEditDescription (ref), setProductEditError (ref)
		setEditDescription(p18)
		setProductEditError(nil)
	end, {})
	local var69 = reactModule.useCallback(function(p18)
		-- upvalues: setEditPrice (ref), setProductEditError (ref)
		setEditPrice(p18)
		setProductEditError(nil)
	end, {})
	local var70 = reactModule.useCallback(function()
		-- upvalues: isProductEditPending (ref), v (ref), var28 (ref), var32 (ref), sendBuildExperienceEventModule (copy), setProductEditError (ref), var40 (ref)
		if isProductEditPending or v.current ~= nil then return end
		local var71 = if var28 ~= nil then nil else { productId = var28.id }
		
		if var71 == nil then
			sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var32)
		else
			sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var32, var71)
		end
		setProductEditError(nil)
		var40("detail")
	end, { isProductEditPending, var28, var32 })
	local var71 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), p16 (ref), fFlagBuildExperienceMonetizationProductEditingModule (copy), var34 (ref), var33 (ref), v (ref), var36 (ref), isProductEditPending (ref), var32 (ref), sendBuildExperienceEventModule (copy), editName (ref), setProductEditError (ref), var30 (ref), editDescription (ref), editPrice (ref), fFlagBuildExperienceRemoveDevProductPriceCap (copy), setIsProductEditPending (ref), fFlagBuildExperienceDevProductModerationReadbackModule (copy), fFlagBuildExperienceMonetizationMultiKindModule (copy), var45 (write), var42 (ref), var53 (ref), setProductSaleStatusError (ref), wasDeveloperProductTextModeratedModule (copy), selectedProductIdRef (ref), var40 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy)
		local var72
		local var73 = if var28 ~= nil then nil else tonumber(var28.id)
		local onUpdateProduct = p16.onUpdateProduct
		
		if fFlagBuildExperienceMonetizationProductEditingModule and var34.current == var33 and (v.current == nil and var28 ~= nil) then
			var72 = not (var28 == nil or var28.productKind == nil) and (var28.productKind == "DeveloperProduct" and var28.canManage ~= false)
			
			if not var72 or not var36 or (var73 == nil or onUpdateProduct == nil) or isProductEditPending then return end
			local t = { productId = var28.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var32)
			else
				sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var32, t)
			end
			var72 = string.match(editName, "^%s*(.-)%s*$") or ""
			
			if var72 == "" then
				setProductEditError(var30.nameRequiredError)
				
				return
			elseif (utf8.len(var72) or #var72) > 50 then
				setProductEditError(var30.nameLengthError)
				
				return
			elseif (utf8.len(editDescription) or #editDescription) > 1000 then
				setProductEditError(var30.descriptionLengthError)
				
				return
			end
			local var74 = tonumber(editPrice)
			
			if editPrice == "" and var28.isForSale == true or editPrice ~= "" and var74 == nil or (var74 ~= nil and var74 % 1 ~= 0 or var74 ~= nil and var74 < 1) or not fFlagBuildExperienceRemoveDevProductPriceCap and var74 ~= nil and var74 > 1000000000 then
				setProductEditError(var30.priceError)
				
				return
			end
			local t_1 = {}
			v.current = t_1
			setProductEditError(nil)
			setIsProductEditPending(true)
			onUpdateProduct(var73, {
				name = var72,
				description = editDescription,
				priceInRobux = var74
			}):andThen(function(_)
				-- upvalues: var34 (copy), var33 (copy), v (copy), t_1 (ref), var32 (copy), var28 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceDevProductModerationReadbackModule (copy), var72 (ref), editDescription (copy), var74 (ref), fFlagBuildExperienceMonetizationMultiKindModule (copy), var45 (copy), var42 (copy), var53 (copy), setProductSaleStatusError (copy), wasDeveloperProductTextModeratedModule (copy), setProductEditError (copy), var30 (copy), selectedProductIdRef (copy), var40 (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 716
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
			end):catch(function(p18)
				-- upvalues: var34 (copy), var33 (copy), v (copy), t_1 (ref), var28 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), formatErrorModule (copy), var32 (copy), sendBuildExperienceEventModule (copy), setProductEditError (copy), var30 (copy)
				if var34.current ~= var33 or v.current ~= t_1 then return end
				local id = var28.id
				
				if fFlagBuildExperienceMonetizationNativeUIModule then
					warn(`[DeveloperProduct] action=product_details productId={id} failed={string.sub(string.gsub(formatErrorModule(p18), "[\r\n]+", " "), 1, 200)}`)
				end
				local t = { action = "product_details", productId = var28.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var32)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var32, t)
				end
				setProductEditError(var30.updateError)
			end):finally(function()
				-- upvalues: var34 (copy), var33 (copy), v (copy), t_1 (ref), setIsProductEditPending (copy)
				if var34.current == var33 and v.current == t_1 then
					v.current = nil
					setIsProductEditPending(false)
				end
			end)
			
			return
		end
	end, {
		var36, editDescription, editName, editPrice, isProductEditPending,
		var30.descriptionLengthError, var30.moderationError, var30.nameLengthError,
		var30.nameRequiredError, var30.priceError, var30.updateError,
		p16.onUpdateProduct, var28, setIsProductEditPending, setProductEditError,
		setProductSaleStatusError, var32, var33
	})
	local onComposerActivated = p16.onComposerActivated or p16.onClose
	local var75 = nil
	local var76 = nil
	
	if fFlagBuildExperienceDeveloperProductContextModule then
		local var77, var78 = reactModule.useBinding("")
		local var79 = reactModule.useRef(nil)
		var76 = useOnScreenKeyboardHeightModule()
		reactModule.useEffect(function()
			-- upvalues: var78 (ref)
			var78("")
		end, {
			p16.universeId or 0,
			p16.sessionId or "",
			if var28 ~= nil then "" else var28.id,
			var78
		})
		local var80 = reactModule.useCallback(function()
			-- upvalues: var77 (ref), var39 (ref), var28 (ref), p16 (ref), getBuildPromptDraftStoreModule (copy), var1 (copy), var78 (ref), var79 (ref), onComposerActivated (ref)
			local var81 = string.match(var77:getValue(), "^%s*(.-)%s*$") or ""
			
			if var81 == "" or var39 ~= "detail" or (var28 == nil or p16.universeId == nil) then
				return false
			end
			getBuildPromptDraftStoreModule().queueDraft({
				autoSend = true,
				universeId = p16.universeId,
				sessionId = p16.sessionId,
				text = var81,
				resourceAttachments = {
					{
						type = "resource_link",
						mimeType = "application/json",
						name = var28.name,
						uri = var1({ universeId = p16.universeId, productId = var28.id })
					}
				}
			})
			var78("")
			
			if var79.current ~= nil then
				var79.current.releaseFocus()
			end
			onComposerActivated()
			
			return true
		end, {
			var77, onComposerActivated, var39, p16.sessionId, p16.universeId, var28,
			var78
		})
		
		if var39 == "detail" and var28 ~= nil then
			var60 = not (var28 == nil or var28.productKind == nil) and (var28.productKind == "DeveloperProduct" and var28.canManage ~= false)
			var75 = if var60 and p16.universeId ~= nil then {
				isAssistantResponding = false,
				canSendWhileResponding = false,
				allowImageAttachments = false,
				tracksExternalText = true,
				composerText = var77,
				onComposerChanged = var78,
				placeholder = var30.composerPlaceholder,
				textBoxRef = var79,
				onSend = var80,
				onStop = function() end
			} else nil
		end
	end
	local var81 = reactModule.useCallback(function()
		-- upvalues: var36 (ref), var32 (ref), sendBuildExperienceEventModule (copy), p16 (ref), getBuildPromptDraftStoreModule (copy), var30 (ref), onComposerActivated (ref)
		if not var36 then return end
		sendBuildExperienceEventModule("MONETIZATION_CREATE_CLICK", var32)
		
		if p16.onCreateProduct == nil then
			getBuildPromptDraftStoreModule().queueDraft({
				universeId = p16.universeId,
				sessionId = p16.sessionId,
				text = var30.createProductPrompt
			})
			onComposerActivated()
			
			return
		end
		p16.onCreateProduct()
	end, {
		onComposerActivated, var30.createProductPrompt, var36, p16.onCreateProduct,
		p16.sessionId, p16.universeId, var32
	})
	local var82 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), sendBuildExperienceEventModule (copy), p16 (ref)
		sendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", var32)
		
		if p16.onRetryCatalog ~= nil then
			p16.onRetryCatalog()
		end
	end, { p16.onRetryCatalog, var32 })
	local var83 = if fFlagBuildExperienceMonetizationMultiKindModule then reactModule.useCallback(function(p18)
		-- upvalues: var32 (ref), sendBuildExperienceEventModule (copy), p16 (ref)
		local t = { catalogKind = tostring(p18) }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", var32)
		else
			sendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", var32, t)
		end
		if p16.onRetryCatalogSource ~= nil then
			p16.onRetryCatalogSource(p18)
		end
	end, { p16.onRetryCatalogSource, var32 }) else nil
	local t_4 = {
		mode = var39,
		keyboardHeight = if fFlagBuildExperienceDeveloperProductContextModule then if var39 == "detail" then var76 else 0 else nil,
		chatActions = var75,
		products = products,
		catalogSources = p16.catalogSources,
		showOptions = fFlagBuildExperienceMonetizationNativeUIModule and p16.showOptions == true,
		optionsLoadStatus = var35.loadStatus,
		canMonetize = var35.canMonetize,
		canCreateProduct = var36,
		canChangeManagedPricing = var35.canChangeManagedPricing,
		managedPricingState = var35.managedPricingState,
		managedPricingSupportingText = var35.managedPricingSupportingText,
		shopButtonEnabled = var35.shopButtonEnabled,
		isOptionsManagedPricingPending = var35.isManagedPricingPending,
		isShopButtonPending = var35.isShopButtonPending,
		managedPricingError = var35.managedPricingError,
		shopButtonError = var35.shopButtonError,
		showManagedPricingAcknowledgement = var35.showAcknowledgement,
		disableDialogPortal = p16.disableDialogPortal,
		selectedProduct = var28
	}
	var60 = true
	
	if p16.isProductDisabled ~= true then
		var60 = not (var28 == nil or var28.productKind == nil) and (var28.productKind == "DeveloperProduct" and var28.canManage ~= false)
		
		if var60 then
			var60 = var28 ~= nil and (if var28.isArchived ~= true then if var28.isImmutable ~= true then var28.isInActivePriceOptimizationExperiment == true else true else true)
		end
	end
	t_4.isProductDisabled = var60
	t_4.isProductManagedPricingPending = var50
	t_4.isProductSaleStatusPending = isProductSaleStatusPending
	t_4.isProductEditPending = isProductEditPending
	t_4.canUpdateProductManagedPricing = p16.onUpdateProductManagedPricing ~= nil
	var60 = fFlagBuildExperienceMonetizationProductEditingModule
	
	if var60 then
		var60 = not (var28 == nil or var28.productKind == nil) and (var28.productKind == "DeveloperProduct" and var28.canManage ~= false)
		
		if var60 then
			var60 = var36 and (p16.onUpdateProductSaleStatus ~= nil and p16.onUpdateProduct ~= nil)
		end
	end
	t_4.canManageProduct = var60
	t_4.productManagedPricingError = var52
	t_4.productSaleStatusError = productSaleStatusError
	t_4.productEditError = productEditError
	t_4.editName = editName
	t_4.editDescription = editDescription
	t_4.editPrice = editPrice
	t_4.catalogStatus = p16.catalogStatus or "Ready"
	t_4.emptyTitle = var30.emptyTitle
	t_4.emptyDescription = var30.emptyDescription
	t_4.onClose = var61
	t_4.onOpenCreate = var81
	t_4.onOpenOptions = var63
	t_4.onManagedPricingChanged = var35.onManagedPricingChanged
	t_4.onShopButtonChanged = var35.onShopButtonChanged
	t_4.onConfirmManagedPricing = var35.onConfirmManagedPricing
	t_4.onCancelManagedPricing = var35.onCancelManagedPricing
	t_4.onRetryOptions = var35.onRetry
	t_4.onProductActivated = var62
	t_4.onProductManagedPricingChanged = var64
	t_4.onProductSaleStatusChanged = var65
	t_4.onOpenProductEdit = var66
	t_4.onEditNameChanged = var67
	t_4.onEditDescriptionChanged = var68
	t_4.onEditPriceChanged = var69
	t_4.onCancelProductEdit = var70
	t_4.onSaveProductEdit = var71
	t_4.onRetryCatalog = var82
	t_4.onRetryCatalogSource = var83
	t_4.labels = {
		title = var30.title,
		options = var35.labels.options,
		pricingOptions = var35.labels.pricingOptions,
		pricingOptionsDescription = var35.labels.pricingOptionsDescription,
		managedPricing = var35.labels.managedPricing,
		managedPricingDescription = var35.labels.managedPricingDescription,
		shopUI = var35.labels.shopUI,
		shopButton = var35.labels.shopButton,
		shopButtonDescription = var35.labels.shopButtonDescription,
		optionsLoadError = var35.labels.optionsLoadError,
		permissionDenied = var35.labels.permissionDenied,
		mixed = var35.labels.mixed,
		unavailable = var35.labels.unavailable,
		noEligibleProducts = var35.labels.noEligibleProducts,
		optionsUpdateError = var35.labels.optionsUpdateError,
		partialUpdateError = var35.labels.partialUpdateError,
		acknowledgementTitle = var35.labels.acknowledgementTitle,
		acknowledgementDescription = var35.labels.acknowledgementDescription,
		agree = var35.labels.agree,
		emptyCreateProduct = var30.emptyCreateProduct,
		pricing = var30.pricing,
		regionalPricing = var30.regionalPricing,
		loading = var30.loading,
		loadErrorTitle = var30.loadErrorTitle,
		loadErrorDescription = var30.loadErrorDescription,
		retry = var30.retry,
		updateError = var30.updateError,
		availableForPurchase = var30.availableForPurchase,
		edit = var30.edit,
		editProduct = var30.editProduct,
		name = var30.name,
		description = var30.description,
		price = var30.price,
		priceError = var30.priceError,
		priceRequiredForSale = var30.priceRequiredForSale,
		cancel = var30.cancel,
		save = var30.save
	}
	
	return t_4
end