local SduiFoundation = script:FindFirstAncestor("SduiFoundation")
local SduiComponentType = require(SduiFoundation.Parent.SduiCoreSystem).SduiComponentType
local FFlagSduiFoundationFloatingBannerModule = require(SduiFoundation.Flags.FFlagSduiFoundationFloatingBanner)
local FFlagSduiFoundationRatingModule = require(SduiFoundation.Flags.FFlagSduiFoundationRating)
local FFlagSduiFoundationStatusBadgeModule = require(SduiFoundation.Flags.FFlagSduiFoundationStatusBadge)
local FFlagSduiFoundationStatusIndicatorModule = require(SduiFoundation.Flags.FFlagSduiFoundationStatusIndicator)

return function()
	-- upvalues: SduiComponentType (copy), FFlagSduiFoundationFloatingBannerModule (copy), SduiFoundation (copy), FFlagSduiFoundationRatingModule (copy), FFlagSduiFoundationStatusBadgeModule (copy), FFlagSduiFoundationStatusIndicatorModule (copy)
	return {
		[SduiComponentType.FloatingBanner] = if FFlagSduiFoundationFloatingBannerModule then {
			getLazyComponent = function()
				-- upvalues: SduiFoundation (upval)
				return require(SduiFoundation.Components.SduiFloatingBanner)
			end
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