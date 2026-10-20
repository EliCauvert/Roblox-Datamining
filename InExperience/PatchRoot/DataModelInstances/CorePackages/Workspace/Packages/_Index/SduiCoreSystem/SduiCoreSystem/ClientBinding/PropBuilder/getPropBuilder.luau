local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local BuildDefaultPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildDefaultProp)
local BuildStringPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildStringProp)
local BuildTablePropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildTableProp)
local BuildRepeatedPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildRepeatedProp)
local BuildContainerPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildContainerProp)
local BuildActionPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildActionProp)
local SduiParsersModule = require(SduiCoreSystem.SduiParsers)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiClientBindingParsersModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiClientBindingParsers)
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local FFlagSduiMarketplaceCatalogCategorySupport = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogCategorySupport
local FFlagSduiMarketplaceCatalogSortSupport = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiCatalogItemCard = require(Parent.SharedFlags).FFlagSduiCatalogItemCard
local FFlagSduiSystemBannerComponent = require(Parent.SharedFlags).FFlagSduiSystemBannerComponent
local FFlagSduiBannerContextComponent = require(Parent.SharedFlags).FFlagSduiBannerContextComponent
local FFlagSduiListComponents = require(Parent.SharedFlags).FFlagSduiListComponents

local function _(p1, p2)
	return function(p3, p4, p5, p6, p7, p8)
		-- upvalues: p1 (copy), p2 (copy)
		local v1, v2 = p1(p3, p4, p5, p6, p7, p8, p2)
		
		return v1, v2
	end
end

local _ = function(p1, p2)
	-- upvalues: BuildDefaultPropModule (copy), SduiParsersModule (copy), ProtoVariableMapperModule (copy)
	local function v80(p3)
		-- upvalues: SduiParsersModule (upval), p1 (copy), ProtoVariableMapperModule (upval), p2 (copy)
		return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p3, p2, (SduiParsersModule.getEngineEnumParser(p1)))
	end
	
	return function(p3, p4, p5, p6, p7, p8)
		-- upvalues: BuildDefaultPropModule (copy), v80 (copy)
		local v1, v2 = BuildDefaultPropModule(p3, p4, p5, p6, p7, p8, v80)
		
		return v1, v2
	end
end

local ParseStruct = SduiClientBindingParsersModule.parseStruct

local function StructProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseStruct (copy)
	local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseStruct)
	
	return v1, v2
end

local ParseImageStringProp = SduiParsersModule.parseImageStringProp_

local function ImageStringProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildStringPropModule (copy), ParseImageStringProp (copy)
	local v1, v2 = BuildStringPropModule(p1, p2, p3, p4, p5, p6, ParseImageStringProp)
	
	return v1, v2
end

local ParseImageSetOrImageProp = SduiParsersModule.parseImageSetOrImageProp_

local function ImageSetProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildStringPropModule (copy), ParseImageSetOrImageProp (copy)
	local v1, v2 = BuildStringPropModule(p1, p2, p3, p4, p5, p6, ParseImageSetOrImageProp)
	
	return v1, v2
end

local ParseColorPropLegacy = SduiClientBindingParsersModule.parseColorPropLegacy

local function ColorProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseColorPropLegacy (copy)
	local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseColorPropLegacy)
	
	return v1, v2
end

local ParseColor3 = SduiClientBindingParsersModule.parseColor3

local function Color3Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseColor3 (copy)
	local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseColor3)
	
	return v1, v2
end

local ParseUDim = SduiClientBindingParsersModule.parseUDim

local function UDimProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseUDim (copy)
	local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseUDim)
	
	return v1, v2
end

local ParseUDim2 = SduiClientBindingParsersModule.parseUDim2

local function UDim2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseUDim2 (copy)
	local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseUDim2)
	
	return v1, v2
end

local ParseVector2Prop = SduiParsersModule.parseVector2Prop_

local function Vector2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseVector2Prop (copy)
	local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseVector2Prop)
	
	return v1, v2
end

local ParseStringArray = SduiClientBindingParsersModule.parseStringArray

local function StringArrayProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseStringArray (copy)
	local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseStringArray)
	
	return v1, v2
end

local ParseIconProp = SduiParsersModule.parseIconProp_
local ParseGradient = if require(Parent.SharedFlags).FFlagSduiParseProtoGradientFields then SduiClientBindingParsersModule.parseGradient else SduiParsersModule.parseGradientProp_
local ParseArrayOfStruct = SduiClientBindingParsersModule.parseArrayOfStruct
local config = {
	StringProp = BuildStringPropModule,
	BoolProp = BuildDefaultPropModule,
	FloatProp = BuildDefaultPropModule,
	DoubleProp = BuildDefaultPropModule,
	Int32Prop = BuildDefaultPropModule,
	Int64Prop = BuildDefaultPropModule,
	StructProp = StructProp,
	ImageStringProp = ImageStringProp,
	ImageSetProp = ImageSetProp,
	ColorProp = ColorProp,
	Color3Prop = Color3Prop,
	TypographyProp = BuildDefaultPropModule,
	TypographyFontProp = BuildDefaultPropModule,
	UDimProp = UDimProp,
	UDim2Prop = UDim2Prop,
	Vector2Prop = Vector2Prop,
	NestedComponentProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentProp),
	LazyNestedComponentProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentProp),
	NestedComponentListProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentListProp),
	LazyNestedComponentListProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentListProp),
	StringArrayProp = StringArrayProp,
	IconProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseIconProp (copy)
		local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseIconProp)
		
		return v1, v2
	end,
	GradientProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseGradient (copy)
		local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseGradient)
		
		return v1, v2
	end,
	ArrayOfStructProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseArrayOfStruct (copy)
		local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseArrayOfStruct)
		
		return v1, v2
	end
}

if require(Parent.SharedFlags).FFlagLuaAppSduiHomePageSupport then
	local ParsePymkItems = SduiClientBindingParsersModule.parsePymkItems
	
	local function ArrayOfPymkItemDataProp(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParsePymkItems (copy)
		local v1, v2 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParsePymkItems)
		
		return v1, v2
	end
else
	local ArrayOfPymkItemDataProp: ((any, any, any, any, any, any) -> any)? = nil
end
config.ArrayOfPymkItemDataProp = ArrayOfPymkItemDataProp
config.ActionProp = BuildActionPropModule
config.TableProp = BuildTablePropModule
config.ContainerProp = BuildContainerPropModule
config.ArrayOfMenuItemProp = BuildRepeatedPropModule
config.MenuItemProp = BuildTablePropModule
config.MenuItem = BuildTablePropModule
config.GenericShareLinkData = BuildTablePropModule
config.ShareLinkFetchData = BuildTablePropModule
config.ExperienceShareLinkPayload = BuildTablePropModule
config.EventShareLinkPayload = BuildTablePropModule
config.MediaGallerySchema_MediaItemArrayProp = BuildRepeatedPropModule
config.ArrayOfSystemBannerActionsProp = if FFlagSduiSystemBannerComponent then BuildRepeatedPropModule else nil
config.SystemBannerActionProp = if FFlagSduiSystemBannerComponent then BuildTablePropModule else nil
config.FoundationInternalNoticeLinkProp = if FFlagSduiBannerContextComponent then BuildTablePropModule else nil
config.FoundationInternalNoticeLink = if FFlagSduiBannerContextComponent then BuildTablePropModule else nil
config.FoundationIconConfigProp = BuildTablePropModule
config.HoldActionConfigProp = BuildTablePropModule
config.HoldActionConfig = BuildTablePropModule
config.OpenPurchasePromptAction_ProductPayload = BuildTablePropModule
config.OpenPurchasePromptAction_DisplayInfo = BuildTablePropModule
config.OpenPurchasePromptAction_PurchaseOptions = BuildTablePropModule
config.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = BuildTablePropModule
config.ArrayOfCatalogCategoryMenuItemProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil
config.CatalogCategoryMenuItem = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil
config.ArrayOfCategoryMenuButtonProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil
config.CategoryMenuButtonProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil
config.CategoryMenuButton = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil
config.ArrayOfCatalogCategoryMenuTooltipInfoProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil
config.CatalogCategoryMenuTooltipInfoProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil
config.CatalogCategoryMenuTooltipInfo = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil
config.ArrayOfTooltipInfoActionsProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil
config.TooltipInfoActionPropsProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil
config.TooltipInfoActionProps = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil
config.ArrayOfCatalogSortContentProp = if FFlagSduiMarketplaceCatalogSortSupport then BuildRepeatedPropModule else nil
config.ArrayOfItemFooterProp = if FFlagSduiMarketplaceCatalogSortSupport then BuildRepeatedPropModule else nil
config.CardStyleProp = if FFlagSduiMarketplaceCatalogSortSupport or FFlagSduiCatalogItemCard then BuildTablePropModule else nil
config.AnalyticsDataField = BuildDefaultPropModule
local AutomaticSize = Enum.AutomaticSize
local v1 = "AUTOMATIC_SIZE_"

local function v46(p1)
	-- upvalues: SduiParsersModule (copy), AutomaticSize (copy), ProtoVariableMapperModule (copy), v1 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v1, (SduiParsersModule.getEngineEnumParser(AutomaticSize)))
end

function config.AutomaticSizeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v46 (copy)
	local v2, v3 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v46)
	
	return v2, v3
end

local TextTruncate = Enum.TextTruncate
local v2 = "TEXT_TRUNCATE_"

local function v49(p1)
	-- upvalues: SduiParsersModule (copy), TextTruncate (copy), ProtoVariableMapperModule (copy), v2 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v2, (SduiParsersModule.getEngineEnumParser(TextTruncate)))
end

function config.TextTruncateProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v49 (copy)
	local v3, v4 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v49)
	
	return v3, v4
end

local TextXAlignment = Enum.TextXAlignment
local v3 = "TEXT_X_ALIGNMENT_"

local function v52(p1)
	-- upvalues: SduiParsersModule (copy), TextXAlignment (copy), ProtoVariableMapperModule (copy), v3 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v3, (SduiParsersModule.getEngineEnumParser(TextXAlignment)))
end

function config.TextXAlignmentProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v52 (copy)
	local v4, v5 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v52)
	
	return v4, v5
end

local TextYAlignment = Enum.TextYAlignment
local v4 = "TEXT_Y_ALIGNMENT_"

local function v55(p1)
	-- upvalues: SduiParsersModule (copy), TextYAlignment (copy), ProtoVariableMapperModule (copy), v4 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v4, (SduiParsersModule.getEngineEnumParser(TextYAlignment)))
end

function config.TextYAlignmentProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v55 (copy)
	local v5, v6 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v55)
	
	return v5, v6
end

local UIFlexMode = Enum.UIFlexMode
local v5 = "UI_FLEX_MODE_"

local function v58(p1)
	-- upvalues: SduiParsersModule (copy), UIFlexMode (copy), ProtoVariableMapperModule (copy), v5 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v5, (SduiParsersModule.getEngineEnumParser(UIFlexMode)))
end

function config.UIFlexModeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v58 (copy)
	local v6, v7 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v58)
	
	return v6, v7
end

local ScaleType = Enum.ScaleType
local v6 = "SCALE_TYPE_"

local function v61(p1)
	-- upvalues: SduiParsersModule (copy), ScaleType (copy), ProtoVariableMapperModule (copy), v6 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v6, (SduiParsersModule.getEngineEnumParser(ScaleType)))
end

function config.ScaleTypeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v61 (copy)
	local v7, v8 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v61)
	
	return v7, v8
end

local ResamplerMode = Enum.ResamplerMode
local v7 = "RESAMPLER_MODE_"

local function v64(p1)
	-- upvalues: SduiParsersModule (copy), ResamplerMode (copy), ProtoVariableMapperModule (copy), v7 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v7, (SduiParsersModule.getEngineEnumParser(ResamplerMode)))
end

function config.ResamplerModeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v64 (copy)
	local v8, v9 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v64)
	
	return v8, v9
end

local SizeConstraint = Enum.SizeConstraint
local v8 = "SIZE_CONSTRAINT_"

local function v67(p1)
	-- upvalues: SduiParsersModule (copy), SizeConstraint (copy), ProtoVariableMapperModule (copy), v8 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v8, (SduiParsersModule.getEngineEnumParser(SizeConstraint)))
end

function config.SizeConstraintProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v67 (copy)
	local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v67)
	
	return v9, v10
end

local SelectionBehavior = Enum.SelectionBehavior
local v9 = "SELECTION_BEHAVIOR_"

local function v70(p1)
	-- upvalues: SduiParsersModule (copy), SelectionBehavior (copy), ProtoVariableMapperModule (copy), v9 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v9, (SduiParsersModule.getEngineEnumParser(SelectionBehavior)))
end

function config.SelectionBehaviorProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v70 (copy)
	local v10, v11 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v70)
	
	return v10, v11
end

local KeyCode = Enum.KeyCode
local v10 = "KEY_CODE_"

local function v73(p1)
	-- upvalues: SduiParsersModule (copy), KeyCode (copy), ProtoVariableMapperModule (copy), v10 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v10, (SduiParsersModule.getEngineEnumParser(KeyCode)))
end

function config.KeyCodeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), v73 (copy)
	local v11, v12 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v73)
	
	return v11, v12
end

local ParseFocusNavActions = SduiClientBindingParsersModule.parseFocusNavActions

function config.FocusNavActionsProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildTablePropModule (copy), ParseFocusNavActions (copy)
	local v11, v12 = BuildTablePropModule(p1, p2, p3, p4, p5, p6, ParseFocusNavActions)
	
	return v11, v12
end

config.ColorStyleProp = BuildDefaultPropModule
local ParseUiScaledUDim2 = SduiClientBindingParsersModule.parseUiScaledUDim2

function config.UiScaledUDim2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseUiScaledUDim2 (copy)
	local v11, v12 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseUiScaledUDim2)
	
	return v11, v12
end

local ParseUiScaledUDim = SduiClientBindingParsersModule.parseUiScaledUDim

function config.UiScaledUDimProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseUiScaledUDim (copy)
	local v11, v12 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseUiScaledUDim)
	
	return v11, v12
end

local ParseUiScaledNumber = SduiClientBindingParsersModule.parseUiScaledNumber

function config.UiScaledFloatProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildDefaultPropModule (copy), ParseUiScaledNumber (copy)
	local v11, v12 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseUiScaledNumber)
	
	return v11, v12
end

config.FillBehaviorProp = BuildDefaultPropModule
config.InputSizeProp = BuildDefaultPropModule
config.ListItemInputControlProp = if FFlagSduiListComponents then BuildTablePropModule else nil
config.LaunchExperienceAction_ExperienceJoinData = BuildTablePropModule
config.AvatarConfigProp = BuildTablePropModule
config.ArrayOfAvatarProp = BuildRepeatedPropModule

return function(p1)
	-- upvalues: config (copy), BuildDefaultPropModule (copy)
	if not p1 then
		error("Failed to find prop builder -- missing propDescriptorName")
	end
	local Entry = config[p1]
	
	if not Entry then
		warn(`Could not find propBuilder for propDescriptorName {p1}. Using default.`)
		Entry = BuildDefaultPropModule
	end
	return Entry
end