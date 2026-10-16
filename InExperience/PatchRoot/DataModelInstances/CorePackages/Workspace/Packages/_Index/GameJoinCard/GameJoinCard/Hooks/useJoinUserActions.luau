local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local ProfileCTAStore = DataHydrationModule.Profile.ProfileCTAStore
local DataStatus = DataHydrationModule.DataStatus
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateComputedFunction = require(Parent.Signals).createComputed
local Computed = CreateComputedFunction(function() --[[ Line: 40 ]]
	return nil
end)
local Computed1 = CreateComputedFunction(function() --[[ Line: 43 ]]
	-- upvalues: DataStatus (copy)
	return DataStatus.NotReady
end)

return function(UserId, Enabled, p1) --[[ Line: 47 | Named "useJoinUserActions" ]]
	-- upvalues: ReactModule (copy), FFlagJoinabilityCTARefactor (copy), ProfileCTAStore (copy), UseSignalStateFunction (copy), Computed (copy), Computed1 (copy)
	local IsEnabled = Enabled == true
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 55 ]]
		-- upvalues: FFlagJoinabilityCTARefactor (upval), UserId (copy), IsEnabled (copy), ProfileCTAStore (upval)
		if FFlagJoinabilityCTARefactor and UserId ~= "" and IsEnabled then
			local GetJoinUserActionsFunction = ProfileCTAStore.get().getJoinUserActions
			
			if GetJoinUserActionsFunction then
				return GetJoinUserActionsFunction(UserId, true)
			end
		end
		return nil
	end, { UserId, IsEnabled, p1 })
	
	if UseMemoResult then
		UseRefResult.current = { userId = UserId, result = UseMemoResult }
	end
	local Current = UseRefResult.current
	local UseMemoResult1 = UseMemoResult
	
	if UseMemoResult1 == nil and Current and Current.userId == UserId then
		UseMemoResult1 = Current.result
	end
	return UseSignalStateFunction(if UseMemoResult1 then UseMemoResult1.data else Computed), (UseSignalStateFunction(if UseMemoResult1 then UseMemoResult1.status else Computed1))
end