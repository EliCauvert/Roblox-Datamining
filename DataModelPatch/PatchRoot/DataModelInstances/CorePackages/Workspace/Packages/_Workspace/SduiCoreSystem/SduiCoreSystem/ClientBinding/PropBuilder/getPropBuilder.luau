local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local BuildDefaultPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildDefaultProp)
local BuildStringPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildStringProp)
local BuildTablePropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildTableProp)
local BuildRepeatedPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildRepeatedProp)
local BuildContainerPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildContainerProp)
local BuildLazyNestedComponentPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentProp)
local BuildNestedComponentListPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentListProp)
local SduiParsersModule = require(SduiCoreSystem.SduiParsers)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiClientBindingParsersModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiClientBindingParsers)
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local FFlagSduiOverflowMenuComponent = require(Parent.SharedFlags).FFlagSduiOverflowMenuComponent
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiDevStoreSeeAllSupport = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local FFlagSduiEventDetailsSupport = require(Parent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagSduiNestedComponentListProp = require(Parent.SharedFlags).FFlagSduiNestedComponentListProp
local FFlagSduiLazyNestedComponentProp = require(Parent.SharedFlags).FFlagSduiLazyNestedComponentProp
local FFlagSduiMarketplaceCatalogCategorySupport = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogCategorySupport
local FFlagSduiMarketplaceCatalogSortSupport = require(Parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiSystemBannerComponent = require(Parent.SharedFlags).FFlagSduiSystemBannerComponent
local FFlagSduiTileHoldAction = require(Parent.SharedFlags).FFlagSduiTileHoldAction
local FFlagSduiGenericContainerDispatch = require(Parent.SharedFlags).FFlagSduiGenericContainerDispatch
local FFlagSduiFocusNavActionsStructured = require(Parent.SharedFlags).FFlagSduiFocusNavActionsStructured

local function _(p1, p2)
	return function(p3, p4, p5, p6, p7, p8)
		-- upvalues: p1 (copy), p2 (copy)
		local v1, v2 = p1(p3, p4, p5, p6, p7, p8, p2)
		
		return v1, v2
	end
end

local _ = function(p1, p2)
	-- upvalues: BuildDefaultPropModule (copy), SduiParsersModule (copy), ProtoVariableMapperModule (copy)
	local function v81(p3)
		-- upvalues: SduiParsersModule (upval), p1 (copy), ProtoVariableMapperModule (upval), p2 (copy)
		return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p3, p2, (SduiParsersModule.getEngineEnumParser(p1)))
	end
	
	return function(p3, p4, p5, p6, p7, p8)
		-- upvalues: BuildDefaultPropModule (copy), v81 (copy)
		local v1, v2 = BuildDefaultPropModule(p3, p4, p5, p6, p7, p8, v81)
		
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

local FromHex = Color3.fromHex
local ParseUDim = if FFlagSduiExperienceDetailsSupport then SduiClientBindingParsersModule.parseUDim else SduiParsersModule.parseUDimProp_
local ParseUDim2 = if FFlagSduiExperienceDetailsSupport then SduiClientBindingParsersModule.parseUDim2 else SduiParsersModule.parseUDim2Prop_
local ParseVector2Prop = SduiParsersModule.parseVector2Prop_
local ParseStringArray = SduiClientBindingParsersModule.parseStringArray
local ParseIconProp = SduiParsersModule.parseIconProp_
local ParseGradientProp = SduiParsersModule.parseGradientProp_
local ParseArrayOfStruct = SduiClientBindingParsersModule.parseArrayOfStruct
local AutomaticSize = Enum.AutomaticSize
local v1 = "AUTOMATIC_SIZE_"

local function v43(p1)
	-- upvalues: SduiParsersModule (copy), AutomaticSize (copy), ProtoVariableMapperModule (copy), v1 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v1, (SduiParsersModule.getEngineEnumParser(AutomaticSize)))
end

local TextTruncate = Enum.TextTruncate
local v2 = "TEXT_TRUNCATE_"

local function v46(p1)
	-- upvalues: SduiParsersModule (copy), TextTruncate (copy), ProtoVariableMapperModule (copy), v2 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v2, (SduiParsersModule.getEngineEnumParser(TextTruncate)))
end

local TextXAlignment = Enum.TextXAlignment
local v3 = "TEXT_X_ALIGNMENT_"

local function v49(p1)
	-- upvalues: SduiParsersModule (copy), TextXAlignment (copy), ProtoVariableMapperModule (copy), v3 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v3, (SduiParsersModule.getEngineEnumParser(TextXAlignment)))
end

local TextYAlignment = Enum.TextYAlignment
local v4 = "TEXT_Y_ALIGNMENT_"

local function v52(p1)
	-- upvalues: SduiParsersModule (copy), TextYAlignment (copy), ProtoVariableMapperModule (copy), v4 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v4, (SduiParsersModule.getEngineEnumParser(TextYAlignment)))
end

local UIFlexMode = Enum.UIFlexMode
local v5 = "UI_FLEX_MODE_"

local function v55(p1)
	-- upvalues: SduiParsersModule (copy), UIFlexMode (copy), ProtoVariableMapperModule (copy), v5 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v5, (SduiParsersModule.getEngineEnumParser(UIFlexMode)))
end

local ScaleType = Enum.ScaleType
local v6 = "SCALE_TYPE_"

local function v58(p1)
	-- upvalues: SduiParsersModule (copy), ScaleType (copy), ProtoVariableMapperModule (copy), v6 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v6, (SduiParsersModule.getEngineEnumParser(ScaleType)))
end

local ResamplerMode = Enum.ResamplerMode
local v7 = "RESAMPLER_MODE_"

local function v61(p1)
	-- upvalues: SduiParsersModule (copy), ResamplerMode (copy), ProtoVariableMapperModule (copy), v7 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v7, (SduiParsersModule.getEngineEnumParser(ResamplerMode)))
end

local SizeConstraint = Enum.SizeConstraint
local v8 = "SIZE_CONSTRAINT_"

local function v64(p1)
	-- upvalues: SduiParsersModule (copy), SizeConstraint (copy), ProtoVariableMapperModule (copy), v8 (copy)
	return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v8, (SduiParsersModule.getEngineEnumParser(SizeConstraint)))
end

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
	ColorProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), FromHex (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, FromHex)
		
		return v9, v10
	end,
	TypographyProp = BuildDefaultPropModule,
	TypographyFontProp = BuildDefaultPropModule,
	UDimProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseUDim (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseUDim)
		
		return v9, v10
	end,
	UDim2Prop = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseUDim2 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseUDim2)
		
		return v9, v10
	end,
	Vector2Prop = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseVector2Prop (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseVector2Prop)
		
		return v9, v10
	end,
	NestedComponentProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentProp),
	LazyNestedComponentProp = if FFlagSduiLazyNestedComponentProp then BuildLazyNestedComponentPropModule else nil,
	NestedComponentListProp = if FFlagSduiNestedComponentListProp then BuildNestedComponentListPropModule else nil,
	LazyNestedComponentListProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentListProp),
	StringArrayProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseStringArray (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseStringArray)
		
		return v9, v10
	end,
	IconProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseIconProp (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseIconProp)
		
		return v9, v10
	end,
	GradientProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseGradientProp (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseGradientProp)
		
		return v9, v10
	end,
	ArrayOfStructProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), ParseArrayOfStruct (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, ParseArrayOfStruct)
		
		return v9, v10
	end,
	ActionProp = require(SduiCoreSystem.ClientBinding.PropBuilder.buildActionProp),
	TableProp = BuildTablePropModule,
	ContainerProp = if FFlagSduiGenericContainerDispatch then BuildContainerPropModule else nil,
	ArrayOfMenuItemProp = if FFlagSduiOverflowMenuComponent then BuildRepeatedPropModule else nil,
	MenuItemProp = if FFlagSduiOverflowMenuComponent then BuildTablePropModule else nil,
	MenuItem = if FFlagSduiOverflowMenuComponent then BuildTablePropModule else nil,
	GenericShareLinkData = BuildTablePropModule,
	ShareLinkFetchData = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then BuildTablePropModule else nil,
	ExperienceShareLinkPayload = if FFlagSduiExperienceDetailsSupport then BuildTablePropModule else nil,
	EventShareLinkPayload = if FFlagSduiEventDetailsSupport then BuildTablePropModule else nil,
	MediaGallerySchema_MediaItemArrayProp = if FFlagSduiExperienceDetailsSupport then BuildRepeatedPropModule else nil,
	ArrayOfSystemBannerActionsProp = if FFlagSduiSystemBannerComponent then BuildRepeatedPropModule else nil,
	SystemBannerActionProp = if FFlagSduiSystemBannerComponent then BuildTablePropModule else nil,
	FoundationIconConfigProp = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then BuildTablePropModule else nil,
	HoldActionConfigProp = if FFlagSduiTileHoldAction then BuildTablePropModule else nil,
	HoldActionConfig = if FFlagSduiTileHoldAction then BuildTablePropModule else nil,
	OpenPurchasePromptAction_ProductPayload = if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then BuildTablePropModule else nil,
	OpenPurchasePromptAction_DisplayInfo = if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then BuildTablePropModule else nil,
	OpenPurchasePromptAction_PurchaseOptions = if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then BuildTablePropModule else nil,
	OpenPurchasePromptAction_PurchaseAnalyticsMetadata = if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then BuildTablePropModule else nil,
	ArrayOfCatalogCategoryMenuItemProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil,
	CatalogCategoryMenuItem = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil,
	ArrayOfCategoryMenuButtonProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil,
	CategoryMenuButtonProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil,
	CategoryMenuButton = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil,
	ArrayOfCatalogCategoryMenuTooltipInfoProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil,
	CatalogCategoryMenuTooltipInfoProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil,
	CatalogCategoryMenuTooltipInfo = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil,
	ArrayOfTooltipInfoActionsProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildRepeatedPropModule else nil,
	TooltipInfoActionPropsProp = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil,
	TooltipInfoActionProps = if FFlagSduiMarketplaceCatalogCategorySupport then BuildTablePropModule else nil,
	ArrayOfCatalogSortContentProp = if FFlagSduiMarketplaceCatalogSortSupport then BuildRepeatedPropModule else nil,
	ArrayOfItemFooterProp = if FFlagSduiMarketplaceCatalogSortSupport then BuildRepeatedPropModule else nil,
	CardStyleProp = if FFlagSduiMarketplaceCatalogSortSupport then BuildTablePropModule else nil,
	AnalyticsDataField = BuildDefaultPropModule,
	AutomaticSizeProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v43 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v43)
		
		return v9, v10
	end,
	TextTruncateProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v46 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v46)
		
		return v9, v10
	end,
	TextXAlignmentProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v49 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v49)
		
		return v9, v10
	end,
	TextYAlignmentProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v52 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v52)
		
		return v9, v10
	end,
	UIFlexModeProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v55 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v55)
		
		return v9, v10
	end,
	ScaleTypeProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v58 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v58)
		
		return v9, v10
	end,
	ResamplerModeProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v61 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v61)
		
		return v9, v10
	end,
	SizeConstraintProp = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v64 (copy)
		local v9, v10 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v64)
		
		return v9, v10
	end
}

if require(Parent.SharedFlags).FFlagSduiChartsSupport then
	local SelectionBehavior = Enum.SelectionBehavior
	local v9 = "SELECTION_BEHAVIOR_"
	
	local function v72(p1)
		-- upvalues: SduiParsersModule (copy), SelectionBehavior (copy), ProtoVariableMapperModule (copy), v9 (copy)
		return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v9, (SduiParsersModule.getEngineEnumParser(SelectionBehavior)))
	end
	
	local function SelectionBehaviorProp(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v72 (copy)
		local v10, v11 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v72)
		
		return v10, v11
	end
else
	local SelectionBehaviorProp: ((any, any, any, any, any, any) -> any)? = nil
end
config.SelectionBehaviorProp = SelectionBehaviorProp

if FFlagSduiTileHoldAction or FFlagSduiFocusNavActionsStructured then
	local KeyCode = Enum.KeyCode
	local v10 = "KEY_CODE_"
	
	local function v76(p1)
		-- upvalues: SduiParsersModule (copy), KeyCode (copy), ProtoVariableMapperModule (copy), v10 (copy)
		return ProtoVariableMapperModule.mapProtoEngineEnumToLua(p1, v10, (SduiParsersModule.getEngineEnumParser(KeyCode)))
	end
	
	local function KeyCodeProp(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildDefaultPropModule (copy), v76 (copy)
		local v11, v12 = BuildDefaultPropModule(p1, p2, p3, p4, p5, p6, v76)
		
		return v11, v12
	end
else
	local KeyCodeProp: ((any, any, any, any, any, any) -> any)? = nil
end
config.KeyCodeProp = KeyCodeProp

if FFlagSduiFocusNavActionsStructured then
	local ParseFocusNavActions = SduiClientBindingParsersModule.parseFocusNavActions
	
	local function FocusNavActionsProp(p1, p2, p3, p4, p5, p6)
		-- upvalues: BuildTablePropModule (copy), ParseFocusNavActions (copy)
		local v11, v12 = BuildTablePropModule(p1, p2, p3, p4, p5, p6, ParseFocusNavActions)
		
		return v11, v12
	end
else
	local FocusNavActionsProp: ((any, any, any, any, any, any) -> any)? = nil
end
config.FocusNavActionsProp = FocusNavActionsProp
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

config.FillBehaviorProp = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then BuildDefaultPropModule else nil
config.InputSizeProp = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then BuildDefaultPropModule else nil
config.LaunchExperienceAction_ExperienceJoinData = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then BuildTablePropModule else nil
config.AvatarConfigProp = if FFlagSduiExperienceDetailsSupport then BuildTablePropModule else nil
config.ArrayOfAvatarProp = if FFlagSduiExperienceDetailsSupport then BuildRepeatedPropModule else nil

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