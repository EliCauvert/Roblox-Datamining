local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("GuiService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("UserInputService")
local _ = game:GetService("Players")
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.Flags.GetFFlagEnableTopBarAnalytics)()
local t = {}
t.__index = t

function t.new() --[[ line: 42 ]]
	-- upvalues: rbxAnalyticsService (ref), t (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), cryoModule (ref), constantsModule (ref)
	local tbl = setmetatable({
		_target = "client",
		_context = "topbar",
		_defaultProps = {
			universeid = tostring(game.GameId),
			placeid = tostring(game.PlaceId),
			sessionid = rbxAnalyticsService:GetSessionId()
		}
	}, t)
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		tbl._defaultProps.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	function tbl._sendEvent(p0, p1) --[[ line: 59 ]]
		-- upvalues: cryoModule (copy), tbl (ref), rbxAnalyticsService (copy)
		rbxAnalyticsService:SendEventDeferred(tbl._target, tbl._context, p0, cryoModule.Dictionary.join(tbl._defaultProps, p1 or {}))
		
		return nil
	end
	
	function tbl._onButtonActivated(p2, p3) --[[ line: 65 ]]
		-- upvalues: tbl (ref), constantsModule (copy)
		return tbl._sendEvent(constantsModule.Analytics.EventNameTopBarButtonActivated, {
			button = p2,
			status = if p3 then constantsModule.Analytics.StatusActive else constantsModule.Analytics.StatusInactive
		})
	end
	
	return tbl
end

function t:onChatButtonActivated(p4) --[[ line: 75 ]]
	-- upvalues: constantsModule (ref)
	return self._onButtonActivated(constantsModule.Analytics.ChatButtonName, p4)
end

function t:onMoreMenuActivated() --[[ line: 79 ]]
	-- upvalues: constantsModule (ref)
	return self._onButtonActivated(constantsModule.Analytics.MoreMenuButtonName, true)
end

function t:onInventoryActivated(p5) --[[ line: 84 ]]
	-- upvalues: constantsModule (ref)
	return self._onButtonActivated(constantsModule.Analytics.InventoryButtonName, p5)
end

function t:onLeaderboardActivated(p6) --[[ line: 88 ]]
	-- upvalues: constantsModule (ref)
	return self._onButtonActivated(constantsModule.Analytics.LeaderboardButtonName, p6)
end

function t:onEmotesActivated(p7) --[[ line: 92 ]]
	-- upvalues: constantsModule (ref)
	return self._onButtonActivated(constantsModule.Analytics.EmotesButtonName, p7)
end

function t:onShowGamepadNavigationDialog() --[[ line: 96 ]]
	-- upvalues: constantsModule (ref)
	return self._sendEvent(constantsModule.Analytics.ShowGamepadNavigationDialog)
end

function t:onDismissGamepadNavigationDialog() --[[ line: 100 ]]
	-- upvalues: constantsModule (ref)
	return self._sendEvent(constantsModule.Analytics.DismissGamepadNavigationDialog)
end

t.default = t.new()

return t