local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local RobloxTranslatorModule = require(Parent1.RobloxTranslator)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local IXPServiceWrapper = require(Parent1.IXPServiceWrapper).IXPServiceWrapper
local View = FoundationModule.View
local Tabs = FoundationModule.Tabs
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local UsePlatformLeaderboardModule = require(Parent.Hooks.usePlatformLeaderboard)
local FallbackSignalsModule = require(Parent.Common.FallbackSignals)
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local FFlagPlatformLeaderboardsExposure3EnabledModule = require(Parent.Flags.FFlagPlatformLeaderboardsExposure3Enabled)
local FStringPlatformLeaderboardsExposure3LayerModule = require(Parent.Flags.FStringPlatformLeaderboardsExposure3Layer)

local function _(p1, p2)
	-- upvalues: RobloxTranslatorModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: RobloxTranslatorModule (upval), p1 (copy)
		return RobloxTranslatorModule:FormatByKey(p1)
	end)
	
	return if Success and Result and Result ~= "" then Result else p2
end

local v1 = "CoreScripts.TextChat.ChannelTabs.Here"
local Success, Result = pcall(function()
	-- upvalues: RobloxTranslatorModule (copy), v1 (copy)
	return RobloxTranslatorModule:FormatByKey(v1)
end)
local config = {
	id = "server",
	text = if Success and Result and Result ~= "" then Result else "Here"
}
local v2 = "CommonUI.Features.Label.Friends"
local Success1, Result1 = pcall(function()
	-- upvalues: RobloxTranslatorModule (copy), v2 (copy)
	return RobloxTranslatorModule:FormatByKey(v2)
end)
local config1 = {
	id = "friends",
	text = if Success1 and Result1 and Result1 ~= "" then Result1 else "Friends"
}
local v3 = "CoreScripts.TextChat.ChannelTabs.Global2"
local Success2, Result2 = pcall(function()
	-- upvalues: RobloxTranslatorModule (copy), v3 (copy)
	return RobloxTranslatorModule:FormatByKey(v3)
end)
local list = {
	config,
	config1,
	{
		id = "global",
		text = if Success2 and Result2 and Result2 ~= "" then Result2 else "Global"
	}
}

return ReactModule.memo(function(p1)
	-- upvalues: UsePlatformLeaderboardModule (copy), FallbackSignalsModule (copy), SignalsReactModule (copy), FFlagPlatformLeaderboardsExposure3EnabledModule (copy), PlayerListVisibilityStoreModule (copy), ReactModule (copy), IXPServiceWrapper (copy), FStringPlatformLeaderboardsExposure3LayerModule (copy), FFlagPlayerListLocalizeGameTextModule (copy), UseLocalizationFunction (copy), list (copy), View (copy), Tabs (copy), InputSize (copy), FillBehavior (copy)
	local UsePlatformLeaderboardModuleResult = UsePlatformLeaderboardModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UsePlatformLeaderboardModuleResult == nil then FallbackSignalsModule.getHasActiveLeaderboard else UsePlatformLeaderboardModuleResult.getHasActiveLeaderboard)
	
	if FFlagPlatformLeaderboardsExposure3EnabledModule then
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(PlayerListVisibilityStoreModule.getEffectiveVisible)
		local UseSignalStateResult2 = if p1.isVisible == nil then UseSignalStateResult1 else p1.isVisible
		local UseRefResult = ReactModule.useRef(false)
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult2 (copy), UseSignalStateResult (copy), UseRefResult (copy), IXPServiceWrapper (upval), FStringPlatformLeaderboardsExposure3LayerModule (upval)
			if UseSignalStateResult2 and UseSignalStateResult and not UseRefResult.current then
				UseRefResult.current = true
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringPlatformLeaderboardsExposure3LayerModule)
			end
		end, { UseSignalStateResult, UseSignalStateResult2 })
	end
	local Tabs1 = nil
	if FFlagPlayerListLocalizeGameTextModule then
		local UseLocalizationResult = UseLocalizationFunction({
			here = "CoreScripts.InGameMenu.Controls.Playerlist.Here",
			friends = "CoreScripts.InGameMenu.Controls.Playerlist.Friends",
			global = "CoreScripts.InGameMenu.Controls.Playerlist.Global"
		})
		Tabs1 = {
			{ id = "server", text = UseLocalizationResult.here },
			{ id = "friends", text = UseLocalizationResult.friends },
			{ id = "global", text = UseLocalizationResult.global }
		}
	else
		Tabs1 = list
	end
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), p1 (copy)
		if not UseSignalStateResult and p1.onPlatformTabsUnavailable then
			p1.onPlatformTabsUnavailable()
		end
	end, { UseSignalStateResult, p1.onPlatformTabsUnavailable })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		p1.onActivated((tostring(p2)))
	end, { p1.onActivated })
	
	return if UseSignalStateResult then ReactModule.createElement(View, {
		Name = "CoreUI_LeaderboardTabs",
		tag = "col size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Tabs = ReactModule.createElement(Tabs, {
			activeTabId = p1.activeTabId,
			size = InputSize.Small,
			fillBehavior = FillBehavior.Fill,
			onActivated = UseResult,
			tabs = Tabs1
		})
	}) else nil
end)