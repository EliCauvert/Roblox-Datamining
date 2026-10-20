local RunService = game:GetService("RunService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NativePurchaseProductTypeEnumModule = require(Modules.LuaApp.Enum.NativePurchaseProductTypeEnum)
local NativePurchaseStatusModule = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local SetUserMembershipTypeModule = require(Modules.LuaApp.Actions.SetUserMembershipType)
local SetNativePurchaseResultModule = require(Modules.LuaApp.Actions.SetNativePurchaseResult)
local _ = require(Modules.LuaApp.Models.PremiumFeaturesApi.IAPProduct)
local PollRobuxBalanceModule = require(Modules.LuaApp.Thunks.PollRobuxBalance)
local GetFFlagFixBuyRobuxNotChargedMessageModule = require(Modules.LuaApp.Flags.GetFFlagFixBuyRobuxNotChargedMessage)

local function _(List, MobileProductId): boolean
	for _, value in pairs(List) do
		if value.mobileProductId == MobileProductId then
			return true
		end
	end
	return false
end

return function(p1, MobileProductId, Failed)
	-- upvalues: NativePurchaseStatusModule (copy), SetNativePurchaseResultModule (copy), NativePurchaseProductTypeEnumModule (copy), SetUserMembershipTypeModule (copy), RunService (copy), GetFFlagFixBuyRobuxNotChargedMessageModule (copy), PollRobuxBalanceModule (copy)
	return function(p2)
		-- upvalues: Failed (copy), NativePurchaseStatusModule (upval), SetNativePurchaseResultModule (upval), MobileProductId (copy), NativePurchaseProductTypeEnumModule (upval), SetUserMembershipTypeModule (upval), RunService (upval), GetFFlagFixBuyRobuxNotChargedMessageModule (upval), PollRobuxBalanceModule (upval), p1 (copy)
		local State = p2:getState()
		local LocalUserId = State.LocalUserId
		local UserRobuxEntry = State.UserRobux[State.LocalUserId]
		local NativePurchase = State.NativePurchase
		
		if Failed == NativePurchaseStatusModule.Failed or Failed == NativePurchaseStatusModule.Pending then
			return p2:dispatch(SetNativePurchaseResultModule(MobileProductId, NativePurchaseStatusModule.Failed))
		end
		if NativePurchase.productType == NativePurchaseProductTypeEnumModule.Subscription then
			return p2:dispatch(SetNativePurchaseResultModule(MobileProductId, NativePurchaseStatusModule.Success))
		end
		local Flag = false
		
		for _, subscription in pairs(State.IAPProducts.Subscriptions) do
			if subscription.mobileProductId == MobileProductId then
				Flag = true
				break
			end
		end
		if Flag then
			p2:dispatch(SetUserMembershipTypeModule(LocalUserId, Enum.MembershipType.Premium))
			
			return p2:dispatch(SetNativePurchaseResultModule(MobileProductId, NativePurchaseStatusModule.Success))
		end
		p2:dispatch(SetNativePurchaseResultModule(MobileProductId, NativePurchaseStatusModule.Polling))
		
		if RunService:IsStudio() then
			return p2:dispatch(SetNativePurchaseResultModule(MobileProductId, NativePurchaseStatusModule.Success))
		else
			local RobuxPollingFailedAfterNativePurchase = if GetFFlagFixBuyRobuxNotChargedMessageModule() and Failed == NativePurchaseStatusModule.Success then NativePurchaseStatusModule.RobuxPollingFailedAfterNativePurchase else NativePurchaseStatusModule.Failed
			
			return p2:dispatch(PollRobuxBalanceModule(p1, tostring(LocalUserId), UserRobuxEntry, function(UserRobuxEntry1)
				-- upvalues: UserRobuxEntry (copy), NativePurchaseStatusModule (upval), RobuxPollingFailedAfterNativePurchase (ref), p2 (copy), SetNativePurchaseResultModule (upval), MobileProductId (upval)
				return p2:dispatch(SetNativePurchaseResultModule(MobileProductId, if UserRobuxEntry1 == UserRobuxEntry then RobuxPollingFailedAfterNativePurchase else NativePurchaseStatusModule.Success or RobuxPollingFailedAfterNativePurchase))
			end)):catch(function()
				-- upvalues: p2 (copy), SetNativePurchaseResultModule (upval), MobileProductId (upval), RobuxPollingFailedAfterNativePurchase (ref)
				return p2:dispatch(SetNativePurchaseResultModule(MobileProductId, RobuxPollingFailedAfterNativePurchase))
			end)
		end
	end
end