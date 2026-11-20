local SduiFoundation = script:FindFirstAncestor("SduiFoundation")
local Parent = SduiFoundation.Parent
local FoundationModule = require(Parent.Foundation)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiParsers = SduiCoreSystemModule.SduiParsers
local ParseBooleanProp = SduiParsers.parseBooleanProp_
local ParseColorTokenProp = SduiParsers.parseColorTokenProp_
local ParseIntegerProp = SduiParsers.parseIntegerProp_
local ParseNumberProp = SduiParsers.parseNumberProp_
local ParseStringProp = SduiParsers.parseStringProp_
local ParseUDim2Prop = SduiParsers.parseUDim2Prop_
local ParseVector2Prop = SduiParsers.parseVector2Prop_
local GetLuaTableEnumParserFunction = SduiParsers.getLuaTableEnumParser
local FFlagSduiFoundationFloatingBannerModule = require(SduiFoundation.Flags.FFlagSduiFoundationFloatingBanner)
local FFlagSduiFoundationRatingModule = require(SduiFoundation.Flags.FFlagSduiFoundationRating)
local FFlagSduiFoundationStatusBadgeModule = require(SduiFoundation.Flags.FFlagSduiFoundationStatusBadge)
local FFlagSduiFoundationStatusIndicatorModule = require(SduiFoundation.Flags.FFlagSduiFoundationStatusIndicator)
local FFlagMigrateSduiIcon = require(Parent.SharedFlags).FFlagMigrateSduiIcon

return function()
	-- upvalues: SduiComponentType (copy), FFlagSduiFoundationFloatingBannerModule (copy), SduiFoundation (copy), FFlagMigrateSduiIcon (copy), GetLuaTableEnumParserFunction (copy), FoundationModule (copy), ParseColorTokenProp (copy), ParseVector2Prop (copy), ParseIntegerProp (copy), ParseUDim2Prop (copy), ParseBooleanProp (copy), ParseNumberProp (copy), ParseStringProp (copy), FFlagSduiFoundationRatingModule (copy), FFlagSduiFoundationStatusBadgeModule (copy), FFlagSduiFoundationStatusIndicatorModule (copy)
	return {
		[SduiComponentType.FloatingBanner] = if FFlagSduiFoundationFloatingBannerModule then {
			getLazyComponent = function()
				-- upvalues: SduiFoundation (upval)
				return require(SduiFoundation.Components.SduiFloatingBanner)
			end
		} else nil,
		[SduiComponentType.Icon] = if FFlagMigrateSduiIcon then {
			getLazyComponent = function()
				-- upvalues: SduiFoundation (upval)
				return require(SduiFoundation.Components.SduiIcon)
			end,
			propParsers = {
				name = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconName, "string"),
				style = ParseColorTokenProp,
				size = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconSize, "string"),
				variant = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconVariant, "string"),
				anchorPoint = ParseVector2Prop,
				layoutOrder = ParseIntegerProp,
				position = ParseUDim2Prop,
				visible = ParseBooleanProp,
				zIndex = ParseNumberProp,
				testId = ParseStringProp
			}
		} else nil,
		[SduiComponentType.Rating] = if FFlagSduiFoundationRatingModule then {
			getLazyComponent = function()
				-- upvalues: SduiFoundation (upval)
				return require(SduiFoundation.Components.SduiRating)
			end
		} else nil,
		[SduiComponentType.StatusBadge] = if FFlagSduiFoundationStatusBadgeModule then {
			getLazyComponent = function()
				-- upvalues: SduiFoundation (upval)
				return require(SduiFoundation.Components.SduiStatusBadge)
			end
		} else nil,
		[SduiComponentType.StatusIndicator] = if FFlagSduiFoundationStatusIndicatorModule then {
			getLazyComponent = function()
				-- upvalues: SduiFoundation (upval)
				return require(SduiFoundation.Components.SduiStatusIndicator)
			end
		} else nil
	}
end