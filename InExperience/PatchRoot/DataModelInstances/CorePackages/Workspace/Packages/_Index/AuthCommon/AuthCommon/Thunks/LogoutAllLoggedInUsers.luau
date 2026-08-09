local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local messageBusService = game:GetService("MessageBusService")
local promiseModule = require(parent.Promise)
local logoutAllLoggedInUsersRequestModule = require(authCommon.Http.Requests.LogoutAllLoggedInUsersRequest)
local getLoggedInUsersMetadataRequestModule = require(authCommon.Http.Requests.GetLoggedInUsersMetadataRequest)
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local recordSignOutModule = require(authCommon.Utils.recordSignOut)
local buildLiveActivity = game:DefineFastFlag("BuildLiveActivity", false)
local buildLiveActivityCleanup = game:DefineFastFlag("BuildLiveActivityCleanup", false)

local function _() --[[ line: 16 | named "notifyBuildLiveActivityCleanup" ]]
	-- upvalues: messageBusService (ref)
	pcall(function() --[[ line: 17 ]]
		-- upvalues: messageBusService (copy)
		messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", "endAll"), {})
	end)
end

local function requestBuildLiveActivityCleanup() --[[ line: 22 ]]
	-- upvalues: promiseModule (ref), messageBusService (ref)
	return promiseModule.race({
		promiseModule.new(function(p0, _) --[[ line: 23 ]]
			-- upvalues: messageBusService (copy)
			if not pcall(function() --[[ line: 24 ]]
				-- upvalues: messageBusService (copy), p0 (ref)
				messageBusService:MakeRequest("BuildLiveActivity", "endAll", {}, function(_) --[[ line: 25 ]]
					-- upvalues: p0 (copy)
					p0()
				end, {})
			end) then
				p0()
			end
		end),
		promiseModule.delay(0.25)
	})
end

local function recordSignOutOnLogoutAll(value, p1) --[[ line: 37 ]]
	-- upvalues: getLoggedInUsersMetadataRequestModule (ref), recordSignOutModule (ref)
	local var11, var12 = getLoggedInUsersMetadataRequestModule(value, p1):await()
	
	if var11 and var12 and (var12.responseBody and var12.responseBody.logged_in_users_metadata) then
		for i, v in ipairs(var12.responseBody.logged_in_users_metadata) do
			pcall(function() --[[ line: 41 ]]
				-- upvalues: recordSignOutModule (copy), v (ref)
				recordSignOutModule(v, true)
			end)
		end
	end
end

return function(p2, _) --[[ line: 48 ]]
	-- upvalues: fFlagEnableLuaAccountSwitch (ref), promiseModule (ref), appStorageUtilitiesModule (ref), recordSignOutOnLogoutAll (ref), logoutAllLoggedInUsersRequestModule (ref), buildLiveActivity (ref), requestBuildLiveActivityCleanup (ref), buildLiveActivityCleanup (ref), messageBusService (ref)
	if not fFlagEnableLuaAccountSwitch then
		return promiseModule.resolve()
	end
	local accountBlob = appStorageUtilitiesModule.getAccountBlob()
	pcall(recordSignOutOnLogoutAll, p2, accountBlob)
	
	local function logoutAfterCleanup() --[[ line: 57 ]]
		-- upvalues: appStorageUtilitiesModule (copy), logoutAllLoggedInUsersRequestModule (copy), p2 (ref), accountBlob (ref), promiseModule (copy)
		appStorageUtilitiesModule.setAccountBlob("")
		appStorageUtilitiesModule.flush()
		
		return logoutAllLoggedInUsersRequestModule(p2, accountBlob):andThen(function(p4) --[[ line: 60 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(p4.responseBody)
		end):catch(function(p3) --[[ line: 62 ]]
			-- upvalues: promiseModule (copy)
			return if p3.data then promiseModule.reject(p3.data.errorCode) elseif p3.StatusCode then promiseModule.reject({ p3.StatusCode }) else promiseModule.reject()
		end)
	end
	
	if buildLiveActivity then
		return requestBuildLiveActivityCleanup():andThen(logoutAfterCleanup)
	elseif buildLiveActivityCleanup then
		pcall(function() --[[ line: 17 ]]
			-- upvalues: messageBusService (copy)
			messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", "endAll"), {})
		end)
	end
	return logoutAfterCleanup()
end