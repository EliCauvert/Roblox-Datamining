local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local responsiveModule = require(parent.Responsive)
local inputModeStore = responsiveModule.GetInputModeStore(false)
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagAXNoCarouselsOnCatalogWithGamepadModule = require(avatarExperienceCatalog.Flags.FFlagAXNoCarouselsOnCatalogWithGamepad)
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)
local _ = require(script.Parent.WidgetListInfoViewModel)
local widgetListBreakPointEnumModule = require(script.Parent.WidgetListBreakPointEnum)
local list = {
	{ contentType = "ItemName" },
	{ contentType = "Price" },
	{ contentType = "AgentName" }
}
local t = {
	type = "Carousel",
	numItemsToShow = 12,
	itemFooters = list,
	previewRows = { default = 1 },
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
}
local t_1 = {
	type = "ItemGroup",
	itemFooters = list,
	previewRows = { default = 1 },
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
}
local t_2 = {
	type = "HeroUnit",
	itemFooters = list,
	previewRows = { default = 1 },
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
}
local t_3 = {
	Default = "default",
	XSmall = "xSmall",
	Small = "small",
	Medium = "medium",
	Large = "large",
	XLarge = "xLarge",
	X2Large = "x2Large",
	Landscape = "landscape",
	Portrait = "portrait"
}
local t_4 = { Dark = "dark", Light = "light", Default = "default" }

local function getQueryStringForSearchWidgets(p0) --[[ line: 72 ]]
	if not p0 or not p0.searchKeyword then
		return nil
	end
	local list = { p0.searchKeyword }
	
	if p0.sortAndFilters and p0.sortAndFilters.SelectedTopics then
		for i, v in p0.sortAndFilters.SelectedTopics do
			table.insert(list, 1, v)
		end
	end
	return table.concat(list, " ")
end

local function _(p1) --[[ line: 87 | named "getDefaultItemGroupTemplate" ]]
	-- upvalues: cryoModule (ref), t_1 (ref)
	return if p1 and p1.defaultItemGroupTemplate then cryoModule.Dictionary.join(t_1, p1.defaultItemGroupTemplate) elseif p1 and p1.defaultTemplate then cryoModule.Dictionary.join(t_1, p1.defaultTemplate) else t_1
end

local _ = function(p2) --[[ line: 98 | named "getDefaultCarouselTemplate" ]]
	-- upvalues: cryoModule (ref), t (ref)
	return if p2 and p2.defaultItemCarouselTemplate then cryoModule.Dictionary.join(t, p2.defaultItemCarouselTemplate) else t
end

local _ = function(p3, p4) --[[ line: 105 | named "getResponsiveValue" ]]
	-- upvalues: t_3 (ref)
	if not p3 then
		return nil
	end
	local var32 = if p4 and t_3[p4] then t_3[p4] else "default"
	
	return if p3[var32] then p3[var32] else p3.default
end

local _ = function(p5, p6) --[[ line: 113 | named "getThemeValue" ]]
	-- upvalues: t_4 (ref)
	if not p5 then
		return nil
	end
	local var33 = if p6 and t_4[p6] then t_4[p6] else "default"
	
	return if p5[var33] then p5[var33] else p5.default
end

local function colorToColor3(p7) --[[ line: 121 ]]
	return Color3.new(p7.r, p7.g, p7.b)
end

local function pointToVector2(p8) --[[ line: 125 ]]
	return Vector2.new(p8.x, p8.y)
end

local function pointToUDim2(p9) --[[ line: 129 ]]
	return UDim2.fromOffset(p9.x, p9.y)
end

local _ = function(p10, p11) --[[ line: 133 | named "formatResponsivePointToVector" ]]
	-- upvalues: t_3 (ref), pointToVector2 (ref)
	local var34
	if p10 then
		local var35 = if p11 and t_3[p11] then t_3[p11] else "default"
		var34 = if p10[var35] then p10[var35] else p10.default
	else
		var34 = nil
	end
	return pointToVector2(var34 or { x = 0, y = 0 })
end

local _ = function(p12, p13) --[[ line: 141 | named "formatResponsivePointToUDim2" ]]
	-- upvalues: t_3 (ref), pointToUDim2 (ref)
	local var36
	if p12 then
		local var37 = if p13 and t_3[p13] then t_3[p13] else "default"
		var36 = if p12[var37] then p12[var37] else p12.default
	else
		var36 = nil
	end
	return pointToUDim2(var36 or { x = 0, y = 0 })
end

local function formatColorSequence(p14) --[[ line: 149 ]]
	-- upvalues: colorToColor3 (ref)
	local t = {}
	
	for i, v in p14 do
		table.insert(t, ColorSequenceKeypoint.new(v.time, colorToColor3(v.color)))
	end
	return ColorSequence.new(t)
end

local function formatNumberSequence(p15) --[[ line: 157 ]]
	if type(p15) == "number" then
		return NumberSequence.new(p15)
	elseif #p15 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p15 do
		table.insert(t, NumberSequenceKeypoint.new(v.time, v.number))
	end
	return NumberSequence.new(t)
end

local function formatImageBackground(value, p16) --[[ line: 171 ]]
	-- upvalues: t_3 (ref)
	local vector2
	if value.anchorPoint then
		local var40
		local anchorPoint = value.anchorPoint
		
		if anchorPoint then
			local var41 = if p16 and t_3[p16] then t_3[p16] else "default"
			var40 = if anchorPoint[var41] then anchorPoint[var41] else anchorPoint.default
		else
			var40 = nil
		end
		local var42 = var40 or { x = 0, y = 0 }
		vector2 = Vector2.new(var42.x, var42.y)
	else
		vector2 = nil
	end
	local uDim2
	if value.position then
		local var44
		local position = value.position
		
		if position then
			local var45 = if p16 and t_3[p16] then t_3[p16] else "default"
			var44 = if position[var45] then position[var45] else position.default
		else
			var44 = nil
		end
		local var46 = var44 or { x = 0, y = 0 }
		uDim2 = UDim2.fromOffset(var46.x, var46.y)
	else
		uDim2 = nil
	end
	local var49
	local t = { type = "ImageBackground" }
	
	if value.resourceIdentifier then
		local resourceIdentifier = value.resourceIdentifier
		
		if resourceIdentifier then
			local var50 = if p16 and t_3[p16] then t_3[p16] else "default"
			var49 = if resourceIdentifier[var50] then resourceIdentifier[var50] else resourceIdentifier.default
		else
			var49 = nil
		end
	else
		var49 = nil
	end
	local color3
	t.resourceIdentifier = var49
	
	if value.color then
		local color = value.color
		color3 = Color3.new(color.r, color.g, color.b)
	else
		color3 = nil
	end
	local var52
	t.color = color3
	t.anchorPoint = vector2
	t.position = uDim2
	
	if value.transparency then
		local transparency = value.transparency
		
		if transparency then
			local var53 = if p16 and t_3[p16] then t_3[p16] else "default"
			var52 = if transparency[var53] then transparency[var53] else transparency.default
		else
			var52 = nil
		end
	else
		var52 = nil
	end
	t.transparency = var52
	
	return t
end

local function formatGradientBackground(value) --[[ line: 195 ]]
	-- upvalues: formatColorSequence (ref), formatNumberSequence (ref)
	local vector2
	local t = {
		type = "GradientBackground",
		colorSequence = formatColorSequence(value.colorSequence),
		rotation = value.rotation,
		transparency = if value.transparency then formatNumberSequence(value.transparency) else nil
	}
	
	if value.offset then
		local offset = value.offset
		vector2 = Vector2.new(offset.x, offset.y)
	else
		vector2 = nil
	end
	t.offset = vector2
	
	return t
end

local function getFormattedBackgroundLayers(value, p17, p18) --[[ line: 209 ]]
	-- upvalues: t_4 (ref), formatImageBackground (ref), formatGradientBackground (ref)
	local var56
	if value then
		local var57 = if p18 and t_4[p18] then t_4[p18] else "default"
		var56 = if value[var57] then value[var57] else value.default
	else
		var56 = nil
	end
	local t = {}
	
	for i, v in var56 or {} do
		if v.type == "ImageBackground" then
			table.insert(t, formatImageBackground(v, p17))
		elseif v.type == "GradientBackground" then
			table.insert(t, formatGradientBackground(v))
		end
	end
	return t
end

local _ = function(p19, p20, p21) --[[ line: 226 | named "formatCardStyle" ]]
	-- upvalues: getFormattedBackgroundLayers (ref)
	return {
		backgroundLayers = if p19.backgroundLayers then getFormattedBackgroundLayers(p19.backgroundLayers, p20, p21) else nil,
		thumbnailAspectRatio = p19.thumbnailAspectRatio
	}
end

local _ = function(p22, p23, p24) --[[ line: 239 | named "formatWidgetStyle" ]]
	-- upvalues: getFormattedBackgroundLayers (ref)
	return {
		backgroundLayers = if p22.backgroundLayers then getFormattedBackgroundLayers(p22.backgroundLayers, p23, p24) else nil
	}
end

local function formatWidgetTemplateAsItemGroup(p25, p26, p27) --[[ line: 251 ]]
	-- upvalues: t_3 (ref), getFormattedBackgroundLayers (ref)
	local var59
	local previewColumns = p25.previewColumns
	
	if previewColumns then
		local var60 = if p26 and t_3[p26] then t_3[p26] else "default"
		var59 = if previewColumns[var60] then previewColumns[var60] else previewColumns.default
	else
		var59 = nil
	end
	local var62
	local var59_1 = var59 or 1
	local previewRows = p25.previewRows
	
	if previewRows then
		local var63 = if p26 and t_3[p26] then t_3[p26] else "default"
		var62 = if previewRows[var63] then previewRows[var63] else previewRows.default
	else
		var62 = nil
	end
	local t_1
	local var62_1 = var62 or 1
	local t = {
		type = "ItemGroup",
		seeAllButton = p25.seeAllButton,
		title = p25.title,
		localizedTitle = p25.localizedTitle,
		description = p25.description,
		localizedDescription = p25.localizedDescription,
		itemFooters = p25.itemFooters
	}
	
	if p25.widgetStyle then
		local widgetStyle = p25.widgetStyle
		t_1 = {
			backgroundLayers = if widgetStyle.backgroundLayers then getFormattedBackgroundLayers(widgetStyle.backgroundLayers, p26, p27) else nil
		}
	else
		t_1 = nil
	end
	local t_2
	t.widgetStyle = t_1
	
	if p25.cardStyle then
		local cardStyle = p25.cardStyle
		t_2 = {
			backgroundLayers = if cardStyle.backgroundLayers then getFormattedBackgroundLayers(cardStyle.backgroundLayers, p26, p27) else nil,
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t_2 = nil
	end
	t.cardStyle = t_2
	t.previewRows = var62_1
	t.previewColumns = var59_1
	
	return t
end

local function formatWidgetTemplateAsCarousel(p28, p29, p30) --[[ line: 273 ]]
	-- upvalues: t_3 (ref), getFormattedBackgroundLayers (ref)
	local var68
	local previewColumns = p28.previewColumns
	
	if previewColumns then
		local var69 = if p29 and t_3[p29] then t_3[p29] else "default"
		var68 = if previewColumns[var69] then previewColumns[var69] else previewColumns.default
	else
		var68 = nil
	end
	local var71
	local var68_1 = var68 or 1
	local previewRows = p28.previewRows
	
	if previewRows then
		local var72 = if p29 and t_3[p29] then t_3[p29] else "default"
		var71 = if previewRows[var72] then previewRows[var72] else previewRows.default
	else
		var71 = nil
	end
	local t_1
	local var71_1 = var71 or 1
	local t = {
		type = "Carousel",
		numItemsToShow = p28.numItemsToShow,
		seeAllButton = p28.seeAllButton,
		title = p28.title,
		localizedTitle = p28.localizedTitle,
		description = p28.description,
		localizedDescription = p28.localizedDescription,
		itemFooters = p28.itemFooters
	}
	
	if p28.widgetStyle then
		local widgetStyle = p28.widgetStyle
		t_1 = {
			backgroundLayers = if widgetStyle.backgroundLayers then getFormattedBackgroundLayers(widgetStyle.backgroundLayers, p29, p30) else nil
		}
	else
		t_1 = nil
	end
	local t_2
	t.widgetStyle = t_1
	
	if p28.cardStyle then
		local cardStyle = p28.cardStyle
		t_2 = {
			backgroundLayers = if cardStyle.backgroundLayers then getFormattedBackgroundLayers(cardStyle.backgroundLayers, p29, p30) else nil,
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t_2 = nil
	end
	t.cardStyle = t_2
	t.previewRows = var71_1
	t.previewColumns = var68_1
	
	return t
end

local function formatWidgetTemplateAsHeroUnit(p31, p32, p33) --[[ line: 296 ]]
	-- upvalues: t_3 (ref), getFormattedBackgroundLayers (ref)
	local var77
	local previewColumns = p31.previewColumns
	
	if previewColumns then
		local var78 = if p32 and t_3[p32] then t_3[p32] else "default"
		var77 = if previewColumns[var78] then previewColumns[var78] else previewColumns.default
	else
		var77 = nil
	end
	local var80
	local var77_1 = var77 or 1
	local previewRows = p31.previewRows
	
	if previewRows then
		local var81 = if p32 and t_3[p32] then t_3[p32] else "default"
		var80 = if previewRows[var81] then previewRows[var81] else previewRows.default
	else
		var80 = nil
	end
	local t_1
	local var80_1 = var80 or 1
	local t = {
		type = "HeroUnit",
		numItemsToShow = p31.numItemsToShow,
		seeAllButton = p31.seeAllButton,
		title = p31.title,
		localizedTitle = p31.localizedTitle,
		description = p31.description,
		localizedDescription = p31.localizedDescription,
		itemFooters = p31.itemFooters
	}
	
	if p31.widgetStyle then
		local widgetStyle = p31.widgetStyle
		t_1 = {
			backgroundLayers = if widgetStyle.backgroundLayers then getFormattedBackgroundLayers(widgetStyle.backgroundLayers, p32, p33) else nil
		}
	else
		t_1 = nil
	end
	local t_2
	t.widgetStyle = t_1
	
	if p31.cardStyle then
		local cardStyle = p31.cardStyle
		t_2 = {
			backgroundLayers = if cardStyle.backgroundLayers then getFormattedBackgroundLayers(cardStyle.backgroundLayers, p32, p33) else nil,
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t_2 = nil
	end
	t.cardStyle = t_2
	t.previewRows = var80_1
	t.previewColumns = var77_1
	t.availableUntil = p31.availableUntil
	
	return t
end

local function mergeCardStyle(p34, p35) --[[ line: 320 ]]
	-- upvalues: cryoModule (ref)
	if not p34 and not p35 then
		return nil
	end
	local var86 = if p35 then p35.thumbnailAspectRatio else nil
	
	return {
		thumbnailAspectRatio = if var86 == nil then if p34 then p34.thumbnailAspectRatio else nil else var86,
		backgroundLayers = cryoModule.Dictionary.join(if p34 and p34.backgroundLayers then p34.backgroundLayers else {}, if p35 and p35.backgroundLayers then p35.backgroundLayers else {})
	}
end

local function mergeWidgetStyle(p36, p37) --[[ line: 336 ]]
	-- upvalues: cryoModule (ref)
	return if not (not p36 and not p37) then {
		backgroundLayers = cryoModule.Dictionary.join(if p36 and p36.backgroundLayers then p36.backgroundLayers else {}, if p37 and p37.backgroundLayers then p37.backgroundLayers else {})
	} else nil
end

local function mergeItemGroupTemplates(p38, p39) --[[ line: 351 ]]
	-- upvalues: mergeWidgetStyle (ref), mergeCardStyle (ref), cryoModule (ref)
	return {
		type = "ItemGroup",
		seeAllButton = if p39.seeAllButton == nil then p38.seeAllButton else p39.seeAllButton,
		title = if p39.title == nil then p38.title else p39.title,
		localizedTitle = if p39.localizedTitle == nil then p38.localizedTitle else p39.localizedTitle,
		description = if p39.description == nil then p38.description else p39.description,
		localizedDescription = if p39.localizedDescription == nil then p38.localizedDescription else p39.localizedDescription,
		itemFooters = if p39.itemFooters == nil then p38.itemFooters else p39.itemFooters,
		widgetStyle = mergeWidgetStyle(p38.widgetStyle, p39.widgetStyle),
		cardStyle = mergeCardStyle(p38.cardStyle, p39.cardStyle),
		previewRows = cryoModule.Dictionary.join(p38.previewRows or {}, p39.previewRows or {}),
		previewColumns = cryoModule.Dictionary.join(p38.previewColumns or {}, p39.previewColumns or {})
	}
end

local function mergeCarouselTemplates(p40, p41) --[[ line: 370 ]]
	-- upvalues: mergeWidgetStyle (ref), mergeCardStyle (ref), cryoModule (ref)
	return {
		type = "Carousel",
		numItemsToShow = if p41.numItemsToShow == nil then p40.numItemsToShow else p41.numItemsToShow,
		seeAllButton = if p41.seeAllButton == nil then p40.seeAllButton else p41.seeAllButton,
		title = if p41.title == nil then p40.title else p41.title,
		localizedTitle = if p41.localizedTitle == nil then p40.localizedTitle else p41.localizedTitle,
		description = if p41.description == nil then p40.description else p41.description,
		localizedDescription = if p41.localizedDescription == nil then p40.localizedDescription else p41.localizedDescription,
		itemFooters = if p41.itemFooters == nil then p40.itemFooters else p41.itemFooters,
		widgetStyle = mergeWidgetStyle(p40.widgetStyle, p41.widgetStyle),
		cardStyle = mergeCardStyle(p40.cardStyle, p41.cardStyle),
		previewRows = cryoModule.Dictionary.join(p40.previewRows or {}, p41.previewRows or {}),
		previewColumns = cryoModule.Dictionary.join(p40.previewColumns or {}, p41.previewColumns or {})
	}
end

local function mergeHeroUnitTemplates(p42, p43) --[[ line: 390 ]]
	-- upvalues: mergeWidgetStyle (ref), mergeCardStyle (ref), cryoModule (ref)
	return {
		type = "HeroUnit",
		numItemsToShow = if p43.numItemsToShow == nil then p42.numItemsToShow else p43.numItemsToShow,
		seeAllButton = if p43.seeAllButton == nil then p42.seeAllButton else p43.seeAllButton,
		title = if p43.title == nil then p42.title else p43.title,
		localizedTitle = if p43.localizedTitle == nil then p42.localizedTitle else p43.localizedTitle,
		description = if p43.description == nil then p42.description else p43.description,
		localizedDescription = if p43.localizedDescription == nil then p42.localizedDescription else p43.localizedDescription,
		itemFooters = if p43.itemFooters == nil then p42.itemFooters else p43.itemFooters,
		widgetStyle = mergeWidgetStyle(p42.widgetStyle, p43.widgetStyle),
		cardStyle = mergeCardStyle(p42.cardStyle, p43.cardStyle),
		previewRows = cryoModule.Dictionary.join(p42.previewRows or {}, p43.previewRows or {}),
		previewColumns = cryoModule.Dictionary.join(p42.previewColumns or {}, p43.previewColumns or {}),
		availableUntil = if p43.availableUntil == nil then p42.availableUntil else p43.availableUntil
	}
end

local _ = function(p44) --[[ line: 411 | named "convertCarouselTemplateToItemGroupTemplate" ]]
	local cloned = table.clone(p44)
	cloned.type = "ItemGroup"
	cloned.numItemsToShow = nil
	
	return cloned
end

local function formatWidgetListStateToWidgetListInfoViewModel(p45, p46, p47, p48) --[[ line: 420 ]]
	-- upvalues: fFlagAXNoCarouselsOnCatalogWithGamepadModule (ref), responsiveModule (ref), cryoModule (ref), t (ref), t_1 (ref), formatWidgetTemplateAsHeroUnit (ref), mergeHeroUnitTemplates (ref), t_2 (ref), formatWidgetTemplateAsCarousel (ref), mergeCarouselTemplates (ref), formatWidgetTemplateAsItemGroup (ref), mergeItemGroupTemplates (ref)
	local var90
	local t_3 = { configuration = {}, widgets = {} }
	local var89 = if p45 then p45.Configuration else nil
	
	if fFlagAXNoCarouselsOnCatalogWithGamepadModule then
		var90 = p48 ~= responsiveModule.Input.Directional
		var90 = nil
	else
		var90 = nil
	end
	local var91 = if var89 and var89.defaultItemCarouselTemplate then cryoModule.Dictionary.join(t, var89.defaultItemCarouselTemplate) else t
	local var92 = if var89 and var89.defaultItemGroupTemplate then cryoModule.Dictionary.join(t_1, var89.defaultItemGroupTemplate) elseif var89 and var89.defaultTemplate then cryoModule.Dictionary.join(t_1, var89.defaultTemplate) else t_1
	
	if p45 and p45.Details then
		for i, v in p45.Details do
			local template
			if not fFlagAXNoCarouselsOnCatalogWithGamepadModule then
				template = nil
			elseif v.template.type == "Carousel" and not var90 then
				local cloned = table.clone(v.template)
				cloned.type = "ItemGroup"
				cloned.numItemsToShow = nil
				template = cloned
			else
				template = v.template
			end
			local _ = nil
			local var94 = if fFlagAXNoCarouselsOnCatalogWithGamepadModule then template else v.template
			local type = var94.type
			t_3.widgets[i] = {
				id = v.id,
				type = v.type,
				content = v.content,
				tagId = v.tagId,
				template = if type == "HeroUnit" then formatWidgetTemplateAsHeroUnit(mergeHeroUnitTemplates(t_2, var94), p46, p47) elseif type == "Carousel" then formatWidgetTemplateAsCarousel(mergeCarouselTemplates(var91, var94), p46, p47) else formatWidgetTemplateAsItemGroup(mergeItemGroupTemplates(var92, var94), p46, p47),
				requestId = p45.RequestId
			}
		end
	end
	if var89 then
		t_3.configuration.customizedDataMap = var89.customizedDataMap
	end
	t_3.configuration.defaultItemGroupTemplate = formatWidgetTemplateAsItemGroup(var92, p46, p47)
	t_3.configuration.defaultItemCarouselTemplate = formatWidgetTemplateAsCarousel(var91, p46, p47)
	
	return t_3
end

return function(p49, p50, p51) --[[ line: 503 | named "useWidgetListInfoViewModel" ]]
	-- upvalues: widgetListBreakPointEnumModule (ref), fFlagAXNoCarouselsOnCatalogWithGamepadModule (ref), useSignalState (ref), inputModeStore (ref), reactModule (ref), getQueryStringForSearchWidgets (ref), useSelector (ref), useTokens (ref), formatWidgetListStateToWidgetListInfoViewModel (ref)
	local var95 = p51 or widgetListBreakPointEnumModule.Default
	local var96 = if fFlagAXNoCarouselsOnCatalogWithGamepadModule then useSignalState(inputModeStore.getLastInputType) else nil
	local var97 = useSelector(reactModule.useCallback(function(p52) --[[ line: 512 ]]
		-- upvalues: p49 (ref), getQueryStringForSearchWidgets (copy), p50 (ref)
		local var99 = p52.SearchesParameters[p49]
		
		return if var99 and var99.searchKeyword ~= nil then p52.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[getQueryStringForSearchWidgets(var99)] elseif p50 then p52.AvatarExperience.Common.Widgets.ContextWidgetInfo[p50] else p52.AvatarExperience.Common.Widgets.WidgetInfo
	end, { p49, p50 }))
	local var98 = useTokens()
	
	return reactModule.useMemo(function() --[[ line: 528 ]]
		-- upvalues: formatWidgetListStateToWidgetListInfoViewModel (copy), var97 (ref), var95 (ref), var98 (ref), fFlagAXNoCarouselsOnCatalogWithGamepadModule (copy), var96 (ref)
		return formatWidgetListStateToWidgetListInfoViewModel(var97, var95, var98.Config.ColorMode.Name, if fFlagAXNoCarouselsOnCatalogWithGamepadModule then var96 else nil)
	end, {
		var98.Config.ColorMode.Name,
		var97,
		var95,
		if fFlagAXNoCarouselsOnCatalogWithGamepadModule then var96 else nil
	})
end