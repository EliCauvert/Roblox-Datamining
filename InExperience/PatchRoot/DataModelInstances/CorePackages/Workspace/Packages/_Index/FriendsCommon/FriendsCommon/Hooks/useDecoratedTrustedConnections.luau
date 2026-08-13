local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local var3 = if fFlagConnectionManagementChips then require(parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p0) --[[ line: 15 | named "useDecoratedTrustedConnections" ]]
	-- upvalues: fFlagConnectionManagementChips (ref), var3 (ref), signalsReactModule (ref), reactModule (ref), cryoModule (ref)
	if fFlagConnectionManagementChips then
		local var4 = signalsReactModule.useSignalState(var3.getUserTrustedConnections().data)
		local var5 = reactModule.useMemo(function() --[[ line: 23 ]]
			-- upvalues: p0 (ref)
			if not p0 then
				return {}
			end
			local t = {}
			
			for i, v in p0 do
				t[v.id] = true
			end
			return t
		end, { p0 })
		local var6 = reactModule.useMemo(function() --[[ line: 35 ]]
			-- upvalues: var4 (ref)
			if not var4 then
				return {}
			end
			local t = {}
			
			for i, v in var4 do
				t[v.id] = true
			end
			return t
		end, { var4 })
		
		return reactModule.useMemo(function() --[[ line: 47 ]]
			-- upvalues: var4 (ref), cryoModule (copy), p0 (ref), var6 (ref), var5 (ref)
			return if var4 then cryoModule.List.join(cryoModule.List.filter(p0 or {}, function(p1) --[[ line: 52 ]]
				-- upvalues: var6 (copy)
				return var6[p1.id] == true
			end), cryoModule.List.filter(var4, function(p2) --[[ line: 56 ]]
				-- upvalues: var5 (copy)
				return var5[p2.id] ~= true
			end)) else {}
		end, { var6, var4, var5 })
	end
end