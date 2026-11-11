local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetNotificationCountModule = require(Modules.LuaApp.Actions.SetNotificationCount)
local SetFriendRequestsCountModule = require(Modules.LuaApp.Actions.SetFriendRequestsCount)
local SetUnreadMessageCountModule = require(Modules.LuaApp.Actions.SetUnreadMessageCount)
local SetEmailNotificationCountModule = require(Modules.LuaApp.Actions.SetEmailNotificationCount)
local SetPasswordNotificationCountModule = require(Modules.LuaApp.Actions.SetPasswordNotificationCount)
local SetTencentNoticeBadgeCountModule = require(Modules.Luobu.Actions.SetTencentNoticeBadgeCount)
local DecrementUnreadTencentNoticeCountModule = require(Modules.Luobu.Actions.DecrementUnreadTencentNoticeCount)

return function(p1, p2)
	-- upvalues: SetNotificationCountModule (copy), SetFriendRequestsCountModule (copy), CryoModule (copy), SetUnreadMessageCountModule (copy), SetEmailNotificationCountModule (copy), SetPasswordNotificationCountModule (copy), SetTencentNoticeBadgeCountModule (copy), DecrementUnreadTencentNoticeCountModule (copy)
	local P0 = p1 or {
		TopBarNotificationIcon = 0,
		MorePageMessages = 0,
		MorePageFriends = 0,
		MorePageEmailSettings = 0,
		MorePagePasswordSettings = 0,
		MorePageSettings = 0,
		MorePageTencentUnreadNotice = 0
	}
	
	if p2.type == SetNotificationCountModule.name then
		P0.TopBarNotificationIcon = p2.notificationCount
		
		return P0
	elseif p2.type == SetFriendRequestsCountModule.name then
		return CryoModule.Dictionary.join(P0, { MorePageFriends = p2.count })
	elseif p2.type == SetUnreadMessageCountModule.name then
		return CryoModule.Dictionary.join(P0, { MorePageMessages = p2.count })
	elseif p2.type == SetEmailNotificationCountModule.name then
		return CryoModule.Dictionary.join(P0, {
			MorePageEmailSettings = p2.count,
			MorePageSettings = p2.count + P0.MorePagePasswordSettings
		})
	elseif p2.type == SetPasswordNotificationCountModule.name then
		return CryoModule.Dictionary.join(P0, {
			MorePagePasswordSettings = p2.count,
			MorePageSettings = p2.count + P0.MorePageEmailSettings
		})
	elseif p2.type == SetTencentNoticeBadgeCountModule.name then
		return CryoModule.Dictionary.join(P0, { MorePageTencentUnreadNotice = p2.count })
	elseif p2.type == DecrementUnreadTencentNoticeCountModule.name then
		local MorePageTencentUnreadNoticeDelta = P0.MorePageTencentUnreadNotice - 1
		
		return CryoModule.Dictionary.join(P0, {
			MorePageTencentUnreadNotice = MorePageTencentUnreadNoticeDelta > 0 and MorePageTencentUnreadNoticeDelta or 0
		})
	else
		return P0
	end
end