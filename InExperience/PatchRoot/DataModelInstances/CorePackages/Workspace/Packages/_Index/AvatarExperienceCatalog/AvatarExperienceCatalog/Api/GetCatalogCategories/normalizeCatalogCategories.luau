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

local function _() --[[ line: 21 | named "SearchUuid" ]]
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(true)
end

local function extractShowCatalogContentActionRequestParams(p0) --[[ line: 39 ]]
	local requestParams = nil
	
	if p0.props and p0.props.OnActivated then
		for i, v in p0.props.OnActivated do
			if v.componentType == "ShowCatalogContentAction" then
				requestParams = v.props and v.props.requestParams
				
				return requestParams
			end
		end
	end
	return requestParams
end

local function extractWidgetContext(p1) --[[ line: 53 ]]
	local context = nil
	
	if p1.props and p1.props.OnActivated then
		for i, v in p1.props.OnActivated do
			if v.componentType == "ShowWidgetContentAction" then
				context = v.props and (v.props.requestParams and v.props.requestParams.context)
				
				return context
			end
		end
	end
	return context
end

local _ = function(p2) --[[ line: 69 | named "stringToBoolean" ]]
	if type(p2) == "boolean" then
		return p2, nil
	elseif type(p2) ~= "string" then
		return nil, "Expected boolean or string"
	elseif p2 == "True" then
		return true, nil
	elseif p2 == "False" then
		return false, nil
	end
	return nil, "Invalid boolean string value, expected \"True\" or \"False\""
end

local function splitCommaSeparatedString(p3) --[[ line: 88 ]]
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

local _ = function(value) --[[ line: 105 | named "normalizeAssetTypeIdStrings" ]]
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeString (ref), splitCommaSeparatedString (ref)
	local var14 = extractShowCatalogContentActionRequestParams(value)
	local assetTypeIds = var14 and var14.assetTypeIds
	
	if assetTypeIds == nil or assetTypeIds == "" then
		return nil, nil
	end
	local var16, var17 = normalizeString(assetTypeIds)
	
	if var17 then
		return nil, var17
	end
	return splitCommaSeparatedString(var16), nil
end

local _ = function(p4) --[[ line: 123 | named "normalizeBundleTypes" ]]
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeString (ref), splitCommaSeparatedString (ref)
	local var18 = extractShowCatalogContentActionRequestParams(p4)
	local bundleTypeIds = var18 and var18.bundleTypeIds
	
	if bundleTypeIds == nil or bundleTypeIds == "" then
		return nil, nil
	end
	local var20, var21 = normalizeString(bundleTypeIds)
	
	if var21 then
		return nil, var21
	end
	return splitCommaSeparatedString(var20), nil
end

local _ = function(p5) --[[ line: 141 | named "normalizeTaxonomy" ]]
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeNotEmptyString (ref)
	local var22 = extractShowCatalogContentActionRequestParams(p5)
	local var23, var24 = normalizeNotEmptyString(var22 and var22.taxonomyId)
	
	return var23, var24
end

local _ = function(p6) --[[ line: 150 | named "normalizeWidgetContext" ]]
	-- upvalues: extractWidgetContext (ref)
	return extractWidgetContext(p6), nil
end

local _ = function() --[[ line: 156 | named "normalizeSearchUuid" ]]
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(true), nil
end

local _ = function(p7) --[[ line: 162 | named "normalizePillTitle" ]]
	-- upvalues: fFlagAXCatalogCategoriesSDUIPillTitleNormalization (ref), normalizeNotEmptyString (ref), normalizeString (ref)
	local pillTitle = p7.props and p7.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var26, var27 = normalizeNotEmptyString(pillTitle)
		
		return var26, var27
	end
	local var28, var29 = normalizeString(pillTitle)
	
	return var28, var29
end

local _ = function(p8) --[[ line: 174 | named "normalizePillId" ]]
	-- upvalues: fFlagAXCatalogCategoriesSDUIPillTitleNormalization (ref), normalizeNotEmptyString (ref), normalizeString (ref)
	local pillId = p8.props and p8.props.pillId
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var31, var32 = normalizeNotEmptyString(pillId)
		
		return var31, var32
	end
	local var33, var34 = normalizeString(pillId)
	
	return var33, var34
end

local _ = function(p9) --[[ line: 186 | named "normalizeTimeToRefresh" ]]
	-- upvalues: normalizeNumber (ref)
	local timeToRefresh = p9.props and p9.props.timeToRefresh
	
	if timeToRefresh == nil or timeToRefresh == "" then
		return nil, nil
	elseif type(timeToRefresh) == "string" then
		timeToRefresh = tonumber(timeToRefresh)
	end
	if timeToRefresh == nil then
		return nil, nil
	end
	local var36, var37 = normalizeNumber(timeToRefresh)
	
	return var36, var37
end

local _ = function(p10) --[[ line: 204 | named "normalizeCameraFocus" ]]
	-- upvalues: normalizeNotEmptyString (ref)
	local var38, var39 = normalizeNotEmptyString(p10.props and p10.props.cameraFocus)
	
	return var38, var39
end

local _ = function(p11) --[[ line: 211 | named "normalizeCameraZoomRadius" ]]
	-- upvalues: normalizeNumber (ref)
	local cameraZoomRadius = p11.props and p11.props.cameraZoomRadius
	
	if cameraZoomRadius == nil or cameraZoomRadius == "" then
		return nil, nil
	elseif type(cameraZoomRadius) == "string" then
		cameraZoomRadius = tonumber(cameraZoomRadius)
	end
	if cameraZoomRadius == nil then
		return nil, nil
	end
	local var41, var42 = normalizeNumber(cameraZoomRadius)
	
	return var41, var42
end

local _ = function(p12) --[[ line: 229 | named "normalizeCanAnimateCameraBasedMood" ]]
	-- upvalues: normalizeBoolean (ref)
	local var44, var45
	local canAnimateCameraBasedMood = p12.props and p12.props.canAnimateCameraBasedMood
	
	if canAnimateCameraBasedMood == nil or canAnimateCameraBasedMood == "" then
		return nil, nil
	elseif type(canAnimateCameraBasedMood) == "boolean" then
		var44 = canAnimateCameraBasedMood
		var45 = nil
	elseif type(canAnimateCameraBasedMood) ~= "string" then
		var44 = nil
		var45 = "Expected boolean or string"
	elseif canAnimateCameraBasedMood == "True" then
		var44 = true
		var45 = nil
	elseif canAnimateCameraBasedMood == "False" then
		var44 = false
		var45 = nil
	else
		var44 = nil
		var45 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var45 then
		return nil, var45
	end
	local var46, var47 = normalizeBoolean(var44)
	
	return var46, var47
end

local _ = function(p13) --[[ line: 245 | named "normalizeDisableFilters" ]]
	-- upvalues: normalizeBoolean (ref)
	local var49, var50
	local disableFilters = p13.props and p13.props.disableFilters
	
	if disableFilters == nil or disableFilters == "" then
		return nil, nil
	elseif type(disableFilters) == "boolean" then
		var49 = disableFilters
		var50 = nil
	elseif type(disableFilters) ~= "string" then
		var49 = nil
		var50 = "Expected boolean or string"
	elseif disableFilters == "True" then
		var49 = true
		var50 = nil
	elseif disableFilters == "False" then
		var49 = false
		var50 = nil
	else
		var49 = nil
		var50 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var50 then
		return nil, var50
	end
	local var51, var52 = normalizeBoolean(var49)
	
	return var51, var52
end

local _ = function(p14) --[[ line: 261 | named "normalizePageType" ]]
	-- upvalues: normalizeNotEmptyString (ref)
	local var53, var54 = normalizeNotEmptyString(p14.props and p14.props.pageType)
	
	return var53, var54
end

local _ = function(p15) --[[ line: 268 | named "normalizeLooksWidgetContextForOrganicContent" ]]
	-- upvalues: extractShowCatalogContentActionRequestParams (ref), normalizeString (ref)
	local var55 = extractShowCatalogContentActionRequestParams(p15)
	local context = var55 and var55.context
	
	if context == nil or context == "" then
		return nil, nil
	end
	local var57, var58 = normalizeString(context)
	
	return var57, var58
end

local _ = function(p16) --[[ line: 281 | named "normalizeTooltipKey" ]]
	-- upvalues: normalizeNotEmptyString (ref)
	local var59, var60 = normalizeNotEmptyString(p16.props and p16.props.tooltipKey)
	
	return var59, var60
end

local _ = function(p17) --[[ line: 288 | named "normalizeTooltipBody" ]]
	-- upvalues: normalizeNotEmptyString (ref)
	local var61, var62 = normalizeNotEmptyString(p17.props and p17.props.tooltipBody)
	
	return var61, var62
end

local _ = function(p18) --[[ line: 295 | named "normalizeTileType" ]]
	-- upvalues: normalizeNotEmptyString (ref)
	local var63, var64 = normalizeNotEmptyString(p18.props and p18.props.tileType)
	
	return var63, var64
end

local var6 = nil
local _ = nil

local var7 = function(p19) --[[ line: 306 ]]
	-- upvalues: var6 (write)
	if not p19.props or not p19.props.Configs or type(p19.props.Configs) ~= "table" then
		return nil, nil
	end
	local t = {}
	local t_1 = {}
	
	for i, v in p19.props.Configs do
		local var67, var68 = var6(v)
		
		if var68 then
			table.insert(t_1, var68)
		end
		if var67 and not var68 then
			table.insert(t, var67)
		end
	end
	return t, if next(t_1) then table.concat(t_1, " ") else nil
end

local function normalizeCategoryOrSubcategory(p20, p21) --[[ line: 334 ]]
	-- upvalues: fFlagAXCatalogCategoriesSDUIPillTitleNormalization (ref), normalizeNotEmptyString (ref), normalizeString (ref), httpService (ref), extractShowCatalogContentActionRequestParams (ref), splitCommaSeparatedString (ref), fFlagAXCatalogCategoriesSDUITaxonomy (ref), extractWidgetContext (ref), normalizeNumber (ref), var7 (write), normalizeBoolean (ref)
	if type(p20) ~= "table" then
		return nil, "Config must be a table"
	end
	local var73, var74
	local t = {}
	local pillId = p20.props and p20.props.pillId
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var75, var76 = normalizeNotEmptyString(pillId)
		var73 = var75
		var74 = var76
	else
		local var71, var72 = normalizeString(pillId)
		var73 = var71
		var74 = var72
	end
	if var74 then
		table.insert(t, "Id: " .. var74)
	end
	local var80, var81
	local pillTitle = p20.props and p20.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var82, var83 = normalizeNotEmptyString(pillTitle)
		var80 = var82
		var81 = var83
	else
		local var78, var79 = normalizeString(pillTitle)
		var80 = var78
		var81 = var79
	end
	if var81 then
		table.insert(t, "Name: " .. var81)
	end
	local var87, var88
	local pillTitle_1 = p20.props and p20.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var89, var90 = normalizeNotEmptyString(pillTitle_1)
		var87 = var89
		var88 = var90
	else
		local var85, var86 = normalizeString(pillTitle_1)
		var87 = var85
		var88 = var86
	end
	if var88 then
		table.insert(t, "LocalizedTitle: " .. var88)
	end
	local var94, var95
	local pillTitle_2 = p20.props and p20.props.pillTitle
	local _ = nil
	local _ = nil
	
	if fFlagAXCatalogCategoriesSDUIPillTitleNormalization then
		local var96, var97 = normalizeNotEmptyString(pillTitle_2)
		var94 = var96
		var95 = var97
	else
		local var92, var93 = normalizeString(pillTitle_2)
		var94 = var92
		var95 = var93
	end
	if var95 then
		table.insert(t, "Title: " .. var95)
	end
	local var98 = httpService:GenerateGUID(true)
	local var99 = nil
	local var104, var105
	local var100 = extractShowCatalogContentActionRequestParams(p20)
	local assetTypeIds = var100 and var100.assetTypeIds
	
	if assetTypeIds == nil or assetTypeIds == "" then
		var104 = nil
		var105 = nil
	else
		local var102, var103 = normalizeString(assetTypeIds)
		
		if var103 then
			var104 = nil
			var105 = var103
		else
			var104 = splitCommaSeparatedString(var102)
			var105 = nil
		end
	end
	if var105 then
		table.insert(t, "AssetTypeIdStrings: " .. var105)
	end
	local var110
	local var106 = extractShowCatalogContentActionRequestParams(p20)
	local bundleTypeIds = var106 and var106.bundleTypeIds
	
	if bundleTypeIds == nil or bundleTypeIds == "" then
		var110 = nil
		assetTypeIds = nil
	else
		local var108, var109 = normalizeString(bundleTypeIds)
		
		if var109 then
			var110 = nil
			assetTypeIds = var109
		else
			var110 = splitCommaSeparatedString(var108)
			assetTypeIds = nil
		end
	end
	if assetTypeIds then
		table.insert(t, "BundleTypes: " .. assetTypeIds)
	end
	local var111 = nil
	bundleTypeIds = nil
	
	if fFlagAXCatalogCategoriesSDUITaxonomy then
		local var112 = extractShowCatalogContentActionRequestParams(p20)
		local var113, var114 = normalizeNotEmptyString(var112 and var112.taxonomyId)
		var111 = var113
		bundleTypeIds = var114
		
		if bundleTypeIds then
			table.insert(t, "Taxonomy: " .. bundleTypeIds)
		end
	end
	local var115 = extractWidgetContext(p20)
	local var116 = nil
	local var118, var119
	local timeToRefresh = p20.props and p20.props.timeToRefresh
	
	if timeToRefresh == nil or timeToRefresh == "" then
		var118 = nil
		var119 = nil
	elseif type(timeToRefresh) == "string" then
		timeToRefresh = tonumber(timeToRefresh)
	end
	if timeToRefresh == nil then
		var118 = nil
		var119 = nil
	else
		local var120, var121 = normalizeNumber(timeToRefresh)
		var118 = var120
		var119 = var121
	end
	if var119 then
		table.insert(t, "TimeToRefresh: " .. var119)
	end
	local var122, var123 = normalizeNotEmptyString(p20.props and p20.props.cameraFocus)
	
	if var123 then
		table.insert(t, "CameraFocus: " .. var123)
	end
	local var125, var126
	local cameraZoomRadius = p20.props and p20.props.cameraZoomRadius
	
	if cameraZoomRadius == nil or cameraZoomRadius == "" then
		var125 = nil
		var126 = nil
	elseif type(cameraZoomRadius) == "string" then
		cameraZoomRadius = tonumber(cameraZoomRadius)
	end
	if cameraZoomRadius == nil then
		var125 = nil
		var126 = nil
	else
		local var127, var128 = normalizeNumber(cameraZoomRadius)
		var125 = var127
		var126 = var128
	end
	if var126 then
		table.insert(t, "CameraZoomRadius: " .. var126)
	end
	cameraZoomRadius = nil
	local _ = nil
	
	if not p21.isSubcategory then
		local var129, var130 = var7(p20)
		cameraZoomRadius = var129
		local var131 = var130
		
		if var131 then
			table.insert(t, "Subcategories: " .. var131)
		end
	end
	local var135, var136, var133, var134
	local canAnimateCameraBasedMood = p20.props and p20.props.canAnimateCameraBasedMood
	
	if canAnimateCameraBasedMood == nil or canAnimateCameraBasedMood == "" then
		var135 = nil
		var136 = nil
	elseif type(canAnimateCameraBasedMood) == "boolean" then
		var133 = canAnimateCameraBasedMood
		var134 = nil
	elseif type(canAnimateCameraBasedMood) ~= "string" then
		var133 = nil
		var134 = "Expected boolean or string"
	elseif canAnimateCameraBasedMood == "True" then
		var133 = true
		var134 = nil
	elseif canAnimateCameraBasedMood == "False" then
		var133 = false
		var134 = nil
	else
		var133 = nil
		var134 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var134 then
		var135 = nil
		var136 = var134
	else
		local var137, var138 = normalizeBoolean(var133)
		var135 = var137
		var136 = var138
	end
	if var136 then
		table.insert(t, "CanAnimateCameraBasedMood: " .. var136)
	end
	local var142, var140, var141
	local disableFilters = p20.props and p20.props.disableFilters
	
	if disableFilters == nil or disableFilters == "" then
		canAnimateCameraBasedMood = nil
		var142 = nil
	elseif type(disableFilters) == "boolean" then
		var140 = disableFilters
		var141 = nil
	elseif type(disableFilters) ~= "string" then
		var140 = nil
		var141 = "Expected boolean or string"
	elseif disableFilters == "True" then
		var140 = true
		var141 = nil
	elseif disableFilters == "False" then
		var140 = false
		var141 = nil
	else
		var140 = nil
		var141 = "Invalid boolean string value, expected \"True\" or \"False\""
	end
	if var141 then
		canAnimateCameraBasedMood = nil
		var142 = var141
	else
		local var143, var144 = normalizeBoolean(var140)
		canAnimateCameraBasedMood = var143
		var142 = var144
	end
	if var142 then
		table.insert(t, "DisableFilters: " .. var142)
	end
	local var145, var146 = normalizeNotEmptyString(p20.props and p20.props.pageType)
	
	if var146 then
		table.insert(t, "PageType: " .. var146)
	end
	local var151, var152
	local var147 = extractShowCatalogContentActionRequestParams(p20)
	local context = var147 and var147.context
	
	if context == nil or context == "" then
		var151 = nil
		var152 = nil
	else
		local var149, var150 = normalizeString(context)
		var151 = var149
		var152 = var150
	end
	if var152 then
		table.insert(t, "LooksWidgetContextForOrganicContent: " .. var152)
	end
	local var153, var154 = normalizeNotEmptyString(p20.props and p20.props.tooltipKey)
	
	if var154 then
		table.insert(t, "TooltipKey: " .. var154)
	end
	local var155, var156 = normalizeNotEmptyString(p20.props and p20.props.tooltipBody)
	
	if var156 then
		table.insert(t, "TooltipBody: " .. var156)
	end
	local var157, var158 = normalizeNotEmptyString(p20.props and p20.props.tileType)
	
	if var158 then
		table.insert(t, "TileType: " .. var158)
	end
	if #t > 0 then
		return nil, (if p21.isSubcategory then "Subcategory" else "Category") .. " normalization failed: " .. table.concat(t, "; ")
	end
	local t_1 = {
		Id = var73,
		Name = var80,
		LocalizedTitle = var87,
		Title = var94,
		SearchUuid = var98,
		AssetTypeIdStrings = var104,
		BundleTypes = var110,
		TaxonomyUuid = if fFlagAXCatalogCategoriesSDUITaxonomy then var111 else nil,
		WidgetContext = var115,
		TimeToRefresh = var118,
		CameraFocus = var122,
		CameraZoomRadius = var125,
		CanAnimateCameraBasedMood = var135,
		DisableFilters = canAnimateCameraBasedMood,
		PageType = var145,
		LooksWidgetContextForOrganicContent = var151,
		TooltipKey = var153,
		TooltipBody = var155,
		TileType = var157
	}
	
	if p21.isSubcategory then
		t_1.isSubcategory = true
	elseif cameraZoomRadius and #cameraZoomRadius > 0 then
		t_1.Subcategories = cameraZoomRadius
	end
	return t_1, nil
end

var6 = function(p22) --[[ line: 491 ]]
	-- upvalues: normalizeCategoryOrSubcategory (ref)
	return normalizeCategoryOrSubcategory(p22, { isSubcategory = true })
end

local _ = nil

local var9 = function(p23) --[[ line: 497 ]]
	-- upvalues: normalizeCategoryOrSubcategory (ref)
	return normalizeCategoryOrSubcategory(p23, { isSubcategory = false })
end

local var10 = makeNormalizeTableFn({
	Configs = {
		fn = function(p24) --[[ line: 502 ]]
			-- upvalues: var9 (write)
			if type(p24) ~= "table" then
				return {}, "Configs field must be a table"
			end
			local t = {}
			local t_1 = {}
			
			for i, v in p24 do
				local var162, var163 = var9(v)
				
				if var163 then
					table.insert(t_1, var163)
				end
				if var162 and not var163 then
					table.insert(t, var162)
				end
			end
			return t, if next(t_1) then table.concat(t_1, " ") else nil
		end
	}
})

return function(p25) --[[ line: 535 ]]
	-- upvalues: var10 (ref)
	if p25 and type(p25.Configs) == "table" then
		local var164, var165 = var10(p25)
		
		return if var164 then var164.Configs else {}, var165
	end
	return {}, "Configs field is required and must be a table"
end