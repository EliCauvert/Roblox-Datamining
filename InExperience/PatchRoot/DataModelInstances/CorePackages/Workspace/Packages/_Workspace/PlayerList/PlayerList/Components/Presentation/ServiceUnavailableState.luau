local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Empty = FoundationModule.Empty
local IconSize = FoundationModule.Enums.IconSize
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local UseLegacyAndTransparencyAwarePanelStyleModule = require(Parent.Hooks.useLegacyAndTransparencyAwarePanelStyle)

local function v9() --[[ Line: 16 ]] end

return ReactModule.memo(function(p1) --[[ Line: 25 | Named "ServiceUnavailableStateImpl" ]]
	-- upvalues: UseLegacyAndTransparencyAwarePanelStyleModule (copy), FFlagPlayerListLocalizeGameTextModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Empty (copy), IconSize (copy), v9 (copy)
	local UseLegacyAndTransparencyAwarePanelStyleModuleResult = UseLegacyAndTransparencyAwarePanelStyleModule(p1.useLegacyPanelStyling)
	local Retry = nil
	local Body = nil
	
	if FFlagPlayerListLocalizeGameTextModule then
		local UseLocalizationResult = UseLocalizationFunction({
			body = "InGame.PlayerList.LeaderboardUnavailable",
			retry = "InGame.PlayerList.Retry"
		})
		Body = UseLocalizationResult.body
		Retry = UseLocalizationResult.retry
	else
		Body = "Leaderboard unavailable. Please try again later."
		Retry = "Retry"
	end
	return ReactModule.createElement(View, {
		tag = UseLegacyAndTransparencyAwarePanelStyleModuleResult.panelTag,
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = UseLegacyAndTransparencyAwarePanelStyleModuleResult.backgroundStyle
	}, {
		Content = ReactModule.createElement(Empty, {
			icon = { name = "triangle-exclamation", size = IconSize.Large },
			text = Body,
			button = { text = Retry, onActivated = p1.onRetry or v9 }
		})
	})
end)