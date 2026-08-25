local parent = script:FindFirstAncestor("StartupStore").Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local fFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(parent.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange

local function _(p0)
	-- upvalues: retrievalStatus (ref)
	return if p0 ~= retrievalStatus.NotStarted then if p0 ~= retrievalStatus.Fetching then if p0 ~= retrievalStatus.Failed then p0 == retrievalStatus.Done else true else true else true
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
	local var3, var4 = createSessionScopedSignal(true)
	local var5, var6 = createSessionScopedSignal(retrievalStatus.NotStarted)
	local var7, var8 = createSessionScopedSignal(if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then {
		isRefreshFetch = false,
		status = retrievalStatus.NotStarted
	} else retrievalStatus.NotStarted)
	local var9, var10 = createSessionScopedSignal(retrievalStatus.NotStarted)
	
	return {
		getPreloading = var3,
		getHomePageDataStatus = var5,
		getGamesPageDataStatus = var7,
		getFetchHomePageDataStatusAll = var9,
		getAppLoadingStarted = signalsModule.createComputed(function(p3)
			-- upvalues: var7 (ref), fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var5 (ref), var9 (ref), joinRetrievalStatus (copy), retrievalStatus (copy)
			local var11 = var7(p3)
			
			return joinRetrievalStatus(joinRetrievalStatus(if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then var11.status else var11, var5(p3)), var9(p3)) ~= retrievalStatus.NotStarted
		end),
		setPreloading = var4,
		setHomePageDataStatus = var6,
		setGamesPageDataStatus = function(value, p4)
			-- upvalues: fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var8 (ref)
			if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then
				var8({ status = value, isRefreshFetch = p4 or false })
				
				return
			end
			var8(value)
		end,
		setFetchHomePageDataStatusAll = var10,
		reset = function()
			-- upvalues: signalsExperimentalModule (copy), var4 (ref), var6 (ref), retrievalStatus (copy), var8 (ref), fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var10 (ref)
			signalsExperimentalModule.batch(function()
				-- upvalues: var4 (copy), var6 (copy), retrievalStatus (copy), var8 (copy), fFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), var10 (copy)
				var4(true)
				var6(retrievalStatus.NotStarted)
				var8(if fFlagLuaAppChartsResetFetchingStatusOnFilterChange then {
					isRefreshFetch = false,
					status = retrievalStatus.NotStarted
				} else retrievalStatus.NotStarted)
				var10(retrievalStatus.NotStarted)
			end)
		end
	}
end)