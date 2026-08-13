local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local view = foundationModule.View
local empty = foundationModule.Empty
local iconSize = foundationModule.Enums.IconSize
local constantsModule = require(parent.Common.Constants)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)

local var4 = function() --[[ line: 16 ]] end

return reactModule.memo(function(p0) --[[ line: 25 | named "ServiceUnavailableStateImpl" ]]
	-- upvalues: constantsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), reactModule (ref), view (ref), empty (ref), iconSize (ref), var4 (ref)
	local var6, var7
	local var5 = if p0.useLegacyPanelStyling then constantsModule.LEGACY_STATE_PANEL_TAG else constantsModule.STATE_PANEL_TAG
	local _ = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var8 = useLocalization({
			body = "InGame.PlayerList.LeaderboardUnavailable",
			retry = "InGame.PlayerList.Retry"
		})
		var6 = var8.body
		var7 = var8.retry
	else
		var6 = "Leaderboard unavailable. Please try again later."
		var7 = "Retry"
	end
	return reactModule.createElement(view, { tag = var5, LayoutOrder = p0.layoutOrder }, {
		Content = reactModule.createElement(empty, {
			icon = { name = "triangle-exclamation", size = iconSize.Large },
			text = var6,
			button = { text = var7, onActivated = p0.onRetry or var4 }
		})
	})
end)