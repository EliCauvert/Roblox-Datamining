local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local buildDefaultPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildDefaultProp)
local buildStringPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildStringProp)
local buildTablePropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildTableProp)
local buildRepeatedPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildRepeatedProp)
local buildContainerPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildContainerProp)
local buildNestedComponentPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentProp)
local buildLazyNestedComponentPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentProp)
local buildLazyNestedComponentListPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentListProp)
local buildNestedComponentListPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentListProp)
local buildActionPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildActionProp)
local sduiParsersModule = require(sduiCoreSystem.SduiParsers)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiClientBindingParsersModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiClientBindingParsers)
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiNestedComponentListProp = require(parent.SharedFlags).FFlagSduiNestedComponentListProp
local fFlagSduiLazyNestedComponentProp = require(parent.SharedFlags).FFlagSduiLazyNestedComponentProp
local fFlagSduiMarketplaceCatalogCategorySupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogCategorySupport
local fFlagSduiMarketplaceCatalogSortSupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local fFlagSduiSystemBannerComponent = require(parent.SharedFlags).FFlagSduiSystemBannerComponent
local fFlagSduiTileHoldAction = require(parent.SharedFlags).FFlagSduiTileHoldAction
local fFlagLuaAppSduiColorPropMigration = require(parent.SharedFlags).FFlagLuaAppSduiColorPropMigration
local fFlagSduiParseProtoGradientFields = require(parent.SharedFlags).FFlagSduiParseProtoGradientFields
local fFlagLuaAppSduiHomePageSupport = require(parent.SharedFlags).FFlagLuaAppSduiHomePageSupport

local function _(p1, p2)
	return function(p3, p4, p5, p6, p7, p8)
		-- upvalues: p1 (ref), p2 (ref)
		local var1, var2 = p1(p3, p4, p5, p6, p7, p8, p2)
		
		return var1, var2
	end
end

local _ = function(p1, p2)
	-- upvalues: buildDefaultPropModule (ref), sduiParsersModule (ref), protoVariableMapperModule (ref)
	local var1 = function(p3)
		-- upvalues: sduiParsersModule (copy), p1 (ref), protoVariableMapperModule (copy), p2 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p3, p2, sduiParsersModule.getEngineEnumParser(p1))
	end
	
	return function(p3, p4, p5, p6, p7, p8)
		-- upvalues: buildDefaultPropModule (ref), var1 (ref)
		local var2, var3 = buildDefaultPropModule(p3, p4, p5, p6, p7, p8, var1)
		
		return var2, var3
	end
end

local t = {
	StringProp = buildStringPropModule,
	BoolProp = buildDefaultPropModule,
	FloatProp = buildDefaultPropModule,
	DoubleProp = buildDefaultPropModule,
	Int32Prop = buildDefaultPropModule,
	Int64Prop = buildDefaultPropModule
}
local parseStruct = sduiClientBindingParsersModule.parseStruct

function t.StructProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseStruct (ref)
	local var1, var2 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseStruct)
	
	return var1, var2
end

local parseImageStringProp = sduiParsersModule.parseImageStringProp_

function t.ImageStringProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildStringPropModule (ref), parseImageStringProp (ref)
	local var1, var2 = buildStringPropModule(p1, p2, p3, p4, p5, p6, parseImageStringProp)
	
	return var1, var2
end

local parseImageSetOrImageProp = sduiParsersModule.parseImageSetOrImageProp_

function t.ImageSetProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildStringPropModule (ref), parseImageSetOrImageProp (ref)
	local var1, var2 = buildStringPropModule(p1, p2, p3, p4, p5, p6, parseImageSetOrImageProp)
	
	return var1, var2
end

if fFlagLuaAppSduiColorPropMigration then
	local parseColorPropLegacy = sduiClientBindingParsersModule.parseColorPropLegacy
	
	local var1 = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: buildDefaultPropModule (ref), parseColorPropLegacy (ref)
		local var2, var3 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseColorPropLegacy)
		
		return var2, var3
	end
else
	local fromHex = Color3.fromHex
	
	local var1 = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: buildDefaultPropModule (ref), fromHex (ref)
		local var2, var3 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, fromHex)
		
		return var2, var3
	end
end
t.ColorProp = var1

if fFlagLuaAppSduiColorPropMigration then
	local parseColor3 = sduiClientBindingParsersModule.parseColor3
	
	local var2 = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: buildDefaultPropModule (ref), parseColor3 (ref)
		local var3, var4 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseColor3)
		
		return var3, var4
	end
else
	local var2 = nil
end
t.Color3Prop = var2
t.TypographyProp = buildDefaultPropModule
t.TypographyFontProp = buildDefaultPropModule
local parseUDim = sduiClientBindingParsersModule.parseUDim

function t.UDimProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUDim (ref)
	local var3, var4 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUDim)
	
	return var3, var4
end

local parseUDim2 = sduiClientBindingParsersModule.parseUDim2

function t.UDim2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUDim2 (ref)
	local var3, var4 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUDim2)
	
	return var3, var4
end

local parseVector2Prop = sduiParsersModule.parseVector2Prop_

function t.Vector2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseVector2Prop (ref)
	local var3, var4 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseVector2Prop)
	
	return var3, var4
end

t.NestedComponentProp = buildNestedComponentPropModule
t.LazyNestedComponentProp = if fFlagSduiLazyNestedComponentProp then buildLazyNestedComponentPropModule else nil
t.NestedComponentListProp = if fFlagSduiNestedComponentListProp then buildNestedComponentListPropModule else nil
t.LazyNestedComponentListProp = buildLazyNestedComponentListPropModule
local parseStringArray = sduiClientBindingParsersModule.parseStringArray

function t.StringArrayProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseStringArray (ref)
	local var3, var4 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseStringArray)
	
	return var3, var4
end

local parseIconProp = sduiParsersModule.parseIconProp_

function t.IconProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseIconProp (ref)
	local var3, var4 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseIconProp)
	
	return var3, var4
end

local var3 = if fFlagSduiParseProtoGradientFields then sduiClientBindingParsersModule.parseGradient else sduiParsersModule.parseGradientProp_

function t.GradientProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var3 (ref)
	local var4, var5 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var3)
	
	return var4, var5
end

local parseArrayOfStruct = sduiClientBindingParsersModule.parseArrayOfStruct

function t.ArrayOfStructProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseArrayOfStruct (ref)
	local var4, var5 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseArrayOfStruct)
	
	return var4, var5
end

if fFlagLuaAppSduiHomePageSupport then
	local parsePymkItems = sduiClientBindingParsersModule.parsePymkItems
	
	local var4 = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: buildDefaultPropModule (ref), parsePymkItems (ref)
		local var5, var6 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parsePymkItems)
		
		return var5, var6
	end
else
	local var4 = nil
end
t.ArrayOfPymkItemDataProp = var4
t.ActionProp = buildActionPropModule
t.TableProp = buildTablePropModule
t.ContainerProp = buildContainerPropModule
t.ArrayOfMenuItemProp = buildRepeatedPropModule
t.MenuItemProp = buildTablePropModule
t.MenuItem = buildTablePropModule
t.GenericShareLinkData = buildTablePropModule
t.ShareLinkFetchData = buildTablePropModule
t.ExperienceShareLinkPayload = buildTablePropModule
t.EventShareLinkPayload = if fFlagSduiEventDetailsSupport then buildTablePropModule else nil
t.MediaGallerySchema_MediaItemArrayProp = buildRepeatedPropModule
t.ArrayOfSystemBannerActionsProp = if fFlagSduiSystemBannerComponent then buildRepeatedPropModule else nil
t.SystemBannerActionProp = if fFlagSduiSystemBannerComponent then buildTablePropModule else nil
t.FoundationIconConfigProp = buildTablePropModule
t.HoldActionConfigProp = if fFlagSduiTileHoldAction then buildTablePropModule else nil
t.HoldActionConfig = if fFlagSduiTileHoldAction then buildTablePropModule else nil
t.OpenPurchasePromptAction_ProductPayload = buildTablePropModule
t.OpenPurchasePromptAction_DisplayInfo = buildTablePropModule
t.OpenPurchasePromptAction_PurchaseOptions = buildTablePropModule
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = buildTablePropModule
t.ArrayOfCatalogCategoryMenuItemProp = if fFlagSduiMarketplaceCatalogCategorySupport then buildRepeatedPropModule else nil
t.CatalogCategoryMenuItem = if fFlagSduiMarketplaceCatalogCategorySupport then buildTablePropModule else nil
t.ArrayOfCategoryMenuButtonProp = if fFlagSduiMarketplaceCatalogCategorySupport then buildRepeatedPropModule else nil
t.CategoryMenuButtonProp = if fFlagSduiMarketplaceCatalogCategorySupport then buildTablePropModule else nil
t.CategoryMenuButton = if fFlagSduiMarketplaceCatalogCategorySupport then buildTablePropModule else nil
t.ArrayOfCatalogCategoryMenuTooltipInfoProp = if fFlagSduiMarketplaceCatalogCategorySupport then buildRepeatedPropModule else nil
t.CatalogCategoryMenuTooltipInfoProp = if fFlagSduiMarketplaceCatalogCategorySupport then buildTablePropModule else nil
t.CatalogCategoryMenuTooltipInfo = if fFlagSduiMarketplaceCatalogCategorySupport then buildTablePropModule else nil
t.ArrayOfTooltipInfoActionsProp = if fFlagSduiMarketplaceCatalogCategorySupport then buildRepeatedPropModule else nil
t.TooltipInfoActionPropsProp = if fFlagSduiMarketplaceCatalogCategorySupport then buildTablePropModule else nil
t.TooltipInfoActionProps = if fFlagSduiMarketplaceCatalogCategorySupport then buildTablePropModule else nil
t.ArrayOfCatalogSortContentProp = if fFlagSduiMarketplaceCatalogSortSupport then buildRepeatedPropModule else nil
t.ArrayOfItemFooterProp = if fFlagSduiMarketplaceCatalogSortSupport then buildRepeatedPropModule else nil
t.CardStyleProp = if fFlagSduiMarketplaceCatalogSortSupport then buildTablePropModule else nil
t.AnalyticsDataField = buildDefaultPropModule
local automaticSize = Enum.AutomaticSize
local var5 = "AUTOMATIC_SIZE_"

local var6 = function(p1)
	-- upvalues: sduiParsersModule (ref), automaticSize (ref), protoVariableMapperModule (ref), var5 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var5, sduiParsersModule.getEngineEnumParser(automaticSize))
end

function t.AutomaticSizeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var6 (ref)
	local var7, var8 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var6)
	
	return var7, var8
end

local textTruncate = Enum.TextTruncate
local var7 = "TEXT_TRUNCATE_"

local var8 = function(p1)
	-- upvalues: sduiParsersModule (ref), textTruncate (ref), protoVariableMapperModule (ref), var7 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var7, sduiParsersModule.getEngineEnumParser(textTruncate))
end

function t.TextTruncateProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var8 (ref)
	local var9, var10 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var8)
	
	return var9, var10
end

local textXAlignment = Enum.TextXAlignment
local var9 = "TEXT_X_ALIGNMENT_"

local var10 = function(p1)
	-- upvalues: sduiParsersModule (ref), textXAlignment (ref), protoVariableMapperModule (ref), var9 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var9, sduiParsersModule.getEngineEnumParser(textXAlignment))
end

function t.TextXAlignmentProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var10 (ref)
	local var11, var12 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var10)
	
	return var11, var12
end

local textYAlignment = Enum.TextYAlignment
local var11 = "TEXT_Y_ALIGNMENT_"

local var12 = function(p1)
	-- upvalues: sduiParsersModule (ref), textYAlignment (ref), protoVariableMapperModule (ref), var11 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var11, sduiParsersModule.getEngineEnumParser(textYAlignment))
end

function t.TextYAlignmentProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var12 (ref)
	local var13, var14 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var12)
	
	return var13, var14
end

local UIFlexMode = Enum.UIFlexMode
local var13 = "UI_FLEX_MODE_"

local var14 = function(p1)
	-- upvalues: sduiParsersModule (ref), UIFlexMode (ref), protoVariableMapperModule (ref), var13 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var13, sduiParsersModule.getEngineEnumParser(UIFlexMode))
end

function t.UIFlexModeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var14 (ref)
	local var15, var16 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var14)
	
	return var15, var16
end

local scaleType = Enum.ScaleType
local var15 = "SCALE_TYPE_"

local var16 = function(p1)
	-- upvalues: sduiParsersModule (ref), scaleType (ref), protoVariableMapperModule (ref), var15 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var15, sduiParsersModule.getEngineEnumParser(scaleType))
end

function t.ScaleTypeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var16 (ref)
	local var17, var18 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var16)
	
	return var17, var18
end

local resamplerMode = Enum.ResamplerMode
local var17 = "RESAMPLER_MODE_"

local var18 = function(p1)
	-- upvalues: sduiParsersModule (ref), resamplerMode (ref), protoVariableMapperModule (ref), var17 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var17, sduiParsersModule.getEngineEnumParser(resamplerMode))
end

function t.ResamplerModeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var18 (ref)
	local var19, var20 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var18)
	
	return var19, var20
end

local sizeConstraint = Enum.SizeConstraint
local var19 = "SIZE_CONSTRAINT_"

local var20 = function(p1)
	-- upvalues: sduiParsersModule (ref), sizeConstraint (ref), protoVariableMapperModule (ref), var19 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var19, sduiParsersModule.getEngineEnumParser(sizeConstraint))
end

function t.SizeConstraintProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var20 (ref)
	local var21, var22 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var20)
	
	return var21, var22
end

local selectionBehavior = Enum.SelectionBehavior
local var21 = "SELECTION_BEHAVIOR_"

local var22 = function(p1)
	-- upvalues: sduiParsersModule (ref), selectionBehavior (ref), protoVariableMapperModule (ref), var21 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var21, sduiParsersModule.getEngineEnumParser(selectionBehavior))
end

function t.SelectionBehaviorProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var22 (ref)
	local var23, var24 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var22)
	
	return var23, var24
end

local keyCode = Enum.KeyCode
local var23 = "KEY_CODE_"

local var24 = function(p1)
	-- upvalues: sduiParsersModule (ref), keyCode (ref), protoVariableMapperModule (ref), var23 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var23, sduiParsersModule.getEngineEnumParser(keyCode))
end

function t.KeyCodeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var24 (ref)
	local var25, var26 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var24)
	
	return var25, var26
end

local parseFocusNavActions = sduiClientBindingParsersModule.parseFocusNavActions

function t.FocusNavActionsProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildTablePropModule (ref), parseFocusNavActions (ref)
	local var25, var26 = buildTablePropModule(p1, p2, p3, p4, p5, p6, parseFocusNavActions)
	
	return var25, var26
end

t.ColorStyleProp = buildDefaultPropModule
local parseUiScaledUDim2 = sduiClientBindingParsersModule.parseUiScaledUDim2

function t.UiScaledUDim2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim2 (ref)
	local var25, var26 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUiScaledUDim2)
	
	return var25, var26
end

local parseUiScaledUDim = sduiClientBindingParsersModule.parseUiScaledUDim

function t.UiScaledUDimProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim (ref)
	local var25, var26 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUiScaledUDim)
	
	return var25, var26
end

local parseUiScaledNumber = sduiClientBindingParsersModule.parseUiScaledNumber

function t.UiScaledFloatProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledNumber (ref)
	local var25, var26 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUiScaledNumber)
	
	return var25, var26
end

t.FillBehaviorProp = buildDefaultPropModule
t.InputSizeProp = buildDefaultPropModule
t.LaunchExperienceAction_ExperienceJoinData = buildTablePropModule
t.AvatarConfigProp = buildTablePropModule
t.ArrayOfAvatarProp = buildRepeatedPropModule

return function(p1)
	-- upvalues: t (ref), buildDefaultPropModule (ref)
	if not p1 then
		error("Failed to find prop builder -- missing propDescriptorName")
	end
	local var25 = t[p1]
	
	if not var25 then
		warn(`Could not find propBuilder for propDescriptorName {p1}. Using default.`)
		var25 = buildDefaultPropModule
	end
	return var25
end