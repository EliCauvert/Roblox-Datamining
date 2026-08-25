local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local robloxTranslatorModule = require(parent_1.RobloxTranslator)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local view = foundationModule.View
local tabs = foundationModule.Tabs
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local usePlatformLeaderboardModule = require(parent.Hooks.usePlatformLeaderboard)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)

local function _(p0, p1)
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function()
		-- upvalues: robloxTranslatorModule (copy), p0 (ref)
		return robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return if ok and status and status ~= "" then status else p1
end

local t = {}
local t_1 = { id = "server" }
local var9 = "CoreScripts.TextChat.ChannelTabs.Here"
local ok, ok_1 = pcall(function()
	-- upvalues: robloxTranslatorModule (ref), var9 (ref)
	return robloxTranslatorModule:FormatByKey(var9)
end)
t_1.text = if ok and ok_1 and ok_1 ~= "" then ok_1 else "Here"
local t_2 = { id = "friends", text = ok }
local var11 = "CommonUI.Features.Label.Friends"
ok_1, ok_2 = pcall(function()
	-- upvalues: robloxTranslatorModule (ref), var11 (ref)
	return robloxTranslatorModule:FormatByKey(var11)
end)
ok = if ok_1 and ok_2 and ok_2 ~= "" then ok_2 else "Friends"
ok = { id = "global", text = ok_1 }
local var12 = "CoreScripts.TextChat.ChannelTabs.Global2"
ok_2, status_2 = pcall(function()
	-- upvalues: robloxTranslatorModule (ref), var12 (ref)
	return robloxTranslatorModule:FormatByKey(var12)
end)
ok_1 = if ok_2 and status_2 and status_2 ~= "" then status_2 else "Global"
-- Unknown statement at pc 28: <SetList>

return reactModule.memo(function(value)
	-- upvalues: usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), signalsReactModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), t (ref), reactModule (ref), view (ref), tabs (ref), inputSize (ref), fillBehavior (ref)
	local var15
	local var13 = usePlatformLeaderboardModule()
	local var14 = signalsReactModule.useSignalState(if var13 ~= nil then fallbackSignalsModule.getHasActiveLeaderboard else var13.getHasActiveLeaderboard)
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var16 = useLocalization({
			here = "CoreScripts.InGameMenu.Controls.Playerlist.Here",
			friends = "CoreScripts.InGameMenu.Controls.Playerlist.Friends",
			global = "CoreScripts.InGameMenu.Controls.Playerlist.Global"
		})
		var15 = {
			{ id = "server", text = var16.here },
			{ id = "friends", text = var16.friends },
			{ id = "global", text = var16.global }
		}
	else
		var15 = t
	end
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), value (ref)
		if not var14 and value.onPlatformTabsUnavailable then
			value.onPlatformTabsUnavailable()
		end
	end, { var14, value.onPlatformTabsUnavailable })
	
	return if var14 then reactModule.createElement(view, {
		Name = "CoreUI_LeaderboardTabs",
		tag = "col size-full-0 auto-y",
		LayoutOrder = value.layoutOrder
	}, {
		Tabs = reactModule.createElement(tabs, {
			activeTabId = value.activeTabId,
			size = inputSize.Small,
			fillBehavior = fillBehavior.Fill,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: value (ref)
				value.onActivated(tostring(p2))
			end, { value.onActivated }),
			tabs = var15
		})
	}) else nil
end)