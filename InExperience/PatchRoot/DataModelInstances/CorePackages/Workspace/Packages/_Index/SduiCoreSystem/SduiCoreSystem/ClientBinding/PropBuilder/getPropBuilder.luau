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
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiNestedComponentListProp = require(parent.SharedFlags).FFlagSduiNestedComponentListProp
local fFlagSduiLazyNestedComponentProp = require(parent.SharedFlags).FFlagSduiLazyNestedComponentProp
local fFlagSduiMarketplaceCatalogCategorySupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogCategorySupport
local fFlagSduiMarketplaceCatalogSortSupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local fFlagSduiSystemBannerComponent = require(parent.SharedFlags).FFlagSduiSystemBannerComponent
local fFlagSduiTileHoldAction = require(parent.SharedFlags).FFlagSduiTileHoldAction
local fFlagLuaAppSduiColorPropMigration = require(parent.SharedFlags).FFlagLuaAppSduiColorPropMigration
local fFlagSduiGenericContainerDispatch = require(parent.SharedFlags).FFlagSduiGenericContainerDispatch
local fFlagSduiFocusNavActionsStructured = require(parent.SharedFlags).FFlagSduiFocusNavActionsStructured
local fFlagSduiParseProtoGradientFields = require(parent.SharedFlags).FFlagSduiParseProtoGradientFields

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
local var3 = if fFlagSduiExperienceDetailsSupport then sduiClientBindingParsersModule.parseUDim else sduiParsersModule.parseUDimProp_

function t.UDimProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var3 (ref)
	local var4, var5 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var3)
	
	return var4, var5
end

local var4 = if fFlagSduiExperienceDetailsSupport then sduiClientBindingParsersModule.parseUDim2 else sduiParsersModule.parseUDim2Prop_

function t.UDim2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var4 (ref)
	local var5, var6 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var4)
	
	return var5, var6
end

local parseVector2Prop = sduiParsersModule.parseVector2Prop_

function t.Vector2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseVector2Prop (ref)
	local var5, var6 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseVector2Prop)
	
	return var5, var6
end

t.NestedComponentProp = buildNestedComponentPropModule
t.LazyNestedComponentProp = if fFlagSduiLazyNestedComponentProp then buildLazyNestedComponentPropModule else nil
t.NestedComponentListProp = if fFlagSduiNestedComponentListProp then buildNestedComponentListPropModule else nil
t.LazyNestedComponentListProp = buildLazyNestedComponentListPropModule
local parseStringArray = sduiClientBindingParsersModule.parseStringArray

function t.StringArrayProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseStringArray (ref)
	local var5, var6 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseStringArray)
	
	return var5, var6
end

local parseIconProp = sduiParsersModule.parseIconProp_

function t.IconProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseIconProp (ref)
	local var5, var6 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseIconProp)
	
	return var5, var6
end

local var5 = if fFlagSduiParseProtoGradientFields then sduiClientBindingParsersModule.parseGradient else sduiParsersModule.parseGradientProp_

function t.GradientProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var5 (ref)
	local var6, var7 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var5)
	
	return var6, var7
end

local parseArrayOfStruct = sduiClientBindingParsersModule.parseArrayOfStruct

function t.ArrayOfStructProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseArrayOfStruct (ref)
	local var6, var7 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseArrayOfStruct)
	
	return var6, var7
end

t.ActionProp = buildActionPropModule
t.TableProp = buildTablePropModule
t.ContainerProp = if fFlagSduiGenericContainerDispatch then buildContainerPropModule else nil
t.ArrayOfMenuItemProp = buildRepeatedPropModule
t.MenuItemProp = buildTablePropModule
t.MenuItem = buildTablePropModule
t.GenericShareLinkData = buildTablePropModule
t.ShareLinkFetchData = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildTablePropModule else nil
t.ExperienceShareLinkPayload = if fFlagSduiExperienceDetailsSupport then buildTablePropModule else nil
t.EventShareLinkPayload = if fFlagSduiEventDetailsSupport then buildTablePropModule else nil
t.MediaGallerySchema_MediaItemArrayProp = if fFlagSduiExperienceDetailsSupport then buildRepeatedPropModule else nil
t.ArrayOfSystemBannerActionsProp = if fFlagSduiSystemBannerComponent then buildRepeatedPropModule else nil
t.SystemBannerActionProp = if fFlagSduiSystemBannerComponent then buildTablePropModule else nil
t.FoundationIconConfigProp = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildTablePropModule else nil
t.HoldActionConfigProp = if fFlagSduiTileHoldAction then buildTablePropModule else nil
t.HoldActionConfig = if fFlagSduiTileHoldAction then buildTablePropModule else nil
t.OpenPurchasePromptAction_ProductPayload = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then buildTablePropModule else nil
t.OpenPurchasePromptAction_DisplayInfo = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then buildTablePropModule else nil
t.OpenPurchasePromptAction_PurchaseOptions = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then buildTablePropModule else nil
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then buildTablePropModule else nil
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
local var6 = "AUTOMATIC_SIZE_"

local var7 = function(p1)
	-- upvalues: sduiParsersModule (ref), automaticSize (ref), protoVariableMapperModule (ref), var6 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var6, sduiParsersModule.getEngineEnumParser(automaticSize))
end

function t.AutomaticSizeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var7 (ref)
	local var8, var9 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var7)
	
	return var8, var9
end

local textTruncate = Enum.TextTruncate
local var8 = "TEXT_TRUNCATE_"

local var9 = function(p1)
	-- upvalues: sduiParsersModule (ref), textTruncate (ref), protoVariableMapperModule (ref), var8 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var8, sduiParsersModule.getEngineEnumParser(textTruncate))
end

function t.TextTruncateProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var9 (ref)
	local var10, var11 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var9)
	
	return var10, var11
end

local textXAlignment = Enum.TextXAlignment
local var10 = "TEXT_X_ALIGNMENT_"

local var11 = function(p1)
	-- upvalues: sduiParsersModule (ref), textXAlignment (ref), protoVariableMapperModule (ref), var10 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var10, sduiParsersModule.getEngineEnumParser(textXAlignment))
end

function t.TextXAlignmentProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var11 (ref)
	local var12, var13 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var11)
	
	return var12, var13
end

local textYAlignment = Enum.TextYAlignment
local var12 = "TEXT_Y_ALIGNMENT_"

local var13 = function(p1)
	-- upvalues: sduiParsersModule (ref), textYAlignment (ref), protoVariableMapperModule (ref), var12 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var12, sduiParsersModule.getEngineEnumParser(textYAlignment))
end

function t.TextYAlignmentProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var13 (ref)
	local var14, var15 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var13)
	
	return var14, var15
end

local UIFlexMode = Enum.UIFlexMode
local var14 = "UI_FLEX_MODE_"

local var15 = function(p1)
	-- upvalues: sduiParsersModule (ref), UIFlexMode (ref), protoVariableMapperModule (ref), var14 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var14, sduiParsersModule.getEngineEnumParser(UIFlexMode))
end

function t.UIFlexModeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var15 (ref)
	local var16, var17 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var15)
	
	return var16, var17
end

local scaleType = Enum.ScaleType
local var16 = "SCALE_TYPE_"

local var17 = function(p1)
	-- upvalues: sduiParsersModule (ref), scaleType (ref), protoVariableMapperModule (ref), var16 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var16, sduiParsersModule.getEngineEnumParser(scaleType))
end

function t.ScaleTypeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var17 (ref)
	local var18, var19 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var17)
	
	return var18, var19
end

local resamplerMode = Enum.ResamplerMode
local var18 = "RESAMPLER_MODE_"

local var19 = function(p1)
	-- upvalues: sduiParsersModule (ref), resamplerMode (ref), protoVariableMapperModule (ref), var18 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var18, sduiParsersModule.getEngineEnumParser(resamplerMode))
end

function t.ResamplerModeProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var19 (ref)
	local var20, var21 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var19)
	
	return var20, var21
end

local sizeConstraint = Enum.SizeConstraint
local var20 = "SIZE_CONSTRAINT_"

local var21 = function(p1)
	-- upvalues: sduiParsersModule (ref), sizeConstraint (ref), protoVariableMapperModule (ref), var20 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var20, sduiParsersModule.getEngineEnumParser(sizeConstraint))
end

function t.SizeConstraintProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var21 (ref)
	local var22, var23 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var21)
	
	return var22, var23
end

local selectionBehavior = Enum.SelectionBehavior
local var22 = "SELECTION_BEHAVIOR_"

local var23 = function(p1)
	-- upvalues: sduiParsersModule (ref), selectionBehavior (ref), protoVariableMapperModule (ref), var22 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var22, sduiParsersModule.getEngineEnumParser(selectionBehavior))
end

function t.SelectionBehaviorProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), var23 (ref)
	local var24, var25 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var23)
	
	return var24, var25
end

if fFlagSduiTileHoldAction or fFlagSduiFocusNavActionsStructured then
	local keyCode = Enum.KeyCode
	local var24 = "KEY_CODE_"
	
	local var25 = function(p1)
		-- upvalues: sduiParsersModule (ref), keyCode (ref), protoVariableMapperModule (ref), var24 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p1, var24, sduiParsersModule.getEngineEnumParser(keyCode))
	end
	
	local var26 = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: buildDefaultPropModule (ref), var25 (ref)
		local var27, var28 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, var25)
		
		return var27, var28
	end
else
	local var26 = nil
end
t.KeyCodeProp = var26

if fFlagSduiFocusNavActionsStructured then
	local parseFocusNavActions = sduiClientBindingParsersModule.parseFocusNavActions
	
	local var27 = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: buildTablePropModule (ref), parseFocusNavActions (ref)
		local var28, var29 = buildTablePropModule(p1, p2, p3, p4, p5, p6, parseFocusNavActions)
		
		return var28, var29
	end
else
	local var27 = nil
end
t.FocusNavActionsProp = var27
t.ColorStyleProp = buildDefaultPropModule
local parseUiScaledUDim2 = sduiClientBindingParsersModule.parseUiScaledUDim2

function t.UiScaledUDim2Prop(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim2 (ref)
	local var28, var29 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUiScaledUDim2)
	
	return var28, var29
end

local parseUiScaledUDim = sduiClientBindingParsersModule.parseUiScaledUDim

function t.UiScaledUDimProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim (ref)
	local var28, var29 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUiScaledUDim)
	
	return var28, var29
end

local parseUiScaledNumber = sduiClientBindingParsersModule.parseUiScaledNumber

function t.UiScaledFloatProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledNumber (ref)
	local var28, var29 = buildDefaultPropModule(p1, p2, p3, p4, p5, p6, parseUiScaledNumber)
	
	return var28, var29
end

t.FillBehaviorProp = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildDefaultPropModule else nil
t.InputSizeProp = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildDefaultPropModule else nil
t.LaunchExperienceAction_ExperienceJoinData = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildTablePropModule else nil
t.AvatarConfigProp = if fFlagSduiExperienceDetailsSupport then buildTablePropModule else nil
t.ArrayOfAvatarProp = if fFlagSduiExperienceDetailsSupport then buildRepeatedPropModule else nil

return function(p1)
	-- upvalues: t (ref), buildDefaultPropModule (ref)
	if not p1 then
		error("Failed to find prop builder -- missing propDescriptorName")
	end
	local var28 = t[p1]
	
	if not var28 then
		warn(`Could not find propBuilder for propDescriptorName {p1}. Using default.`)
		var28 = buildDefaultPropModule
	end
	return var28
end