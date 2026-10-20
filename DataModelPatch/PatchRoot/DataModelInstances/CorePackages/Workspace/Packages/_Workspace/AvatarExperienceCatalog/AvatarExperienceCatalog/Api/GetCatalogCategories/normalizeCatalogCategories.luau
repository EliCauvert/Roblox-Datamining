local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Normalize = require(Parent.AvatarExperienceCommon).Utils.normalize
local NormalizeBooleanFunction = Normalize.normalizeBoolean
local NormalizeStringFunction = Normalize.normalizeString
local NormalizeNumberFunction = Normalize.normalizeNumber
local NormalizeNotEmptyStringFunction = Normalize.normalizeNotEmptyString
local HttpService = game:GetService("HttpService")
local _ = require(AvatarExperienceCatalog.Models.CatalogCategories)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesSDUITaxonomy = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUITaxonomy
local FFlagAXCatalogCategoriesSDUIPillTitleNormalization = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUIPillTitleNormalization

local function _()
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID(true)
end

local function extractShowCatalogContentActionRequestParams(p1)
	local RequestParams = nil
	
	if p1.props and p1.props.OnActivated then
		for _, value in p1.props.OnActivated do
			if value.componentType == "ShowCatalogContentAction" then
				RequestParams = value.props and value.props.requestParams
				
				return RequestParams
			end
		end
	end
	return RequestParams
end

local function extractWidgetContext(p2)
	local Context = nil
	
	if p2.props and p2.props.OnActivated then
		for _, value in p2.props.OnActivated do
			if value.componentType == "ShowWidgetContentAction" then
				Context = value.props and (value.props.requestParams and value.props.requestParams.context)
				
				return Context
			end
		end
	end
	return Context
end

local _ = function(p3)
	if type(p3) == "boolean" then
		return p3, nil
	elseif type(p3) ~= "string" then
		return nil, "Expected boolean or string"
	elseif p3 == "True" then
		return true, nil
	elseif p3 == "False" then
		return false, nil
	else
		return nil, "Invalid boolean string value, expected \"True\" or \"False\""
	end
end

local function splitCommaSeparatedString(Text: string)
	if not Text or Text == "" then
		return nil
	end
	local List = {}
	
	for _, value in string.split(Text, ",") do
		if value ~= "" then
			table.insert(List, value)
		end
	end
	return #List > 0 and List or nil
end

local _ = function(p3)
	-- upvalues: extractShowCatalogContentActionRequestParams (copy), NormalizeStringFunction (copy), splitCommaSeparatedString (copy)
	local ExtractShowCatalogContentActionRequestParamsResult = extractShowCatalogContentActionRequestParams(p3)
	local AssetTypeIds = ExtractShowCatalogContentActionRequestParamsResult and ExtractShowCatalogContentActionRequestParamsResult.assetTypeIds
	
	if AssetTypeIds == nil or AssetTypeIds == "" then
		return nil, nil
	end
	local NormalizeStringResult, NormalizeStringResult2 = NormalizeStringFunction(AssetTypeIds)
	
	if NormalizeStringResult2 then
		return nil, NormalizeStringResult2
	else
		return splitCommaSeparatedString(NormalizeStringResult), nil
	end
end

local _ = function(p3)
	-- upvalues: extractShowCatalogContentActionRequestParams (copy), NormalizeStringFunction (copy), splitCommaSeparatedString (copy)
	local ExtractShowCatalogContentActionRequestParamsResult = extractShowCatalogContentActionRequestParams(p3)
	local BundleTypeIds = ExtractShowCatalogContentActionRequestParamsResult and ExtractShowCatalogContentActionRequestParamsResult.bundleTypeIds
	
	if BundleTypeIds == nil or BundleTypeIds == "" then
		return nil, nil
	end
	local NormalizeStringResult, NormalizeStringResult2 = NormalizeStringFunction(BundleTypeIds)
	
	if NormalizeStringResult2 then
		return nil, NormalizeStringResult2
	else
		return splitCommaSeparatedString(NormalizeStringResult), nil
	end
end

local _ = function(p3)
	-- upvalues: extractShowCatalogContentActionRequestParams (copy), NormalizeNotEmptyStringFunction (copy)
	local ExtractShowCatalogContentActionRequestParamsResult = extractShowCatalogContentActionRequestParams(p3)
	local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(ExtractShowCatalogContentActionRequestParamsResult and ExtractShowCatalogContentActionRequestParamsResult.taxonomyId)
	
	return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
end

local _ = function(p3)
	-- upvalues: extractWidgetContext (copy)
	return extractWidgetContext(p3), nil
end

local _ = function()
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID(true), nil
end

local _ = function(p3)
	-- upvalues: FFlagAXCatalogCategoriesSDUIPillTitleNormalization (copy), NormalizeNotEmptyStringFunction (copy), NormalizeStringFunction (copy)
	local PillTitle = p3.props and p3.props.pillTitle
	
	if FFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(PillTitle)
		
		return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
	else
		local NormalizeStringResult, NormalizeStringResult2 = NormalizeStringFunction(PillTitle)
		
		return NormalizeStringResult, NormalizeStringResult2
	end
end

local _ = function(p3)
	-- upvalues: FFlagAXCatalogCategoriesSDUIPillTitleNormalization (copy), NormalizeNotEmptyStringFunction (copy), NormalizeStringFunction (copy)
	local PillId = p3.props and p3.props.pillId
	
	if FFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(PillId)
		
		return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
	else
		local NormalizeStringResult, NormalizeStringResult2 = NormalizeStringFunction(PillId)
		
		return NormalizeStringResult, NormalizeStringResult2
	end
end

local _ = function(p3)
	-- upvalues: NormalizeNumberFunction (copy)
	local TimeToRefresh = p3.props and p3.props.timeToRefresh
	
	if TimeToRefresh == nil or TimeToRefresh == "" then
		return nil, nil
	end
	if type(TimeToRefresh) == "string" then
		TimeToRefresh = tonumber(TimeToRefresh)
	end
	if TimeToRefresh == nil then
		return nil, nil
	else
		local NormalizeNumberResult, NormalizeNumberResult2 = NormalizeNumberFunction(TimeToRefresh)
		
		return NormalizeNumberResult, NormalizeNumberResult2
	end
end

local _ = function(p3)
	-- upvalues: NormalizeNotEmptyStringFunction (copy)
	local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(p3.props and p3.props.cameraFocus)
	
	return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
end

local _ = function(p3)
	-- upvalues: NormalizeNumberFunction (copy)
	local CameraZoomRadius = p3.props and p3.props.cameraZoomRadius
	
	if CameraZoomRadius == nil or CameraZoomRadius == "" then
		return nil, nil
	end
	if type(CameraZoomRadius) == "string" then
		CameraZoomRadius = tonumber(CameraZoomRadius)
	end
	if CameraZoomRadius == nil then
		return nil, nil
	else
		local NormalizeNumberResult, NormalizeNumberResult2 = NormalizeNumberFunction(CameraZoomRadius)
		
		return NormalizeNumberResult, NormalizeNumberResult2
	end
end

local _ = function(p3)
	-- upvalues: NormalizeBooleanFunction (copy)
	local CanAnimateCameraBasedMood = p3.props and p3.props.canAnimateCameraBasedMood
	
	if CanAnimateCameraBasedMood == nil or CanAnimateCameraBasedMood == "" then
		return nil, nil
	end
	local Flag = nil
	local v1 = nil
	if type(CanAnimateCameraBasedMood) == "boolean" then
		Flag = CanAnimateCameraBasedMood
		v1 = nil
	elseif type(CanAnimateCameraBasedMood) == "string" then
		if CanAnimateCameraBasedMood == "True" then
			Flag = true
			v1 = nil
		elseif CanAnimateCameraBasedMood == "False" then
			Flag = false
			v1 = nil
		else
			Flag = nil
			v1 = "Invalid boolean string value, expected \"True\" or \"False\""
		end
	else
		Flag = nil
		v1 = "Expected boolean or string"
	end
	if v1 then
		return nil, v1
	else
		local NormalizeBooleanResult, NormalizeBooleanResult2 = NormalizeBooleanFunction(Flag)
		
		return NormalizeBooleanResult, NormalizeBooleanResult2
	end
end

local _ = function(p3)
	-- upvalues: NormalizeBooleanFunction (copy)
	local DisableFilters = p3.props and p3.props.disableFilters
	
	if DisableFilters == nil or DisableFilters == "" then
		return nil, nil
	end
	local Flag = nil
	local v1 = nil
	if type(DisableFilters) == "boolean" then
		Flag = DisableFilters
		v1 = nil
	elseif type(DisableFilters) == "string" then
		if DisableFilters == "True" then
			Flag = true
			v1 = nil
		elseif DisableFilters == "False" then
			Flag = false
			v1 = nil
		else
			Flag = nil
			v1 = "Invalid boolean string value, expected \"True\" or \"False\""
		end
	else
		Flag = nil
		v1 = "Expected boolean or string"
	end
	if v1 then
		return nil, v1
	else
		local NormalizeBooleanResult, NormalizeBooleanResult2 = NormalizeBooleanFunction(Flag)
		
		return NormalizeBooleanResult, NormalizeBooleanResult2
	end
end

local _ = function(p3)
	-- upvalues: NormalizeNotEmptyStringFunction (copy)
	local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(p3.props and p3.props.pageType)
	
	return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
end

local _ = function(p3)
	-- upvalues: extractShowCatalogContentActionRequestParams (copy), NormalizeStringFunction (copy)
	local ExtractShowCatalogContentActionRequestParamsResult = extractShowCatalogContentActionRequestParams(p3)
	local Context = ExtractShowCatalogContentActionRequestParamsResult and ExtractShowCatalogContentActionRequestParamsResult.context
	
	if Context == nil or Context == "" then
		return nil, nil
	else
		local NormalizeStringResult, NormalizeStringResult2 = NormalizeStringFunction(Context)
		
		return NormalizeStringResult, NormalizeStringResult2
	end
end

local _ = function(p3)
	-- upvalues: NormalizeNotEmptyStringFunction (copy)
	local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(p3.props and p3.props.tooltipKey)
	
	return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
end

local _ = function(p3)
	-- upvalues: NormalizeNotEmptyStringFunction (copy)
	local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(p3.props and p3.props.tooltipBody)
	
	return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
end

local _ = function(p3)
	-- upvalues: NormalizeNotEmptyStringFunction (copy)
	local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(p3.props and p3.props.tileType)
	
	return NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2
end

local Callback = nil
local v1 = nil

v1 = function(p3)
	-- upvalues: Callback (ref)
	if not p3.props or not p3.props.Configs or type(p3.props.Configs) ~= "table" then
		return nil, nil
	end
	local List = {}
	local List1 = {}
	
	for _, config in p3.props.Configs do
		local CallbackResult, CallbackResult2 = Callback(config)
		
		if CallbackResult2 then
			table.insert(List1, CallbackResult2)
		end
		if CallbackResult and not CallbackResult2 then
			table.insert(List, CallbackResult)
		end
	end
	return List, if next(List1) then table.concat(List1, " ") else nil
end

local function normalizeCategoryOrSubcategory(p4, p5)
	-- upvalues: FFlagAXCatalogCategoriesSDUIPillTitleNormalization (copy), NormalizeNotEmptyStringFunction (copy), NormalizeStringFunction (copy), HttpService (copy), extractShowCatalogContentActionRequestParams (copy), splitCommaSeparatedString (copy), FFlagAXCatalogCategoriesSDUITaxonomy (copy), extractWidgetContext (copy), NormalizeNumberFunction (copy), v1 (ref), NormalizeBooleanFunction (copy)
	if type(p4) ~= "table" then
		return nil, "Config must be a table"
	end
	local List = {}
	local PillId = p4.props and p4.props.pillId
	local NormalizeNotEmptyStringResult = nil
	local NormalizeNotEmptyStringResult2 = nil
	
	if FFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(PillId)
	else
		NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeStringFunction(PillId)
	end
	local Id = NormalizeNotEmptyStringResult
	local NormalizeNotEmptyStringResult1 = NormalizeNotEmptyStringResult2
	
	if NormalizeNotEmptyStringResult1 then
		table.insert(List, "Id: " .. NormalizeNotEmptyStringResult1)
	end
	local PillTitle = p4.props and p4.props.pillTitle
	local NormalizeNotEmptyStringResult3 = nil
	local NormalizeNotEmptyStringResult2_1 = nil
	
	if FFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		NormalizeNotEmptyStringResult3, NormalizeNotEmptyStringResult2_1 = NormalizeNotEmptyStringFunction(PillTitle)
	else
		NormalizeNotEmptyStringResult3, NormalizeNotEmptyStringResult2_1 = NormalizeStringFunction(PillTitle)
	end
	local Name = NormalizeNotEmptyStringResult3
	local NormalizeNotEmptyStringResult4 = NormalizeNotEmptyStringResult2_1
	
	if NormalizeNotEmptyStringResult4 then
		table.insert(List, "Name: " .. NormalizeNotEmptyStringResult4)
	end
	local PillTitle1 = p4.props and p4.props.pillTitle
	local NormalizeNotEmptyStringResult5 = nil
	local NormalizeNotEmptyStringResult2_2 = nil
	
	if FFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		NormalizeNotEmptyStringResult5, NormalizeNotEmptyStringResult2_2 = NormalizeNotEmptyStringFunction(PillTitle1)
	else
		NormalizeNotEmptyStringResult5, NormalizeNotEmptyStringResult2_2 = NormalizeStringFunction(PillTitle1)
	end
	local LocalizedTitle = NormalizeNotEmptyStringResult5
	local NormalizeNotEmptyStringResult6 = NormalizeNotEmptyStringResult2_2
	
	if NormalizeNotEmptyStringResult6 then
		table.insert(List, "LocalizedTitle: " .. NormalizeNotEmptyStringResult6)
	end
	local PillTitle2 = p4.props and p4.props.pillTitle
	local NormalizeNotEmptyStringResult7 = nil
	local NormalizeNotEmptyStringResult2_3 = nil
	
	if FFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		NormalizeNotEmptyStringResult7, NormalizeNotEmptyStringResult2_3 = NormalizeNotEmptyStringFunction(PillTitle2)
	else
		NormalizeNotEmptyStringResult7, NormalizeNotEmptyStringResult2_3 = NormalizeStringFunction(PillTitle2)
	end
	local Title = NormalizeNotEmptyStringResult7
	local NormalizeNotEmptyStringResult8 = NormalizeNotEmptyStringResult2_3
	
	if NormalizeNotEmptyStringResult8 then
		table.insert(List, "Title: " .. NormalizeNotEmptyStringResult8)
	end
	local Guid = HttpService:GenerateGUID(true)
	local v2 = nil
	
	if v2 then
		table.insert(List, "SearchUuid: " .. v2)
	end
	local ExtractShowCatalogContentActionRequestParamsResult = extractShowCatalogContentActionRequestParams(p4)
	local AssetTypeIds = ExtractShowCatalogContentActionRequestParamsResult and ExtractShowCatalogContentActionRequestParamsResult.assetTypeIds
	local v3 = nil
	local AssetTypeIdStrings = nil
	
	if AssetTypeIds == nil or AssetTypeIds == "" then
		AssetTypeIdStrings = nil
		v3 = nil
	else
		local NormalizeStringResult, NormalizeStringResult2 = NormalizeStringFunction(AssetTypeIds)
		
		if NormalizeStringResult2 then
			AssetTypeIdStrings = nil
			v3 = NormalizeStringResult2
		else
			AssetTypeIdStrings = splitCommaSeparatedString(NormalizeStringResult)
			v3 = nil
		end
	end
	if v3 then
		table.insert(List, "AssetTypeIdStrings: " .. v3)
	end
	local ExtractShowCatalogContentActionRequestParamsResult1 = extractShowCatalogContentActionRequestParams(p4)
	local BundleTypeIds = ExtractShowCatalogContentActionRequestParamsResult1 and ExtractShowCatalogContentActionRequestParamsResult1.bundleTypeIds
	local v4 = nil
	local BundleTypes = nil
	
	if BundleTypeIds == nil or BundleTypeIds == "" then
		BundleTypes = nil
		v4 = nil
	else
		local NormalizeStringResult1, NormalizeStringResult2_1 = NormalizeStringFunction(BundleTypeIds)
		
		if NormalizeStringResult2_1 then
			BundleTypes = nil
			v4 = NormalizeStringResult2_1
		else
			BundleTypes = splitCommaSeparatedString(NormalizeStringResult1)
			v4 = nil
		end
	end
	if v4 then
		table.insert(List, "BundleTypes: " .. v4)
	end
	local v5 = nil
	
	if FFlagAXCatalogCategoriesSDUITaxonomy then
		local ExtractShowCatalogContentActionRequestParamsResult2 = extractShowCatalogContentActionRequestParams(p4)
		local NormalizeNotEmptyStringResult2_4
		v5, NormalizeNotEmptyStringResult2_4 = NormalizeNotEmptyStringFunction(ExtractShowCatalogContentActionRequestParamsResult2 and ExtractShowCatalogContentActionRequestParamsResult2.taxonomyId)
		
		if NormalizeNotEmptyStringResult2_4 then
			table.insert(List, "Taxonomy: " .. NormalizeNotEmptyStringResult2_4)
		end
	end
	local ExtractWidgetContextResult = extractWidgetContext(p4)
	local v6 = nil
	
	if v6 then
		table.insert(List, "WidgetContext: " .. v6)
	end
	local TimeToRefresh = p4.props and p4.props.timeToRefresh
	local v7 = nil
	local TimeToRefresh1 = nil
	
	if TimeToRefresh == nil or TimeToRefresh == "" then
		TimeToRefresh1 = nil
		v7 = nil
	else
		if type(TimeToRefresh) == "string" then
			TimeToRefresh = tonumber(TimeToRefresh)
		end
		if TimeToRefresh == nil then
			TimeToRefresh1 = nil
			v7 = nil
		else
			TimeToRefresh1, v136 = NormalizeNumberFunction(TimeToRefresh)
		end
	end
	if v7 then
		table.insert(List, "TimeToRefresh: " .. v7)
	end
	local NormalizeNotEmptyStringResult9, NormalizeNotEmptyStringResult2_5 = NormalizeNotEmptyStringFunction(p4.props and p4.props.cameraFocus)
	
	if NormalizeNotEmptyStringResult2_5 then
		table.insert(List, "CameraFocus: " .. NormalizeNotEmptyStringResult2_5)
	end
	local CameraZoomRadius = p4.props and p4.props.cameraZoomRadius
	local CameraZoomRadius1 = nil
	local v8 = nil
	
	if CameraZoomRadius == nil or CameraZoomRadius == "" then
		CameraZoomRadius1 = nil
		v8 = nil
	else
		if type(CameraZoomRadius) == "string" then
			CameraZoomRadius = tonumber(CameraZoomRadius)
		end
		if CameraZoomRadius == nil then
			CameraZoomRadius1 = nil
			v8 = nil
		else
			CameraZoomRadius1, v141 = NormalizeNumberFunction(CameraZoomRadius)
		end
	end
	if v8 then
		table.insert(List, "CameraZoomRadius: " .. v8)
	end
	local Subcategories = nil
	
	if not p5.isSubcategory then
		local v9
		Subcategories, v143 = v1(p4)
		
		if v9 then
			table.insert(List, "Subcategories: " .. v9)
		end
	end
	local CanAnimateCameraBasedMood = p4.props and p4.props.canAnimateCameraBasedMood
	local CanAnimateCameraBasedMood1 = nil
	local v10 = nil
	
	if CanAnimateCameraBasedMood == nil or CanAnimateCameraBasedMood == "" then
		CanAnimateCameraBasedMood1 = nil
		v10 = nil
	else
		local Flag = nil
		local v11 = nil
		if type(CanAnimateCameraBasedMood) == "boolean" then
			Flag = CanAnimateCameraBasedMood
			v11 = nil
		elseif type(CanAnimateCameraBasedMood) == "string" then
			if CanAnimateCameraBasedMood == "True" then
				Flag = true
				v11 = nil
			elseif CanAnimateCameraBasedMood == "False" then
				Flag = false
				v11 = nil
			else
				Flag = nil
				v11 = "Invalid boolean string value, expected \"True\" or \"False\""
			end
		else
			Flag = nil
			v11 = "Expected boolean or string"
		end
		if v11 then
			CanAnimateCameraBasedMood1 = nil
			v10 = v11
		else
			CanAnimateCameraBasedMood1, v148 = NormalizeBooleanFunction(Flag)
		end
	end
	if v10 then
		table.insert(List, "CanAnimateCameraBasedMood: " .. v10)
	end
	local DisableFilters = p4.props and p4.props.disableFilters
	local v12 = nil
	local DisableFilters1 = nil
	
	if DisableFilters == nil or DisableFilters == "" then
		DisableFilters1 = nil
		v12 = nil
	else
		local Flag1 = nil
		local v13 = nil
		if type(DisableFilters) == "boolean" then
			Flag1 = DisableFilters
			v13 = nil
		elseif type(DisableFilters) == "string" then
			if DisableFilters == "True" then
				Flag1 = true
				v13 = nil
			elseif DisableFilters == "False" then
				Flag1 = false
				v13 = nil
			else
				Flag1 = nil
				v13 = "Invalid boolean string value, expected \"True\" or \"False\""
			end
		else
			Flag1 = nil
			v13 = "Expected boolean or string"
		end
		if v13 then
			DisableFilters1 = nil
			v12 = v13
		else
			DisableFilters1, v155 = NormalizeBooleanFunction(Flag1)
		end
	end
	if v12 then
		table.insert(List, "DisableFilters: " .. v12)
	end
	local NormalizeNotEmptyStringResult11, NormalizeNotEmptyStringResult2_7 = NormalizeNotEmptyStringFunction(p4.props and p4.props.pageType)
	
	if NormalizeNotEmptyStringResult2_7 then
		table.insert(List, "PageType: " .. NormalizeNotEmptyStringResult2_7)
	end
	local ExtractShowCatalogContentActionRequestParamsResult3 = extractShowCatalogContentActionRequestParams(p4)
	local Context = ExtractShowCatalogContentActionRequestParamsResult3 and ExtractShowCatalogContentActionRequestParamsResult3.context
	local v14 = nil
	local LooksWidgetContextForOrganicContent = nil
	
	if Context == nil or Context == "" then
		LooksWidgetContextForOrganicContent = nil
		v14 = nil
	else
		LooksWidgetContextForOrganicContent, v157 = NormalizeStringFunction(Context)
	end
	if v14 then
		table.insert(List, "LooksWidgetContextForOrganicContent: " .. v14)
	end
	local NormalizeNotEmptyStringResult12, NormalizeNotEmptyStringResult2_8 = NormalizeNotEmptyStringFunction(p4.props and p4.props.tooltipKey)
	
	if NormalizeNotEmptyStringResult2_8 then
		table.insert(List, "TooltipKey: " .. NormalizeNotEmptyStringResult2_8)
	end
	local NormalizeNotEmptyStringResult10, NormalizeNotEmptyStringResult2_6 = NormalizeNotEmptyStringFunction(p4.props and p4.props.tooltipBody)
	
	if NormalizeNotEmptyStringResult2_6 then
		table.insert(List, "TooltipBody: " .. NormalizeNotEmptyStringResult2_6)
	end
	local NormalizeNotEmptyStringResult13, NormalizeNotEmptyStringResult2_9 = NormalizeNotEmptyStringFunction(p4.props and p4.props.tileType)
	
	if NormalizeNotEmptyStringResult2_9 then
		table.insert(List, "TileType: " .. NormalizeNotEmptyStringResult2_9)
	end
	if #List > 0 then
		return nil, (if p5.isSubcategory then "Subcategory" else "Category") .. " normalization failed: " .. table.concat(List, "; ")
	end
	local config = {
		Id = Id,
		Name = Name,
		LocalizedTitle = LocalizedTitle,
		Title = Title,
		SearchUuid = Guid,
		AssetTypeIdStrings = AssetTypeIdStrings,
		BundleTypes = BundleTypes,
		TaxonomyUuid = if FFlagAXCatalogCategoriesSDUITaxonomy then v5 else nil,
		WidgetContext = ExtractWidgetContextResult,
		TimeToRefresh = TimeToRefresh1,
		CameraFocus = NormalizeNotEmptyStringResult9,
		CameraZoomRadius = CameraZoomRadius1,
		CanAnimateCameraBasedMood = CanAnimateCameraBasedMood1,
		DisableFilters = DisableFilters1,
		PageType = NormalizeNotEmptyStringResult11,
		LooksWidgetContextForOrganicContent = LooksWidgetContextForOrganicContent,
		TooltipKey = NormalizeNotEmptyStringResult12,
		TooltipBody = NormalizeNotEmptyStringResult10,
		TileType = NormalizeNotEmptyStringResult13
	}
	
	if p5.isSubcategory then
		config.isSubcategory = true
	elseif Subcategories and #Subcategories > 0 then
		config.Subcategories = Subcategories
	end
	return config, nil
end

Callback = function(p4)
	-- upvalues: normalizeCategoryOrSubcategory (copy)
	return normalizeCategoryOrSubcategory(p4, { isSubcategory = true })
end

local v2 = nil

v2 = function(p4)
	-- upvalues: normalizeCategoryOrSubcategory (copy)
	return normalizeCategoryOrSubcategory(p4, { isSubcategory = false })
end

local NormalizeTableFn = Normalize.makeNormalizeTableFn({
	Configs = {
		fn = function(List)
			-- upvalues: v2 (ref)
			if type(List) ~= "table" then
				return {}, "Configs field must be a table"
			end
			local List1 = {}
			local List2 = {}
			
			for _, value in List do
				local v3, v4 = v2(value)
				
				if v4 then
					table.insert(List2, v4)
				end
				if v3 and not v4 then
					table.insert(List1, v3)
				end
			end
			return List1, if next(List2) then table.concat(List2, " ") else nil
		end
	}
})

return function(p4)
	-- upvalues: NormalizeTableFn (copy)
	if p4 and type(p4.Configs) == "table" then
		local NormalizeTableFnResult, NormalizeTableFnResult2 = NormalizeTableFn(p4)
		
		return NormalizeTableFnResult and NormalizeTableFnResult.Configs or {}, NormalizeTableFnResult2
	else
		return {}, "Configs field is required and must be a table"
	end
end