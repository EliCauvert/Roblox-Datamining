local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SetShowBuyRobuxButtonBadgeModule = require(Modules.LuaApp.Actions.Economy.SetShowBuyRobuxButtonBadge)
local SetBuyRobuxButtonClickedModule = require(Modules.LuaApp.Actions.Economy.SetBuyRobuxButtonClicked)
local SetHasFetchedRobuxBadgeModule = require(Modules.LuaApp.Actions.Economy.SetHasFetchedRobuxBadge)
local ApiFetchRobuxBadgeModule = require(Modules.LuaApp.Thunks.Economy.ApiFetchRobuxBadge)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService

local function _(p1)
	-- upvalues: AppStorageService (copy)
	AppStorageService:SetItem("VirtualItemRobuxBadgeAcknowledgeTime", (tostring(p1)))
	AppStorageService:Flush()
end

local _ = function()
	-- upvalues: AppStorageService (copy)
	return AppStorageService:GetItem("VirtualItemRobuxBadgeAcknowledgeTime") or -1
end

return function()
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), ApiFetchRobuxBadgeModule (copy), AppStorageService (copy), SetShowBuyRobuxButtonBadgeModule (copy), SetHasFetchedRobuxBadgeModule (copy), SetBuyRobuxButtonClickedModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.RobuxVirtualItem.buyRobuxButtonClicked
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		return p1.RobuxVirtualItem.hasFetchedRobuxBadge
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		isVirtualItemAvailable = false,
		activeVirtualItemStartTimeSecondsUtc = -1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult1 (copy), UseDispatchResult (copy), ApiFetchRobuxBadgeModule (upval), UseRoactServiceResult (copy), AppStorageService (upval), SetShowBuyRobuxButtonBadgeModule (upval), SetHasFetchedRobuxBadgeModule (upval), UseStateResult2 (copy)
		if not UseSelectorResult1 then
			UseDispatchResult(ApiFetchRobuxBadgeModule(UseRoactServiceResult)):andThen(function(Result)
				-- upvalues: AppStorageService (upval), UseDispatchResult (upval), SetShowBuyRobuxButtonBadgeModule (upval), SetHasFetchedRobuxBadgeModule (upval), UseStateResult2 (upval)
				if Result.is_virtual_item_available == nil or Result.active_virtual_item_start_time_seconds_utc == nil then return end
				local Number: number? = tonumber(AppStorageService:GetItem("VirtualItemRobuxBadgeAcknowledgeTime") or -1)
				
				if Result.is_virtual_item_available and Number < Result.active_virtual_item_start_time_seconds_utc then
					UseDispatchResult(SetShowBuyRobuxButtonBadgeModule(true))
				end
				UseDispatchResult(SetHasFetchedRobuxBadgeModule())
				UseStateResult2({
					isVirtualItemAvailable = Result.is_virtual_item_available,
					activeVirtualItemStartTimeSecondsUtc = Result.active_virtual_item_start_time_seconds_utc
				})
			end):catch(function() end)
			
			return
		end
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		UseSelectorResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), SetBuyRobuxButtonClickedModule (upval), UseStateResult (copy), AppStorageService (upval), SetShowBuyRobuxButtonBadgeModule (upval)
		if UseSelectorResult then
			UseDispatchResult(SetBuyRobuxButtonClickedModule(false))
			
			if not UseStateResult then return end
			if not UseStateResult.isVirtualItemAvailable or not UseStateResult.activeVirtualItemStartTimeSecondsUtc then return end
			if tonumber(AppStorageService:GetItem("VirtualItemRobuxBadgeAcknowledgeTime") or -1) < UseStateResult.activeVirtualItemStartTimeSecondsUtc then
				AppStorageService:SetItem("VirtualItemRobuxBadgeAcknowledgeTime", (tostring((os.time(os.date("!*t"))))))
				AppStorageService:Flush()
			end
			UseDispatchResult(SetShowBuyRobuxButtonBadgeModule(false))
		end
	end, { UseSelectorResult, UseStateResult })
	
	return nil
end