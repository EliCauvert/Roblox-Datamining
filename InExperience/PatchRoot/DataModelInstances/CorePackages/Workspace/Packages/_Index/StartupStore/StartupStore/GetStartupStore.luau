local parent = script:FindFirstAncestor("StartupStore").Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local fFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(parent.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange

local function _(p1)
	-- upvalues: retrievalStatus (ref)
	return if p1 ~= retrievalStatus.NotStarted then if p1 ~= retrievalStatus.Fetching then if p1 ~= retrievalStatus.Failed then p1 == retrievalStatus.Done else true else true else true
end

local function joinRetrievalStatus(p1, p2)
	-- upvalues: retrievalStatus (ref)
	if not (if p1 ~= retrievalStatus.NotStarted then if p1 ~= retrievalStatus.Fetching then if p1 ~= retrievalStatus.Failed then p1 == retrievalStatus.Done else true else true else true) then
		p1 = nil
	end
	if not (if p2 ~= retrievalStatus.NotStarted then if p2 ~= retrievalStatus.Fetching then if p2 ~= retrievalStatus.Failed then p2 == retrievalStatus.Done else true else true else true) then
		p2 = nil
	end
	return if p1 == nil then p2 elseif p2 == nil then p1 elseif p1 == retrievalStatus.Failed or p2 == retrievalStatus.Failed then retrievalStatus.Failed elseif p1 == retrievalStatus.NotStarted and p2 == retrievalStatus.NotStarted then retrievalStatus.NotStarted elseif p1 == retrievalStatus.Done and p2 == retrievalStatus.Done then retrievalStatus.Done else retrievalStatus.Fetching
end

local _ = function()
	-- upvalues: fFlagLuaAppChartsResetFetchingStatusOnFilterChange (ref), retrievalStatus (ref)
	return if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then {
		isRefreshFetch = false,
		status = retrievalStatus.NotStarted
	} else retrievalStatus.NotStarted
end

return signalsModule.createComputed(function()
	-- upvalues: createSessionScopedSignal (ref), retrievalStatus (ref), fFlagLuaAppChartsResetFetchingStatusOnFilterChange (ref), signalsModule (ref), joinRetrievalStatus (ref), signalsExperimentalModule (ref)
	local var1, var2 = createSessionScopedSignal(true)
	local var3, var4 = createSessionScopedSignal(retrievalStatus.NotStarted)
	local var5, var6 = createSessionScopedSignal(if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then {
		isRefreshFetch = false,
		status = retrievalStatus.NotStarted
	} else retrievalStatus.NotStarted)
	local var7, var8 = createSessionScopedSignal(retrievalStatus.NotStarted)
	
	return {
		getPreloading = var1,
		getHomePageDataStatus = var3,
		getGamesPageDataStatus = var5,
		getFetchHomePageDataStatusAll = var7,
		getAppLoadingStarted = signalsModule.createComputed(function(p1)
			-- upvalues: var5 (ref), fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var3 (ref), var7 (ref), joinRetrievalStatus (copy), retrievalStatus (copy)
			local var9 = var5(p1)
			
			return joinRetrievalStatus(joinRetrievalStatus(if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then var9.status else var9, var3(p1)), var7(p1)) ~= retrievalStatus.NotStarted
		end),
		setPreloading = var2,
		setHomePageDataStatus = var4,
		setGamesPageDataStatus = function(value, p1)
			-- upvalues: fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var6 (ref)
			if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then
				var6({ status = value, isRefreshFetch = p1 or false })
				
				return
			end
			var6(value)
		end,
		setFetchHomePageDataStatusAll = var8,
		reset = function()
			-- upvalues: signalsExperimentalModule (copy), var2 (ref), var4 (ref), retrievalStatus (copy), var6 (ref), fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var8 (ref)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), var4 (copy), retrievalStatus (copy), var6 (copy), fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var8 (copy)
				var2(true)
				var4(retrievalStatus.NotStarted)
				var6(if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then {
					isRefreshFetch = false,
					status = retrievalStatus.NotStarted
				} else retrievalStatus.NotStarted)
				var8(retrievalStatus.NotStarted)
			end)
		end
	}
end)