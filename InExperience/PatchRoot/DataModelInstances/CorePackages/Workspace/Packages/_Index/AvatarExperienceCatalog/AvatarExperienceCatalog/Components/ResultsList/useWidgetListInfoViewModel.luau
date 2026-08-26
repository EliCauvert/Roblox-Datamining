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

local function getQueryStringForSearchWidgets(p1)
	if not p1 or not p1.searchKeyword then
		return nil
	end
	local list = { p1.searchKeyword }
	
	if p1.sortAndFilters and p1.sortAndFilters.SelectedTopics then
		for i, v in p1.sortAndFilters.SelectedTopics do
			table.insert(list, 1, v)
		end
	end
	return table.concat(list, " ")
end

local function _(p2)
	-- upvalues: cryoModule (ref), t_1 (ref)
	return if p2 and p2.defaultItemGroupTemplate then cryoModule.Dictionary.join(t_1, p2.defaultItemGroupTemplate) elseif p2 and p2.defaultTemplate then cryoModule.Dictionary.join(t_1, p2.defaultTemplate) else t_1
end

local _ = function(p2)
	-- upvalues: cryoModule (ref), t (ref)
	return if p2 and p2.defaultItemCarouselTemplate then cryoModule.Dictionary.join(t, p2.defaultItemCarouselTemplate) else t
end

local _ = function(p2, p3)
	-- upvalues: t_3 (ref)
	if not p2 then
		return nil
	end
	local var1 = if p3 and t_3[p3] then t_3[p3] else "default"
	
	return if p2[var1] then p2[var1] else p2.default
end

local _ = function(p2, p3)
	-- upvalues: t_4 (ref)
	if not p2 then
		return nil
	end
	local var1 = if p3 and t_4[p3] then t_4[p3] else "default"
	
	return if p2[var1] then p2[var1] else p2.default
end

local function colorToColor3(p2)
	return Color3.new(p2.r, p2.g, p2.b)
end

local function pointToVector2(p2)
	return Vector2.new(p2.x, p2.y)
end

local function pointToUDim2(p2)
	return UDim2.fromOffset(p2.x, p2.y)
end

local _ = function(p2, p3)
	-- upvalues: t_3 (ref), pointToVector2 (ref)
	local var1
	if p2 then
		local var2 = if p3 and t_3[p3] then t_3[p3] else "default"
		var1 = if p2[var2] then p2[var2] else p2.default
	else
		var1 = nil
	end
	return pointToVector2(var1 or { x = 0, y = 0 })
end

local _ = function(p2, p3)
	-- upvalues: t_3 (ref), pointToUDim2 (ref)
	local var1
	if p2 then
		local var2 = if p3 and t_3[p3] then t_3[p3] else "default"
		var1 = if p2[var2] then p2[var2] else p2.default
	else
		var1 = nil
	end
	return pointToUDim2(var1 or { x = 0, y = 0 })
end

local function formatColorSequence(p2)
	-- upvalues: colorToColor3 (ref)
	local t = {}
	
	for i, v in p2 do
		table.insert(t, ColorSequenceKeypoint.new(v.time, colorToColor3(v.color)))
	end
	return ColorSequence.new(t)
end

local function formatNumberSequence(p3)
	if type(p3) == "number" then
		return NumberSequence.new(p3)
	elseif #p3 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p3 do
		table.insert(t, NumberSequenceKeypoint.new(v.time, v.number))
	end
	return NumberSequence.new(t)
end

local function formatImageBackground(value, p4)
	-- upvalues: t_3 (ref)
	local vector2
	if value.anchorPoint then
		local var1
		local anchorPoint = value.anchorPoint
		
		if anchorPoint then
			local var2 = if p4 and t_3[p4] then t_3[p4] else "default"
			var1 = if anchorPoint[var2] then anchorPoint[var2] else anchorPoint.default
		else
			var1 = nil
		end
		local var3 = var1 or { x = 0, y = 0 }
		vector2 = Vector2.new(var3.x, var3.y)
	else
		vector2 = nil
	end
	local uDim2
	if value.position then
		local var4
		local position = value.position
		
		if position then
			local var5 = if p4 and t_3[p4] then t_3[p4] else "default"
			var4 = if position[var5] then position[var5] else position.default
		else
			var4 = nil
		end
		local var6 = var4 or { x = 0, y = 0 }
		uDim2 = UDim2.fromOffset(var6.x, var6.y)
	else
		uDim2 = nil
	end
	local var7
	local t = { type = "ImageBackground" }
	
	if value.resourceIdentifier then
		local resourceIdentifier = value.resourceIdentifier
		
		if resourceIdentifier then
			local var8 = if p4 and t_3[p4] then t_3[p4] else "default"
			var7 = if resourceIdentifier[var8] then resourceIdentifier[var8] else resourceIdentifier.default
		else
			var7 = nil
		end
	else
		var7 = nil
	end
	local color3
	t.resourceIdentifier = var7
	
	if value.color then
		local color = value.color
		color3 = Color3.new(color.r, color.g, color.b)
	else
		color3 = nil
	end
	local var9
	t.color = color3
	t.anchorPoint = vector2
	t.position = uDim2
	
	if value.transparency then
		local transparency = value.transparency
		
		if transparency then
			local var10 = if p4 and t_3[p4] then t_3[p4] else "default"
			var9 = if transparency[var10] then transparency[var10] else transparency.default
		else
			var9 = nil
		end
	else
		var9 = nil
	end
	t.transparency = var9
	
	return t
end

local function formatGradientBackground(value)
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

local function getFormattedBackgroundLayers(value, p4, p5)
	-- upvalues: t_4 (ref), formatImageBackground (ref), formatGradientBackground (ref)
	local var1
	if value then
		local var2 = if p5 and t_4[p5] then t_4[p5] else "default"
		var1 = if value[var2] then value[var2] else value.default
	else
		var1 = nil
	end
	local t = {}
	
	for i, v in var1 or {} do
		if v.type == "ImageBackground" then
			table.insert(t, formatImageBackground(v, p4))
		elseif v.type == "GradientBackground" then
			table.insert(t, formatGradientBackground(v))
		end
	end
	return t
end

local _ = function(p6, p7, p8)
	-- upvalues: getFormattedBackgroundLayers (ref)
	return {
		backgroundLayers = if p6.backgroundLayers then getFormattedBackgroundLayers(p6.backgroundLayers, p7, p8) else nil,
		thumbnailAspectRatio = p6.thumbnailAspectRatio
	}
end

local _ = function(p6, p7, p8)
	-- upvalues: getFormattedBackgroundLayers (ref)
	return {
		backgroundLayers = if p6.backgroundLayers then getFormattedBackgroundLayers(p6.backgroundLayers, p7, p8) else nil
	}
end

local function formatWidgetTemplateAsItemGroup(p6, p7, p8)
	-- upvalues: t_3 (ref), getFormattedBackgroundLayers (ref)
	local var3
	local previewColumns = p6.previewColumns
	
	if previewColumns then
		local var4 = if p7 and t_3[p7] then t_3[p7] else "default"
		var3 = if previewColumns[var4] then previewColumns[var4] else previewColumns.default
	else
		var3 = nil
	end
	local var5
	local var6 = var3 or 1
	local previewRows = p6.previewRows
	
	if previewRows then
		local var7 = if p7 and t_3[p7] then t_3[p7] else "default"
		var5 = if previewRows[var7] then previewRows[var7] else previewRows.default
	else
		var5 = nil
	end
	local t_1
	local var8 = var5 or 1
	local t = {
		type = "ItemGroup",
		seeAllButton = p6.seeAllButton,
		title = p6.title,
		localizedTitle = p6.localizedTitle,
		description = p6.description,
		localizedDescription = p6.localizedDescription,
		itemFooters = p6.itemFooters
	}
	
	if p6.widgetStyle then
		local widgetStyle = p6.widgetStyle
		t_1 = {
			backgroundLayers = if widgetStyle.backgroundLayers then getFormattedBackgroundLayers(widgetStyle.backgroundLayers, p7, p8) else nil
		}
	else
		t_1 = nil
	end
	local t_2
	t.widgetStyle = t_1
	
	if p6.cardStyle then
		local cardStyle = p6.cardStyle
		t_2 = {
			backgroundLayers = if cardStyle.backgroundLayers then getFormattedBackgroundLayers(cardStyle.backgroundLayers, p7, p8) else nil,
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t_2 = nil
	end
	t.cardStyle = t_2
	t.previewRows = var8
	t.previewColumns = var6
	
	return t
end

local function formatWidgetTemplateAsCarousel(p6, p7, p8)
	-- upvalues: t_3 (ref), getFormattedBackgroundLayers (ref)
	local var3
	local previewColumns = p6.previewColumns
	
	if previewColumns then
		local var4 = if p7 and t_3[p7] then t_3[p7] else "default"
		var3 = if previewColumns[var4] then previewColumns[var4] else previewColumns.default
	else
		var3 = nil
	end
	local var5
	local var6 = var3 or 1
	local previewRows = p6.previewRows
	
	if previewRows then
		local var7 = if p7 and t_3[p7] then t_3[p7] else "default"
		var5 = if previewRows[var7] then previewRows[var7] else previewRows.default
	else
		var5 = nil
	end
	local t_1
	local var8 = var5 or 1
	local t = {
		type = "Carousel",
		numItemsToShow = p6.numItemsToShow,
		seeAllButton = p6.seeAllButton,
		title = p6.title,
		localizedTitle = p6.localizedTitle,
		description = p6.description,
		localizedDescription = p6.localizedDescription,
		itemFooters = p6.itemFooters
	}
	
	if p6.widgetStyle then
		local widgetStyle = p6.widgetStyle
		t_1 = {
			backgroundLayers = if widgetStyle.backgroundLayers then getFormattedBackgroundLayers(widgetStyle.backgroundLayers, p7, p8) else nil
		}
	else
		t_1 = nil
	end
	local t_2
	t.widgetStyle = t_1
	
	if p6.cardStyle then
		local cardStyle = p6.cardStyle
		t_2 = {
			backgroundLayers = if cardStyle.backgroundLayers then getFormattedBackgroundLayers(cardStyle.backgroundLayers, p7, p8) else nil,
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t_2 = nil
	end
	t.cardStyle = t_2
	t.previewRows = var8
	t.previewColumns = var6
	
	return t
end

local function formatWidgetTemplateAsHeroUnit(p6, p7, p8)
	-- upvalues: t_3 (ref), getFormattedBackgroundLayers (ref)
	local var3
	local previewColumns = p6.previewColumns
	
	if previewColumns then
		local var4 = if p7 and t_3[p7] then t_3[p7] else "default"
		var3 = if previewColumns[var4] then previewColumns[var4] else previewColumns.default
	else
		var3 = nil
	end
	local var5
	local var6 = var3 or 1
	local previewRows = p6.previewRows
	
	if previewRows then
		local var7 = if p7 and t_3[p7] then t_3[p7] else "default"
		var5 = if previewRows[var7] then previewRows[var7] else previewRows.default
	else
		var5 = nil
	end
	local t_1
	local var8 = var5 or 1
	local t = {
		type = "HeroUnit",
		numItemsToShow = p6.numItemsToShow,
		seeAllButton = p6.seeAllButton,
		title = p6.title,
		localizedTitle = p6.localizedTitle,
		description = p6.description,
		localizedDescription = p6.localizedDescription,
		itemFooters = p6.itemFooters
	}
	
	if p6.widgetStyle then
		local widgetStyle = p6.widgetStyle
		t_1 = {
			backgroundLayers = if widgetStyle.backgroundLayers then getFormattedBackgroundLayers(widgetStyle.backgroundLayers, p7, p8) else nil
		}
	else
		t_1 = nil
	end
	local t_2
	t.widgetStyle = t_1
	
	if p6.cardStyle then
		local cardStyle = p6.cardStyle
		t_2 = {
			backgroundLayers = if cardStyle.backgroundLayers then getFormattedBackgroundLayers(cardStyle.backgroundLayers, p7, p8) else nil,
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t_2 = nil
	end
	t.cardStyle = t_2
	t.previewRows = var8
	t.previewColumns = var6
	t.availableUntil = p6.availableUntil
	
	return t
end

local function mergeCardStyle(p6, p7)
	-- upvalues: cryoModule (ref)
	if not p6 and not p7 then
		return nil
	end
	local var3 = if p7 then p7.thumbnailAspectRatio else nil
	
	return {
		thumbnailAspectRatio = if var3 == nil then if p6 then p6.thumbnailAspectRatio else nil else var3,
		backgroundLayers = cryoModule.Dictionary.join(if p6 and p6.backgroundLayers then p6.backgroundLayers else {}, if p7 and p7.backgroundLayers then p7.backgroundLayers else {})
	}
end

local function mergeWidgetStyle(p6, p7)
	-- upvalues: cryoModule (ref)
	return if not (not p6 and not p7) then {
		backgroundLayers = cryoModule.Dictionary.join(if p6 and p6.backgroundLayers then p6.backgroundLayers else {}, if p7 and p7.backgroundLayers then p7.backgroundLayers else {})
	} else nil
end

local function mergeItemGroupTemplates(p6, p7)
	-- upvalues: mergeWidgetStyle (ref), mergeCardStyle (ref), cryoModule (ref)
	return {
		type = "ItemGroup",
		seeAllButton = if p7.seeAllButton == nil then p6.seeAllButton else p7.seeAllButton,
		title = if p7.title == nil then p6.title else p7.title,
		localizedTitle = if p7.localizedTitle == nil then p6.localizedTitle else p7.localizedTitle,
		description = if p7.description == nil then p6.description else p7.description,
		localizedDescription = if p7.localizedDescription == nil then p6.localizedDescription else p7.localizedDescription,
		itemFooters = if p7.itemFooters == nil then p6.itemFooters else p7.itemFooters,
		widgetStyle = mergeWidgetStyle(p6.widgetStyle, p7.widgetStyle),
		cardStyle = mergeCardStyle(p6.cardStyle, p7.cardStyle),
		previewRows = cryoModule.Dictionary.join(p6.previewRows or {}, p7.previewRows or {}),
		previewColumns = cryoModule.Dictionary.join(p6.previewColumns or {}, p7.previewColumns or {})
	}
end

local function mergeCarouselTemplates(p6, p7)
	-- upvalues: mergeWidgetStyle (ref), mergeCardStyle (ref), cryoModule (ref)
	return {
		type = "Carousel",
		numItemsToShow = if p7.numItemsToShow == nil then p6.numItemsToShow else p7.numItemsToShow,
		seeAllButton = if p7.seeAllButton == nil then p6.seeAllButton else p7.seeAllButton,
		title = if p7.title == nil then p6.title else p7.title,
		localizedTitle = if p7.localizedTitle == nil then p6.localizedTitle else p7.localizedTitle,
		description = if p7.description == nil then p6.description else p7.description,
		localizedDescription = if p7.localizedDescription == nil then p6.localizedDescription else p7.localizedDescription,
		itemFooters = if p7.itemFooters == nil then p6.itemFooters else p7.itemFooters,
		widgetStyle = mergeWidgetStyle(p6.widgetStyle, p7.widgetStyle),
		cardStyle = mergeCardStyle(p6.cardStyle, p7.cardStyle),
		previewRows = cryoModule.Dictionary.join(p6.previewRows or {}, p7.previewRows or {}),
		previewColumns = cryoModule.Dictionary.join(p6.previewColumns or {}, p7.previewColumns or {})
	}
end

local function mergeHeroUnitTemplates(p6, p7)
	-- upvalues: mergeWidgetStyle (ref), mergeCardStyle (ref), cryoModule (ref)
	return {
		type = "HeroUnit",
		numItemsToShow = if p7.numItemsToShow == nil then p6.numItemsToShow else p7.numItemsToShow,
		seeAllButton = if p7.seeAllButton == nil then p6.seeAllButton else p7.seeAllButton,
		title = if p7.title == nil then p6.title else p7.title,
		localizedTitle = if p7.localizedTitle == nil then p6.localizedTitle else p7.localizedTitle,
		description = if p7.description == nil then p6.description else p7.description,
		localizedDescription = if p7.localizedDescription == nil then p6.localizedDescription else p7.localizedDescription,
		itemFooters = if p7.itemFooters == nil then p6.itemFooters else p7.itemFooters,
		widgetStyle = mergeWidgetStyle(p6.widgetStyle, p7.widgetStyle),
		cardStyle = mergeCardStyle(p6.cardStyle, p7.cardStyle),
		previewRows = cryoModule.Dictionary.join(p6.previewRows or {}, p7.previewRows or {}),
		previewColumns = cryoModule.Dictionary.join(p6.previewColumns or {}, p7.previewColumns or {}),
		availableUntil = if p7.availableUntil == nil then p6.availableUntil else p7.availableUntil
	}
end

local _ = function(p6)
	local cloned = table.clone(p6)
	cloned.type = "ItemGroup"
	cloned.numItemsToShow = nil
	
	return cloned
end

local function formatWidgetListStateToWidgetListInfoViewModel(p6, p7, p8, p9)
	-- upvalues: fFlagAXNoCarouselsOnCatalogWithGamepadModule (ref), responsiveModule (ref), cryoModule (ref), t (ref), t_1 (ref), formatWidgetTemplateAsHeroUnit (ref), mergeHeroUnitTemplates (ref), t_2 (ref), formatWidgetTemplateAsCarousel (ref), mergeCarouselTemplates (ref), formatWidgetTemplateAsItemGroup (ref), mergeItemGroupTemplates (ref)
	local var3
	local t_3 = { configuration = {}, widgets = {} }
	local var4 = if p6 then p6.Configuration else nil
	
	if fFlagAXNoCarouselsOnCatalogWithGamepadModule then
		var3 = p9 ~= responsiveModule.Input.Directional
		var3 = nil
	else
		var3 = nil
	end
	local var5 = if var4 and var4.defaultItemCarouselTemplate then cryoModule.Dictionary.join(t, var4.defaultItemCarouselTemplate) else t
	local var6 = if var4 and var4.defaultItemGroupTemplate then cryoModule.Dictionary.join(t_1, var4.defaultItemGroupTemplate) elseif var4 and var4.defaultTemplate then cryoModule.Dictionary.join(t_1, var4.defaultTemplate) else t_1
	
	if p6 and p6.Details then
		for i, v in p6.Details do
			local template
			if not fFlagAXNoCarouselsOnCatalogWithGamepadModule then
				template = nil
			elseif v.template.type == "Carousel" and not var3 then
				local cloned = table.clone(v.template)
				cloned.type = "ItemGroup"
				cloned.numItemsToShow = nil
				template = cloned
			else
				template = v.template
			end
			local _ = nil
			local var7 = if fFlagAXNoCarouselsOnCatalogWithGamepadModule then template else v.template
			local type = var7.type
			t_3.widgets[i] = {
				id = v.id,
				type = v.type,
				content = v.content,
				tagId = v.tagId,
				template = if type == "HeroUnit" then formatWidgetTemplateAsHeroUnit(mergeHeroUnitTemplates(t_2, var7), p7, p8) elseif type == "Carousel" then formatWidgetTemplateAsCarousel(mergeCarouselTemplates(var5, var7), p7, p8) else formatWidgetTemplateAsItemGroup(mergeItemGroupTemplates(var6, var7), p7, p8),
				requestId = p6.RequestId
			}
		end
	end
	if var4 then
		t_3.configuration.customizedDataMap = var4.customizedDataMap
	end
	t_3.configuration.defaultItemGroupTemplate = formatWidgetTemplateAsItemGroup(var6, p7, p8)
	t_3.configuration.defaultItemCarouselTemplate = formatWidgetTemplateAsCarousel(var5, p7, p8)
	
	return t_3
end

return function(p10, p11, p12)
	-- upvalues: widgetListBreakPointEnumModule (ref), fFlagAXNoCarouselsOnCatalogWithGamepadModule (ref), useSignalState (ref), inputModeStore (ref), reactModule (ref), getQueryStringForSearchWidgets (ref), useSelector (ref), useTokens (ref), formatWidgetListStateToWidgetListInfoViewModel (ref)
	local var8 = p12 or widgetListBreakPointEnumModule.Default
	local var9 = if fFlagAXNoCarouselsOnCatalogWithGamepadModule then useSignalState(inputModeStore.getLastInputType) else nil
	local var10 = useSelector(reactModule.useCallback(function(p13)
		-- upvalues: p10 (ref), getQueryStringForSearchWidgets (copy), p11 (ref)
		local var11 = p13.SearchesParameters[p10]
		
		return if var11 and var11.searchKeyword ~= nil then p13.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[getQueryStringForSearchWidgets(var11)] elseif p11 then p13.AvatarExperience.Common.Widgets.ContextWidgetInfo[p11] else p13.AvatarExperience.Common.Widgets.WidgetInfo
	end, { p10, p11 }))
	local var11 = useTokens()
	
	return reactModule.useMemo(function()
		-- upvalues: formatWidgetListStateToWidgetListInfoViewModel (copy), var10 (ref), var8 (ref), var11 (ref), fFlagAXNoCarouselsOnCatalogWithGamepadModule (copy), var9 (ref)
		return formatWidgetListStateToWidgetListInfoViewModel(var10, var8, var11.Config.ColorMode.Name, if fFlagAXNoCarouselsOnCatalogWithGamepadModule then var9 else nil)
	end, {
		var11.Config.ColorMode.Name,
		var10,
		var8,
		if fFlagAXNoCarouselsOnCatalogWithGamepadModule then var9 else nil
	})
end