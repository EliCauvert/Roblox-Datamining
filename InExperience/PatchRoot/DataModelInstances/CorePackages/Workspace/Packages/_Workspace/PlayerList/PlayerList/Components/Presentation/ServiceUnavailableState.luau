local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local view = foundationModule.View
local empty = foundationModule.Empty
local iconSize = foundationModule.Enums.IconSize
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)
local useLegacyAndTransparencyAwarePanelStyleModule = require(parent.Hooks.useLegacyAndTransparencyAwarePanelStyle)

local var1 = function() end

return reactModule.memo(function(p1)
	-- upvalues: useLegacyAndTransparencyAwarePanelStyleModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), reactModule (ref), view (ref), empty (ref), iconSize (ref), var1 (ref)
	local body, retry
	local var2 = useLegacyAndTransparencyAwarePanelStyleModule(p1.useLegacyPanelStyling)
	local _ = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var3 = useLocalization({
			body = "InGame.PlayerList.LeaderboardUnavailable",
			retry = "InGame.PlayerList.Retry"
		})
		body = var3.body
		retry = var3.retry
	else
		body = "Leaderboard unavailable. Please try again later."
		retry = "Retry"
	end
	return reactModule.createElement(view, {
		tag = var2.panelTag,
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = var2.backgroundStyle
	}, {
		Content = reactModule.createElement(empty, {
			icon = { name = "triangle-exclamation", size = iconSize.Large },
			text = body,
			button = { text = retry, onActivated = p1.onRetry or var1 }
		})
	})
end)