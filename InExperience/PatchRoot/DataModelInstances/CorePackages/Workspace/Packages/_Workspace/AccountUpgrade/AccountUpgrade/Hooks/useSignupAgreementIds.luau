local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local FetchSignupUserAgreements = require(Parent.UserAgreements).FetchSignupUserAgreements
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local FIntAccountUpgradeAgreementIdsSubmitWaitMsModuleRatio = require(AccountUpgrade.Flags.FIntAccountUpgradeAgreementIdsSubmitWaitMs) / 1000

local function toAgreementIds(Result)
	if Result == nil then
		return nil
	end
	local Ids = {}
	
	for _, value in Result do
		local Id = value.id
		
		if type(Id) == "string" and Id ~= "" then
			table.insert(Ids, Id)
		end
	end
	return if #Ids == 0 then nil else Ids
end

local function resolveNil()
	return nil
end

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalytics (copy), ReactModule (copy), PromiseModule (copy), FetchSignupUserAgreements (copy), toAgreementIds (copy), resolveNil (copy), FIntAccountUpgradeAgreementIdsSubmitWaitMsModuleRatio (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), PromiseModule (upval), UseRefResult (copy), FetchSignupUserAgreements (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), toAgreementIds (upval), resolveNil (upval), FIntAccountUpgradeAgreementIdsSubmitWaitMsModuleRatio (upval)
		if not p1 then
			return PromiseModule.resolve(nil)
		end
		local Current = UseRefResult.current or PromiseModule.try(FetchSignupUserAgreements, UseRoactServiceResult, UseRoactServiceResult1):andThen(toAgreementIds):catch(resolveNil)
		
		if UseRefResult.current == nil then
			UseRefResult.current = Current
			Current:andThen(function(Result)
				-- upvalues: UseRefResult (upval)
				if Result == nil then
					UseRefResult.current = nil
				end
			end)
		end
		return PromiseModule.new(function(Callback)
			-- upvalues: Current (copy), PromiseModule (upval), FIntAccountUpgradeAgreementIdsSubmitWaitMsModuleRatio (upval)
			Current:andThen(Callback)
			PromiseModule.delay(FIntAccountUpgradeAgreementIdsSubmitWaitMsModuleRatio):andThen(function()
				-- upvalues: Callback (copy)
				Callback(nil)
			end)
		end)
	end, { p1, UseRoactServiceResult, UseRoactServiceResult1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult (copy)
		if p1 then
			UseResult()
		end
	end, { p1, UseResult })
	
	return UseResult
end