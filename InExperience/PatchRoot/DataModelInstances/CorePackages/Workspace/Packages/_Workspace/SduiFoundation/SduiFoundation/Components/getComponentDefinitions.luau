local SduiFoundation = script:FindFirstAncestor("SduiFoundation")
local SduiComponentType = require(SduiFoundation.Parent.SduiCoreSystem).SduiComponentType
local FFlagSduiFoundationRatingModule = require(SduiFoundation.Flags.FFlagSduiFoundationRating)
local FFlagSduiFoundationStatusIndicatorModule = require(SduiFoundation.Flags.FFlagSduiFoundationStatusIndicator)

return function()
	-- upvalues: SduiComponentType (copy), FFlagSduiFoundationRatingModule (copy), SduiFoundation (copy), FFlagSduiFoundationStatusIndicatorModule (copy)
	return {
		[SduiComponentType.Rating] = if FFlagSduiFoundationRatingModule then {
			getLazyComponent = function()
				-- upvalues: SduiFoundation (upval)
				return require(SduiFoundation.Components.SduiRating)
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