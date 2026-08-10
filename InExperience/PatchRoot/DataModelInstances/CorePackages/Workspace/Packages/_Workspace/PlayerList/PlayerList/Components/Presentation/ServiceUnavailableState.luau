local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local empty = foundationModule.Empty
local iconSize = foundationModule.Enums.IconSize
local constantsModule = require(parent.Common.Constants)

local var3 = function() --[[ line: 14 ]] end

return reactModule.memo(function(p0) --[[ line: 23 | named "ServiceUnavailableStateImpl" ]]
	-- upvalues: constantsModule (ref), reactModule (ref), view (ref), empty (ref), iconSize (ref), var3 (ref)
	return reactModule.createElement(view, {
		tag = if p0.useLegacyPanelStyling then constantsModule.LEGACY_STATE_PANEL_TAG else constantsModule.STATE_PANEL_TAG,
		LayoutOrder = p0.layoutOrder
	}, {
		Content = reactModule.createElement(empty, {
			text = "Leaderboard unavailable. Please try again later.",
			icon = { name = "triangle-exclamation", size = iconSize.Large },
			button = { text = "Retry", onActivated = p0.onRetry or var3 }
		})
	})
end)