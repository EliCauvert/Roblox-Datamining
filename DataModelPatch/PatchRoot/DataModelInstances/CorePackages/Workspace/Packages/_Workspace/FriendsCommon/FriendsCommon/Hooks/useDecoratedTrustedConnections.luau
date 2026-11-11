local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.GraphQLServer)
local GetResult = if FFlagConnectionManagementChips then DataHydrationModule.TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p1)
	-- upvalues: FFlagConnectionManagementChips (copy), GetResult (copy), SignalsReactModule (copy), ReactModule (copy), CryoModule (copy)
	if not FFlagConnectionManagementChips then return end
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetResult.getUserTrustedConnections().data)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		if not p1 then
			return {}
		end
		local t = {}
		
		for _, value in p1 do
			t[value.id] = true
		end
		return t
	end, { p1 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy)
		if not UseSignalStateResult then
			return {}
		end
		local t = {}
		
		for _, value in UseSignalStateResult do
			t[value.id] = true
		end
		return t
	end, { UseSignalStateResult })
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), CryoModule (upval), p1 (copy), UseMemoResult1 (copy), UseMemoResult (copy)
		return if UseSignalStateResult then CryoModule.List.join(CryoModule.List.filter(p1 or {}, function(p2): boolean
			-- upvalues: UseMemoResult1 (upval)
			return UseMemoResult1[p2.id] == true
		end), (CryoModule.List.filter(UseSignalStateResult, function(p2): boolean
			-- upvalues: UseMemoResult (upval)
			return UseMemoResult[p2.id] ~= true
		end))) else {}
	end, { UseMemoResult1, UseSignalStateResult, UseMemoResult }))
end