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

local function _(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function()
		-- upvalues: robloxTranslatorModule (copy), p1 (ref)
		return robloxTranslatorModule:FormatByKey(p1)
	end)
	
	return if ok and status and status ~= "" then status else p2
end

local t = {}
local t_1 = { id = "server" }
local var1 = "CoreScripts.TextChat.ChannelTabs.Here"
local ok, ok_1 = pcall(function()
	-- upvalues: robloxTranslatorModule (ref), var1 (ref)
	return robloxTranslatorModule:FormatByKey(var1)
end)
t_1.text = if ok and ok_1 and ok_1 ~= "" then ok_1 else "Here"
local t_2 = { id = "friends", text = ok }
local var2 = "CommonUI.Features.Label.Friends"
ok_1, ok_2 = pcall(function()
	-- upvalues: robloxTranslatorModule (ref), var2 (ref)
	return robloxTranslatorModule:FormatByKey(var2)
end)
ok = if ok_1 and ok_2 and ok_2 ~= "" then ok_2 else "Friends"
ok = { id = "global", text = ok_1 }
local var3 = "CoreScripts.TextChat.ChannelTabs.Global2"
ok_2, status_2 = pcall(function()
	-- upvalues: robloxTranslatorModule (ref), var3 (ref)
	return robloxTranslatorModule:FormatByKey(var3)
end)
ok_1 = if ok_2 and status_2 and status_2 ~= "" then status_2 else "Global"
-- Unknown statement at pc 28: <SetList>

return reactModule.memo(function(value)
	-- upvalues: usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), signalsReactModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), t (ref), reactModule (ref), view (ref), tabs (ref), inputSize (ref), fillBehavior (ref)
	local var4
	local var5 = usePlatformLeaderboardModule()
	local var6 = signalsReactModule.useSignalState(if var5 ~= nil then fallbackSignalsModule.getHasActiveLeaderboard else var5.getHasActiveLeaderboard)
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var7 = useLocalization({
			here = "CoreScripts.InGameMenu.Controls.Playerlist.Here",
			friends = "CoreScripts.InGameMenu.Controls.Playerlist.Friends",
			global = "CoreScripts.InGameMenu.Controls.Playerlist.Global"
		})
		var4 = {
			{ id = "server", text = var7.here },
			{ id = "friends", text = var7.friends },
			{ id = "global", text = var7.global }
		}
	else
		var4 = t
	end
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), value (ref)
		if not var6 and value.onPlatformTabsUnavailable then
			value.onPlatformTabsUnavailable()
		end
	end, { var6, value.onPlatformTabsUnavailable })
	
	return if var6 then reactModule.createElement(view, {
		Name = "CoreUI_LeaderboardTabs",
		tag = "col size-full-0 auto-y",
		LayoutOrder = value.layoutOrder
	}, {
		Tabs = reactModule.createElement(tabs, {
			activeTabId = value.activeTabId,
			size = inputSize.Small,
			fillBehavior = fillBehavior.Fill,
			onActivated = reactModule.useCallback(function(p1)
				-- upvalues: value (ref)
				value.onActivated(tostring(p1))
			end, { value.onActivated }),
			tabs = var4
		})
	}) else nil
end)