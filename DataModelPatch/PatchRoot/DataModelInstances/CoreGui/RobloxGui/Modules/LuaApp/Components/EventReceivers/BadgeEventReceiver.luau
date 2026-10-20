local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(game:GetService("CorePackages").Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ApiFetchUnreadNotificationCountModule = require(Modules.LuaApp.Thunks.ApiFetchUnreadNotificationCount)
local SetNotificationCountModule = require(Modules.LuaApp.Actions.SetNotificationCount)
local GetFFlagLuaAppUpdateNotificationBadgeCountEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUpdateNotificationBadgeCountEnabled)
local BadgeEventReceiver = require(Modules.Common.Roact).Component:extend("BadgeEventReceiver")

function BadgeEventReceiver.init(p1)
	-- upvalues: GetFFlagLuaAppUpdateNotificationBadgeCountEnabledModule (copy)
	local SetNotificationCountFunction = p1.props.setNotificationCount
	local GetNotificationCountFunction = p1.props.getNotificationCount
	local RobloxEventReceiver = p1.props.RobloxEventReceiver
	local Networking = p1.props.networking
	
	if GetFFlagLuaAppUpdateNotificationBadgeCountEnabledModule() then
		p1.lastSeqNumOfNotificationStream = nil
	end
	p1.tokens = {
		RobloxEventReceiver:observeEvent("UpdateNotificationBadge", function(p2, p3)
			-- upvalues: SetNotificationCountFunction (copy)
			if p3 == "NotificationIcon" then
				SetNotificationCountFunction((tonumber(p2.badgeString)))
			end
		end),
		RobloxEventReceiver:observeEvent("NotificationStream", function(p2, p3)
			-- upvalues: SetNotificationCountFunction (copy), GetNotificationCountFunction (copy), Networking (copy), GetFFlagLuaAppUpdateNotificationBadgeCountEnabledModule (upval), p1 (copy)
			if p3 == "NotificationsRead" then
				SetNotificationCountFunction(0)
			else
				GetNotificationCountFunction(Networking)
			end
			if GetFFlagLuaAppUpdateNotificationBadgeCountEnabledModule() and p2 and p2.SequenceNumber then
				p1.lastSeqNumOfNotificationStream = p2.SequenceNumber
			end
		end)
	}
	
	if GetFFlagLuaAppUpdateNotificationBadgeCountEnabledModule() then
		table.insert(p1.tokens, RobloxEventReceiver:observeEvent("signalR", function(ConnectionState, _, p2)
			-- upvalues: p1 (copy), GetNotificationCountFunction (copy), Networking (copy)
			if ConnectionState == Enum.ConnectionState.Connected and p2 and p2.NotificationStream then
				if p1.lastSeqNumOfNotificationStream ~= p2.NotificationStream then
					GetNotificationCountFunction(Networking)
				end
				p1.lastSeqNumOfNotificationStream = p2.NotificationStream
			end
		end))
	end
end

function BadgeEventReceiver:render() end

function BadgeEventReceiver.willUnmount(p1)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
end

return (RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: ApiFetchUnreadNotificationCountModule (copy), SetNotificationCountModule (copy)
	return {
		getNotificationCount = function(p2)
			-- upvalues: Callback (copy), ApiFetchUnreadNotificationCountModule (upval)
			return Callback(ApiFetchUnreadNotificationCountModule(p2))
		end,
		setNotificationCount = function(...)
			-- upvalues: Callback (copy), SetNotificationCountModule (upval)
			return Callback(SetNotificationCountModule(...))
		end
	}
end)(BadgeEventReceiver))))