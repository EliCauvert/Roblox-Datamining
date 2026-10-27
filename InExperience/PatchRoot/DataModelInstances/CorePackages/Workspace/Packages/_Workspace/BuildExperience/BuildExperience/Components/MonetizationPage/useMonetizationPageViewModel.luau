local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(BuildExperience.Components.Chat.ChatComposer)
local _ = require(BuildExperience.Components.Chat.ChatActions)
local _ = require(BuildExperience.Chat.chatTypes)
local UseOnScreenKeyboardHeightModule = require(BuildExperience.utils.useOnScreenKeyboardHeight)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local GetBuildPromptDraftStoreModule = require(BuildExperience.Stores.GetBuildPromptDraftStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FormatErrorModule = require(BuildExperience.utils.formatError)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceMonetizationMultiKindModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationMultiKind)
local FFlagBuildExperienceDeveloperProductContextModule = require(BuildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local FFlagBuildExperienceMonetizationProductEditingModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationProductEditing)
local FFlagBuildExperienceMonetizationManageKindsModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationManageKinds)
local FFlagBuildExperienceMonetizationKindRegionalPricingModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationKindRegionalPricing)
local FFlagBuildExperienceRemoveDevProductPriceCap = require(Parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap
local _ = require(script.Parent.MonetizationPageView)
local GetProductKindCapabilitiesModule = require(script.Parent.getProductKindCapabilities)
local t = {}
local Creator = if FFlagBuildExperienceDeveloperProductContextModule then UrlBuilder.fromString("apis:developer-products/v2/universes/{universeId}/developer-products/{productId}/creator") else nil
local FFlagBuildExperienceDevProductModerationReadbackModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductModerationReadback)
local WasDeveloperProductTextModeratedModule = require(BuildExperience.utils.wasDeveloperProductTextModerated)

local function _(p1, p2, p3)
	-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (copy), FormatErrorModule (copy)
	if FFlagBuildExperienceMonetizationNativeUIModule then
		warn(`[{p2.productKind or "DeveloperProduct"}] action={p1} productId={p2.id} failed={string.sub(string.gsub(FormatErrorModule(p3), "[\r\n]+", " "), 1, 200)}`)
		
		return
	end
end

local _ = function(p1): string
	-- upvalues: FormatErrorModule (copy)
	return (string.sub(string.gsub(FormatErrorModule(p1), "[\r\n]+", " "), 1, 200))
end

local _ = function(p1, p2, p3)
	-- upvalues: SendBuildExperienceEventModule (copy)
	if p3 == nil then
		SendBuildExperienceEventModule(p1, p2)
		
		return
	else
		SendBuildExperienceEventModule(p1, p2, p3)
	end
end

local function noop(_) end

local config = {
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
local config1 = {
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
		options = LocalizationStringsModule.MONETIZATION_OPTIONS,
		pricingOptions = LocalizationStringsModule.MONETIZATION_PRICING_OPTIONS,
		pricingOptionsDescription = LocalizationStringsModule.MONETIZATION_PRICING_OPTIONS_DESCRIPTION,
		managedPricing = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING,
		managedPricingDescription = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_DESCRIPTION,
		shopUI = LocalizationStringsModule.MONETIZATION_SHOP_UI,
		shopButton = LocalizationStringsModule.MONETIZATION_SHOP_BUTTON,
		shopButtonDescription = LocalizationStringsModule.MONETIZATION_SHOP_BUTTON_DESCRIPTION,
		optionsLoadError = LocalizationStringsModule.MONETIZATION_OPTIONS_LOAD_ERROR,
		permissionDenied = LocalizationStringsModule.MONETIZATION_PERMISSION_DENIED,
		mixed = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_MIXED,
		unavailable = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_UNAVAILABLE,
		noEligibleProducts = LocalizationStringsModule.MONETIZATION_NO_ELIGIBLE_PRODUCTS,
		optionsUpdateError = LocalizationStringsModule.MONETIZATION_OPTIONS_UPDATE_ERROR,
		partialUpdateError = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_PARTIAL_ERROR,
		acknowledgementTitle = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_TITLE,
		acknowledgementDescription = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_DESCRIPTION,
		agree = LocalizationStringsModule.MONETIZATION_AGREE
	}
}

local _ = function(Text: string): string
	return string.match(Text, "^%s*(.-)%s*$") or ""
end

local _ = function(Text): number
	return utf8.len(Text) or #Text
end

local _ = function(p1)
	return p1.identity or p1.id
end

local _ = function(p1): boolean
	return p1 ~= nil and (if p1.productKind == nil then p1.canManage ~= false else p1.productKind == "DeveloperProduct" and p1.canManage ~= false)
end

local _ = function(p1)
	-- upvalues: FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	return if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
end

local _ = function(p1)
	-- upvalues: FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy), FFlagBuildExperienceMonetizationKindRegionalPricingModule (copy)
	local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
	
	return if FFlagBuildExperienceMonetizationKindRegionalPricingModule and ProductKindCapabilitiesModule ~= nil and ProductKindCapabilitiesModule.regionalPricing then ProductKindCapabilitiesModule else nil
end

local _ = function(p1): boolean
	-- upvalues: FFlagBuildExperienceMonetizationProductEditingModule (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	return FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil) ~= nil
end

local _ = function(p1): boolean
	-- upvalues: FFlagBuildExperienceMonetizationProductEditingModule (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	return p1 ~= nil and (if p1.productKind == nil then p1.canManage ~= false else p1.productKind == "DeveloperProduct" and p1.canManage ~= false) or FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil) ~= nil
end

local _ = function(p1, p2): boolean
	-- upvalues: FFlagBuildExperienceMonetizationProductEditingModule (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	return (p2 ~= nil and (if p2.productKind == nil then p2.canManage ~= false else p2.productKind == "DeveloperProduct" and p2.canManage ~= false) or FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p2 == nil then nil else p2.productKind) else nil) ~= nil) and (p1.onUpdateProductKind ~= nil or not (FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p2 == nil then nil else p2.productKind) else nil) ~= nil))
end

local _ = function(p1)
	-- upvalues: FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
	
	return ProductKindCapabilitiesModule == nil or ProductKindCapabilitiesModule.editableName
end

local _ = function(p1, Text: string)
	-- upvalues: FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
	local NoProductKindCapabilitiesModule = ProductKindCapabilitiesModule == nil or ProductKindCapabilitiesModule.editableName
	
	return if NoProductKindCapabilitiesModule then string.match(Text, "^%s*(.-)%s*$") or "" else nil
end

local _ = function(p1)
	-- upvalues: FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
	
	return ProductKindCapabilitiesModule == nil or ProductKindCapabilitiesModule.editablePrice
end

local _ = function(p1)
	-- upvalues: FFlagBuildExperienceMonetizationProductEditingModule (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	local config = { productId = p1.id }
	
	if FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil) ~= nil and p1.productKind ~= nil then
		config.productKind = p1.productKind
	end
	return config
end

local _ = function(List, Identity)
	if Identity == nil then
		return nil
	end
	for _, value in List do
		if (value.identity or value.id) == Identity then
			return value
		end
	end
	return nil
end

local config2 = {
	managedPricing = { "isManagedPricingEnabled" },
	saleStatus = { "isForSale" },
	details = { "name", "description", "priceInRobux", "price" }
}

local _ = function(p1, p2)
	return function(Tbl)
		-- upvalues: p1 (copy), p2 (copy)
		local Identity = p1.identity or p1.id
		local Copy = table.clone(Tbl[Identity] or {})
		Copy[p2] = p1
		local Copy1 = table.clone(Tbl)
		Copy1[Identity] = Copy
		
		return Copy1
	end
end

local _ = function(p1, p2)
	return function(Tbl)
		-- upvalues: p1 (copy), p2 (copy)
		if (Tbl[p1] or {})[p2] == nil then
			return Tbl
		end
		local Copy = table.clone(Tbl[p1])
		Copy[p2] = nil
		local Copy1 = table.clone(Tbl)
		Copy1[p1] = Copy
		
		if next(Copy) == nil then
			Copy1[p1] = nil
		end
		return Copy1
	end
end

local function applyProductOverrides(Tbl, List)
	-- upvalues: config2 (copy)
	if List == nil then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		for _, value1 in config2[i] do
			Copy[value1] = value[value1]
		end
	end
	return Copy
end

local function clearReadBackOverrides(Products, List, Callback: (any) -> ())
	local v1 = nil
	for i, value in List do
		if i == nil then
			v1 = nil
		else
			v1 = nil
			
			for _, product in Products do
				if (product.identity or product.id) == i then
					v1 = product
					break
				end
			end
		end
		local Details = value.details
		
		if v1 ~= nil and Details ~= nil and v1.name == Details.name and v1.description == Details.description and v1.priceInRobux == Details.priceInRobux then
			local v2 = "details"
			Callback(function(Tbl)
				-- upvalues: i (copy), v2 (copy)
				if (Tbl[i] or {})[v2] == nil then
					return Tbl
				end
				local Copy = table.clone(Tbl[i])
				Copy[v2] = nil
				local Copy1 = table.clone(Tbl)
				Copy1[i] = Copy
				
				if next(Copy) == nil then
					Copy1[i] = nil
				end
				return Copy1
			end)
		end
		local function _(p1, p2)
			-- upvalues: value (copy), v1 (copy), Callback (copy), i (copy)
			local Entry = value[p1]
			
			if v1 == nil or Entry == nil then return end
			if v1[p2] == true == (Entry[p2] == true) then
				Callback(function(Tbl)
					-- upvalues: i (copy), p1 (copy)
					if (Tbl[i] or {})[p1] == nil then
						return Tbl
					end
					local Copy = table.clone(Tbl[i])
					Copy[p1] = nil
					local Copy1 = table.clone(Tbl)
					Copy1[i] = Copy
					
					if next(Copy) == nil then
						Copy1[i] = nil
					end
					return Copy1
				end)
			end
		end
		
		local ManagedPricing = value.managedPricing
		
		if v1 ~= nil and ManagedPricing ~= nil and v1.isManagedPricingEnabled == true == (ManagedPricing.isManagedPricingEnabled == true) then
			local v3 = "managedPricing"
			Callback(function(Tbl)
				-- upvalues: i (copy), v3 (copy)
				if (Tbl[i] or {})[v3] == nil then
					return Tbl
				end
				local Copy = table.clone(Tbl[i])
				Copy[v3] = nil
				local Copy1 = table.clone(Tbl)
				Copy1[i] = Copy
				
				if next(Copy) == nil then
					Copy1[i] = nil
				end
				return Copy1
			end)
		end
		local SaleStatus = value.saleStatus
		
		if v1 ~= nil and SaleStatus ~= nil and v1.isForSale == true == (SaleStatus.isForSale == true) then
			local v4 = "saleStatus"
			Callback(function(Tbl)
				-- upvalues: i (copy), v4 (copy)
				if (Tbl[i] or {})[v4] == nil then
					return Tbl
				end
				local Copy = table.clone(Tbl[i])
				Copy[v4] = nil
				local Copy1 = table.clone(Tbl)
				Copy1[i] = Copy
				
				if next(Copy) == nil then
					Copy1[i] = nil
				end
				return Copy1
			end)
		end
	end
end

local function useManageProductState(p1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(if p1 == nil then nil else p1.identity or p1.id)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(if p1 == nil then "" else p1.name)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(if p1 == nil then "" else p1.description)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(if p1 == nil or p1.priceInRobux == nil then "" else tostring(p1.priceInRobux))
	
	return {
		selectedProductIdRef = UseRefResult,
		isProductSaleStatusPending = UseStateResult,
		setIsProductSaleStatusPending = UseStateResult2,
		productSaleStatusError = UseStateResult1,
		setProductSaleStatusError = UseStateResult2_1,
		isProductEditPending = UseStateResult3,
		setIsProductEditPending = UseStateResult2_2,
		productEditError = UseStateResult4,
		setProductEditError = UseStateResult2_3,
		editName = UseStateResult5,
		setEditName = UseStateResult2_4,
		editDescription = UseStateResult6,
		setEditDescription = UseStateResult2_5,
		editPrice = UseStateResult7,
		setEditPrice = UseStateResult2_6
	}
end

local function getEligibleProducts(List)
	local List1 = {}
	
	for _, value in List do
		if value ~= nil and (if value.productKind == nil then value.canManage ~= false else value.productKind == "DeveloperProduct" and value.canManage ~= false) and value.isForSale == true and value.isArchived ~= true and value.isImmutable ~= true and value.isInActivePriceOptimizationExperiment ~= true and value.priceInRobux ~= nil and value.priceInRobux > 0 then
			table.insert(List1, value)
		end
	end
	return List1
end

local _ = function(p1): boolean
	return p1 ~= nil and (p1.isArchived == true or (p1.isImmutable == true or p1.isInActivePriceOptimizationExperiment == true))
end

local function validateProductEdit(p1, Text1, Text, EditPrice, p2)
	-- upvalues: FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy), FFlagBuildExperienceRemoveDevProductPriceCap (copy)
	if Text1 ~= nil then
		if Text1 == "" then
			return p2.nameRequiredError
		elseif (utf8.len(Text1) or #Text1) > 50 then
			return p2.nameLengthError
		end
	end
	if (utf8.len(Text) or #Text) > 1000 then
		return p2.descriptionLengthError
	end
	local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
	
	if ProductKindCapabilitiesModule ~= nil and not ProductKindCapabilitiesModule.editablePrice then
		return nil, nil
	end
	local Number: number? = tonumber(EditPrice)
	local IsIsForSale = p1.isForSale == true
	
	if EditPrice == "" and IsIsForSale or EditPrice ~= "" and Number == nil or Number ~= nil and Number % 1 ~= 0 or Number ~= nil and Number < 1 or not FFlagBuildExperienceRemoveDevProductPriceCap and Number ~= nil and Number > 1000000000 then
		return p2.priceError
	else
		return nil, Number
	end
end

local function resolveProductEditSubmit(p1, p2)
	-- upvalues: FFlagBuildExperienceMonetizationProductEditingModule (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy), PromiseModule (copy)
	if FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p2 == nil then nil else p2.productKind) else nil) ~= nil then
		local OnUpdateProductKindFunction = p1.onUpdateProductKind
		
		return if OnUpdateProductKindFunction == nil then nil else function(p3)
			-- upvalues: OnUpdateProductKindFunction (copy), p2 (copy)
			return OnUpdateProductKindFunction(p2.productKind, p2.id, p3)
		end
	else
		local OnUpdateProductFunction = p1.onUpdateProduct
		local Number: number? = tonumber(p2.id)
		
		return if OnUpdateProductFunction == nil or Number == nil then nil else function(Labels)
			-- upvalues: PromiseModule (upval), OnUpdateProductFunction (copy), Number (copy)
			local Name = Labels.name
			
			return if Name == nil then PromiseModule.reject("A name is required to update a developer product.") else OnUpdateProductFunction(Number, {
				name = Name,
				description = Labels.description,
				priceInRobux = Labels.priceInRobux
			})
		end
	end
end

local function applyProductEditResult(Tbl, Labels, Match, Description, PriceInRobux)
	-- upvalues: FFlagBuildExperienceDevProductModerationReadbackModule (copy), WasDeveloperProductTextModeratedModule (copy)
	local Copy = table.clone(Tbl)
	
	if Match == nil then
		Copy.name = Labels.name or Tbl.name
	else
		Copy.name = if FFlagBuildExperienceDevProductModerationReadbackModule then Labels.name or "" else Labels.name or Match
	end
	Copy.description = if FFlagBuildExperienceDevProductModerationReadbackModule then Labels.description or "" elseif Labels.description == nil then Description else Labels.description
	local DefaultPriceInRobux = (if Labels.priceInformation == nil then nil else Labels.priceInformation.defaultPriceInRobux) or (PriceInRobux or Tbl.priceInRobux)
	Copy.priceInRobux = DefaultPriceInRobux
	Copy.price = if DefaultPriceInRobux == nil then Tbl.price else tostring(DefaultPriceInRobux)
	
	return Copy, if FFlagBuildExperienceDevProductModerationReadbackModule then WasDeveloperProductTextModeratedModule(Match, Labels.name) or WasDeveloperProductTextModeratedModule(Description, Labels.description) elseif Match == nil or Labels.name == nil then Labels.description ~= nil and Labels.description ~= Description else Labels.name ~= Match or Labels.description ~= nil and Labels.description ~= Description
end

local function getKindEditState(p1, p2, p3)
	-- upvalues: FFlagBuildExperienceMonetizationProductEditingModule (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy)
	if p1 == nil or (not FFlagBuildExperienceMonetizationProductEditingModule or (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil) == nil or not p2 or p3.onUpdateProductKind == nil) then
		return {}
	else
		local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
		local NoProductKindCapabilitiesModule = ProductKindCapabilitiesModule == nil or ProductKindCapabilitiesModule.editableName
		local ProductKindCapabilitiesModule1 = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p1 == nil then nil else p1.productKind) else nil
		
		return {
			canEdit = true,
			canEditName = NoProductKindCapabilitiesModule,
			canEditPrice = ProductKindCapabilitiesModule1 == nil or ProductKindCapabilitiesModule1.editablePrice
		}
	end
end

local _ = function(p1, List): string
	if p1 == nil or p1 == "Disabled" then
		return "Unavailable"
	end
	local Count = 0
	
	for _, value in List do
		if value.isManagedPricingEnabled == true then
			Count += 1
		end
	end
	return if Count == 0 then "AllOff" elseif Count == #List then "AllOn" else "Mixed"
end

local function getShopButtonEnabled(Entry): boolean
	local Entry1 = if Entry == nil then nil else Entry[1]
	local T = if Entry1 == nil or Entry1.entryPoints == nil then {} else Entry1.entryPoints
	for _, value in T do
		if value.name == "InExperienceGlobalIconEnabled" then
			return value.isEnabled == true
		end
	end
	return false
end

local _ = function(List): string
	for _, value in List do
		if value == "Failed" then
			return "Failed"
		end
	end
	for _, value1 in List do
		if value1 ~= "Ready" then
			return "NotReady"
		end
	end
	return "Ready"
end

local _ = function(p2, p3)
	return if p2 == nil then p3 elseif p2 then "AllOn" else "AllOff"
end

local function useOptionsState(p2, Products, UseMemoResult, UseRefResult, Current)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), getEligibleProducts (copy), getShopButtonEnabled (copy), ReactModule (copy), SendBuildExperienceEventModule (copy), FormatErrorModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		options = LocalizationStringsModule.MONETIZATION_OPTIONS,
		pricingOptions = LocalizationStringsModule.MONETIZATION_PRICING_OPTIONS,
		pricingOptionsDescription = LocalizationStringsModule.MONETIZATION_PRICING_OPTIONS_DESCRIPTION,
		managedPricing = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING,
		managedPricingDescription = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_DESCRIPTION,
		shopUI = LocalizationStringsModule.MONETIZATION_SHOP_UI,
		shopButton = LocalizationStringsModule.MONETIZATION_SHOP_BUTTON,
		shopButtonDescription = LocalizationStringsModule.MONETIZATION_SHOP_BUTTON_DESCRIPTION,
		optionsLoadError = LocalizationStringsModule.MONETIZATION_OPTIONS_LOAD_ERROR,
		permissionDenied = LocalizationStringsModule.MONETIZATION_PERMISSION_DENIED,
		mixed = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_MIXED,
		unavailable = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_UNAVAILABLE,
		noEligibleProducts = LocalizationStringsModule.MONETIZATION_NO_ELIGIBLE_PRODUCTS,
		optionsUpdateError = LocalizationStringsModule.MONETIZATION_OPTIONS_UPDATE_ERROR,
		partialUpdateError = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_PARTIAL_ERROR,
		acknowledgementTitle = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_TITLE,
		acknowledgementDescription = LocalizationStringsModule.MONETIZATION_MANAGED_PRICING_ACK_DESCRIPTION,
		agree = LocalizationStringsModule.MONETIZATION_AGREE
	})
	local EligibleProducts = getEligibleProducts(Products)
	local ManagedPricingStatus = p2.managedPricingStatus
	local AllOff = nil
	
	if ManagedPricingStatus == nil or ManagedPricingStatus == "Disabled" then
		AllOff = "Unavailable"
	else
		local Count = 0
		
		for _, eligibleProduct in EligibleProducts do
			if eligibleProduct.isManagedPricingEnabled == true then
				Count += 1
			end
		end
		AllOff = if Count == 0 then "AllOff" elseif Count == #EligibleProducts then "AllOn" else "Mixed"
	end
	local ShopButtonEnabled = getShopButtonEnabled(p2.shops)
	local list = {
		p2.managedPricingLoadStatus or "NotReady",
		p2.shopsLoadStatus or "NotReady",
		p2.permissionLoadStatus or "NotReady"
	}
	local LoadStatus = nil
	
	for _, value in list do
		if value == "Failed" then
			LoadStatus = "Failed"
			local IsPermissionCanMonetize: boolean = LoadStatus == "Ready" and p2.permissionCanMonetize == true
			local UseStateResult, UseStateResult2 = ReactModule.useState(false)
			local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
			local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
			local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
			local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
			local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
			local UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
			local UseRefResult1 = ReactModule.useRef(nil)
			local UseRefResult2 = ReactModule.useRef(nil)
			ReactModule.useLayoutEffect(function()
				-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), UseStateResult2_6 (copy)
				UseRefResult1.current = nil
				UseRefResult2.current = nil
				UseStateResult2(false)
				UseStateResult2_1(false)
				UseStateResult2_2(nil)
				UseStateResult2_3(nil)
				UseStateResult2_4(nil)
				UseStateResult2_5(nil)
				UseStateResult2_6(false)
			end, { p2.universeId or 0 })
			ReactModule.useEffect(function()
				-- upvalues: UseStateResult3 (copy), AllOff (copy), UseStateResult2_2 (copy)
				if UseStateResult3 ~= nil and (UseStateResult3 and AllOff == "AllOn" or not UseStateResult3 and AllOff == "AllOff") then
					UseStateResult2_2(nil)
				end
			end, { AllOff, UseStateResult3 })
			ReactModule.useEffect(function()
				-- upvalues: UseStateResult4 (copy), ShopButtonEnabled (copy), UseStateResult2_3 (copy)
				if UseStateResult4 ~= nil and UseStateResult4 == ShopButtonEnabled then
					UseStateResult2_3(nil)
				end
			end, { UseStateResult4, ShopButtonEnabled })
			local UseResult = ReactModule.useCallback(function(p3, p4)
				-- upvalues: p2 (copy), UseRefResult (copy), Current (copy), UseRefResult1 (copy), UseStateResult (copy), IsPermissionCanMonetize (copy), EligibleProducts (copy), UseStateResult2_6 (copy), UseStateResult2_4 (copy), UseStateResult2_2 (copy), UseStateResult2 (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), UseLocalizationResult (copy), FormatErrorModule (upval)
				local OnUpdateManagedPricingFunction = p2.onUpdateManagedPricing
				
				if UseRefResult.current ~= Current or UseRefResult1.current ~= nil or UseStateResult or not IsPermissionCanMonetize or OnUpdateManagedPricingFunction == nil or p2.managedPricingStatus == nil or p2.managedPricingStatus == "Disabled" or #EligibleProducts == 0 then return end
				local List = {}
				
				for _, eligibleProduct in EligibleProducts do
					local Number: number? = tonumber(eligibleProduct.id)
					
					if Number ~= nil then
						table.insert(List, Number)
					end
				end
				if #List == 0 then
					UseStateResult2_6(false)
					
					return
				else
					local Current1 = {}
					UseRefResult1.current = Current1
					UseStateResult2_4(nil)
					UseStateResult2_2(p3)
					UseStateResult2(true);
					(if p4 and p2.onAcceptManagedPricing ~= nil then p2.onAcceptManagedPricing():andThen(function()
						-- upvalues: UseRefResult (upval), Current (upval), UseRefResult1 (upval), Current1 (copy), OnUpdateManagedPricingFunction (copy), List (copy), p3 (copy)
						return if UseRefResult.current == Current and UseRefResult1.current == Current1 then OnUpdateManagedPricingFunction(List, p3) else nil
					end) else OnUpdateManagedPricingFunction(List, p3)):andThen(function(Result)
						-- upvalues: UseRefResult (upval), Current (upval), UseRefResult1 (upval), Current1 (copy), UseStateResult2_6 (upval), UseMemoResult (upval), SendBuildExperienceEventModule (upval), UseStateResult2_2 (upval), UseStateResult2_4 (upval), UseLocalizationResult (upval)
						if UseRefResult.current ~= Current or UseRefResult1.current ~= Current1 then return end
						UseStateResult2_6(false)
						
						if type(Result) == "table" and type(Result.errors) == "table" and #Result.errors > 0 then
							warn(`[MonetizationOptions] Managed Pricing update partially failed (universeId={tostring(UseMemoResult.universeId)})`)
							local config1 = { action = "managed_pricing", failureType = "partial" }
							
							if config1 == nil then
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", UseMemoResult)
							else
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", UseMemoResult, config1)
							end
							UseStateResult2_2(nil)
							UseStateResult2_4(UseLocalizationResult.partialUpdateError)
							
							return
						else
							local config = { action = "managed_pricing" }
							
							if config == nil then
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", UseMemoResult)
								
								return
							else
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", UseMemoResult, config)
							end
						end
					end):catch(function(Err)
						-- upvalues: UseRefResult (upval), Current (upval), UseRefResult1 (upval), Current1 (copy), UseMemoResult (upval), FormatErrorModule (upval), SendBuildExperienceEventModule (upval), UseStateResult2_6 (upval), UseStateResult2_2 (upval), UseStateResult2_4 (upval), UseLocalizationResult (upval)
						if UseRefResult.current ~= Current or UseRefResult1.current ~= Current1 then return end
						warn(`[MonetizationOptions] Managed Pricing update failed (universeId={tostring(UseMemoResult.universeId)}): {string.sub(string.gsub(FormatErrorModule(Err), "[\r\n]+", " "), 1, 200)}`)
						local config = { action = "managed_pricing", failureType = "request" }
						
						if config == nil then
							SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", UseMemoResult)
						else
							SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", UseMemoResult, config)
						end
						UseStateResult2_6(false)
						UseStateResult2_2(nil)
						UseStateResult2_4(UseLocalizationResult.optionsUpdateError)
					end):finally(function()
						-- upvalues: UseRefResult (upval), Current (upval), UseRefResult1 (upval), Current1 (copy), UseStateResult2 (upval)
						if UseRefResult.current == Current and UseRefResult1.current == Current1 then
							UseRefResult1.current = nil
							UseStateResult2(false)
						end
					end)
				end
			end, {
				IsPermissionCanMonetize, EligibleProducts, UseStateResult,
				UseLocalizationResult.optionsUpdateError,
				UseLocalizationResult.partialUpdateError, p2.managedPricingStatus,
				p2.onAcceptManagedPricing, p2.onUpdateManagedPricing, UseMemoResult, Current
			})
			local AllOff1: string = if UseStateResult3 == nil then AllOff elseif UseStateResult3 then "AllOn" else "AllOff"
			
			return {
				loadStatus = LoadStatus,
				canMonetize = IsPermissionCanMonetize,
				canChangeManagedPricing = IsPermissionCanMonetize and (p2.onUpdateManagedPricing ~= nil and (#EligibleProducts > 0 and AllOff1 ~= "Unavailable")),
				managedPricingState = AllOff1,
				managedPricingSupportingText = if #EligibleProducts == 0 and AllOff1 ~= "Unavailable" then UseLocalizationResult.noEligibleProducts else nil,
				shopButtonEnabled = if UseStateResult4 == nil then ShopButtonEnabled else UseStateResult4,
				isManagedPricingPending = UseStateResult,
				isShopButtonPending = UseStateResult1,
				managedPricingError = UseStateResult5,
				shopButtonError = UseStateResult6,
				showAcknowledgement = UseStateResult7,
				onManagedPricingChanged = ReactModule.useCallback(function(p5)
					-- upvalues: UseRefResult (copy), Current (copy), IsPermissionCanMonetize (copy), p2 (copy), EligibleProducts (copy), UseStateResult2_6 (copy), UseResult (copy)
					if UseRefResult.current ~= Current or not IsPermissionCanMonetize or p2.onUpdateManagedPricing == nil or p2.managedPricingStatus == nil or p2.managedPricingStatus == "Disabled" or #EligibleProducts == 0 then return end
					if p2.managedPricingStatus == "Pending" and p5 then
						UseStateResult2_6(true)
						
						return
					else
						UseResult(p5, false)
					end
				end, {
					IsPermissionCanMonetize,
					EligibleProducts,
					p2.managedPricingStatus,
					p2.onUpdateManagedPricing,
					UseResult
				}),
				onShopButtonChanged = ReactModule.useCallback(function(p5)
					-- upvalues: p2 (copy), UseRefResult (copy), Current (copy), UseRefResult2 (copy), UseStateResult1 (copy), IsPermissionCanMonetize (copy), UseStateResult2_5 (copy), UseStateResult2_3 (copy), UseStateResult2_1 (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), FormatErrorModule (upval), UseLocalizationResult (copy)
					local OnSetShopButtonFunction = p2.onSetShopButton
					
					if UseRefResult.current == Current and UseRefResult2.current == nil and not UseStateResult1 and IsPermissionCanMonetize and OnSetShopButtonFunction ~= nil then
						local Current1 = {}
						UseRefResult2.current = Current1
						UseStateResult2_5(nil)
						UseStateResult2_3(p5)
						UseStateResult2_1(true)
						OnSetShopButtonFunction(p5):andThen(function()
							-- upvalues: UseRefResult (upval), Current (upval), UseRefResult2 (upval), Current1 (copy), UseMemoResult (upval), SendBuildExperienceEventModule (upval)
							if UseRefResult.current ~= Current or UseRefResult2.current ~= Current1 then return end
							local config = { action = "shop_button" }
							
							if config == nil then
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", UseMemoResult)
								
								return
							else
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_SUCCESS", UseMemoResult, config)
							end
						end):catch(function(Err)
							-- upvalues: UseRefResult (upval), Current (upval), UseRefResult2 (upval), Current1 (copy), UseMemoResult (upval), FormatErrorModule (upval), SendBuildExperienceEventModule (upval), UseStateResult2_3 (upval), UseStateResult2_5 (upval), UseLocalizationResult (upval)
							if UseRefResult.current ~= Current or UseRefResult2.current ~= Current1 then return end
							warn(`[MonetizationOptions] Shop button update failed (universeId={tostring(UseMemoResult.universeId)}): {string.sub(string.gsub(FormatErrorModule(Err), "[\r\n]+", " "), 1, 200)}`)
							local config = { action = "shop_button", failureType = "request" }
							
							if config == nil then
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", UseMemoResult)
							else
								SendBuildExperienceEventModule("MONETIZATION_OPTIONS_UPDATE_FAILURE", UseMemoResult, config)
							end
							UseStateResult2_3(nil)
							UseStateResult2_5(UseLocalizationResult.optionsUpdateError)
						end):finally(function()
							-- upvalues: UseRefResult (upval), Current (upval), UseRefResult2 (upval), Current1 (copy), UseStateResult2_1 (upval)
							if UseRefResult.current == Current and UseRefResult2.current == Current1 then
								UseRefResult2.current = nil
								UseStateResult2_1(false)
							end
						end)
						
						return
					end
				end, {
					IsPermissionCanMonetize, UseStateResult1,
					UseLocalizationResult.optionsUpdateError, p2.onSetShopButton, UseMemoResult,
					Current
				}),
				onConfirmManagedPricing = function()
					-- upvalues: UseResult (copy)
					UseResult(true, true)
				end,
				onCancelManagedPricing = function()
					-- upvalues: UseStateResult (copy), UseStateResult2_6 (copy)
					if not UseStateResult then
						UseStateResult2_6(false)
					end
				end,
				onRetry = p2.onRetryOptions or function() end,
				labels = UseLocalizationResult
			}
		end
	end
	LoadStatus = "Ready"
	
	for _, value1 in list do
		if value1 ~= "Ready" then
			LoadStatus = "NotReady"
			break
		end
	end
end

local function getRegionalPricingViewState(p3, p4, p5, ProductManagedPricingError, p6)
	-- upvalues: FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy), FFlagBuildExperienceMonetizationKindRegionalPricingModule (copy)
	local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if p4 == nil then nil else p4.productKind) else nil
	local ProductKindCapabilitiesModule1 = if FFlagBuildExperienceMonetizationKindRegionalPricingModule and ProductKindCapabilitiesModule ~= nil and ProductKindCapabilitiesModule.regionalPricing then ProductKindCapabilitiesModule else nil
	local PriceInRobux = if p4 == nil then nil else p4.priceInRobux
	
	return {
		canUpdate = if ProductKindCapabilitiesModule1 == nil then p3.onUpdateProductManagedPricing ~= nil else p3.onUpdateProductKindManagedPricing ~= nil,
		canChangeKind = if FFlagBuildExperienceMonetizationKindRegionalPricingModule then p5 and (ProductKindCapabilitiesModule1 ~= nil and p3.onUpdateProductKindManagedPricing ~= nil) else nil,
		errorLabel = if ProductKindCapabilitiesModule1 == nil or not ProductManagedPricingError then nil elseif PriceInRobux == nil then p6.kindPriceRequiredForRegionalPricing else p6.updateError
	}
end

local _ = function(p3, Entry)
	-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (copy), FFlagBuildExperienceMonetizationProductEditingModule (copy)
	local InitialMode = if FFlagBuildExperienceMonetizationNativeUIModule or p3.initialMode ~= "options" then p3.initialMode else nil
	
	if InitialMode == "detail" or FFlagBuildExperienceMonetizationProductEditingModule and InitialMode == "edit" then
		return InitialMode, Entry[1]
	else
		return InitialMode, nil
	end
end

local function useMonetizationLocalization()
	-- upvalues: UseLocalizationFunction (copy), FFlagBuildExperienceDeveloperProductContextModule (copy), LocalizationStringsModule (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), FFlagBuildExperienceMonetizationKindRegionalPricingModule (copy)
	return UseLocalizationFunction({
		composerPlaceholder = if FFlagBuildExperienceDeveloperProductContextModule then LocalizationStringsModule.CHAT_COMPOSER_PLACEHOLDER else nil,
		title = LocalizationStringsModule.MONETIZATION_TITLE,
		emptyTitle = LocalizationStringsModule.MONETIZATION_EMPTY_TITLE,
		emptyDescription = LocalizationStringsModule.MONETIZATION_EMPTY_DESCRIPTION,
		emptyCreateProduct = LocalizationStringsModule.MONETIZATION_EMPTY_CREATE_PRODUCT,
		createProductPrompt = LocalizationStringsModule.MONETIZATION_CREATE_PRODUCT_PROMPT,
		pricing = LocalizationStringsModule.MONETIZATION_PRICING,
		regionalPricing = LocalizationStringsModule.MONETIZATION_REGIONAL_PRICING,
		loading = LocalizationStringsModule.MONETIZATION_LOADING,
		loadErrorTitle = LocalizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE,
		loadErrorDescription = LocalizationStringsModule.CHAT_ERROR_UPSTREAM_UNAVAILABLE,
		updateError = LocalizationStringsModule.CHAT_DEFAULT_FAILURE,
		retry = LocalizationStringsModule.MONETIZATION_RETRY,
		availableForPurchase = LocalizationStringsModule.MONETIZATION_AVAILABLE_FOR_PURCHASE,
		edit = LocalizationStringsModule.MONETIZATION_EDIT,
		editProduct = LocalizationStringsModule.MONETIZATION_EDIT_PRODUCT,
		name = LocalizationStringsModule.MONETIZATION_NAME,
		description = LocalizationStringsModule.MONETIZATION_DESCRIPTION,
		price = LocalizationStringsModule.MONETIZATION_PRICE,
		cancel = LocalizationStringsModule.MONETIZATION_CANCEL,
		save = LocalizationStringsModule.MONETIZATION_SAVE,
		nameRequiredError = LocalizationStringsModule.MONETIZATION_NAME_REQUIRED_ERROR,
		nameLengthError = LocalizationStringsModule.MONETIZATION_NAME_LENGTH_ERROR,
		descriptionLengthError = LocalizationStringsModule.MONETIZATION_DESCRIPTION_LENGTH_ERROR,
		priceError = LocalizationStringsModule.MONETIZATION_PRICE_ERROR,
		priceRequiredForSale = LocalizationStringsModule.MONETIZATION_PRICE_REQUIRED_FOR_SALE,
		moderationError = LocalizationStringsModule.MONETIZATION_MODERATION_ERROR,
		kindPriceRequiredForSale = if FFlagBuildExperienceMonetizationManageKindsModule then LocalizationStringsModule.MONETIZATION_PRICE_REQUIRED_FOR_KIND_SALE else nil,
		kindPriceRequiredForRegionalPricing = if FFlagBuildExperienceMonetizationKindRegionalPricingModule then LocalizationStringsModule.MONETIZATION_PRICE_REQUIRED_FOR_REGIONAL_PRICING else nil
	})
end

return function(p3)
	-- upvalues: useMonetizationLocalization (copy), t (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), FFlagBuildExperienceMonetizationProductEditingModule (copy), ReactModule (copy), config1 (copy), useOptionsState (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), noop (copy), applyProductOverrides (copy), config (copy), useManageProductState (copy), SendBuildExperienceEventModule (copy), clearReadBackOverrides (copy), FFlagBuildExperienceMonetizationManageKindsModule (copy), GetProductKindCapabilitiesModule (copy), FFlagBuildExperienceMonetizationKindRegionalPricingModule (copy), FormatErrorModule (copy), resolveProductEditSubmit (copy), validateProductEdit (copy), applyProductEditResult (copy), FFlagBuildCheckGamePermissionsModule (copy), FFlagBuildExperienceDeveloperProductContextModule (copy), UseOnScreenKeyboardHeightModule (copy), GetBuildPromptDraftStoreModule (copy), Creator (copy), getRegionalPricingViewState (copy), getKindEditState (copy)
	local UseMonetizationLocalizationResult = useMonetizationLocalization()
	local Products = p3.products or t
	local InitialMode = if FFlagBuildExperienceMonetizationNativeUIModule or p3.initialMode ~= "options" then p3.initialMode else nil
	local Product = if InitialMode == "detail" or FFlagBuildExperienceMonetizationProductEditingModule and InitialMode == "edit" then Products[1] else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p3 (copy)
		return {
			messageId = nil,
			turnId = nil,
			universeId = p3.universeId,
			placeId = p3.placeId,
			conversationId = p3.sessionId
		}
	end, {
		p3.placeId or 0,
		p3.sessionId or "",
		p3.universeId or 0
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		return {}
	end, { p3.universeId or 0 })
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseMemoResult1 (copy)
		UseRefResult.current = UseMemoResult1
		
		return function()
			-- upvalues: UseRefResult (upval), UseMemoResult1 (upval)
			if UseRefResult.current == UseMemoResult1 then
				UseRefResult.current = nil
			end
		end
	end, { UseMemoResult1 })
	local UseOptionsStateResult = if FFlagBuildExperienceMonetizationNativeUIModule then useOptionsState(p3, Products, UseMemoResult, UseRefResult, UseMemoResult1) else config1
	local NoFFlagBuildExperienceMonetizationMultiKindModule: boolean = not FFlagBuildExperienceMonetizationMultiKindModule or p3.permissionLoadStatus == "Ready" and p3.permissionCanMonetize == true
	local Catalog: string = if #Products > 0 then "catalog" else "empty"
	local UseStateResult, UseStateResult2 = ReactModule.useState(InitialMode or Catalog)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Product)
	local v5 = nil
	local Callback = noop
	local t1 = {}
	local Callback1 = noop
	
	if FFlagBuildExperienceMonetizationMultiKindModule then
		v5, Callback = ReactModule.useState(if Product == nil then nil else Product.identity or Product.id)
		t1, Callback1 = ReactModule.useState({})
	end
	local v6 = nil
	if FFlagBuildExperienceMonetizationMultiKindModule then
		local Identity = v5
		
		if Identity == nil then
			v6 = nil
		else
			v6 = nil
			
			for _, product in Products do
				if (product.identity or product.id) == Identity then
					v6 = product
					break
				end
			end
		end
	else
		v6 = nil
	end
	local ApplyProductOverridesResult = if FFlagBuildExperienceMonetizationMultiKindModule then if v6 == nil then nil else applyProductOverrides(v6, if v5 == nil then nil else t1[v5]) else UseStateResult1
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseManageProductStateResult = if FFlagBuildExperienceMonetizationProductEditingModule then useManageProductState(Product) else config
	local SelectedProductIdRef = UseManageProductStateResult.selectedProductIdRef
	local IsProductSaleStatusPending = UseManageProductStateResult.isProductSaleStatusPending
	local SetIsProductSaleStatusPendingFunction = UseManageProductStateResult.setIsProductSaleStatusPending
	local ProductSaleStatusError = UseManageProductStateResult.productSaleStatusError
	local SetProductSaleStatusErrorFunction = UseManageProductStateResult.setProductSaleStatusError
	local IsProductEditPending = UseManageProductStateResult.isProductEditPending
	local SetIsProductEditPendingFunction = UseManageProductStateResult.setIsProductEditPending
	local ProductEditError = UseManageProductStateResult.productEditError
	local SetProductEditErrorFunction = UseManageProductStateResult.setProductEditError
	local EditName = UseManageProductStateResult.editName
	local SetEditNameFunction = UseManageProductStateResult.setEditName
	local EditDescription = UseManageProductStateResult.editDescription
	local SetEditDescriptionFunction = UseManageProductStateResult.setEditDescription
	local EditPrice = UseManageProductStateResult.editPrice
	local SetEditPriceFunction = UseManageProductStateResult.setEditPrice
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), InitialMode (copy), Catalog (copy), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback (ref), Product (copy), Callback1 (ref), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), FFlagBuildExperienceMonetizationProductEditingModule (upval), SelectedProductIdRef (copy), SetIsProductSaleStatusPendingFunction (copy), SetProductSaleStatusErrorFunction (copy), SetIsProductEditPendingFunction (copy), SetProductEditErrorFunction (copy), SetEditNameFunction (copy), SetEditDescriptionFunction (copy), SetEditPriceFunction (copy)
		UseRefResult1.current = nil
		UseStateResult2(InitialMode or Catalog)
		
		if FFlagBuildExperienceMonetizationMultiKindModule then
			Callback(if Product == nil then nil else Product.identity or Product.id)
			Callback1({})
		else
			UseStateResult2_1(Product)
		end
		UseStateResult2_2(false)
		UseStateResult2_3(false)
		
		if FFlagBuildExperienceMonetizationProductEditingModule then
			SelectedProductIdRef.current = if Product == nil then nil else Product.identity or Product.id
			SetIsProductSaleStatusPendingFunction(false)
			SetProductSaleStatusErrorFunction(false)
			SetIsProductEditPendingFunction(false)
			SetProductEditErrorFunction(nil)
			SetEditNameFunction(if Product == nil then "" else Product.name)
			SetEditDescriptionFunction(if Product == nil then "" else Product.description)
			SetEditPriceFunction(if Product == nil or Product.priceInRobux == nil then "" else tostring(Product.priceInRobux))
		end
	end, { p3.universeId or 0 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), SendBuildExperienceEventModule (upval)
		local config = { source = "monetization_page" }
		
		if config == nil then
			SendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_ENTRY_CLICK", UseMemoResult, config)
		end
		SendBuildExperienceEventModule("MONETIZATION_PAGE_IMPRESSION", UseMemoResult)
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: InitialMode (copy), UseStateResult (copy), Catalog (copy), UseStateResult2 (copy)
		if InitialMode == nil and (UseStateResult == "catalog" or UseStateResult == "empty") and UseStateResult ~= Catalog then
			UseStateResult2(Catalog)
		end
	end, { Catalog, InitialMode, UseStateResult })
	
	if FFlagBuildExperienceMonetizationMultiKindModule then
		ReactModule.useEffect(function()
			-- upvalues: v5 (ref), Products (copy), SelectedProductIdRef (copy), Callback (ref), UseStateResult2 (copy), Catalog (copy), clearReadBackOverrides (upval), t1 (ref), Callback1 (ref)
			if v5 ~= nil then
				local Identity = v5
				local v7 = nil
				
				if Identity == nil then
					v7 = nil
				else
					v7 = nil
					
					for _, product in Products do
						if (product.identity or product.id) == Identity then
							v7 = product
							break
						end
					end
				end
				if v7 == nil then
					SelectedProductIdRef.current = nil
					Callback(nil)
					UseStateResult2(Catalog)
				end
			end
			clearReadBackOverrides(Products, t1, Callback1)
		end, { Catalog, t1, Products, v5 })
	end
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), UseStateResult (copy), SendBuildExperienceEventModule (upval), FFlagBuildExperienceMonetizationProductEditingModule (upval), IsProductEditPending (copy), UseRefResult1 (copy), SetProductEditErrorFunction (copy), UseStateResult2 (copy), SelectedProductIdRef (copy), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback (ref), UseStateResult2_1 (copy), Catalog (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), InitialMode (copy), p3 (copy)
		local config = { mode = tostring(UseStateResult) }
		
		if config == nil then
			SendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_CLOSE_CLICK", UseMemoResult, config)
		end
		if not FFlagBuildExperienceMonetizationProductEditingModule or UseStateResult ~= "edit" then
			if UseStateResult == "detail" then
				if FFlagBuildExperienceMonetizationProductEditingModule then
					SelectedProductIdRef.current = nil
				end
				if FFlagBuildExperienceMonetizationMultiKindModule then
					Callback(nil)
				else
					UseStateResult2_1(nil)
				end
				UseStateResult2(Catalog)
				
				return
			elseif FFlagBuildExperienceMonetizationNativeUIModule and UseStateResult == "options" and InitialMode ~= "options" then
				UseStateResult2(Catalog)
				
				return
			else
				p3.onClose()
				
				return
			end
		elseif not IsProductEditPending and UseRefResult1.current == nil then
			SetProductEditErrorFunction(nil)
			UseStateResult2("detail")
			
			return
		else
		end
	end, {
		Catalog,
		if FFlagBuildExperienceMonetizationProductEditingModule then IsProductEditPending else nil,
		UseStateResult, InitialMode, p3.onClose, UseMemoResult,
		SetProductEditErrorFunction
	})
	local UseResult4 = ReactModule.useCallback(function(Identity)
		-- upvalues: Products (copy), FFlagBuildExperienceMonetizationMultiKindModule (upval), UseMemoResult (copy), SendBuildExperienceEventModule (upval), FFlagBuildExperienceMonetizationProductEditingModule (upval), UseStateResult2_3 (copy), SetProductSaleStatusErrorFunction (copy), SetProductEditErrorFunction (copy), SelectedProductIdRef (copy), Callback (ref), UseStateResult2_1 (copy), UseStateResult2 (copy)
		for _, product in Products do
			if (product.identity or product.id) == Identity then
				local config = { productId = product.id }
				
				if FFlagBuildExperienceMonetizationMultiKindModule then
					config.productKind = product.productKind
				end
				if config == nil then
					SendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", UseMemoResult)
				else
					SendBuildExperienceEventModule("MONETIZATION_PRODUCT_CLICK", UseMemoResult, config)
				end
				if FFlagBuildExperienceMonetizationProductEditingModule then
					UseStateResult2_3(false)
					SetProductSaleStatusErrorFunction(false)
					SetProductEditErrorFunction(nil)
				end
				if FFlagBuildExperienceMonetizationProductEditingModule then
					SelectedProductIdRef.current = product.identity or product.id
				end
				if FFlagBuildExperienceMonetizationMultiKindModule then
					Callback(Identity)
				else
					UseStateResult2_1(product)
				end
				UseStateResult2("detail")
				break
			end
		end
	end, {
		Products,
		SetProductEditErrorFunction,
		SetProductSaleStatusErrorFunction,
		UseMemoResult
	})
	local UseResult5 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2("options")
	end, {}) else function() end
	local UseResult6 = ReactModule.useCallback(function(IsManagedPricingEnabled)
		-- upvalues: ApplyProductOverridesResult (copy), p3 (copy), FFlagBuildExperienceMonetizationManageKindsModule (upval), GetProductKindCapabilitiesModule (upval), FFlagBuildExperienceMonetizationKindRegionalPricingModule (upval), UseRefResult (copy), UseMemoResult1 (copy), UseRefResult1 (copy), NoFFlagBuildExperienceMonetizationMultiKindModule (copy), UseStateResult3 (copy), FFlagBuildExperienceMonetizationProductEditingModule (upval), IsProductSaleStatusPending (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), UseStateResult2_3 (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback1 (ref), UseStateResult2_1 (copy), UseStateResult2_2 (copy), FormatErrorModule (upval), SelectedProductIdRef (copy)
		local Number = if ApplyProductOverridesResult == nil then nil else tonumber(ApplyProductOverridesResult.id)
		local OnUpdateProductManagedPricingFunction = p3.onUpdateProductManagedPricing
		local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil
		local ProductKindCapabilitiesModule1 = if FFlagBuildExperienceMonetizationKindRegionalPricingModule and ProductKindCapabilitiesModule ~= nil and ProductKindCapabilitiesModule.regionalPricing then ProductKindCapabilitiesModule else nil
		local OnUpdateProductKindManagedPricingFunction = p3.onUpdateProductKindManagedPricing
		
		if UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= nil or ApplyProductOverridesResult == nil or (ApplyProductOverridesResult == nil or not (if ApplyProductOverridesResult.productKind == nil then ApplyProductOverridesResult.canManage ~= false else ApplyProductOverridesResult.productKind == "DeveloperProduct" and ApplyProductOverridesResult.canManage ~= false)) and ProductKindCapabilitiesModule1 == nil or not NoFFlagBuildExperienceMonetizationMultiKindModule or ((if ProductKindCapabilitiesModule1 == nil then Number == nil or OnUpdateProductManagedPricingFunction == nil else OnUpdateProductKindManagedPricingFunction == nil) or UseStateResult3 or FFlagBuildExperienceMonetizationProductEditingModule and IsProductSaleStatusPending) or ApplyProductOverridesResult ~= nil and (ApplyProductOverridesResult.isArchived == true or (ApplyProductOverridesResult.isImmutable == true or ApplyProductOverridesResult.isInActivePriceOptimizationExperiment == true)) then return end
		if FFlagBuildExperienceMonetizationNativeUIModule and IsManagedPricingEnabled and ApplyProductOverridesResult.priceInRobux == nil then
			UseStateResult2_3(true)
			
			return
		end
		local Current = {}
		UseRefResult1.current = Current
		local ProductKind = if ProductKindCapabilitiesModule1 == nil then nil else ApplyProductOverridesResult.productKind
		local config = {
			isEnabled = tostring(IsManagedPricingEnabled),
			productId = ApplyProductOverridesResult.id,
			productKind = ProductKind
		}
		
		if config == nil then
			SendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_MANAGED_PRICING_CLICK", UseMemoResult, config)
		end
		local Copy = table.clone(ApplyProductOverridesResult)
		Copy.isManagedPricingEnabled = IsManagedPricingEnabled
		
		if FFlagBuildExperienceMonetizationMultiKindModule then
			local v7 = "managedPricing"
			Callback1(function(Tbl)
				-- upvalues: Copy (copy), v7 (copy)
				local Identity = Copy.identity or Copy.id
				local Copy = table.clone(Tbl[Identity] or {})
				Copy[v7] = Copy
				local Copy1 = table.clone(Tbl)
				Copy1[Identity] = Copy
				
				return Copy1
			end)
		else
			UseStateResult2_1(Copy)
		end
		UseStateResult2_3(false)
		UseStateResult2_2(true);
		(if ProductKindCapabilitiesModule1 == nil then OnUpdateProductManagedPricingFunction(Number, IsManagedPricingEnabled) else OnUpdateProductKindManagedPricingFunction(ApplyProductOverridesResult.productKind, ApplyProductOverridesResult.id, IsManagedPricingEnabled)):andThen(function()
			-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), UseMemoResult (upval), ApplyProductOverridesResult (copy), ProductKind (copy), SendBuildExperienceEventModule (upval)
			if UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= Current then return end
			local config = {
				action = "managed_pricing",
				productId = ApplyProductOverridesResult.id,
				productKind = ProductKind
			}
			
			if config == nil then
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", UseMemoResult)
				
				return
			else
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", UseMemoResult, config)
			end
		end):catch(function(Err)
			-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), ApplyProductOverridesResult (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), FormatErrorModule (upval), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback1 (upval), UseMemoResult (upval), ProductKind (copy), SendBuildExperienceEventModule (upval), FFlagBuildExperienceMonetizationProductEditingModule (upval), SelectedProductIdRef (upval), UseStateResult2_1 (upval), UseStateResult2_3 (upval)
			if UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= Current then return end
			if FFlagBuildExperienceMonetizationNativeUIModule then
				warn(`[{ApplyProductOverridesResult.productKind or "DeveloperProduct"}] action=managed_pricing productId={ApplyProductOverridesResult.id} failed={string.sub(string.gsub(FormatErrorModule(Err), "[\r\n]+", " "), 1, 200)}`)
			end
			if FFlagBuildExperienceMonetizationMultiKindModule then
				local Identity = ApplyProductOverridesResult.identity or ApplyProductOverridesResult.id
				local v8 = "managedPricing"
				Callback1(function(Tbl)
					-- upvalues: Identity (copy), v8 (copy)
					if (Tbl[Identity] or {})[v8] == nil then
						return Tbl
					end
					local Copy = table.clone(Tbl[Identity])
					Copy[v8] = nil
					local Copy1 = table.clone(Tbl)
					Copy1[Identity] = Copy
					
					if next(Copy) == nil then
						Copy1[Identity] = nil
					end
					return Copy1
				end)
			end
			local config = {
				action = "managed_pricing",
				productId = ApplyProductOverridesResult.id,
				productKind = ProductKind
			}
			
			if config == nil then
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", UseMemoResult)
			else
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", UseMemoResult, config)
			end
			if not FFlagBuildExperienceMonetizationProductEditingModule or SelectedProductIdRef.current == (ApplyProductOverridesResult.identity or ApplyProductOverridesResult.id) then
				if not FFlagBuildExperienceMonetizationMultiKindModule then
					UseStateResult2_1(ApplyProductOverridesResult)
				end
				UseStateResult2_3(true)
			end
		end):finally(function()
			-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), UseStateResult2_2 (upval)
			if UseRefResult.current == UseMemoResult1 and UseRefResult1.current == Current then
				UseRefResult1.current = nil
				UseStateResult2_2(false)
			end
		end)
	end, {
		NoFFlagBuildExperienceMonetizationMultiKindModule, UseStateResult3,
		if FFlagBuildExperienceMonetizationProductEditingModule then IsProductSaleStatusPending else nil,
		p3.onUpdateProductManagedPricing, ApplyProductOverridesResult, UseMemoResult,
		UseMemoResult1, p3.onUpdateProductKindManagedPricing or false
	})
	local UseResult7 = ReactModule.useCallback(function(IsForSale)
		-- upvalues: ApplyProductOverridesResult (copy), p3 (copy), FFlagBuildExperienceMonetizationManageKindsModule (upval), GetProductKindCapabilitiesModule (upval), FFlagBuildExperienceMonetizationProductEditingModule (upval), UseRefResult (copy), UseMemoResult1 (copy), UseRefResult1 (copy), NoFFlagBuildExperienceMonetizationMultiKindModule (copy), IsProductSaleStatusPending (copy), UseStateResult3 (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), SetProductSaleStatusErrorFunction (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback1 (ref), UseStateResult2_1 (copy), SetIsProductSaleStatusPendingFunction (copy), FormatErrorModule (upval), SelectedProductIdRef (copy)
		local Number = if ApplyProductOverridesResult == nil then nil else tonumber(ApplyProductOverridesResult.id)
		local OnUpdateProductSaleStatusFunction = p3.onUpdateProductSaleStatus
		local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil
		local OnUpdateProductKindSaleStatusFunction = p3.onUpdateProductKindSaleStatus
		
		if not FFlagBuildExperienceMonetizationProductEditingModule or UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= nil or ApplyProductOverridesResult == nil or (ApplyProductOverridesResult == nil or not (if ApplyProductOverridesResult.productKind == nil then ApplyProductOverridesResult.canManage ~= false else ApplyProductOverridesResult.productKind == "DeveloperProduct" and ApplyProductOverridesResult.canManage ~= false)) and ProductKindCapabilitiesModule == nil or not NoFFlagBuildExperienceMonetizationMultiKindModule or ((if ProductKindCapabilitiesModule == nil then Number == nil or OnUpdateProductSaleStatusFunction == nil else OnUpdateProductKindSaleStatusFunction == nil) or IsProductSaleStatusPending or UseStateResult3) or ApplyProductOverridesResult ~= nil and (ApplyProductOverridesResult.isArchived == true or (ApplyProductOverridesResult.isImmutable == true or ApplyProductOverridesResult.isInActivePriceOptimizationExperiment == true)) then return end
		if FFlagBuildExperienceMonetizationNativeUIModule and IsForSale and ApplyProductOverridesResult.priceInRobux == nil and (ProductKindCapabilitiesModule == nil or ProductKindCapabilitiesModule.priceRequiredForSale) then
			SetProductSaleStatusErrorFunction(true)
			
			return
		end
		local Current = {}
		UseRefResult1.current = Current
		local ProductKind = if ProductKindCapabilitiesModule == nil then nil else ApplyProductOverridesResult.productKind
		local config = {
			isEnabled = tostring(IsForSale),
			productId = ApplyProductOverridesResult.id,
			productKind = ProductKind
		}
		
		if config == nil then
			SendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_SALE_STATUS_CLICK", UseMemoResult, config)
		end
		local Copy = table.clone(ApplyProductOverridesResult)
		Copy.isForSale = IsForSale
		
		if FFlagBuildExperienceMonetizationMultiKindModule then
			local v7 = "saleStatus"
			Callback1(function(Tbl)
				-- upvalues: Copy (copy), v7 (copy)
				local Identity = Copy.identity or Copy.id
				local Copy = table.clone(Tbl[Identity] or {})
				Copy[v7] = Copy
				local Copy1 = table.clone(Tbl)
				Copy1[Identity] = Copy
				
				return Copy1
			end)
		else
			UseStateResult2_1(Copy)
		end
		SetProductSaleStatusErrorFunction(false)
		SetIsProductSaleStatusPendingFunction(true);
		(if ProductKindCapabilitiesModule == nil then OnUpdateProductSaleStatusFunction(Number, IsForSale) else OnUpdateProductKindSaleStatusFunction(ApplyProductOverridesResult.productKind, ApplyProductOverridesResult.id, IsForSale)):andThen(function()
			-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), UseMemoResult (upval), ApplyProductOverridesResult (copy), ProductKind (copy), SendBuildExperienceEventModule (upval)
			if UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= Current then return end
			local config = {
				action = "sale_status",
				productId = ApplyProductOverridesResult.id,
				productKind = ProductKind
			}
			
			if config == nil then
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", UseMemoResult)
				
				return
			else
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", UseMemoResult, config)
			end
		end):catch(function(Err)
			-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), ApplyProductOverridesResult (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), FormatErrorModule (upval), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback1 (upval), UseMemoResult (upval), ProductKind (copy), SendBuildExperienceEventModule (upval), SelectedProductIdRef (upval), UseStateResult2_1 (upval), SetProductSaleStatusErrorFunction (upval)
			if UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= Current then return end
			if FFlagBuildExperienceMonetizationNativeUIModule then
				warn(`[{ApplyProductOverridesResult.productKind or "DeveloperProduct"}] action=sale_status productId={ApplyProductOverridesResult.id} failed={string.sub(string.gsub(FormatErrorModule(Err), "[\r\n]+", " "), 1, 200)}`)
			end
			if FFlagBuildExperienceMonetizationMultiKindModule then
				local Identity = ApplyProductOverridesResult.identity or ApplyProductOverridesResult.id
				local v8 = "saleStatus"
				Callback1(function(Tbl)
					-- upvalues: Identity (copy), v8 (copy)
					if (Tbl[Identity] or {})[v8] == nil then
						return Tbl
					end
					local Copy = table.clone(Tbl[Identity])
					Copy[v8] = nil
					local Copy1 = table.clone(Tbl)
					Copy1[Identity] = Copy
					
					if next(Copy) == nil then
						Copy1[Identity] = nil
					end
					return Copy1
				end)
			end
			local config = {
				action = "sale_status",
				productId = ApplyProductOverridesResult.id,
				productKind = ProductKind
			}
			
			if config == nil then
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", UseMemoResult)
			else
				SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", UseMemoResult, config)
			end
			if SelectedProductIdRef.current == (ApplyProductOverridesResult.identity or ApplyProductOverridesResult.id) then
				if not FFlagBuildExperienceMonetizationMultiKindModule then
					UseStateResult2_1(ApplyProductOverridesResult)
				end
				SetProductSaleStatusErrorFunction(true)
			end
		end):finally(function()
			-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), SetIsProductSaleStatusPendingFunction (upval)
			if UseRefResult.current == UseMemoResult1 and UseRefResult1.current == Current then
				UseRefResult1.current = nil
				SetIsProductSaleStatusPendingFunction(false)
			end
		end)
	end, {
		NoFFlagBuildExperienceMonetizationMultiKindModule, UseStateResult3,
		IsProductSaleStatusPending, p3.onUpdateProductSaleStatus,
		ApplyProductOverridesResult, SetIsProductSaleStatusPendingFunction,
		SetProductSaleStatusErrorFunction, UseMemoResult, UseMemoResult1,
		p3.onUpdateProductKindSaleStatus or false
	})
	local OnUpdateProductKind = p3.onUpdateProductKind or false
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: ApplyProductOverridesResult (copy), FFlagBuildExperienceMonetizationProductEditingModule (upval), p3 (copy), FFlagBuildExperienceMonetizationManageKindsModule (upval), GetProductKindCapabilitiesModule (upval), NoFFlagBuildExperienceMonetizationMultiKindModule (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), SetEditNameFunction (copy), SetEditDescriptionFunction (copy), SetEditPriceFunction (copy), SetProductEditErrorFunction (copy), UseStateResult2 (copy)
		if not FFlagBuildExperienceMonetizationProductEditingModule or ApplyProductOverridesResult == nil or ((ApplyProductOverridesResult == nil or not (if ApplyProductOverridesResult.productKind == nil then ApplyProductOverridesResult.canManage ~= false else ApplyProductOverridesResult.productKind == "DeveloperProduct" and ApplyProductOverridesResult.canManage ~= false)) and (not FFlagBuildExperienceMonetizationProductEditingModule or (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil) == nil) or p3.onUpdateProductKind == nil and (FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil) ~= nil) or not NoFFlagBuildExperienceMonetizationMultiKindModule) or ApplyProductOverridesResult ~= nil and (ApplyProductOverridesResult.isArchived == true or (ApplyProductOverridesResult.isImmutable == true or ApplyProductOverridesResult.isInActivePriceOptimizationExperiment == true)) then return end
		local config = { productId = ApplyProductOverridesResult.id }
		
		if FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil) ~= nil and ApplyProductOverridesResult.productKind ~= nil then
			config.productKind = ApplyProductOverridesResult.productKind
		end
		if config == nil then
			SendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_EDIT_CLICK", UseMemoResult, config)
		end
		SetEditNameFunction(ApplyProductOverridesResult.name)
		SetEditDescriptionFunction(ApplyProductOverridesResult.description)
		SetEditPriceFunction(if ApplyProductOverridesResult.priceInRobux == nil then "" else tostring(ApplyProductOverridesResult.priceInRobux))
		SetProductEditErrorFunction(nil)
		UseStateResult2("edit")
	end, {
		NoFFlagBuildExperienceMonetizationMultiKindModule, OnUpdateProductKind,
		ApplyProductOverridesResult, SetEditDescriptionFunction, SetEditNameFunction,
		SetEditPriceFunction, SetProductEditErrorFunction, UseMemoResult
	})
	local UseResult9 = ReactModule.useCallback(function(p4)
		-- upvalues: SetEditNameFunction (copy), SetProductEditErrorFunction (copy)
		SetEditNameFunction(p4)
		SetProductEditErrorFunction(nil)
	end, {})
	local UseResult10 = ReactModule.useCallback(function(p4)
		-- upvalues: SetEditDescriptionFunction (copy), SetProductEditErrorFunction (copy)
		SetEditDescriptionFunction(p4)
		SetProductEditErrorFunction(nil)
	end, {})
	local UseResult11 = ReactModule.useCallback(function(p4)
		-- upvalues: SetEditPriceFunction (copy), SetProductEditErrorFunction (copy)
		SetEditPriceFunction(p4)
		SetProductEditErrorFunction(nil)
	end, {})
	local UseResult12 = ReactModule.useCallback(function()
		-- upvalues: IsProductEditPending (copy), UseRefResult1 (copy), ApplyProductOverridesResult (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), SetProductEditErrorFunction (copy), UseStateResult2 (copy)
		if IsProductEditPending or UseRefResult1.current ~= nil then return end
		local Config = if ApplyProductOverridesResult == nil then nil else { productId = ApplyProductOverridesResult.id }
		
		if Config == nil then
			SendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_EDIT_CANCEL_CLICK", UseMemoResult, Config)
		end
		SetProductEditErrorFunction(nil)
		UseStateResult2("detail")
	end, {
		IsProductEditPending,
		ApplyProductOverridesResult,
		UseMemoResult
	})
	local UseResult13 = ReactModule.useCallback(function()
		-- upvalues: ApplyProductOverridesResult (copy), resolveProductEditSubmit (upval), p3 (copy), FFlagBuildExperienceMonetizationProductEditingModule (upval), UseRefResult (copy), UseMemoResult1 (copy), UseRefResult1 (copy), FFlagBuildExperienceMonetizationManageKindsModule (upval), GetProductKindCapabilitiesModule (upval), NoFFlagBuildExperienceMonetizationMultiKindModule (copy), IsProductEditPending (copy), UseMemoResult (copy), SendBuildExperienceEventModule (upval), EditName (copy), validateProductEdit (upval), EditDescription (copy), EditPrice (copy), UseMonetizationLocalizationResult (copy), SetProductEditErrorFunction (copy), SetIsProductEditPendingFunction (copy), applyProductEditResult (upval), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback1 (ref), UseStateResult2_1 (copy), UseStateResult2_3 (copy), SetProductSaleStatusErrorFunction (copy), SelectedProductIdRef (copy), UseStateResult2 (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), FormatErrorModule (upval)
		local ResolveProductEditSubmitResult = if ApplyProductOverridesResult == nil then nil else resolveProductEditSubmit(p3, ApplyProductOverridesResult)
		
		if not FFlagBuildExperienceMonetizationProductEditingModule or UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= nil or ApplyProductOverridesResult == nil or ((ApplyProductOverridesResult == nil or not (if ApplyProductOverridesResult.productKind == nil then ApplyProductOverridesResult.canManage ~= false else ApplyProductOverridesResult.productKind == "DeveloperProduct" and ApplyProductOverridesResult.canManage ~= false)) and (not FFlagBuildExperienceMonetizationProductEditingModule or (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil) == nil) or not NoFFlagBuildExperienceMonetizationMultiKindModule or ResolveProductEditSubmitResult == nil or IsProductEditPending) then return end
		local Tbl = { productId = ApplyProductOverridesResult.id }
		
		if FFlagBuildExperienceMonetizationProductEditingModule and (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil) ~= nil and ApplyProductOverridesResult.productKind ~= nil then
			Tbl.productKind = ApplyProductOverridesResult.productKind
		end
		if Tbl == nil then
			SendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_EDIT_SAVE_CLICK", UseMemoResult, Tbl)
		end
		local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil
		local NoProductKindCapabilitiesModule = ProductKindCapabilitiesModule == nil or ProductKindCapabilitiesModule.editableName
		local Match = if NoProductKindCapabilitiesModule then string.match(EditName, "^%s*(.-)%s*$") or "" else nil
		local ValidateProductEditResult, ValidateProductEditResult2 = validateProductEdit(ApplyProductOverridesResult, Match, EditDescription, EditPrice, UseMonetizationLocalizationResult)
		
		if ValidateProductEditResult == nil then
			local Current = {}
			UseRefResult1.current = Current
			SetProductEditErrorFunction(nil)
			SetIsProductEditPendingFunction(true)
			ResolveProductEditSubmitResult({
				name = Match,
				description = EditDescription,
				priceInRobux = ValidateProductEditResult2
			}):andThen(function(Result)
				-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), Tbl (copy), UseMemoResult (upval), SendBuildExperienceEventModule (upval), applyProductEditResult (upval), ApplyProductOverridesResult (copy), Match (copy), EditDescription (upval), ValidateProductEditResult2 (copy), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback1 (upval), UseStateResult2_1 (upval), UseStateResult2_3 (upval), SetProductSaleStatusErrorFunction (upval), SetProductEditErrorFunction (upval), UseMonetizationLocalizationResult (upval), SelectedProductIdRef (upval), UseStateResult2 (upval)
				if UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= Current then return end
				local Copy = table.clone(Tbl)
				Copy.action = "product_details"
				
				if Copy == nil then
					SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", UseMemoResult)
				else
					SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_SUCCESS", UseMemoResult, Copy)
				end
				local ApplyProductEditResultResult, ApplyProductEditResultResult2 = applyProductEditResult(ApplyProductOverridesResult, Result, Match, EditDescription, ValidateProductEditResult2)
				
				if FFlagBuildExperienceMonetizationMultiKindModule then
					local v7 = "details"
					Callback1(function(Tbl)
						-- upvalues: ApplyProductEditResultResult (copy), v7 (copy)
						local Identity = ApplyProductEditResultResult.identity or ApplyProductEditResultResult.id
						local Copy = table.clone(Tbl[Identity] or {})
						Copy[v7] = ApplyProductEditResultResult
						local Copy1 = table.clone(Tbl)
						Copy1[Identity] = Copy
						
						return Copy1
					end)
				else
					UseStateResult2_1(ApplyProductEditResultResult)
				end
				UseStateResult2_3(false)
				SetProductSaleStatusErrorFunction(false)
				
				if ApplyProductEditResultResult2 then
					SetProductEditErrorFunction(UseMonetizationLocalizationResult.moderationError)
					
					return
				end
				if not FFlagBuildExperienceMonetizationMultiKindModule or SelectedProductIdRef.current == (ApplyProductOverridesResult.identity or ApplyProductOverridesResult.id) then
					UseStateResult2("detail")
				end
			end):catch(function(Err)
				-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), ApplyProductOverridesResult (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), FormatErrorModule (upval), Tbl (copy), UseMemoResult (upval), SendBuildExperienceEventModule (upval), SetProductEditErrorFunction (upval), UseMonetizationLocalizationResult (upval)
				if UseRefResult.current ~= UseMemoResult1 or UseRefResult1.current ~= Current then return end
				if FFlagBuildExperienceMonetizationNativeUIModule then
					warn(`[{ApplyProductOverridesResult.productKind or "DeveloperProduct"}] action=product_details productId={ApplyProductOverridesResult.id} failed={string.sub(string.gsub(FormatErrorModule(Err), "[\r\n]+", " "), 1, 200)}`)
				end
				local Copy = table.clone(Tbl)
				Copy.action = "product_details"
				
				if Copy == nil then
					SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", UseMemoResult)
				else
					SendBuildExperienceEventModule("MONETIZATION_PRODUCT_UPDATE_FAILURE", UseMemoResult, Copy)
				end
				SetProductEditErrorFunction(UseMonetizationLocalizationResult.updateError)
			end):finally(function()
				-- upvalues: UseRefResult (upval), UseMemoResult1 (upval), UseRefResult1 (upval), Current (copy), SetIsProductEditPendingFunction (upval)
				if UseRefResult.current == UseMemoResult1 and UseRefResult1.current == Current then
					UseRefResult1.current = nil
					SetIsProductEditPendingFunction(false)
				end
			end)
			
			return
		else
			SetProductEditErrorFunction(ValidateProductEditResult)
		end
	end, {
		NoFFlagBuildExperienceMonetizationMultiKindModule, EditDescription, EditName,
		EditPrice, IsProductEditPending,
		UseMonetizationLocalizationResult.descriptionLengthError,
		UseMonetizationLocalizationResult.moderationError,
		UseMonetizationLocalizationResult.nameLengthError,
		UseMonetizationLocalizationResult.nameRequiredError,
		UseMonetizationLocalizationResult.priceError,
		UseMonetizationLocalizationResult.updateError, p3.onUpdateProduct,
		OnUpdateProductKind, ApplyProductOverridesResult,
		SetIsProductEditPendingFunction, SetProductEditErrorFunction,
		SetProductSaleStatusErrorFunction, UseMemoResult, UseMemoResult1
	})
	local OnComposerActivated = p3.onComposerActivated or p3.onClose
	local IsCanEditOnBuild = p3.canEditOnBuild ~= false
	local IsPermissionCanMonetize: boolean = if FFlagBuildCheckGamePermissionsModule and p3.permissionLoadStatus ~= nil then p3.permissionLoadStatus == "Ready" and p3.permissionCanMonetize == true else NoFFlagBuildExperienceMonetizationMultiKindModule
	local ChatActions = nil
	local v7 = nil
	
	if FFlagBuildExperienceDeveloperProductContextModule then
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
		local UseRefResult2 = ReactModule.useRef(nil)
		v7 = UseOnScreenKeyboardHeightModule()
		ReactModule.useEffect(function()
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2("")
		end, {
			p3.universeId or 0,
			p3.sessionId or "",
			if ApplyProductOverridesResult == nil then "" else ApplyProductOverridesResult.id,
			UseBindingResult2
		})
		local UseResult14 = ReactModule.useCallback(function(): boolean
			-- upvalues: UseBindingResult (copy), UseStateResult (copy), ApplyProductOverridesResult (copy), p3 (copy), GetBuildPromptDraftStoreModule (upval), Creator (upval), UseBindingResult2 (copy), UseRefResult2 (copy), OnComposerActivated (copy)
			local Match: string = string.match(UseBindingResult:getValue(), "^%s*(.-)%s*$") or ""
			
			if Match == "" or UseStateResult ~= "detail" or ApplyProductOverridesResult == nil or p3.universeId == nil then
				return false
			end
			GetBuildPromptDraftStoreModule().queueDraft({
				autoSend = true,
				universeId = p3.universeId,
				sessionId = p3.sessionId,
				text = Match,
				resourceAttachments = {
					{
						type = "resource_link",
						mimeType = "application/json",
						name = ApplyProductOverridesResult.name,
						uri = Creator({
							universeId = p3.universeId,
							productId = ApplyProductOverridesResult.id
						})
					}
				}
			})
			UseBindingResult2("")
			
			if UseRefResult2.current ~= nil then
				UseRefResult2.current.releaseFocus()
			end
			OnComposerActivated()
			
			return true
		end, {
			UseBindingResult, OnComposerActivated, UseStateResult, p3.sessionId,
			p3.universeId, ApplyProductOverridesResult, UseBindingResult2
		})
		ChatActions = if UseStateResult == "detail" and ApplyProductOverridesResult ~= nil and (ApplyProductOverridesResult ~= nil and (if ApplyProductOverridesResult.productKind == nil then ApplyProductOverridesResult.canManage ~= false else ApplyProductOverridesResult.productKind == "DeveloperProduct" and ApplyProductOverridesResult.canManage ~= false) and p3.universeId ~= nil) then {
			isAssistantResponding = false,
			canSendWhileResponding = false,
			allowImageAttachments = false,
			tracksExternalText = true,
			composerText = UseBindingResult,
			onComposerChanged = UseBindingResult2,
			placeholder = UseMonetizationLocalizationResult.composerPlaceholder,
			textBoxRef = UseRefResult2,
			onSend = UseResult14,
			onStop = function() end,
			isReadOnly = not IsCanEditOnBuild
		} else nil
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsPermissionCanMonetize (ref), UseMemoResult (copy), SendBuildExperienceEventModule (upval), p3 (copy), GetBuildPromptDraftStoreModule (upval), UseMonetizationLocalizationResult (copy), OnComposerActivated (copy)
		if not IsPermissionCanMonetize then return end
		SendBuildExperienceEventModule("MONETIZATION_CREATE_CLICK", UseMemoResult)
		
		if p3.onCreateProduct == nil then
			GetBuildPromptDraftStoreModule().queueDraft({
				universeId = p3.universeId,
				sessionId = p3.sessionId,
				text = UseMonetizationLocalizationResult.createProductPrompt
			})
			OnComposerActivated()
			
			return
		else
			p3.onCreateProduct()
		end
	end, {
		OnComposerActivated, UseMonetizationLocalizationResult.createProductPrompt,
		IsPermissionCanMonetize, p3.onCreateProduct, p3.sessionId, p3.universeId,
		UseMemoResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), SendBuildExperienceEventModule (upval), p3 (copy)
		SendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", UseMemoResult)
		
		if p3.onRetryCatalog ~= nil then
			p3.onRetryCatalog()
		end
	end, { p3.onRetryCatalog, UseMemoResult })
	local UseResult2 = if FFlagBuildExperienceMonetizationMultiKindModule then ReactModule.useCallback(function(p4)
		-- upvalues: UseMemoResult (copy), SendBuildExperienceEventModule (upval), p3 (copy)
		local config = { catalogKind = tostring(p4) }
		
		if config == nil then
			SendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", UseMemoResult)
		else
			SendBuildExperienceEventModule("MONETIZATION_RETRY_CLICK", UseMemoResult, config)
		end
		if p3.onRetryCatalogSource ~= nil then
			p3.onRetryCatalogSource(p4)
		end
	end, { p3.onRetryCatalogSource, UseMemoResult }) else nil
	local ProductKindCapabilitiesModule = if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil
	local PriceInRobux = if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.priceInRobux
	local RegionalPricingViewState = getRegionalPricingViewState(p3, ApplyProductOverridesResult, NoFFlagBuildExperienceMonetizationMultiKindModule, UseStateResult4, UseMonetizationLocalizationResult)
	local KindEditState = getKindEditState(ApplyProductOverridesResult, NoFFlagBuildExperienceMonetizationMultiKindModule, p3)
	local config2 = {
		mode = UseStateResult,
		keyboardHeight = if FFlagBuildExperienceDeveloperProductContextModule then if UseStateResult == "detail" then v7 else 0 else nil,
		chatActions = ChatActions,
		products = Products,
		catalogSources = p3.catalogSources,
		showOptions = FFlagBuildExperienceMonetizationNativeUIModule and p3.showOptions == true,
		optionsLoadStatus = UseOptionsStateResult.loadStatus,
		canMonetize = UseOptionsStateResult.canMonetize,
		canCreateProduct = IsPermissionCanMonetize,
		canChangeManagedPricing = UseOptionsStateResult.canChangeManagedPricing,
		managedPricingState = UseOptionsStateResult.managedPricingState,
		managedPricingSupportingText = UseOptionsStateResult.managedPricingSupportingText,
		shopButtonEnabled = UseOptionsStateResult.shopButtonEnabled,
		isOptionsManagedPricingPending = UseOptionsStateResult.isManagedPricingPending,
		isShopButtonPending = UseOptionsStateResult.isShopButtonPending,
		managedPricingError = UseOptionsStateResult.managedPricingError,
		shopButtonError = UseOptionsStateResult.shopButtonError,
		showManagedPricingAcknowledgement = UseOptionsStateResult.showAcknowledgement,
		disableDialogPortal = p3.disableDialogPortal,
		selectedProduct = ApplyProductOverridesResult
	}
	local IsIsArchived = true
	
	if p3.isProductDisabled ~= true then
		local IsCanManage: boolean = ApplyProductOverridesResult ~= nil and (if ApplyProductOverridesResult.productKind == nil then ApplyProductOverridesResult.canManage ~= false else ApplyProductOverridesResult.productKind == "DeveloperProduct" and ApplyProductOverridesResult.canManage ~= false)
		IsIsArchived = if IsCanManage then ApplyProductOverridesResult ~= nil and (ApplyProductOverridesResult.isArchived == true or (ApplyProductOverridesResult.isImmutable == true or ApplyProductOverridesResult.isInActivePriceOptimizationExperiment == true)) else (if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil) ~= nil and (ApplyProductOverridesResult ~= nil and (ApplyProductOverridesResult.isArchived == true or (ApplyProductOverridesResult.isImmutable == true or ApplyProductOverridesResult.isInActivePriceOptimizationExperiment == true)))
	end
	config2.isProductDisabled = IsIsArchived
	config2.isProductManagedPricingPending = UseStateResult3
	config2.isProductSaleStatusPending = IsProductSaleStatusPending
	config2.isProductEditPending = IsProductEditPending
	config2.canUpdateProductManagedPricing = RegionalPricingViewState.canUpdate
	config2.canManageProduct = FFlagBuildExperienceMonetizationProductEditingModule and (ApplyProductOverridesResult ~= nil and ((if ApplyProductOverridesResult.productKind == nil then ApplyProductOverridesResult.canManage ~= false else ApplyProductOverridesResult.productKind == "DeveloperProduct" and ApplyProductOverridesResult.canManage ~= false) and (NoFFlagBuildExperienceMonetizationMultiKindModule and (p3.onUpdateProductSaleStatus ~= nil and p3.onUpdateProduct ~= nil))))
	config2.canChangeKindManagedPricing = RegionalPricingViewState.canChangeKind
	config2.canEditKindProduct = KindEditState.canEdit
	config2.canEditName = KindEditState.canEditName
	config2.canEditPrice = KindEditState.canEditPrice
	config2.canChangeSaleStatus = if FFlagBuildExperienceMonetizationManageKindsModule then NoFFlagBuildExperienceMonetizationMultiKindModule and ((if FFlagBuildExperienceMonetizationManageKindsModule then GetProductKindCapabilitiesModule(if ApplyProductOverridesResult == nil then nil else ApplyProductOverridesResult.productKind) else nil) ~= nil and p3.onUpdateProductKindSaleStatus ~= nil) else nil
	config2.productManagedPricingError = UseStateResult4
	config2.productManagedPricingErrorLabel = RegionalPricingViewState.errorLabel
	config2.productSaleStatusError = ProductSaleStatusError ~= false
	config2.productSaleStatusErrorLabel = if FFlagBuildExperienceMonetizationManageKindsModule and (ProductSaleStatusError and ProductKindCapabilitiesModule ~= nil) then if ProductKindCapabilitiesModule.priceRequiredForSale and PriceInRobux == nil then UseMonetizationLocalizationResult.kindPriceRequiredForSale else UseMonetizationLocalizationResult.updateError else nil
	config2.productEditError = ProductEditError
	config2.editName = EditName
	config2.editDescription = EditDescription
	config2.editPrice = EditPrice
	config2.catalogStatus = p3.catalogStatus or "Ready"
	config2.emptyTitle = UseMonetizationLocalizationResult.emptyTitle
	config2.emptyDescription = UseMonetizationLocalizationResult.emptyDescription
	config2.onClose = UseResult3
	config2.onOpenCreate = UseResult
	config2.onOpenOptions = UseResult5
	config2.onManagedPricingChanged = UseOptionsStateResult.onManagedPricingChanged
	config2.onShopButtonChanged = UseOptionsStateResult.onShopButtonChanged
	config2.onConfirmManagedPricing = UseOptionsStateResult.onConfirmManagedPricing
	config2.onCancelManagedPricing = UseOptionsStateResult.onCancelManagedPricing
	config2.onRetryOptions = UseOptionsStateResult.onRetry
	config2.onProductActivated = UseResult4
	config2.onProductManagedPricingChanged = UseResult6
	config2.onProductSaleStatusChanged = UseResult7
	config2.onOpenProductEdit = UseResult8
	config2.onEditNameChanged = UseResult9
	config2.onEditDescriptionChanged = UseResult10
	config2.onEditPriceChanged = UseResult11
	config2.onCancelProductEdit = UseResult12
	config2.onSaveProductEdit = UseResult13
	config2.onRetryCatalog = UseResult1
	config2.onRetryCatalogSource = UseResult2
	config2.labels = {
		title = UseMonetizationLocalizationResult.title,
		options = UseOptionsStateResult.labels.options,
		pricingOptions = UseOptionsStateResult.labels.pricingOptions,
		pricingOptionsDescription = UseOptionsStateResult.labels.pricingOptionsDescription,
		managedPricing = UseOptionsStateResult.labels.managedPricing,
		managedPricingDescription = UseOptionsStateResult.labels.managedPricingDescription,
		shopUI = UseOptionsStateResult.labels.shopUI,
		shopButton = UseOptionsStateResult.labels.shopButton,
		shopButtonDescription = UseOptionsStateResult.labels.shopButtonDescription,
		optionsLoadError = UseOptionsStateResult.labels.optionsLoadError,
		permissionDenied = UseOptionsStateResult.labels.permissionDenied,
		mixed = UseOptionsStateResult.labels.mixed,
		unavailable = UseOptionsStateResult.labels.unavailable,
		noEligibleProducts = UseOptionsStateResult.labels.noEligibleProducts,
		optionsUpdateError = UseOptionsStateResult.labels.optionsUpdateError,
		partialUpdateError = UseOptionsStateResult.labels.partialUpdateError,
		acknowledgementTitle = UseOptionsStateResult.labels.acknowledgementTitle,
		acknowledgementDescription = UseOptionsStateResult.labels.acknowledgementDescription,
		agree = UseOptionsStateResult.labels.agree,
		emptyCreateProduct = UseMonetizationLocalizationResult.emptyCreateProduct,
		pricing = UseMonetizationLocalizationResult.pricing,
		regionalPricing = UseMonetizationLocalizationResult.regionalPricing,
		loading = UseMonetizationLocalizationResult.loading,
		loadErrorTitle = UseMonetizationLocalizationResult.loadErrorTitle,
		loadErrorDescription = UseMonetizationLocalizationResult.loadErrorDescription,
		retry = UseMonetizationLocalizationResult.retry,
		updateError = UseMonetizationLocalizationResult.updateError,
		availableForPurchase = UseMonetizationLocalizationResult.availableForPurchase,
		edit = UseMonetizationLocalizationResult.edit,
		editProduct = UseMonetizationLocalizationResult.editProduct,
		name = UseMonetizationLocalizationResult.name,
		description = UseMonetizationLocalizationResult.description,
		price = UseMonetizationLocalizationResult.price,
		priceError = UseMonetizationLocalizationResult.priceError,
		priceRequiredForSale = UseMonetizationLocalizationResult.priceRequiredForSale,
		cancel = UseMonetizationLocalizationResult.cancel,
		save = UseMonetizationLocalizationResult.save
	}
	
	return config2
end