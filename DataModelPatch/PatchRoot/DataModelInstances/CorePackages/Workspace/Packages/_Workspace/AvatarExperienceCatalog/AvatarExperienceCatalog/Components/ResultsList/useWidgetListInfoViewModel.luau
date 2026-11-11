local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ResponsiveModule = require(Parent.Responsive)
local InputModeStore = ResponsiveModule.GetInputModeStore(false)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagAXNoCarouselsOnCatalogWithGamepadModule = require(AvatarExperienceCatalog.Flags.FFlagAXNoCarouselsOnCatalogWithGamepad)
local FFlagAXHeroWidget = require(Parent.AvatarExperienceFlags).FFlagAXHeroWidget
local _ = require(AvatarExperienceCatalog.Models.WidgetListInfo)
local _ = require(script.Parent.WidgetListInfoViewModel)
local WidgetListBreakPointEnumModule = require(script.Parent.WidgetListBreakPointEnum)
local ItemFooters = {
	{ contentType = "ItemName" },
	{ contentType = "Price" },
	{ contentType = "AgentName" }
}
local config = {
	type = "Carousel",
	numItemsToShow = 12,
	itemFooters = ItemFooters,
	previewRows = { default = 1 },
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
}
local config1 = {
	type = "ItemGroup",
	itemFooters = ItemFooters,
	previewRows = { default = 1 },
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
}
local Config = if FFlagAXHeroWidget then {
	type = "HeroUnit",
	itemFooters = ItemFooters,
	previewRows = { default = 1 },
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
} else nil
local config2 = {
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
local config3 = { Dark = "dark", Light = "light", Default = "default" }

local function getQueryStringForSearchWidgets(SearchesParameter): string?
	if not SearchesParameter or not SearchesParameter.searchKeyword then
		return nil
	end
	local List = { SearchesParameter.searchKeyword }
	
	if SearchesParameter.sortAndFilters and SearchesParameter.sortAndFilters.SelectedTopics then
		for _, selectedTopic in SearchesParameter.sortAndFilters.SelectedTopics do
			table.insert(List, 1, selectedTopic)
		end
	end
	return table.concat(List, " ")
end

local function _(p1)
	-- upvalues: CryoModule (copy), config1 (copy)
	return if p1 and p1.defaultItemGroupTemplate then CryoModule.Dictionary.join(config1, p1.defaultItemGroupTemplate) elseif p1 and p1.defaultTemplate then CryoModule.Dictionary.join(config1, p1.defaultTemplate) else config1
end

local _ = function(p1)
	-- upvalues: CryoModule (copy), config (copy)
	return if p1 and p1.defaultItemCarouselTemplate then CryoModule.Dictionary.join(config, p1.defaultItemCarouselTemplate) else config
end

local _ = function(p1, p2)
	-- upvalues: config2 (copy)
	if p1 then
		local Entry = if p2 and config2[p2] then config2[p2] else "default"
		
		return if p1[Entry] then p1[Entry] else p1.default
	else
		return nil
	end
end

local _ = function(p1, p2)
	-- upvalues: config3 (copy)
	if p1 then
		local Entry = if p2 and config3[p2] then config3[p2] else "default"
		
		return if p1[Entry] then p1[Entry] else p1.default
	else
		return nil
	end
end

local function colorToColor3(Color): Color3
	return Color3.new(Color.r, Color.g, Color.b)
end

local function pointToVector2(Vector): Vector2
	return Vector2.new(Vector.x, Vector.y)
end

local function pointToUDim2(Vector): UDim2
	return UDim2.fromOffset(Vector.x, Vector.y)
end

local _ = function(p1, p2)
	-- upvalues: config2 (copy), pointToVector2 (copy)
	local Default = nil
	if p1 then
		local Entry = if p2 and config2[p2] then config2[p2] else "default"
		Default = if p1[Entry] then p1[Entry] else p1.default
	else
		Default = nil
	end
	return pointToVector2(if Default then Default else { x = 0, y = 0 })
end

local _ = function(p1, p2)
	-- upvalues: config2 (copy), pointToUDim2 (copy)
	local Default = nil
	if p1 then
		local Entry = if p2 and config2[p2] then config2[p2] else "default"
		Default = if p1[Entry] then p1[Entry] else p1.default
	else
		Default = nil
	end
	return pointToUDim2(if Default then Default else { x = 0, y = 0 })
end

local function formatColorSequence(ColorSequence1): ColorSequence
	-- upvalues: colorToColor3 (copy)
	local ColorSequenceKeypoints = {}
	
	for _, value in ColorSequence1 do
		table.insert(ColorSequenceKeypoints, ColorSequenceKeypoint.new(value.time, colorToColor3(value.color)))
	end
	return ColorSequence.new(ColorSequenceKeypoints)
end

local function formatNumberSequence(Transparency): NumberSequence?
	if type(Transparency) == "number" then
		return NumberSequence.new(Transparency)
	end
	if #Transparency == 0 then
		return nil
	end
	local List = {}
	
	for _, value in Transparency do
		table.insert(List, NumberSequenceKeypoint.new(value.time, value.number))
	end
	return NumberSequence.new(List)
end

local function formatImageBackground(p1, p2)
	-- upvalues: config2 (copy)
	local AnchorPoint1 = nil
	if p1.anchorPoint then
		local AnchorPoint = p1.anchorPoint
		local Default = nil
		
		if AnchorPoint then
			local Entry = if p2 and config2[p2] then config2[p2] else "default"
			Default = if AnchorPoint[Entry] then AnchorPoint[Entry] else AnchorPoint.default
		else
			Default = nil
		end
		local Default1 = if Default then Default else { x = 0, y = 0 }
		AnchorPoint1 = Vector2.new(Default1.x, Default1.y)
	else
		AnchorPoint1 = nil
	end
	local Position1 = nil
	if p1.position then
		local Position = p1.position
		local Default = nil
		
		if Position then
			local Entry = if p2 and config2[p2] then config2[p2] else "default"
			Default = if Position[Entry] then Position[Entry] else Position.default
		else
			Default = nil
		end
		local Default2 = if Default then Default else { x = 0, y = 0 }
		Position1 = UDim2.fromOffset(Default2.x, Default2.y)
	else
		Position1 = nil
	end
	local config = { type = "ImageBackground" }
	local Default = nil
	
	if p1.resourceIdentifier then
		local ResourceIdentifier = p1.resourceIdentifier
		
		if ResourceIdentifier then
			local Entry = if p2 and config2[p2] then config2[p2] else "default"
			Default = if ResourceIdentifier[Entry] then ResourceIdentifier[Entry] else ResourceIdentifier.default
		else
			Default = nil
		end
	else
		Default = nil
	end
	config.resourceIdentifier = Default
	local _Color3 = nil
	
	if p1.color then
		local Color = p1.color
		_Color3 = Color3.new(Color.r, Color.g, Color.b)
	else
		_Color3 = nil
	end
	config.color = _Color3
	config.anchorPoint = AnchorPoint1
	config.position = Position1
	local Default3 = nil
	
	if p1.transparency then
		local Transparency = p1.transparency
		
		if Transparency then
			local Entry = if p2 and config2[p2] then config2[p2] else "default"
			Default3 = if Transparency[Entry] then Transparency[Entry] else Transparency.default
		else
			Default3 = nil
		end
	else
		Default3 = nil
	end
	config.transparency = Default3
	
	return config
end

local function formatGradientBackground(p1)
	-- upvalues: formatColorSequence (copy), formatNumberSequence (copy)
	local config = {
		type = "GradientBackground",
		colorSequence = formatColorSequence(p1.colorSequence),
		rotation = p1.rotation,
		transparency = if p1.transparency then formatNumberSequence(p1.transparency) else nil
	}
	local _Vector2 = nil
	
	if p1.offset then
		local Offset = p1.offset
		_Vector2 = Vector2.new(Offset.x, Offset.y)
	else
		_Vector2 = nil
	end
	config.offset = _Vector2
	
	return config
end

local function getFormattedBackgroundLayers(BackgroundLayers, p1, p2)
	-- upvalues: config3 (copy), formatImageBackground (copy), formatGradientBackground (copy)
	local Default = nil
	if BackgroundLayers then
		local Entry = if p2 and config3[p2] then config3[p2] else "default"
		Default = if BackgroundLayers[Entry] then BackgroundLayers[Entry] else BackgroundLayers.default
	else
		Default = nil
	end
	if not Default then
		Default = {}
	end
	local List = {}
	
	for _, value in Default do
		if value.type == "ImageBackground" then
			table.insert(List, (formatImageBackground(value, p1)))
		elseif value.type == "GradientBackground" then
			table.insert(List, (formatGradientBackground(value)))
		end
	end
	return List
end

local _ = function(CardStyle, p3, p4)
	-- upvalues: getFormattedBackgroundLayers (copy)
	return {
		backgroundLayers = if CardStyle.backgroundLayers then getFormattedBackgroundLayers(CardStyle.backgroundLayers, p3, p4) else nil,
		thumbnailAspectRatio = CardStyle.thumbnailAspectRatio
	}
end

local _ = function(p3, p4, p5)
	-- upvalues: getFormattedBackgroundLayers (copy)
	return {
		backgroundLayers = if p3.backgroundLayers then getFormattedBackgroundLayers(p3.backgroundLayers, p4, p5) else nil
	}
end

local function formatWidgetTemplateAsItemGroup(JoinResult, p3, p4)
	-- upvalues: config2 (copy), getFormattedBackgroundLayers (copy)
	local PreviewColumns = JoinResult.previewColumns
	local Default = nil
	
	if PreviewColumns then
		local Entry = if p3 and config2[p3] then config2[p3] else "default"
		Default = if PreviewColumns[Entry] then PreviewColumns[Entry] else PreviewColumns.default
	else
		Default = nil
	end
	local Default1 = Default or 1
	local PreviewRows = JoinResult.previewRows
	local Default2 = nil
	
	if PreviewRows then
		local Entry = if p3 and config2[p3] then config2[p3] else "default"
		Default2 = if PreviewRows[Entry] then PreviewRows[Entry] else PreviewRows.default
	else
		Default2 = nil
	end
	local Default21 = Default2 or 1
	local config = {
		type = "ItemGroup",
		seeAllButton = JoinResult.seeAllButton,
		title = JoinResult.title,
		localizedTitle = JoinResult.localizedTitle,
		description = JoinResult.description,
		localizedDescription = JoinResult.localizedDescription,
		itemFooters = JoinResult.itemFooters
	}
	local WidgetStyle1 = nil
	
	if JoinResult.widgetStyle then
		local WidgetStyle = JoinResult.widgetStyle
		WidgetStyle1 = {
			backgroundLayers = if WidgetStyle.backgroundLayers then getFormattedBackgroundLayers(WidgetStyle.backgroundLayers, p3, p4) else nil
		}
	else
		WidgetStyle1 = nil
	end
	config.widgetStyle = WidgetStyle1
	local CardStyle1 = nil
	
	if JoinResult.cardStyle then
		local CardStyle = JoinResult.cardStyle
		CardStyle1 = {
			backgroundLayers = if CardStyle.backgroundLayers then getFormattedBackgroundLayers(CardStyle.backgroundLayers, p3, p4) else nil,
			thumbnailAspectRatio = CardStyle.thumbnailAspectRatio
		}
	else
		CardStyle1 = nil
	end
	config.cardStyle = CardStyle1
	config.previewRows = Default21
	config.previewColumns = Default1
	
	return config
end

local function formatWidgetTemplateAsCarousel(JoinResult, p3, p4)
	-- upvalues: config2 (copy), getFormattedBackgroundLayers (copy)
	local PreviewColumns = JoinResult.previewColumns
	local Default = nil
	
	if PreviewColumns then
		local Entry = if p3 and config2[p3] then config2[p3] else "default"
		Default = if PreviewColumns[Entry] then PreviewColumns[Entry] else PreviewColumns.default
	else
		Default = nil
	end
	local Default1 = Default or 1
	local PreviewRows = JoinResult.previewRows
	local Default2 = nil
	
	if PreviewRows then
		local Entry = if p3 and config2[p3] then config2[p3] else "default"
		Default2 = if PreviewRows[Entry] then PreviewRows[Entry] else PreviewRows.default
	else
		Default2 = nil
	end
	local Default21 = Default2 or 1
	local config = {
		type = "Carousel",
		numItemsToShow = JoinResult.numItemsToShow,
		seeAllButton = JoinResult.seeAllButton,
		title = JoinResult.title,
		localizedTitle = JoinResult.localizedTitle,
		description = JoinResult.description,
		localizedDescription = JoinResult.localizedDescription,
		itemFooters = JoinResult.itemFooters
	}
	local WidgetStyle1 = nil
	
	if JoinResult.widgetStyle then
		local WidgetStyle = JoinResult.widgetStyle
		WidgetStyle1 = {
			backgroundLayers = if WidgetStyle.backgroundLayers then getFormattedBackgroundLayers(WidgetStyle.backgroundLayers, p3, p4) else nil
		}
	else
		WidgetStyle1 = nil
	end
	config.widgetStyle = WidgetStyle1
	local CardStyle1 = nil
	
	if JoinResult.cardStyle then
		local CardStyle = JoinResult.cardStyle
		CardStyle1 = {
			backgroundLayers = if CardStyle.backgroundLayers then getFormattedBackgroundLayers(CardStyle.backgroundLayers, p3, p4) else nil,
			thumbnailAspectRatio = CardStyle.thumbnailAspectRatio
		}
	else
		CardStyle1 = nil
	end
	config.cardStyle = CardStyle1
	config.previewRows = Default21
	config.previewColumns = Default1
	
	return config
end

local Callback = if FFlagAXHeroWidget then function(p3, p4, p5)
	-- upvalues: config2 (copy), getFormattedBackgroundLayers (copy)
	local PreviewColumns = p3.previewColumns
	local Default = nil
	
	if PreviewColumns then
		local Entry = if p4 and config2[p4] then config2[p4] else "default"
		Default = if PreviewColumns[Entry] then PreviewColumns[Entry] else PreviewColumns.default
	else
		Default = nil
	end
	local Default1 = Default or 1
	local PreviewRows = p3.previewRows
	local Default2 = nil
	
	if PreviewRows then
		local Entry = if p4 and config2[p4] then config2[p4] else "default"
		Default2 = if PreviewRows[Entry] then PreviewRows[Entry] else PreviewRows.default
	else
		Default2 = nil
	end
	local Default21 = Default2 or 1
	local config = {
		type = "HeroUnit",
		numItemsToShow = p3.numItemsToShow,
		seeAllButton = p3.seeAllButton,
		title = p3.title,
		localizedTitle = p3.localizedTitle,
		description = p3.description,
		localizedDescription = p3.localizedDescription,
		itemFooters = p3.itemFooters
	}
	local WidgetStyle1 = nil
	
	if p3.widgetStyle then
		local WidgetStyle = p3.widgetStyle
		WidgetStyle1 = {
			backgroundLayers = if WidgetStyle.backgroundLayers then getFormattedBackgroundLayers(WidgetStyle.backgroundLayers, p4, p5) else nil
		}
	else
		WidgetStyle1 = nil
	end
	config.widgetStyle = WidgetStyle1
	local CardStyle1 = nil
	
	if p3.cardStyle then
		local CardStyle = p3.cardStyle
		CardStyle1 = {
			backgroundLayers = if CardStyle.backgroundLayers then getFormattedBackgroundLayers(CardStyle.backgroundLayers, p4, p5) else nil,
			thumbnailAspectRatio = CardStyle.thumbnailAspectRatio
		}
	else
		CardStyle1 = nil
	end
	config.cardStyle = CardStyle1
	config.previewRows = Default21
	config.previewColumns = Default1
	config.availableUntil = p3.availableUntil
	
	return config
end else nil

local function mergeCardStyle(CardStyle, CardStyle1)
	-- upvalues: CryoModule (copy)
	if CardStyle or CardStyle1 then
		local ThumbnailAspectRatio = if CardStyle1 then CardStyle1.thumbnailAspectRatio else nil
		local ThumbnailAspectRatio1 = if CardStyle then CardStyle.thumbnailAspectRatio else nil
		
		return {
			thumbnailAspectRatio = if ThumbnailAspectRatio == nil then ThumbnailAspectRatio1 else ThumbnailAspectRatio,
			backgroundLayers = CryoModule.Dictionary.join(if CardStyle and CardStyle.backgroundLayers then CardStyle.backgroundLayers else {}, if CardStyle1 and CardStyle1.backgroundLayers then CardStyle1.backgroundLayers else {})
		}
	else
		return nil
	end
end

local function mergeWidgetStyle(WidgetStyle, WidgetStyle1)
	-- upvalues: CryoModule (copy)
	return if WidgetStyle or WidgetStyle1 then {
		backgroundLayers = CryoModule.Dictionary.join(if WidgetStyle and WidgetStyle.backgroundLayers then WidgetStyle.backgroundLayers else {}, if WidgetStyle1 and WidgetStyle1.backgroundLayers then WidgetStyle1.backgroundLayers else {})
	} else nil
end

local function mergeItemGroupTemplates(JoinResult, Template)
	-- upvalues: mergeWidgetStyle (copy), mergeCardStyle (copy), CryoModule (copy)
	return {
		type = "ItemGroup",
		seeAllButton = if Template.seeAllButton == nil then JoinResult.seeAllButton else Template.seeAllButton,
		title = if Template.title == nil then JoinResult.title else Template.title,
		localizedTitle = if Template.localizedTitle == nil then JoinResult.localizedTitle else Template.localizedTitle,
		description = if Template.description == nil then JoinResult.description else Template.description,
		localizedDescription = if Template.localizedDescription == nil then JoinResult.localizedDescription else Template.localizedDescription,
		itemFooters = if Template.itemFooters == nil then JoinResult.itemFooters else Template.itemFooters,
		widgetStyle = mergeWidgetStyle(JoinResult.widgetStyle, Template.widgetStyle),
		cardStyle = mergeCardStyle(JoinResult.cardStyle, Template.cardStyle),
		previewRows = CryoModule.Dictionary.join(JoinResult.previewRows or {}, Template.previewRows or {}),
		previewColumns = CryoModule.Dictionary.join(JoinResult.previewColumns or {}, Template.previewColumns or {})
	}
end

local function mergeCarouselTemplates(JoinResult, Template)
	-- upvalues: mergeWidgetStyle (copy), mergeCardStyle (copy), CryoModule (copy)
	return {
		type = "Carousel",
		numItemsToShow = if Template.numItemsToShow == nil then JoinResult.numItemsToShow else Template.numItemsToShow,
		seeAllButton = if Template.seeAllButton == nil then JoinResult.seeAllButton else Template.seeAllButton,
		title = if Template.title == nil then JoinResult.title else Template.title,
		localizedTitle = if Template.localizedTitle == nil then JoinResult.localizedTitle else Template.localizedTitle,
		description = if Template.description == nil then JoinResult.description else Template.description,
		localizedDescription = if Template.localizedDescription == nil then JoinResult.localizedDescription else Template.localizedDescription,
		itemFooters = if Template.itemFooters == nil then JoinResult.itemFooters else Template.itemFooters,
		widgetStyle = mergeWidgetStyle(JoinResult.widgetStyle, Template.widgetStyle),
		cardStyle = mergeCardStyle(JoinResult.cardStyle, Template.cardStyle),
		previewRows = CryoModule.Dictionary.join(JoinResult.previewRows or {}, Template.previewRows or {}),
		previewColumns = CryoModule.Dictionary.join(JoinResult.previewColumns or {}, Template.previewColumns or {})
	}
end

local Callback1 = if FFlagAXHeroWidget then function(p3, p4)
	-- upvalues: mergeWidgetStyle (copy), mergeCardStyle (copy), CryoModule (copy)
	return {
		type = "HeroUnit",
		numItemsToShow = if p4.numItemsToShow == nil then p3.numItemsToShow else p4.numItemsToShow,
		seeAllButton = if p4.seeAllButton == nil then p3.seeAllButton else p4.seeAllButton,
		title = if p4.title == nil then p3.title else p4.title,
		localizedTitle = if p4.localizedTitle == nil then p3.localizedTitle else p4.localizedTitle,
		description = if p4.description == nil then p3.description else p4.description,
		localizedDescription = if p4.localizedDescription == nil then p3.localizedDescription else p4.localizedDescription,
		itemFooters = if p4.itemFooters == nil then p3.itemFooters else p4.itemFooters,
		widgetStyle = mergeWidgetStyle(p3.widgetStyle, p4.widgetStyle),
		cardStyle = mergeCardStyle(p3.cardStyle, p4.cardStyle),
		previewRows = CryoModule.Dictionary.join(p3.previewRows or {}, p4.previewRows or {}),
		previewColumns = CryoModule.Dictionary.join(p3.previewColumns or {}, p4.previewColumns or {}),
		availableUntil = if p4.availableUntil == nil then p3.availableUntil else p4.availableUntil
	}
end else nil

local _ = function(Tbl)
	local Copy = table.clone(Tbl)
	Copy.type = "ItemGroup"
	Copy.numItemsToShow = nil
	
	return Copy
end

local function formatWidgetListStateToWidgetListInfoViewModel(p3, Default, Name, Directional)
	-- upvalues: FFlagAXNoCarouselsOnCatalogWithGamepadModule (copy), ResponsiveModule (copy), CryoModule (copy), config (copy), config1 (copy), FFlagAXHeroWidget (copy), Config (copy), Callback (copy), Callback1 (copy), formatWidgetTemplateAsCarousel (copy), mergeCarouselTemplates (copy), formatWidgetTemplateAsItemGroup (copy), mergeItemGroupTemplates (copy)
	local config2 = { configuration = {}, widgets = {} }
	local Configuration = if p3 then p3.Configuration else nil
	local IsNotDirectionalMatch = if FFlagAXNoCarouselsOnCatalogWithGamepadModule then Directional ~= ResponsiveModule.Input.Directional else nil
	local JoinResult = if Configuration and Configuration.defaultItemCarouselTemplate then CryoModule.Dictionary.join(config, Configuration.defaultItemCarouselTemplate) else config
	local JoinResult1 = if Configuration and Configuration.defaultItemGroupTemplate then CryoModule.Dictionary.join(config1, Configuration.defaultItemGroupTemplate) elseif Configuration and Configuration.defaultTemplate then CryoModule.Dictionary.join(config1, Configuration.defaultTemplate) else config1
	local Config1 = if FFlagAXHeroWidget then Config else nil
	
	if p3 and p3.Details then
		for i, detail in p3.Details do
			local Template = nil
			if FFlagAXNoCarouselsOnCatalogWithGamepadModule then
				if detail.template.type == "Carousel" and not IsNotDirectionalMatch then
					local Copy = table.clone(detail.template)
					Copy.type = "ItemGroup"
					Copy.numItemsToShow = nil
					Template = Copy
				else
					Template = detail.template
				end
			else
				Template = nil
			end
			local CallbackResult = nil
			if FFlagAXHeroWidget then
				local Template1 = if FFlagAXNoCarouselsOnCatalogWithGamepadModule then Template else detail.template
				local Type = Template1.type
				local IsCarousel = Type == "Carousel"
				local IsHeroUnit = Type == "HeroUnit"
				CallbackResult = if IsHeroUnit then Callback(Callback1(Config1, Template1), Default, Name) elseif IsCarousel then formatWidgetTemplateAsCarousel(mergeCarouselTemplates(JoinResult, Template1), Default, Name) else formatWidgetTemplateAsItemGroup(mergeItemGroupTemplates(JoinResult1, Template1), Default, Name)
			else
				local IsCarousel: boolean = if FFlagAXNoCarouselsOnCatalogWithGamepadModule then Template.type == "Carousel" else detail.template.type == "Carousel"
				CallbackResult = if IsCarousel then formatWidgetTemplateAsCarousel(mergeCarouselTemplates(JoinResult, if FFlagAXNoCarouselsOnCatalogWithGamepadModule then Template else detail.template), Default, Name) else formatWidgetTemplateAsItemGroup(mergeItemGroupTemplates(JoinResult1, if FFlagAXNoCarouselsOnCatalogWithGamepadModule then Template else detail.template), Default, Name)
			end
			config2.widgets[i] = {
				id = detail.id,
				type = detail.type,
				content = detail.content,
				tagId = detail.tagId,
				template = CallbackResult,
				requestId = p3.RequestId
			}
		end
	end
	if Configuration then
		config2.configuration.customizedDataMap = Configuration.customizedDataMap
	end
	config2.configuration.defaultItemGroupTemplate = formatWidgetTemplateAsItemGroup(JoinResult1, Default, Name)
	config2.configuration.defaultItemCarouselTemplate = formatWidgetTemplateAsCarousel(JoinResult, Default, Name)
	
	return config2
end

return function(p4, p5, p6)
	-- upvalues: WidgetListBreakPointEnumModule (copy), FFlagAXNoCarouselsOnCatalogWithGamepadModule (copy), UseSignalStateFunction (copy), InputModeStore (copy), ReactModule (copy), getQueryStringForSearchWidgets (copy), UseSelectorFunction (copy), UseTokensFunction (copy), formatWidgetListStateToWidgetListInfoViewModel (copy)
	local Default = if p6 then p6 else WidgetListBreakPointEnumModule.Default
	local UseSignalStateResult = if FFlagAXNoCarouselsOnCatalogWithGamepadModule then UseSignalStateFunction(InputModeStore.getLastInputType) else nil
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p7)
		-- upvalues: p4 (copy), getQueryStringForSearchWidgets (upval), p5 (copy)
		local SearchesParameter = p7.SearchesParameters[p4]
		local HasSearchKeyword: boolean = SearchesParameter and SearchesParameter.searchKeyword ~= nil
		local QueryStringForSearchWidgets = getQueryStringForSearchWidgets(SearchesParameter)
		
		return if HasSearchKeyword then p7.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[QueryStringForSearchWidgets] elseif p5 then p7.AvatarExperience.Common.Widgets.ContextWidgetInfo[p5] else p7.AvatarExperience.Common.Widgets.WidgetInfo
	end, { p4, p5 })))
	local UseTokensResult = UseTokensFunction()
	
	return (ReactModule.useMemo(function()
		-- upvalues: formatWidgetListStateToWidgetListInfoViewModel (upval), UseSelectorResult (copy), Default (copy), UseTokensResult (copy), FFlagAXNoCarouselsOnCatalogWithGamepadModule (upval), UseSignalStateResult (copy)
		return (formatWidgetListStateToWidgetListInfoViewModel(UseSelectorResult, Default, UseTokensResult.Config.ColorMode.Name, if FFlagAXNoCarouselsOnCatalogWithGamepadModule then UseSignalStateResult else nil))
	end, {
		UseTokensResult.Config.ColorMode.Name,
		UseSelectorResult,
		Default,
		if FFlagAXNoCarouselsOnCatalogWithGamepadModule then UseSignalStateResult else nil
	}))
end