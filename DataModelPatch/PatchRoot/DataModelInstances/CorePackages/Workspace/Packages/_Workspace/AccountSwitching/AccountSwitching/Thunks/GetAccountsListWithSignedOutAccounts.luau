local Parent = script:FindFirstAncestor("AccountSwitching").Parent
local AuthCommonModule = require(Parent.AuthCommon)
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local GetSignedOutAccountsFunction = AuthCommonModule.Utils.getSignedOutAccounts
local GetAccountsListModule = require(script.Parent.GetAccountsList)
local CryoModule = require(Parent.Cryo)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthAccountPickerAccountsFetchedFunction = AuthAnalyticsModule.Events.authAccountPickerAccountsFetched
local GetFFlagEnableAccountCarouselEventsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountCarouselEvents
local GetFFlagShowInvoluntarilySignedOutAccountsFunction = require(Parent.SharedFlags).GetFFlagShowInvoluntarilySignedOutAccounts
local MaxTotalAccountListSize = game:DefineFastInt("MaxTotalAccountListSize", 10)
local AccountSwitcherSignedOutAccountsLimit = game:DefineFastInt("AccountSwitcherSignedOutAccountsLimit", 5)
local EnableAccountSwitcherSignedOutLimit = game:DefineFastFlag("EnableAccountSwitcherSignedOutLimit", false)

local function ensureAccountsNotSignedOut(LoggedInUsersMetadata)
	-- upvalues: AppStorageUtilities (copy)
	local PreviousAccountsList = AppStorageUtilities.getPreviousAccountsList()
	
	if LoggedInUsersMetadata and #LoggedInUsersMetadata > 0 then
		for _, value in ipairs(LoggedInUsersMetadata) do
			if PreviousAccountsList and PreviousAccountsList[value.user_id] and PreviousAccountsList[value.user_id].signOutTimestamp then
				PreviousAccountsList[value.user_id].signOutTimestamp = nil
			end
		end
	end
	AppStorageUtilities.setPreviousAccountsList(PreviousAccountsList)
end

local function v11(MapResult, JoinResult)
	-- upvalues: AppStorageUtilities (copy), CryoModule (copy), AuthAccountPickerAccountsFetchedFunction (copy), EventStreamConstants (copy)
	local KeysResult = CryoModule.Dictionary.keys((AppStorageUtilities.getPreviousAccountsList()))
	
	if #JoinResult ~= 0 or #KeysResult ~= 0 then
		AuthAccountPickerAccountsFetchedFunction(EventStreamConstants.Context.AccountPickerAccountsFetched, CryoModule.List.map(MapResult, function(p1)
			return p1 and p1.user_id
		end), CryoModule.List.map(JoinResult, function(p1)
			return p1 and p1.user_id
		end), KeysResult)
		
		return
	end
end

return function(p1, p2)
	-- upvalues: GetAccountsListModule (copy), ensureAccountsNotSignedOut (copy), CryoModule (copy), GetFFlagShowInvoluntarilySignedOutAccountsFunction (copy), EnableAccountSwitcherSignedOutLimit (copy), AccountSwitcherSignedOutAccountsLimit (copy), MaxTotalAccountListSize (copy), GetSignedOutAccountsFunction (copy), GetFFlagEnableAccountCarouselEventsFunction (copy), v11 (copy)
	return GetAccountsListModule(p1, p2.isAuthenticated):andThen(function(Result)
		-- upvalues: ensureAccountsNotSignedOut (upval), CryoModule (upval), GetFFlagShowInvoluntarilySignedOutAccountsFunction (upval), p2 (copy), EnableAccountSwitcherSignedOutLimit (upval), AccountSwitcherSignedOutAccountsLimit (upval), MaxTotalAccountListSize (upval), GetSignedOutAccountsFunction (upval), GetFFlagEnableAccountCarouselEventsFunction (upval), v11 (upval)
		local LoggedInUsersMetadata = Result.logged_in_users_metadata or {}
		ensureAccountsNotSignedOut(LoggedInUsersMetadata)
		local MapResult = CryoModule.List.map(LoggedInUsersMetadata, function(p3)
			return {
				has_valid_session = true,
				user_id = p3.user_id,
				username = p3.username,
				display_name = p3.display_name or p3.username
			}
		end)
		local CountMapResult: number = if MapResult then #MapResult else 0
		local v1 = nil
		
		if GetFFlagShowInvoluntarilySignedOutAccountsFunction() then
			local t = {}
			
			for _, value in MapResult do
				t[value.user_id] = true
			end
			v1 = t
		end
		local Largest = math.max((if p2.useAccountSwitcherSignedOutAccountsLimit and EnableAccountSwitcherSignedOutLimit then AccountSwitcherSignedOutAccountsLimit else MaxTotalAccountListSize) - CountMapResult, 0)
		local FilterUnauthenticatedSessionsForAccountPicker = GetFFlagShowInvoluntarilySignedOutAccountsFunction() and p2.filterUnauthenticatedSessionsForAccountPicker
		local SignedOutAccounts = GetSignedOutAccountsFunction(Largest, v1, FilterUnauthenticatedSessionsForAccountPicker)
		
		if not FilterUnauthenticatedSessionsForAccountPicker and p2.filterUnauthenticatedSessionsForAccountPicker then
			SignedOutAccounts = CryoModule.List.filter(SignedOutAccounts, function(p3)
				return p3 and p3.showInAccountPicker
			end)
		end
		local JoinResult = CryoModule.List.join(MapResult, (CryoModule.List.map(SignedOutAccounts, function(p3)
			return {
				has_valid_session = false,
				user_id = p3.userId,
				username = p3.username,
				display_name = p3.displayName
			}
		end)))
		
		if GetFFlagEnableAccountCarouselEventsFunction() then
			pcall(function()
				-- upvalues: v11 (upval), MapResult (ref), JoinResult (copy)
				v11(MapResult, JoinResult)
			end)
		end
		return JoinResult
	end):catch(function(Err)
		warn(Err)
		
		return {}
	end)
end