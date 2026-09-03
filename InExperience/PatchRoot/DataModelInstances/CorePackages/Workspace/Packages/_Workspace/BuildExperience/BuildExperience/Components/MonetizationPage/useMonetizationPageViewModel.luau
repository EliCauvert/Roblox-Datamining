local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local getBuildPromptDraftStoreModule = require(buildExperience.Stores.GetBuildPromptDraftStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local _ = require(script.Parent.MonetizationPageView)
local t = {}

local function _(p1, p2, p3)
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
	useState, var23 = useState(var14)
	
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

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), t (ref), fFlagBuildExperienceManageDevProductModule (ref), reactModule (ref), t_1 (ref), useManageProductState (ref), sendBuildExperienceEventModule (ref), getBuildPromptDraftStoreModule (ref)
	local var1 = useLocalization({
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
		moderationError = localizationStringsModule.MONETIZATION_MODERATION_ERROR
	})
	local products = p1.products or t
	local var2 = if #products > 0 then "catalog" else "empty"
	local var3 = if p1.initialMode == "detail" or fFlagBuildExperienceManageDevProductModule and p1.initialMode == "edit" then products[1] else nil
	local var4, var5 = reactModule.useState(p1.initialMode or var2)
	local var6, var7 = reactModule.useState(var3)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12 = if fFlagBuildExperienceManageDevProductModule then useManageProductState(var3) else t_1
	local selectedProductIdRef = var12.selectedProductIdRef
	local isProductSaleStatusPending = var12.isProductSaleStatusPending
	local setIsProductSaleStatusPending = var12.setIsProductSaleStatusPending
	local productSaleStatusError = var12.productSaleStatusError
	local setProductSaleStatusError = var12.setProductSaleStatusError
	local isProductEditPending = var12.isProductEditPending
	local setIsProductEditPending = var12.setIsProductEditPending
	local productEditError = var12.productEditError
	local setProductEditError = var12.setProductEditError
	local editName = var12.editName
	local setEditName = var12.setEditName
	local editDescription = var12.editDescription
	local setEditDescription = var12.setEditDescription
	local editPrice = var12.editPrice
	local setEditPrice = var12.setEditPrice
	local var13 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return {
			messageId = nil,
			turnId = nil,
			universeId = p1.universeId,
			placeId = p1.placeId,
			conversationId = p1.sessionId
		}
	end, { p1.placeId, p1.sessionId, p1.universeId })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), sendBuildExperienceEventModule (copy)
		local t = { source = "monetization_page" }
		
		if t == nil then
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var13)
		else
			sendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", var13, t)
		end
		sendBuildExperienceEventModule("MONETIZATION_PAGE_IMPRESSION", var13)
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var2 (ref), var5 (ref)
		if p1.initialMode == nil and (var4 == "catalog" or var4 == "empty") and var4 ~= var2 then
			var5(var2)
		end
	end, { var2, var4, p1.initialMode })
	local onComposerActivated = p1.onComposerActivated or p1.onClose
	
	return {
		mode = var4,
		products = products,
		selectedProduct = var6,
		isProductDisabled = p1.isProductDisabled == true,
		isProductManagedPricingPending = var8,
		isProductSaleStatusPending = isProductSaleStatusPending,
		isProductEditPending = isProductEditPending,
		canUpdateProductManagedPricing = p1.onUpdateProductManagedPricing ~= nil,
		canManageProduct = fFlagBuildExperienceManageDevProductModule and (p1.onUpdateProductSaleStatus ~= nil and p1.onUpdateProduct ~= nil),
		productManagedPricingError = var10,
		productSaleStatusError = productSaleStatusError,
		productEditError = productEditError,
		editName = editName,
		editDescription = editDescription,
		editPrice = editPrice,
		catalogStatus = p1.catalogStatus or "Ready",
		emptyTitle = var1.emptyTitle,
		emptyDescription = var1.emptyDescription,
		onClose = reactModule.useCallback(function()
			-- upvalues: var13 (ref), var4 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceManageDevProductModule (copy), isProductEditPending (ref), setProductEditError (ref), var5 (ref), selectedProductIdRef (ref), var7 (ref), var2 (ref), p1 (ref)
			local t = { mode = tostring(var4) }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var13)
			else
				sendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", var13, t)
			end
			if fFlagBuildExperienceManageDevProductModule and var4 == "edit" then
				if isProductEditPending then
					return
				end
				setProductEditError(nil)
				var5("detail")
				
				return
			elseif var4 ~= "detail" then
				p1.onClose()
				
				return
			elseif fFlagBuildExperienceManageDevProductModule then
				selectedProductIdRef.current = nil
			end
			var7(nil)
			var5(var2)
		end, {
			var2,
			if fFlagBuildExperienceManageDevProductModule then isProductEditPending else nil,
			var4, p1.initialMode, p1.onClose, var13
		}),
		onOpenCreate = reactModule.useCallback(function()
			-- upvalues: var13 (ref), sendBuildExperienceEventModule (copy), p1 (ref), getBuildPromptDraftStoreModule (copy), var1 (ref), onComposerActivated (ref)
			sendBuildExperienceEventModule("MONETIZATION_CREATE_CLICK", var13)
			
			if p1.onCreateProduct == nil then
				getBuildPromptDraftStoreModule().queueDraft({
					autoSend = true,
					universeId = p1.universeId,
					sessionId = p1.sessionId,
					text = var1.createProductPrompt
				})
				onComposerActivated()
				
				return
			end
			p1.onCreateProduct()
		end, {
			onComposerActivated, var1.createProductPrompt, p1.onCreateProduct,
			p1.sessionId, p1.universeId, var13
		}),
		onProductActivated = reactModule.useCallback(function(p2)
			-- upvalues: products (ref), var13 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceManageDevProductModule (copy), var11 (ref), setProductSaleStatusError (ref), setProductEditError (ref), selectedProductIdRef (ref), var7 (ref), var5 (ref)
			for i, v in products do
				if v.id == p2 then
					local t = { productId = v.id }
					
					if t == nil then
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var13)
					else
						sendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", var13, t)
					end
					if fFlagBuildExperienceManageDevProductModule then
						var11(false)
						setProductSaleStatusError(false)
						setProductEditError(nil)
					end
					if fFlagBuildExperienceManageDevProductModule then
						selectedProductIdRef.current = v.id
					end
					var7(v)
					var5("detail")
					
					return
				end
			end
		end, { products, var13 }),
		onProductManagedPricingChanged = reactModule.useCallback(function(p3)
			-- upvalues: var6 (ref), p1 (ref), var8 (ref), fFlagBuildExperienceManageDevProductModule (copy), isProductSaleStatusPending (ref), var13 (ref), sendBuildExperienceEventModule (copy), var7 (ref), var11 (ref), var9 (ref), selectedProductIdRef (ref)
			local var14 = if var6 ~= nil then nil else tonumber(var6.id)
			local onUpdateProductManagedPricing = p1.onUpdateProductManagedPricing
			
			if var6 == nil or var14 == nil or (onUpdateProductManagedPricing == nil or var8) or fFlagBuildExperienceManageDevProductModule and isProductSaleStatusPending then return end
			local t = { isEnabled = tostring(p3), productId = var6.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var13)
			else
				sendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", var13, t)
			end
			local cloned = table.clone(var6)
			cloned.isManagedPricingEnabled = p3
			var7(cloned)
			var11(false)
			var9(true)
			onUpdateProductManagedPricing(var14, p3):andThen(function()
				-- upvalues: var13 (copy), var6 (ref), sendBuildExperienceEventModule (copy)
				local t = { action = "managed_pricing", productId = var6.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var13)
					
					return
				end
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var13, t)
			end):catch(function()
				-- upvalues: var13 (copy), var6 (ref), sendBuildExperienceEventModule (copy), fFlagBuildExperienceManageDevProductModule (copy), selectedProductIdRef (copy), var7 (copy), var11 (copy)
				local t = { action = "managed_pricing", productId = var6.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var13)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var13, t)
				end
				if not fFlagBuildExperienceManageDevProductModule or selectedProductIdRef.current == var6.id then
					var7(var6)
					var11(true)
				end
			end):finally(function()
				-- upvalues: var9 (copy)
				var9(false)
			end)
		end, {
			var8,
			if fFlagBuildExperienceManageDevProductModule then isProductSaleStatusPending else nil,
			p1.onUpdateProductManagedPricing,
			var6,
			var13
		}),
		onProductSaleStatusChanged = reactModule.useCallback(function(p3)
			-- upvalues: var6 (ref), p1 (ref), fFlagBuildExperienceManageDevProductModule (copy), isProductSaleStatusPending (ref), var8 (ref), var13 (ref), sendBuildExperienceEventModule (copy), var7 (ref), setProductSaleStatusError (ref), setIsProductSaleStatusPending (ref), selectedProductIdRef (ref)
			local var14 = if var6 ~= nil then nil else tonumber(var6.id)
			local onUpdateProductSaleStatus = p1.onUpdateProductSaleStatus
			
			if not fFlagBuildExperienceManageDevProductModule or var6 == nil or (var14 == nil or onUpdateProductSaleStatus == nil) or (isProductSaleStatusPending or var8) then return end
			local t = { isEnabled = tostring(p3), productId = var6.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var13)
			else
				sendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", var13, t)
			end
			local cloned = table.clone(var6)
			cloned.isForSale = p3
			var7(cloned)
			setProductSaleStatusError(false)
			setIsProductSaleStatusPending(true)
			onUpdateProductSaleStatus(var14, p3):andThen(function()
				-- upvalues: var13 (copy), var6 (ref), sendBuildExperienceEventModule (copy)
				local t = { action = "sale_status", productId = var6.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var13)
					
					return
				end
				sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var13, t)
			end):catch(function()
				-- upvalues: var13 (copy), var6 (ref), sendBuildExperienceEventModule (copy), selectedProductIdRef (copy), var7 (copy), setProductSaleStatusError (copy)
				local t = { action = "sale_status", productId = var6.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var13)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var13, t)
				end
				if selectedProductIdRef.current == var6.id then
					var7(var6)
					setProductSaleStatusError(true)
				end
			end):finally(function()
				-- upvalues: setIsProductSaleStatusPending (copy)
				setIsProductSaleStatusPending(false)
			end)
		end, {
			var8,
			isProductSaleStatusPending,
			p1.onUpdateProductSaleStatus,
			var6,
			var13
		}),
		onOpenProductEdit = reactModule.useCallback(function()
			-- upvalues: var6 (ref), fFlagBuildExperienceManageDevProductModule (copy), var13 (ref), sendBuildExperienceEventModule (copy), setEditName (ref), setEditDescription (ref), setEditPrice (ref), setProductEditError (ref), var5 (ref)
			if not fFlagBuildExperienceManageDevProductModule or var6 == nil then return end
			local t = { productId = var6.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var13)
			else
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", var13, t)
			end
			setEditName(var6.name)
			setEditDescription(var6.description)
			setEditPrice(if var6.priceInRobux ~= nil then "" else tostring(var6.priceInRobux))
			setProductEditError(nil)
			var5("edit")
		end, { var6, var13 }),
		onEditNameChanged = reactModule.useCallback(function(p3)
			-- upvalues: setEditName (ref), setProductEditError (ref)
			setEditName(p3)
			setProductEditError(nil)
		end, {}),
		onEditDescriptionChanged = reactModule.useCallback(function(p3)
			-- upvalues: setEditDescription (ref), setProductEditError (ref)
			setEditDescription(p3)
			setProductEditError(nil)
		end, {}),
		onEditPriceChanged = reactModule.useCallback(function(p3)
			-- upvalues: setEditPrice (ref), setProductEditError (ref)
			setEditPrice(p3)
			setProductEditError(nil)
		end, {}),
		onCancelProductEdit = reactModule.useCallback(function()
			-- upvalues: isProductEditPending (ref), var6 (ref), var13 (ref), sendBuildExperienceEventModule (copy), setProductEditError (ref), var5 (ref)
			if isProductEditPending then return end
			local var14 = if var6 ~= nil then nil else { productId = var6.id }
			
			if var14 == nil then
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var13)
			else
				sendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", var13, var14)
			end
			setProductEditError(nil)
			var5("detail")
		end, { isProductEditPending, var6, var13 }),
		onSaveProductEdit = reactModule.useCallback(function()
			-- upvalues: var6 (ref), p1 (ref), fFlagBuildExperienceManageDevProductModule (copy), isProductEditPending (ref), var13 (ref), sendBuildExperienceEventModule (copy), editName (ref), setProductEditError (ref), var1 (ref), editDescription (ref), editPrice (ref), setIsProductEditPending (ref), var7 (ref), var5 (ref)
			local var14 = if var6 ~= nil then nil else tonumber(var6.id)
			local onUpdateProduct = p1.onUpdateProduct
			
			if not fFlagBuildExperienceManageDevProductModule or var6 == nil or (var14 == nil or onUpdateProduct == nil) or isProductEditPending then return end
			local t = { productId = var6.id }
			
			if t == nil then
				sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var13)
			else
				sendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", var13, t)
			end
			local var15 = string.match(editName, "^%s*(.-)%s*$") or ""
			
			if var15 == "" then
				setProductEditError(var1.nameRequiredError)
				
				return
			elseif (utf8.len(var15) or #var15) > 50 then
				setProductEditError(var1.nameLengthError)
				
				return
			elseif (utf8.len(editDescription) or #editDescription) > 1000 then
				setProductEditError(var1.descriptionLengthError)
				
				return
			end
			local var16 = tonumber(editPrice)
			
			if editPrice == "" and var6.isForSale == true or editPrice ~= "" and var16 == nil or (var16 ~= nil and var16 % 1 ~= 0 or var16 ~= nil and var16 < 1) or var16 ~= nil and var16 > 1000000000 then
				setProductEditError(var1.priceError)
				
				return
			end
			setProductEditError(nil)
			setIsProductEditPending(true)
			onUpdateProduct(var14, {
				name = var15,
				description = editDescription,
				priceInRobux = var16
			}):andThen(function(p3)
				-- upvalues: var13 (copy), var6 (ref), sendBuildExperienceEventModule (copy), var15 (ref), editDescription (copy), var16 (ref), var7 (copy), setProductEditError (copy), var1 (copy), var5 (copy)
				local t = { action = "product_details", productId = var6.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var13)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", var13, t)
				end
				local cloned = table.clone(var6)
				cloned.name = p3.name or var15
				cloned.description = if p3.description ~= nil then editDescription else p3.description
				local var17 = (if p3.priceInformation ~= nil then nil else p3.priceInformation.defaultPriceInRobux) or (var16 or var6.priceInRobux)
				cloned.priceInRobux = var17
				cloned.price = if var17 ~= nil then var6.price else tostring(var17)
				var7(cloned)
				
				if (p3.name == nil or p3.name == var15) and (p3.description == nil or p3.description == editDescription) then
					var5("detail")
					
					return
				end
				setProductEditError(var1.moderationError)
			end):catch(function()
				-- upvalues: var13 (copy), var6 (ref), sendBuildExperienceEventModule (copy), setProductEditError (copy), var1 (copy)
				local t = { action = "product_details", productId = var6.id }
				
				if t == nil then
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var13)
				else
					sendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", var13, t)
				end
				setProductEditError(var1.updateError)
			end):finally(function()
				-- upvalues: setIsProductEditPending (copy)
				setIsProductEditPending(false)
			end)
		end, {
			editDescription, editName, editPrice, isProductEditPending,
			var1.descriptionLengthError, var1.moderationError, var1.nameLengthError,
			var1.nameRequiredError, var1.priceError, var1.updateError,
			p1.onUpdateProduct, var6, var13
		}),
		onRetryCatalog = reactModule.useCallback(function()
			-- upvalues: var13 (ref), sendBuildExperienceEventModule (copy), p1 (ref)
			sendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", var13)
			
			if p1.onRetryCatalog ~= nil then
				p1.onRetryCatalog()
			end
		end, { p1.onRetryCatalog, var13 }),
		labels = {
			title = var1.title,
			emptyCreateProduct = var1.emptyCreateProduct,
			pricing = var1.pricing,
			regionalPricing = var1.regionalPricing,
			loading = var1.loading,
			loadErrorTitle = var1.loadErrorTitle,
			loadErrorDescription = var1.loadErrorDescription,
			retry = var1.retry,
			updateError = var1.updateError,
			availableForPurchase = var1.availableForPurchase,
			edit = var1.edit,
			editProduct = var1.editProduct,
			name = var1.name,
			description = var1.description,
			price = var1.price,
			cancel = var1.cancel,
			save = var1.save
		}
	}
end