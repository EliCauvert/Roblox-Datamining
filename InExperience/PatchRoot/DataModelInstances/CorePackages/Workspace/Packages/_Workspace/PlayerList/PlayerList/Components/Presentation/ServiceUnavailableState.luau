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

local var4 = function() end

return reactModule.memo(function(p0)
	-- upvalues: useLegacyAndTransparencyAwarePanelStyleModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), reactModule (ref), view (ref), empty (ref), iconSize (ref), var4 (ref)
	local body, retry
	local var5 = useLegacyAndTransparencyAwarePanelStyleModule(p0.useLegacyPanelStyling)
	local _ = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var6 = useLocalization({
			body = "InGame.PlayerList.LeaderboardUnavailable",
			retry = "InGame.PlayerList.Retry"
		})
		body = var6.body
		retry = var6.retry
	else
		body = "Leaderboard unavailable. Please try again later."
		retry = "Retry"
	end
	return reactModule.createElement(view, {
		tag = var5.panelTag,
		LayoutOrder = p0.layoutOrder,
		backgroundStyle = var5.backgroundStyle
	}, {
		Content = reactModule.createElement(empty, {
			icon = { name = "triangle-exclamation", size = iconSize.Large },
			text = body,
			button = { text = retry, onActivated = p0.onRetry or var4 }
		})
	})
end)