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
local fFlagLuaAppSduiBadgeDetailsComponents = require(parent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local fFlagSduiOverflowMenuComponent = require(parent.SharedFlags).FFlagSduiOverflowMenuComponent
local fFlagSduiStructPropParsers = require(parent.SharedFlags).FFlagSduiStructPropParsers
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiNestedComponentListProp = require(parent.SharedFlags).FFlagSduiNestedComponentListProp
local fFlagSduiLazyNestedComponentProp = require(parent.SharedFlags).FFlagSduiLazyNestedComponentProp
local fFlagSduiMarketplaceCatalogCategorySupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogCategorySupport
local fFlagSduiMarketplaceCatalogSortSupport = require(parent.SharedFlags).FFlagSduiMarketplaceCatalogSortSupport
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiSystemBannerComponent = require(parent.SharedFlags).FFlagSduiSystemBannerComponent
local fFlagSduiTileHoldAction = require(parent.SharedFlags).FFlagSduiTileHoldAction
local fFlagSduiComponentList = require(parent.SharedFlags).FFlagSduiComponentList
local fFlagSduiGenericContainerDispatch = require(parent.SharedFlags).FFlagSduiGenericContainerDispatch
local fFlagSduiFocusNavActionsStructured = require(parent.SharedFlags).FFlagSduiFocusNavActionsStructured

local function _(p0, p1) --[[ line: 71 | named "applyParser" ]]
	return function(p2, p3, p4, p5, p6, p7) --[[ line: 75 ]]
		-- upvalues: p0 (ref), p1 (ref)
		local var54, var55 = p0(p2, p3, p4, p5, p6, p7, p1)
		
		return var54, var55
	end
end

local _ = function(p8, p9) --[[ line: 96 | named "createEngineEnumProtoBuilder" ]]
	-- upvalues: buildDefaultPropModule (ref), sduiParsersModule (ref), protoVariableMapperModule (ref)
	local var56 = function(p10) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (copy), p8 (ref), protoVariableMapperModule (copy), p9 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p10, p9, sduiParsersModule.getEngineEnumParser(p8))
	end
	
	return function(p11, p12, p13, p14, p15, p16) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var56 (ref)
		local var54, var55 = buildDefaultPropModule(p11, p12, p13, p14, p15, p16, var56)
		
		return var54, var55
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

if fFlagSduiStructPropParsers then
	local parseStruct = sduiClientBindingParsersModule.parseStruct
	
	local var15 = function(p17, p18, p19, p20, p21, p22) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), parseStruct (ref)
		local var54, var55 = buildDefaultPropModule(p17, p18, p19, p20, p21, p22, parseStruct)
		
		return var54, var55
	end
else
	local var15 = buildDefaultPropModule
end
t.StructProp = var15
local parseImageStringProp = sduiParsersModule.parseImageStringProp_

function t.ImageStringProp(p23, p24, p25, p26, p27, p28) --[[ line: 75 ]]
	-- upvalues: buildStringPropModule (ref), parseImageStringProp (ref)
	local var54, var55 = buildStringPropModule(p23, p24, p25, p26, p27, p28, parseImageStringProp)
	
	return var54, var55
end

local parseImageSetOrImageProp = sduiParsersModule.parseImageSetOrImageProp_

function t.ImageSetProp(p29, p30, p31, p32, p33, p34) --[[ line: 75 ]]
	-- upvalues: buildStringPropModule (ref), parseImageSetOrImageProp (ref)
	local var54, var55 = buildStringPropModule(p29, p30, p31, p32, p33, p34, parseImageSetOrImageProp)
	
	return var54, var55
end

local fromHex = Color3.fromHex

function t.ColorProp(p35, p36, p37, p38, p39, p40) --[[ line: 75 ]]
	-- upvalues: buildDefaultPropModule (ref), fromHex (ref)
	local var54, var55 = buildDefaultPropModule(p35, p36, p37, p38, p39, p40, fromHex)
	
	return var54, var55
end

t.TypographyProp = buildDefaultPropModule
t.TypographyFontProp = buildDefaultPropModule
local var16 = if fFlagSduiExperienceDetailsSupport then sduiClientBindingParsersModule.parseUDim else sduiParsersModule.parseUDimProp_

function t.UDimProp(p41, p42, p43, p44, p45, p46) --[[ line: 75 ]]
	-- upvalues: buildDefaultPropModule (ref), var16 (ref)
	local var54, var55 = buildDefaultPropModule(p41, p42, p43, p44, p45, p46, var16)
	
	return var54, var55
end

local var17 = if fFlagSduiExperienceDetailsSupport then sduiClientBindingParsersModule.parseUDim2 else sduiParsersModule.parseUDim2Prop_

function t.UDim2Prop(p47, p48, p49, p50, p51, p52) --[[ line: 75 ]]
	-- upvalues: buildDefaultPropModule (ref), var17 (ref)
	local var54, var55 = buildDefaultPropModule(p47, p48, p49, p50, p51, p52, var17)
	
	return var54, var55
end

local parseVector2Prop = sduiParsersModule.parseVector2Prop_

function t.Vector2Prop(p53, p54, p55, p56, p57, p58) --[[ line: 75 ]]
	-- upvalues: buildDefaultPropModule (ref), parseVector2Prop (ref)
	local var54, var55 = buildDefaultPropModule(p53, p54, p55, p56, p57, p58, parseVector2Prop)
	
	return var54, var55
end

t.NestedComponentProp = buildNestedComponentPropModule
t.LazyNestedComponentProp = if fFlagSduiLazyNestedComponentProp then buildLazyNestedComponentPropModule else nil
t.NestedComponentListProp = if fFlagSduiNestedComponentListProp then buildNestedComponentListPropModule else nil
t.LazyNestedComponentListProp = buildLazyNestedComponentListPropModule

if fFlagSduiComponentList then
	local parseStringArray = sduiClientBindingParsersModule.parseStringArray
	
	local var18 = function(p59, p60, p61, p62, p63, p64) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), parseStringArray (ref)
		local var54, var55 = buildDefaultPropModule(p59, p60, p61, p62, p63, p64, parseStringArray)
		
		return var54, var55
	end
else
	local var18 = nil
end
t.StringArrayProp = var18
local parseIconProp = sduiParsersModule.parseIconProp_

function t.IconProp(p65, p66, p67, p68, p69, p70) --[[ line: 75 ]]
	-- upvalues: buildDefaultPropModule (ref), parseIconProp (ref)
	local var54, var55 = buildDefaultPropModule(p65, p66, p67, p68, p69, p70, parseIconProp)
	
	return var54, var55
end

local parseGradientProp = sduiParsersModule.parseGradientProp_

function t.GradientProp(p71, p72, p73, p74, p75, p76) --[[ line: 75 ]]
	-- upvalues: buildDefaultPropModule (ref), parseGradientProp (ref)
	local var54, var55 = buildDefaultPropModule(p71, p72, p73, p74, p75, p76, parseGradientProp)
	
	return var54, var55
end

if fFlagSduiStructPropParsers then
	local parseArrayOfStruct = sduiClientBindingParsersModule.parseArrayOfStruct
	
	local var19 = function(p77, p78, p79, p80, p81, p82) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), parseArrayOfStruct (ref)
		local var54, var55 = buildDefaultPropModule(p77, p78, p79, p80, p81, p82, parseArrayOfStruct)
		
		return var54, var55
	end
else
	local var19 = buildDefaultPropModule
end
t.ArrayOfStructProp = var19
t.ActionProp = buildActionPropModule
t.TableProp = buildTablePropModule
t.ContainerProp = if fFlagSduiGenericContainerDispatch then buildContainerPropModule else nil
t.ArrayOfMenuItemProp = if fFlagSduiOverflowMenuComponent then buildRepeatedPropModule else nil
t.MenuItemProp = if fFlagSduiOverflowMenuComponent then buildTablePropModule else nil
t.MenuItem = if fFlagSduiOverflowMenuComponent then buildTablePropModule else nil
t.GenericShareLinkData = if fFlagLuaAppSduiBadgeDetailsComponents or fFlagSduiEventDetailsSupport then buildTablePropModule else nil
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

if fFlagLuaAppSduiBadgeDetailsComponents then
	local automaticSize = Enum.AutomaticSize
	local var21 = "AUTOMATIC_SIZE_"
	
	local var22 = function(p83) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), automaticSize (ref), protoVariableMapperModule (ref), var21 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p83, var21, sduiParsersModule.getEngineEnumParser(automaticSize))
	end
	
	local var20 = function(p84, p85, p86, p87, p88, p89) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var22 (ref)
		local var54, var55 = buildDefaultPropModule(p84, p85, p86, p87, p88, p89, var22)
		
		return var54, var55
	end
else
	local var20 = nil
end
t.AutomaticSizeProp = var20

if fFlagLuaAppSduiBadgeDetailsComponents then
	local textTruncate = Enum.TextTruncate
	local var23 = "TEXT_TRUNCATE_"
	
	local var24 = function(p90) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), textTruncate (ref), protoVariableMapperModule (ref), var23 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p90, var23, sduiParsersModule.getEngineEnumParser(textTruncate))
	end
	
	local var25 = function(p91, p92, p93, p94, p95, p96) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var24 (ref)
		local var54, var55 = buildDefaultPropModule(p91, p92, p93, p94, p95, p96, var24)
		
		return var54, var55
	end
else
	local var25 = nil
end
t.TextTruncateProp = var25

if fFlagLuaAppSduiBadgeDetailsComponents then
	local textXAlignment = Enum.TextXAlignment
	local var26 = "TEXT_X_ALIGNMENT_"
	
	local var27 = function(p97) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), textXAlignment (ref), protoVariableMapperModule (ref), var26 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p97, var26, sduiParsersModule.getEngineEnumParser(textXAlignment))
	end
	
	local var28 = function(p98, p99, p100, p101, p102, p103) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var27 (ref)
		local var54, var55 = buildDefaultPropModule(p98, p99, p100, p101, p102, p103, var27)
		
		return var54, var55
	end
else
	local var28 = nil
end
t.TextXAlignmentProp = var28

if fFlagLuaAppSduiBadgeDetailsComponents then
	local textYAlignment = Enum.TextYAlignment
	local var29 = "TEXT_Y_ALIGNMENT_"
	
	local var30 = function(p104) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), textYAlignment (ref), protoVariableMapperModule (ref), var29 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p104, var29, sduiParsersModule.getEngineEnumParser(textYAlignment))
	end
	
	local var31 = function(p105, p106, p107, p108, p109, p110) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var30 (ref)
		local var54, var55 = buildDefaultPropModule(p105, p106, p107, p108, p109, p110, var30)
		
		return var54, var55
	end
else
	local var31 = nil
end
t.TextYAlignmentProp = var31

if fFlagLuaAppSduiBadgeDetailsComponents then
	local UIFlexMode = Enum.UIFlexMode
	local var32 = "UI_FLEX_MODE_"
	
	local var33 = function(p111) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), UIFlexMode (ref), protoVariableMapperModule (ref), var32 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p111, var32, sduiParsersModule.getEngineEnumParser(UIFlexMode))
	end
	
	local var34 = function(p112, p113, p114, p115, p116, p117) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var33 (ref)
		local var54, var55 = buildDefaultPropModule(p112, p113, p114, p115, p116, p117, var33)
		
		return var54, var55
	end
else
	local var34 = nil
end
t.UIFlexModeProp = var34

if fFlagLuaAppSduiBadgeDetailsComponents then
	local scaleType = Enum.ScaleType
	local var35 = "SCALE_TYPE_"
	
	local var36 = function(p118) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), scaleType (ref), protoVariableMapperModule (ref), var35 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p118, var35, sduiParsersModule.getEngineEnumParser(scaleType))
	end
	
	local var37 = function(p119, p120, p121, p122, p123, p124) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var36 (ref)
		local var54, var55 = buildDefaultPropModule(p119, p120, p121, p122, p123, p124, var36)
		
		return var54, var55
	end
else
	local var37 = nil
end
t.ScaleTypeProp = var37

if fFlagLuaAppSduiBadgeDetailsComponents then
	local resamplerMode = Enum.ResamplerMode
	local var38 = "RESAMPLER_MODE_"
	
	local var39 = function(p125) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), resamplerMode (ref), protoVariableMapperModule (ref), var38 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p125, var38, sduiParsersModule.getEngineEnumParser(resamplerMode))
	end
	
	local var40 = function(p126, p127, p128, p129, p130, p131) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var39 (ref)
		local var54, var55 = buildDefaultPropModule(p126, p127, p128, p129, p130, p131, var39)
		
		return var54, var55
	end
else
	local var40 = nil
end
t.ResamplerModeProp = var40

if fFlagLuaAppSduiBadgeDetailsComponents then
	local sizeConstraint = Enum.SizeConstraint
	local var41 = "SIZE_CONSTRAINT_"
	
	local var42 = function(p132) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), sizeConstraint (ref), protoVariableMapperModule (ref), var41 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p132, var41, sduiParsersModule.getEngineEnumParser(sizeConstraint))
	end
	
	local var43 = function(p133, p134, p135, p136, p137, p138) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var42 (ref)
		local var54, var55 = buildDefaultPropModule(p133, p134, p135, p136, p137, p138, var42)
		
		return var54, var55
	end
else
	local var43 = nil
end
t.SizeConstraintProp = var43

if fFlagSduiChartsSupport then
	local selectionBehavior = Enum.SelectionBehavior
	local var44 = "SELECTION_BEHAVIOR_"
	
	local var45 = function(p139) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), selectionBehavior (ref), protoVariableMapperModule (ref), var44 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p139, var44, sduiParsersModule.getEngineEnumParser(selectionBehavior))
	end
	
	local var46 = function(p140, p141, p142, p143, p144, p145) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var45 (ref)
		local var54, var55 = buildDefaultPropModule(p140, p141, p142, p143, p144, p145, var45)
		
		return var54, var55
	end
else
	local var46 = nil
end
t.SelectionBehaviorProp = var46

if fFlagSduiTileHoldAction or fFlagSduiFocusNavActionsStructured then
	local keyCode = Enum.KeyCode
	local var48 = "KEY_CODE_"
	
	local var49 = function(p146) --[[ line: 97 ]]
		-- upvalues: sduiParsersModule (ref), keyCode (ref), protoVariableMapperModule (ref), var48 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p146, var48, sduiParsersModule.getEngineEnumParser(keyCode))
	end
	
	local var47 = function(p147, p148, p149, p150, p151, p152) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), var49 (ref)
		local var54, var55 = buildDefaultPropModule(p147, p148, p149, p150, p151, p152, var49)
		
		return var54, var55
	end
else
	local var47 = nil
end
t.KeyCodeProp = var47

if fFlagSduiFocusNavActionsStructured then
	local parseFocusNavActions = sduiClientBindingParsersModule.parseFocusNavActions
	
	local var50 = function(p153, p154, p155, p156, p157, p158) --[[ line: 75 ]]
		-- upvalues: buildTablePropModule (ref), parseFocusNavActions (ref)
		local var54, var55 = buildTablePropModule(p153, p154, p155, p156, p157, p158, parseFocusNavActions)
		
		return var54, var55
	end
else
	local var50 = nil
end
t.FocusNavActionsProp = var50
t.ColorStyleProp = if fFlagLuaAppSduiBadgeDetailsComponents then buildDefaultPropModule else nil

if fFlagLuaAppSduiBadgeDetailsComponents then
	local parseUiScaledUDim2 = sduiClientBindingParsersModule.parseUiScaledUDim2
	
	local var51 = function(p159, p160, p161, p162, p163, p164) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim2 (ref)
		local var54, var55 = buildDefaultPropModule(p159, p160, p161, p162, p163, p164, parseUiScaledUDim2)
		
		return var54, var55
	end
else
	local var51 = nil
end
t.UiScaledUDim2Prop = var51

if fFlagLuaAppSduiBadgeDetailsComponents then
	local parseUiScaledUDim = sduiClientBindingParsersModule.parseUiScaledUDim
	
	local var52 = function(p165, p166, p167, p168, p169, p170) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim (ref)
		local var54, var55 = buildDefaultPropModule(p165, p166, p167, p168, p169, p170, parseUiScaledUDim)
		
		return var54, var55
	end
else
	local var52 = nil
end
t.UiScaledUDimProp = var52

if fFlagLuaAppSduiBadgeDetailsComponents then
	local parseUiScaledNumber = sduiClientBindingParsersModule.parseUiScaledNumber
	
	local var53 = function(p171, p172, p173, p174, p175, p176) --[[ line: 75 ]]
		-- upvalues: buildDefaultPropModule (ref), parseUiScaledNumber (ref)
		local var54, var55 = buildDefaultPropModule(p171, p172, p173, p174, p175, p176, parseUiScaledNumber)
		
		return var54, var55
	end
else
	local var53 = nil
end
t.UiScaledFloatProp = var53
t.FillBehaviorProp = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildDefaultPropModule else nil
t.InputSizeProp = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildDefaultPropModule else nil
t.LaunchExperienceAction_ExperienceJoinData = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildTablePropModule else nil
t.AvatarConfigProp = if fFlagSduiExperienceDetailsSupport then buildTablePropModule else nil
t.ArrayOfAvatarProp = if fFlagSduiExperienceDetailsSupport then buildRepeatedPropModule else nil

return function(p177) --[[ line: 283 | named "getPropBuilder" ]]
	-- upvalues: t (ref), buildDefaultPropModule (ref)
	if not p177 then
		error("Failed to find prop builder -- missing propDescriptorName")
	end
	local var57 = t[p177]
	
	if not var57 then
		warn(`Could not find propBuilder for propDescriptorName {p177}. Using default.`)
		var57 = buildDefaultPropModule
	end
	return var57
end