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
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiSystemBannerComponent = require(parent.SharedFlags).FFlagSduiSystemBannerComponent
local fFlagSduiTileHoldAction = require(parent.SharedFlags).FFlagSduiTileHoldAction
local fFlagLuaAppSduiColorPropMigration = require(parent.SharedFlags).FFlagLuaAppSduiColorPropMigration
local fFlagSduiGenericContainerDispatch = require(parent.SharedFlags).FFlagSduiGenericContainerDispatch
local fFlagSduiFocusNavActionsStructured = require(parent.SharedFlags).FFlagSduiFocusNavActionsStructured

local function _(p0, p1)
	return function(p2, p3, p4, p5, p6, p7)
		-- upvalues: p0 (ref), p1 (ref)
		local var42, var43 = p0(p2, p3, p4, p5, p6, p7, p1)
		
		return var42, var43
	end
end

local _ = function(p8, p9)
	-- upvalues: buildDefaultPropModule (ref), sduiParsersModule (ref), protoVariableMapperModule (ref)
	local var44 = function(p10)
		-- upvalues: sduiParsersModule (copy), p8 (ref), protoVariableMapperModule (copy), p9 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p10, p9, sduiParsersModule.getEngineEnumParser(p8))
	end
	
	return function(p11, p12, p13, p14, p15, p16)
		-- upvalues: buildDefaultPropModule (ref), var44 (ref)
		local var42, var43 = buildDefaultPropModule(p11, p12, p13, p14, p15, p16, var44)
		
		return var42, var43
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

function t.StructProp(p17, p18, p19, p20, p21, p22)
	-- upvalues: buildDefaultPropModule (ref), parseStruct (ref)
	local var42, var43 = buildDefaultPropModule(p17, p18, p19, p20, p21, p22, parseStruct)
	
	return var42, var43
end

local parseImageStringProp = sduiParsersModule.parseImageStringProp_

function t.ImageStringProp(p23, p24, p25, p26, p27, p28)
	-- upvalues: buildStringPropModule (ref), parseImageStringProp (ref)
	local var42, var43 = buildStringPropModule(p23, p24, p25, p26, p27, p28, parseImageStringProp)
	
	return var42, var43
end

local parseImageSetOrImageProp = sduiParsersModule.parseImageSetOrImageProp_

function t.ImageSetProp(p29, p30, p31, p32, p33, p34)
	-- upvalues: buildStringPropModule (ref), parseImageSetOrImageProp (ref)
	local var42, var43 = buildStringPropModule(p29, p30, p31, p32, p33, p34, parseImageSetOrImageProp)
	
	return var42, var43
end

if fFlagLuaAppSduiColorPropMigration then
	local parseColorPropLegacy = sduiClientBindingParsersModule.parseColorPropLegacy
	
	local var15 = function(p35, p36, p37, p38, p39, p40)
		-- upvalues: buildDefaultPropModule (ref), parseColorPropLegacy (ref)
		local var42, var43 = buildDefaultPropModule(p35, p36, p37, p38, p39, p40, parseColorPropLegacy)
		
		return var42, var43
	end
else
	local fromHex = Color3.fromHex
	
	local var15 = function(p41, p42, p43, p44, p45, p46)
		-- upvalues: buildDefaultPropModule (ref), fromHex (ref)
		local var42, var43 = buildDefaultPropModule(p41, p42, p43, p44, p45, p46, fromHex)
		
		return var42, var43
	end
end
t.ColorProp = var15

if fFlagLuaAppSduiColorPropMigration then
	local parseColor3 = sduiClientBindingParsersModule.parseColor3
	
	local var16 = function(p47, p48, p49, p50, p51, p52)
		-- upvalues: buildDefaultPropModule (ref), parseColor3 (ref)
		local var42, var43 = buildDefaultPropModule(p47, p48, p49, p50, p51, p52, parseColor3)
		
		return var42, var43
	end
else
	local var16 = nil
end
t.Color3Prop = var16
t.TypographyProp = buildDefaultPropModule
t.TypographyFontProp = buildDefaultPropModule
local var17 = if fFlagSduiExperienceDetailsSupport then sduiClientBindingParsersModule.parseUDim else sduiParsersModule.parseUDimProp_

function t.UDimProp(p53, p54, p55, p56, p57, p58)
	-- upvalues: buildDefaultPropModule (ref), var17 (ref)
	local var42, var43 = buildDefaultPropModule(p53, p54, p55, p56, p57, p58, var17)
	
	return var42, var43
end

local var18 = if fFlagSduiExperienceDetailsSupport then sduiClientBindingParsersModule.parseUDim2 else sduiParsersModule.parseUDim2Prop_

function t.UDim2Prop(p59, p60, p61, p62, p63, p64)
	-- upvalues: buildDefaultPropModule (ref), var18 (ref)
	local var42, var43 = buildDefaultPropModule(p59, p60, p61, p62, p63, p64, var18)
	
	return var42, var43
end

local parseVector2Prop = sduiParsersModule.parseVector2Prop_

function t.Vector2Prop(p65, p66, p67, p68, p69, p70)
	-- upvalues: buildDefaultPropModule (ref), parseVector2Prop (ref)
	local var42, var43 = buildDefaultPropModule(p65, p66, p67, p68, p69, p70, parseVector2Prop)
	
	return var42, var43
end

t.NestedComponentProp = buildNestedComponentPropModule
t.LazyNestedComponentProp = if fFlagSduiLazyNestedComponentProp then buildLazyNestedComponentPropModule else nil
t.NestedComponentListProp = if fFlagSduiNestedComponentListProp then buildNestedComponentListPropModule else nil
t.LazyNestedComponentListProp = buildLazyNestedComponentListPropModule
local parseStringArray = sduiClientBindingParsersModule.parseStringArray

function t.StringArrayProp(p71, p72, p73, p74, p75, p76)
	-- upvalues: buildDefaultPropModule (ref), parseStringArray (ref)
	local var42, var43 = buildDefaultPropModule(p71, p72, p73, p74, p75, p76, parseStringArray)
	
	return var42, var43
end

local parseIconProp = sduiParsersModule.parseIconProp_

function t.IconProp(p77, p78, p79, p80, p81, p82)
	-- upvalues: buildDefaultPropModule (ref), parseIconProp (ref)
	local var42, var43 = buildDefaultPropModule(p77, p78, p79, p80, p81, p82, parseIconProp)
	
	return var42, var43
end

local parseGradientProp = sduiParsersModule.parseGradientProp_

function t.GradientProp(p83, p84, p85, p86, p87, p88)
	-- upvalues: buildDefaultPropModule (ref), parseGradientProp (ref)
	local var42, var43 = buildDefaultPropModule(p83, p84, p85, p86, p87, p88, parseGradientProp)
	
	return var42, var43
end

local parseArrayOfStruct = sduiClientBindingParsersModule.parseArrayOfStruct

function t.ArrayOfStructProp(p89, p90, p91, p92, p93, p94)
	-- upvalues: buildDefaultPropModule (ref), parseArrayOfStruct (ref)
	local var42, var43 = buildDefaultPropModule(p89, p90, p91, p92, p93, p94, parseArrayOfStruct)
	
	return var42, var43
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
local var19 = "AUTOMATIC_SIZE_"

local var20 = function(p95)
	-- upvalues: sduiParsersModule (ref), automaticSize (ref), protoVariableMapperModule (ref), var19 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p95, var19, sduiParsersModule.getEngineEnumParser(automaticSize))
end

function t.AutomaticSizeProp(p96, p97, p98, p99, p100, p101)
	-- upvalues: buildDefaultPropModule (ref), var20 (ref)
	local var42, var43 = buildDefaultPropModule(p96, p97, p98, p99, p100, p101, var20)
	
	return var42, var43
end

local textTruncate = Enum.TextTruncate
local var21 = "TEXT_TRUNCATE_"

local var22 = function(p102)
	-- upvalues: sduiParsersModule (ref), textTruncate (ref), protoVariableMapperModule (ref), var21 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p102, var21, sduiParsersModule.getEngineEnumParser(textTruncate))
end

function t.TextTruncateProp(p103, p104, p105, p106, p107, p108)
	-- upvalues: buildDefaultPropModule (ref), var22 (ref)
	local var42, var43 = buildDefaultPropModule(p103, p104, p105, p106, p107, p108, var22)
	
	return var42, var43
end

local textXAlignment = Enum.TextXAlignment
local var23 = "TEXT_X_ALIGNMENT_"

local var24 = function(p109)
	-- upvalues: sduiParsersModule (ref), textXAlignment (ref), protoVariableMapperModule (ref), var23 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p109, var23, sduiParsersModule.getEngineEnumParser(textXAlignment))
end

function t.TextXAlignmentProp(p110, p111, p112, p113, p114, p115)
	-- upvalues: buildDefaultPropModule (ref), var24 (ref)
	local var42, var43 = buildDefaultPropModule(p110, p111, p112, p113, p114, p115, var24)
	
	return var42, var43
end

local textYAlignment = Enum.TextYAlignment
local var25 = "TEXT_Y_ALIGNMENT_"

local var26 = function(p116)
	-- upvalues: sduiParsersModule (ref), textYAlignment (ref), protoVariableMapperModule (ref), var25 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p116, var25, sduiParsersModule.getEngineEnumParser(textYAlignment))
end

function t.TextYAlignmentProp(p117, p118, p119, p120, p121, p122)
	-- upvalues: buildDefaultPropModule (ref), var26 (ref)
	local var42, var43 = buildDefaultPropModule(p117, p118, p119, p120, p121, p122, var26)
	
	return var42, var43
end

local UIFlexMode = Enum.UIFlexMode
local var27 = "UI_FLEX_MODE_"

local var28 = function(p123)
	-- upvalues: sduiParsersModule (ref), UIFlexMode (ref), protoVariableMapperModule (ref), var27 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p123, var27, sduiParsersModule.getEngineEnumParser(UIFlexMode))
end

function t.UIFlexModeProp(p124, p125, p126, p127, p128, p129)
	-- upvalues: buildDefaultPropModule (ref), var28 (ref)
	local var42, var43 = buildDefaultPropModule(p124, p125, p126, p127, p128, p129, var28)
	
	return var42, var43
end

local scaleType = Enum.ScaleType
local var29 = "SCALE_TYPE_"

local var30 = function(p130)
	-- upvalues: sduiParsersModule (ref), scaleType (ref), protoVariableMapperModule (ref), var29 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p130, var29, sduiParsersModule.getEngineEnumParser(scaleType))
end

function t.ScaleTypeProp(p131, p132, p133, p134, p135, p136)
	-- upvalues: buildDefaultPropModule (ref), var30 (ref)
	local var42, var43 = buildDefaultPropModule(p131, p132, p133, p134, p135, p136, var30)
	
	return var42, var43
end

local resamplerMode = Enum.ResamplerMode
local var31 = "RESAMPLER_MODE_"

local var32 = function(p137)
	-- upvalues: sduiParsersModule (ref), resamplerMode (ref), protoVariableMapperModule (ref), var31 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p137, var31, sduiParsersModule.getEngineEnumParser(resamplerMode))
end

function t.ResamplerModeProp(p138, p139, p140, p141, p142, p143)
	-- upvalues: buildDefaultPropModule (ref), var32 (ref)
	local var42, var43 = buildDefaultPropModule(p138, p139, p140, p141, p142, p143, var32)
	
	return var42, var43
end

local sizeConstraint = Enum.SizeConstraint
local var33 = "SIZE_CONSTRAINT_"

local var34 = function(p144)
	-- upvalues: sduiParsersModule (ref), sizeConstraint (ref), protoVariableMapperModule (ref), var33 (ref)
	return protoVariableMapperModule.mapProtoEngineEnumToLua(p144, var33, sduiParsersModule.getEngineEnumParser(sizeConstraint))
end

function t.SizeConstraintProp(p145, p146, p147, p148, p149, p150)
	-- upvalues: buildDefaultPropModule (ref), var34 (ref)
	local var42, var43 = buildDefaultPropModule(p145, p146, p147, p148, p149, p150, var34)
	
	return var42, var43
end

if fFlagSduiChartsSupport then
	local selectionBehavior = Enum.SelectionBehavior
	local var36 = "SELECTION_BEHAVIOR_"
	
	local var37 = function(p151)
		-- upvalues: sduiParsersModule (ref), selectionBehavior (ref), protoVariableMapperModule (ref), var36 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p151, var36, sduiParsersModule.getEngineEnumParser(selectionBehavior))
	end
	
	local var35 = function(p152, p153, p154, p155, p156, p157)
		-- upvalues: buildDefaultPropModule (ref), var37 (ref)
		local var42, var43 = buildDefaultPropModule(p152, p153, p154, p155, p156, p157, var37)
		
		return var42, var43
	end
else
	local var35 = nil
end
t.SelectionBehaviorProp = var35

if fFlagSduiTileHoldAction or fFlagSduiFocusNavActionsStructured then
	local keyCode = Enum.KeyCode
	local var39 = "KEY_CODE_"
	
	local var40 = function(p158)
		-- upvalues: sduiParsersModule (ref), keyCode (ref), protoVariableMapperModule (ref), var39 (ref)
		return protoVariableMapperModule.mapProtoEngineEnumToLua(p158, var39, sduiParsersModule.getEngineEnumParser(keyCode))
	end
	
	local var38 = function(p159, p160, p161, p162, p163, p164)
		-- upvalues: buildDefaultPropModule (ref), var40 (ref)
		local var42, var43 = buildDefaultPropModule(p159, p160, p161, p162, p163, p164, var40)
		
		return var42, var43
	end
else
	local var38 = nil
end
t.KeyCodeProp = var38

if fFlagSduiFocusNavActionsStructured then
	local parseFocusNavActions = sduiClientBindingParsersModule.parseFocusNavActions
	
	local var41 = function(p165, p166, p167, p168, p169, p170)
		-- upvalues: buildTablePropModule (ref), parseFocusNavActions (ref)
		local var42, var43 = buildTablePropModule(p165, p166, p167, p168, p169, p170, parseFocusNavActions)
		
		return var42, var43
	end
else
	local var41 = nil
end
t.FocusNavActionsProp = var41
t.ColorStyleProp = buildDefaultPropModule
local parseUiScaledUDim2 = sduiClientBindingParsersModule.parseUiScaledUDim2

function t.UiScaledUDim2Prop(p171, p172, p173, p174, p175, p176)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim2 (ref)
	local var42, var43 = buildDefaultPropModule(p171, p172, p173, p174, p175, p176, parseUiScaledUDim2)
	
	return var42, var43
end

local parseUiScaledUDim = sduiClientBindingParsersModule.parseUiScaledUDim

function t.UiScaledUDimProp(p177, p178, p179, p180, p181, p182)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledUDim (ref)
	local var42, var43 = buildDefaultPropModule(p177, p178, p179, p180, p181, p182, parseUiScaledUDim)
	
	return var42, var43
end

local parseUiScaledNumber = sduiClientBindingParsersModule.parseUiScaledNumber

function t.UiScaledFloatProp(p183, p184, p185, p186, p187, p188)
	-- upvalues: buildDefaultPropModule (ref), parseUiScaledNumber (ref)
	local var42, var43 = buildDefaultPropModule(p183, p184, p185, p186, p187, p188, parseUiScaledNumber)
	
	return var42, var43
end

t.FillBehaviorProp = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildDefaultPropModule else nil
t.InputSizeProp = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildDefaultPropModule else nil
t.LaunchExperienceAction_ExperienceJoinData = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then buildTablePropModule else nil
t.AvatarConfigProp = if fFlagSduiExperienceDetailsSupport then buildTablePropModule else nil
t.ArrayOfAvatarProp = if fFlagSduiExperienceDetailsSupport then buildRepeatedPropModule else nil

return function(p189)
	-- upvalues: t (ref), buildDefaultPropModule (ref)
	if not p189 then
		error("Failed to find prop builder -- missing propDescriptorName")
	end
	local var45 = t[p189]
	
	if not var45 then
		warn(`Could not find propBuilder for propDescriptorName {p189}. Using default.`)
		var45 = buildDefaultPropModule
	end
	return var45
end