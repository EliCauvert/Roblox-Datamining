local GuiService = game:GetService("GuiService")
local AppStorageService = game:GetService("AppStorageService")
local Parent = script:FindFirstAncestor("AccountSwitching").Parent
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = require(Parent.SharedFlags).FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local AuthCommonModule = require(Parent.AuthCommon)
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local AccountSwitcherConstants = AuthCommonModule.Common.AccountSwitcherConstants
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities

return function(p1, Callback: () -> (), Callback1: () -> (), p2)
	-- upvalues: AccountSwitcherConstants (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AppStorageUtilities (copy), AppStorageService (copy), GuiService (copy), NotificationType (copy)
	if p1 then
		Callback()
		AppStorageUtilities.setAccountSwitchStatus(if FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then if p2 then AccountSwitcherConstants.AccountSwitcherSwitchedFromSignupStatus else AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus else AccountSwitcherConstants.AccountSwitcherSwitchedStatus)
		AppStorageService:Flush()
		GuiService:BroadcastNotification("", NotificationType.DID_SWITCH_ACCOUNT)
		
		return
	else
		Callback1()
	end
end