local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local _ = game:GetService("GuiService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("UserInputService")
local _ = game:GetService("Players")
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Parent = script.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.Flags.GetFFlagEnableTopBarAnalytics)()
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule

function AnalyticsModule.new() --[[ Line: 42 ]]
	-- upvalues: RbxAnalyticsService (copy), AnalyticsModule (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), CryoModule (copy), ConstantsModule (copy)
	local self = setmetatable({
		_target = "client",
		_context = "topbar",
		_defaultProps = {
			universeid = tostring(game.GameId),
			placeid = tostring(game.PlaceId),
			sessionid = RbxAnalyticsService:GetSessionId()
		}
	}, AnalyticsModule)
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		self._defaultProps.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	function self._sendEvent(DismissGamepadNavigationDialog, p1) --[[ Line: 59 ]]
		-- upvalues: CryoModule (upval), self (copy), RbxAnalyticsService (upval)
		RbxAnalyticsService:SendEventDeferred(self._target, self._context, DismissGamepadNavigationDialog, (CryoModule.Dictionary.join(self._defaultProps, p1 or {})))
		
		return nil
	end
	
	function self._onButtonActivated(Button, p1) --[[ Line: 65 ]]
		-- upvalues: self (copy), ConstantsModule (upval)
		return self._sendEvent(ConstantsModule.Analytics.EventNameTopBarButtonActivated, {
			button = Button,
			status = if p1 then ConstantsModule.Analytics.StatusActive else ConstantsModule.Analytics.StatusInactive
		})
	end
	
	return self
end

function AnalyticsModule:onChatButtonActivated(p1) --[[ Line: 75 ]]
	-- upvalues: ConstantsModule (copy)
	return self._onButtonActivated(ConstantsModule.Analytics.ChatButtonName, p1)
end

function AnalyticsModule:onMoreMenuActivated() --[[ Line: 79 ]]
	-- upvalues: ConstantsModule (copy)
	return self._onButtonActivated(ConstantsModule.Analytics.MoreMenuButtonName, true)
end

function AnalyticsModule:onInventoryActivated(p1) --[[ Line: 84 ]]
	-- upvalues: ConstantsModule (copy)
	return self._onButtonActivated(ConstantsModule.Analytics.InventoryButtonName, p1)
end

function AnalyticsModule:onLeaderboardActivated(p1) --[[ Line: 88 ]]
	-- upvalues: ConstantsModule (copy)
	return self._onButtonActivated(ConstantsModule.Analytics.LeaderboardButtonName, p1)
end

function AnalyticsModule:onEmotesActivated(p1) --[[ Line: 92 ]]
	-- upvalues: ConstantsModule (copy)
	return self._onButtonActivated(ConstantsModule.Analytics.EmotesButtonName, p1)
end

function AnalyticsModule:onShowGamepadNavigationDialog() --[[ Line: 96 ]]
	-- upvalues: ConstantsModule (copy)
	return self._sendEvent(ConstantsModule.Analytics.ShowGamepadNavigationDialog)
end

function AnalyticsModule:onDismissGamepadNavigationDialog() --[[ Line: 100 ]]
	-- upvalues: ConstantsModule (copy)
	return self._sendEvent(ConstantsModule.Analytics.DismissGamepadNavigationDialog)
end

AnalyticsModule.default = AnalyticsModule.new()

return AnalyticsModule