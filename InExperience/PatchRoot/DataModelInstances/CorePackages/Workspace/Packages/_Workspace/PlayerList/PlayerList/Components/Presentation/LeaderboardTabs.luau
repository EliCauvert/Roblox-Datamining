local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local robloxTranslatorModule = require(parent_1.RobloxTranslator)
local view = foundationModule.View
local tabs = foundationModule.Tabs
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local usePlatformLeaderboardModule = require(parent.Hooks.usePlatformLeaderboard)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)

local function _(p0, p1) --[[ line: 19 | named "translateOr" ]]
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function() --[[ line: 20 ]]
		-- upvalues: robloxTranslatorModule (copy), p0 (ref)
		return robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return if ok and status and status ~= "" then status else p1
end

local t = {}
local t_1 = { id = "server" }
local var8 = "CoreScripts.TextChat.ChannelTabs.Here"
local ok, ok_1 = pcall(function() --[[ line: 20 ]]
	-- upvalues: robloxTranslatorModule (ref), var8 (ref)
	return robloxTranslatorModule:FormatByKey(var8)
end)
t_1.text = if ok and ok_1 and ok_1 ~= "" then ok_1 else "Here"
local t_2 = { id = "friends", text = ok }
local var10 = "CommonUI.Features.Label.Friends"
ok_1, ok_2 = pcall(function() --[[ line: 20 ]]
	-- upvalues: robloxTranslatorModule (ref), var10 (ref)
	return robloxTranslatorModule:FormatByKey(var10)
end)
ok = if ok_1 and ok_2 and ok_2 ~= "" then ok_2 else "Friends"
ok = { id = "global", text = ok_1 }
local var11 = "CoreScripts.TextChat.ChannelTabs.Global2"
ok_2, status_2 = pcall(function() --[[ line: 20 ]]
	-- upvalues: robloxTranslatorModule (ref), var11 (ref)
	return robloxTranslatorModule:FormatByKey(var11)
end)
ok_1 = if ok_2 and status_2 and status_2 ~= "" then status_2 else "Global"
-- Unknown statement at pc 26: <SetList>

return reactModule.memo(function(value) --[[ line: 42 | named "LeaderboardTabs" ]]
	-- upvalues: usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), signalsReactModule (ref), reactModule (ref), view (ref), tabs (ref), inputSize (ref), fillBehavior (ref), t (ref)
	local var12 = usePlatformLeaderboardModule()
	local var13 = signalsReactModule.useSignalState(if var12 ~= nil then fallbackSignalsModule.getHasActiveLeaderboard else var12.getHasActiveLeaderboard)
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: var13 (ref), value (ref)
		if not var13 and value.onPlatformTabsUnavailable then
			value.onPlatformTabsUnavailable()
		end
	end, { var13, value.onPlatformTabsUnavailable })
	
	return if var13 then reactModule.createElement(view, {
		Name = "CoreUI_LeaderboardTabs",
		tag = "col size-full-0 auto-y",
		LayoutOrder = value.layoutOrder
	}, {
		Tabs = reactModule.createElement(tabs, {
			activeTabId = value.activeTabId,
			size = inputSize.Small,
			fillBehavior = fillBehavior.Fill,
			onActivated = reactModule.useCallback(function(p2) --[[ line: 57 ]]
				-- upvalues: value (ref)
				value.onActivated(tostring(p2))
			end, { value.onActivated }),
			tabs = t
		})
	}) else nil
end)