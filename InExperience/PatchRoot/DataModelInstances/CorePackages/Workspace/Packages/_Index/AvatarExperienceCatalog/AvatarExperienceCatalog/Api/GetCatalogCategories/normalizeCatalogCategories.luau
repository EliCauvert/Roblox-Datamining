local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local normalize = require(parent.AvatarExperienceCommon).Utils.normalize
local normalizeBoolean = normalize.normalizeBoolean
local normalizeString = normalize.normalizeString
local normalizeNumber = normalize.normalizeNumber
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local normalizeNotEmptyString = normalize.normalizeNotEmptyString
local httpService = game:GetService("HttpService")
local _ = require(avatarExperienceCatalog.Models.CatalogCategories)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCatalogCategoriesSDUITaxonomy = avatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUITaxonomy
local fFlagAXCatalogCategoriesSDUIPillTitleNormalization = avatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUIPillTitleNormalization

local function _()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(true)
end

local function extractShowCatalogContentActionRequestParams(p1)
	local requestParams = nil
	
	if p1.props and p1.props.OnActivated then
		for i, v in p1.props.OnActivated do
			if v.componentType == "ShowCatalogContentAction" then
				requestParams = v.props and v.props.requestParams
				
				return requestParams
			end
		end
	end
	return requestParams
end

local function extractWidgetContext(p2)
	local context = nil
	
	if p2.props and p2.props.OnActivated then
		for i, v in p2.props.OnActivated do
			if v.componentType == "ShowWidgetContentAction" then
				context = v.props and (v.props.requestParams and v.props.requestParams.context)
				
				return context
			end
		end
	end
	return context
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
	end
	return nil, "Invalid boolean string value, expected \"True\" or \"False\""
end

local function splitCommaSeparatedString(p3)
	if not p3 or p3 == "" then
		return nil
	end
	local t = {}
	
	for i, v in string.split(p3, ",") do
		if v ~= "" then
			table.insert(t, v)
		end
	end
	return if #t > 0 then t else nil
end

local _ = function(value)
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeString (ref), splitCommaSeparatedString (ref)
	local var1 = extractShowCatalogContentActionRequestParams(value)
	local assetTypeIds = var1 and var1.assetTypeIds
	
	if assetTypeIds == nil or assetTypeIds == "" then
		return nil, nil
	end
	local var2, var3 = normalizeString(assetTypeIds)
	
	if var3 then
		return nil, var3
	end
	return splitCommaSeparatedString(var2), nil
end

local _ = function(p4)
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeString (ref), splitCommaSeparatedString (ref)
	local var1 = extractShowCatalogContentActionRequestParams(p4)
	local bundleTypeIds = var1 and var1.bundleTypeIds
	
	if bundleTypeIds == nil or bundleTypeIds == "" then
		return nil, nil
	end
	local var2, var3 = normalizeString(bundleTypeIds)
	
	if var3 then
		return nil, var3
	end
	return splitCommaSeparatedString(var2), nil
end

local _ = function(p4)
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeNotEmptyString (ref)
	local var1 = extractShowCatalogContentActionRequestParams(p4)
	local var2, var3 = normalizeNotEmptyString(var1 and var1.taxonomyId)
	
	return var2, var3
end

local _ = function(p4)
	-- upvalues: extractWidgetContext (ref)
	return extractWidgetContext(p4), nil
end

local _ = function()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(true), nil
end

local _ = function(p4)
	-- upvalues: fFlagAXCatalogCategoriesSDUIPillTitleNormalization (ref), normalizeNotEmptyString (ref), normalizeString (ref)
	local pillTitle = p4.props and p4.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var1, var2 = normalizeNotEmptyString(pillTitle)
		
		return var1, var2
	end
	local var3, var4 = normalizeString(pillTitle)
	
	return var3, var4
end

local _ = function(p4)
	-- upvalues: fFlagAXCatalogCategoriesSDUIPillTitleNormalization (ref), normalizeNotEmptyString (ref), normalizeString (ref)
	local pillId = p4.props and p4.props.pillId
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var1, var2 = normalizeNotEmptyString(pillId)
		
		return var1, var2
	end
	local var3, var4 = normalizeString(pillId)
	
	return var3, var4
end

local _ = function(p4)
	-- upvalues: normalizeNumber (ref)
	local timeToRefresh = p4.props and p4.props.timeToRefresh
	
	if timeToRefresh == nil or timeToRefresh == "" then
		return nil, nil
	elseif type(timeToRefresh) == "string" then
		timeToRefresh = tonumber(timeToRefresh)
	end
	if timeToRefresh == nil then
		return nil, nil
	end
	local var1, var2 = normalizeNumber(timeToRefresh)
	
	return var1, var2
end

local _ = function(p4)
	-- upvalues: normalizeNotEmptyString (ref)
	local var1, var2 = normalizeNotEmptyString(p4.props and p4.props.cameraFocus)
	
	return var1, var2
end

local _ = function(p4)
	-- upvalues: normalizeNumber (ref)
	local cameraZoomRadius = p4.props and p4.props.cameraZoomRadius
	
	if cameraZoomRadius == nil or cameraZoomRadius == "" then
		return nil, nil
	elseif type(cameraZoomRadius) == "string" then
		cameraZoomRadius = tonumber(cameraZoomRadius)
	end
	if cameraZoomRadius == nil then
		return nil, nil
	end
	local var1, var2 = normalizeNumber(cameraZoomRadius)
	
	return var1, var2
end

local _ = function(p4)
	-- upvalues: normalizeBoolean (ref)
	local var1, var2
	local canAnimateCameraBasedMood = p4.props and p4.props.canAnimateCameraBasedMood
	
	if canAnimateCameraBasedMood == nil or canAnimateCameraBasedMood == "" then
		return nil, nil
	elseif type(canAnimateCameraBasedMood) == "boolean" then
		var1 = canAnimateCameraBasedMood
		var2 = nil
	elseif type(canAnimateCameraBasedMood) ~= "string" then
		var1 = nil
		var2 = "Expected boolean or string"
	elseif canAnimateCameraBasedMood == "True" then
		var1 = true
		var2 = nil
	elseif canAnimateCameraBasedMood == "False" then
		var1 = false
		var2 = nil
	else
		var1 = nil
		var2 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var2 then
		return nil, var2
	end
	local var3, var4 = normalizeBoolean(var1)
	
	return var3, var4
end

local _ = function(p4)
	-- upvalues: normalizeBoolean (ref)
	local var1, var2
	local disableFilters = p4.props and p4.props.disableFilters
	
	if disableFilters == nil or disableFilters == "" then
		return nil, nil
	elseif type(disableFilters) == "boolean" then
		var1 = disableFilters
		var2 = nil
	elseif type(disableFilters) ~= "string" then
		var1 = nil
		var2 = "Expected boolean or string"
	elseif disableFilters == "True" then
		var1 = true
		var2 = nil
	elseif disableFilters == "False" then
		var1 = false
		var2 = nil
	else
		var1 = nil
		var2 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var2 then
		return nil, var2
	end
	local var3, var4 = normalizeBoolean(var1)
	
	return var3, var4
end

local _ = function(p4)
	-- upvalues: normalizeNotEmptyString (ref)
	local var1, var2 = normalizeNotEmptyString(p4.props and p4.props.pageType)
	
	return var1, var2
end

local _ = function(p4)
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeString (ref)
	local var1 = extractShowCatalogContentActionRequestParams(p4)
	local context = var1 and var1.context
	
	if context == nil or context == "" then
		return nil, nil
	end
	local var2, var3 = normalizeString(context)
	
	return var2, var3
end

local _ = function(p4)
	-- upvalues: normalizeNotEmptyString (ref)
	local var1, var2 = normalizeNotEmptyString(p4.props and p4.props.tooltipKey)
	
	return var1, var2
end

local _ = function(p4)
	-- upvalues: normalizeNotEmptyString (ref)
	local var1, var2 = normalizeNotEmptyString(p4.props and p4.props.tooltipBody)
	
	return var1, var2
end

local _ = function(p4)
	-- upvalues: normalizeNotEmptyString (ref)
	local var1, var2 = normalizeNotEmptyString(p4.props and p4.props.tileType)
	
	return var1, var2
end

local var1 = nil
local _ = nil

local var2 = function(p4)
	-- upvalues: var1 (write)
	if not p4.props or not p4.props.Configs or type(p4.props.Configs) ~= "table" then
		return nil, nil
	end
	local t = {}
	local t_1 = {}
	
	for i, v in p4.props.Configs do
		local var3, var4 = var1(v)
		
		if var4 then
			table.insert(t_1, var4)
		end
		if var3 and not var4 then
			table.insert(t, var3)
		end
	end
	return t, if next(t_1) then table.concat(t_1, " ") else nil
end

local function normalizeCategoryOrSubcategory(p5, p6)
	-- upvalues: fFlagAXCatalogCategoriesSDUIPillTitleNormalization (ref), normalizeNotEmptyString (ref), normalizeString (ref), httpService (ref), extractShowCatalogContentActionRequestParams (ref), splitCommaSeparatedString (ref), fFlagAXCatalogCategoriesSDUITaxonomy (ref), extractWidgetContext (ref), normalizeNumber (ref), var2 (write), normalizeBoolean (ref)
	if type(p5) ~= "table" then
		return nil, "Config must be a table"
	end
	local var5, var6
	local t = {}
	local pillId = p5.props and p5.props.pillId
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var7, var8 = normalizeNotEmptyString(pillId)
		var5 = var7
		var6 = var8
	else
		local var9, var10 = normalizeString(pillId)
		var5 = var9
		var6 = var10
	end
	if var6 then
		table.insert(t, "Id: " .. var74)
	end
	local var11, var12
	local pillTitle = p5.props and p5.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var13, var14 = normalizeNotEmptyString(pillTitle)
		var11 = var13
		var12 = var14
	else
		local var15, var16 = normalizeString(pillTitle)
		var11 = var15
		var12 = var16
	end
	if var12 then
		table.insert(t, "Name: " .. var81)
	end
	local var17, var18
	local pillTitle_1 = p5.props and p5.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var19, var20 = normalizeNotEmptyString(pillTitle_1)
		var17 = var19
		var18 = var20
	else
		local var21, var22 = normalizeString(pillTitle_1)
		var17 = var21
		var18 = var22
	end
	if var18 then
		table.insert(t, "LocalizedTitle: " .. var88)
	end
	local var23, var24
	local pillTitle_2 = p5.props and p5.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var25, var26 = normalizeNotEmptyString(pillTitle_2)
		var23 = var25
		var24 = var26
	else
		local var27, var28 = normalizeString(pillTitle_2)
		var23 = var27
		var24 = var28
	end
	if var24 then
		table.insert(t, "Title: " .. var95)
	end
	local var29 = httpService:GenerateGUID(true)
	local var30 = nil
	local var31, var32
	local var33 = extractShowCatalogContentActionRequestParams(p5)
	local assetTypeIds = var33 and var33.assetTypeIds
	
	if assetTypeIds == nil or assetTypeIds == "" then
		var31 = nil
		var32 = nil
	else
		local var34, var35 = normalizeString(assetTypeIds)
		
		if var35 then
			var31 = nil
			var32 = var35
		else
			var31 = splitCommaSeparatedString(var34)
			var32 = nil
		end
	end
	if var32 then
		table.insert(t, "AssetTypeIdStrings: " .. var105)
	end
	local var36
	local var37 = extractShowCatalogContentActionRequestParams(p5)
	local bundleTypeIds = var37 and var37.bundleTypeIds
	
	if bundleTypeIds == nil or bundleTypeIds == "" then
		var36 = nil
		assetTypeIds = nil
	else
		local var38, var39 = normalizeString(bundleTypeIds)
		
		if var39 then
			var36 = nil
			assetTypeIds = var39
		else
			var36 = splitCommaSeparatedString(var38)
			assetTypeIds = nil
		end
	end
	if assetTypeIds then
		table.insert(t, "BundleTypes: " .. assetTypeIds)
	end
	local var40 = nil
	bundleTypeIds = nil
	
	if fFlagAXCatalogCategoriesSDUITaxonomy then
		local var41 = extractShowCatalogContentActionRequestParams(p5)
		local var42, var43 = normalizeNotEmptyString(var41 and var41.taxonomyId)
		var40 = var42
		bundleTypeIds = var43
		
		if bundleTypeIds then
			table.insert(t, "Taxonomy: " .. bundleTypeIds)
		end
	end
	local var44 = extractWidgetContext(p5)
	local var45 = nil
	local var46, var47
	local timeToRefresh = p5.props and p5.props.timeToRefresh
	
	if timeToRefresh == nil or timeToRefresh == "" then
		var46 = nil
		var47 = nil
	elseif type(timeToRefresh) == "string" then
		timeToRefresh = tonumber(timeToRefresh)
	end
	if timeToRefresh == nil then
		var46 = nil
		var47 = nil
	else
		local var48, var49 = normalizeNumber(timeToRefresh)
		var46 = var48
		var47 = var49
	end
	if var47 then
		table.insert(t, "TimeToRefresh: " .. var119)
	end
	local var50, var51 = normalizeNotEmptyString(p5.props and p5.props.cameraFocus)
	
	if var51 then
		table.insert(t, "CameraFocus: " .. var123)
	end
	local var52, var53
	local cameraZoomRadius = p5.props and p5.props.cameraZoomRadius
	
	if cameraZoomRadius == nil or cameraZoomRadius == "" then
		var52 = nil
		var53 = nil
	elseif type(cameraZoomRadius) == "string" then
		cameraZoomRadius = tonumber(cameraZoomRadius)
	end
	if cameraZoomRadius == nil then
		var52 = nil
		var53 = nil
	else
		local var54, var55 = normalizeNumber(cameraZoomRadius)
		var52 = var54
		var53 = var55
	end
	if var53 then
		table.insert(t, "CameraZoomRadius: " .. var126)
	end
	cameraZoomRadius = nil
	local _ = nil
	
	if not p6.isSubcategory then
		local var56, var57 = var2(p5)
		cameraZoomRadius = var56
		local var58 = var57
		
		if var58 then
			table.insert(t, "Subcategories: " .. var131)
		end
	end
	local var59, var60, var61, var62
	local canAnimateCameraBasedMood = p5.props and p5.props.canAnimateCameraBasedMood
	
	if canAnimateCameraBasedMood == nil or canAnimateCameraBasedMood == "" then
		var59 = nil
		var60 = nil
	elseif type(canAnimateCameraBasedMood) == "boolean" then
		var61 = canAnimateCameraBasedMood
		var62 = nil
	elseif type(canAnimateCameraBasedMood) ~= "string" then
		var61 = nil
		var62 = "Expected boolean or string"
	elseif canAnimateCameraBasedMood == "True" then
		var61 = true
		var62 = nil
	elseif canAnimateCameraBasedMood == "False" then
		var61 = false
		var62 = nil
	else
		var61 = nil
		var62 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var62 then
		var59 = nil
		var60 = var62
	else
		local var63, var64 = normalizeBoolean(var61)
		var59 = var63
		var60 = var64
	end
	if var60 then
		table.insert(t, "CanAnimateCameraBasedMood: " .. var136)
	end
	local var65, var66, var67
	local disableFilters = p5.props and p5.props.disableFilters
	
	if disableFilters == nil or disableFilters == "" then
		canAnimateCameraBasedMood = nil
		var65 = nil
	elseif type(disableFilters) == "boolean" then
		var66 = disableFilters
		var67 = nil
	elseif type(disableFilters) ~= "string" then
		var66 = nil
		var67 = "Expected boolean or string"
	elseif disableFilters == "True" then
		var66 = true
		var67 = nil
	elseif disableFilters == "False" then
		var66 = false
		var67 = nil
	else
		var66 = nil
		var67 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var67 then
		canAnimateCameraBasedMood = nil
		var65 = var67
	else
		local var68, var69 = normalizeBoolean(var66)
		canAnimateCameraBasedMood = var68
		var65 = var69
	end
	if var65 then
		table.insert(t, "DisableFilters: " .. var142)
	end
	local var70, var71 = normalizeNotEmptyString(p5.props and p5.props.pageType)
	
	if var71 then
		table.insert(t, "PageType: " .. var146)
	end
	local var72, var73
	local var74 = extractShowCatalogContentActionRequestParams(p5)
	local context = var74 and var74.context
	
	if context == nil or context == "" then
		var72 = nil
		var73 = nil
	else
		local var75, var76 = normalizeString(context)
		var72 = var75
		var73 = var76
	end
	if var73 then
		table.insert(t, "LooksWidgetContextForOrganicContent: " .. var152)
	end
	local var77, var78 = normalizeNotEmptyString(p5.props and p5.props.tooltipKey)
	
	if var78 then
		table.insert(t, "TooltipKey: " .. var154)
	end
	local var79, var80 = normalizeNotEmptyString(p5.props and p5.props.tooltipBody)
	
	if var80 then
		table.insert(t, "TooltipBody: " .. var156)
	end
	local var81, var82 = normalizeNotEmptyString(p5.props and p5.props.tileType)
	
	if var82 then
		table.insert(t, "TileType: " .. var158)
	end
	if #t > 0 then
		return nil, (if p6.isSubcategory then "Subcategory" else "Category") .. " normalization failed: " .. table.concat(t, "; ")
	end
	local t_1 = {
		Id = var5,
		Name = var11,
		LocalizedTitle = var17,
		Title = var23,
		SearchUuid = var29,
		AssetTypeIdStrings = var31,
		BundleTypes = var36,
		TaxonomyUuid = if fFlagAXCatalogCategoriesSDUITaxonomy then var40 else nil,
		WidgetContext = var44,
		TimeToRefresh = var46,
		CameraFocus = var50,
		CameraZoomRadius = var52,
		CanAnimateCameraBasedMood = var59,
		DisableFilters = canAnimateCameraBasedMood,
		PageType = var70,
		LooksWidgetContextForOrganicContent = var72,
		TooltipKey = var77,
		TooltipBody = var79,
		TileType = var81
	}
	
	if p6.isSubcategory then
		t_1.isSubcategory = true
	elseif cameraZoomRadius and #cameraZoomRadius > 0 then
		t_1.Subcategories = cameraZoomRadius
	end
	return t_1, nil
end

var1 = function(p5)
	-- upvalues: normalizeCategoryOrSubcategory (ref)
	return normalizeCategoryOrSubcategory(p5, { isSubcategory = true })
end

local _ = nil

local var5 = function(p5)
	-- upvalues: normalizeCategoryOrSubcategory (ref)
	return normalizeCategoryOrSubcategory(p5, { isSubcategory = false })
end

local var6 = makeNormalizeTableFn({
	Configs = {
		fn = function(p5)
			-- upvalues: var5 (write)
			if type(p5) ~= "table" then
				return {}, "Configs field must be a table"
			end
			local t = {}
			local t_1 = {}
			
			for i, v in p5 do
				local var7, var8 = var5(v)
				
				if var8 then
					table.insert(t_1, var8)
				end
				if var7 and not var8 then
					table.insert(t, var7)
				end
			end
			return t, if next(t_1) then table.concat(t_1, " ") else nil
		end
	}
})

return function(p6)
	-- upvalues: var6 (ref)
	if p6 and type(p6.Configs) == "table" then
		local var9, var10 = var6(p6)
		
		return if var9 then var9.Configs else {}, var10
	end
	return {}, "Configs field is required and must be a table"
end