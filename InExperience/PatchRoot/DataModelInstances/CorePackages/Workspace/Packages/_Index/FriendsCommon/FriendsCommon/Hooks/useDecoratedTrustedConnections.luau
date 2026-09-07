local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local var1 = if fFlagConnectionManagementChips then require(parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get() else nil

return function(p1)
	-- upvalues: fFlagConnectionManagementChips (ref), var1 (ref), signalsReactModule (ref), reactModule (ref), cryoModule (ref)
	if fFlagConnectionManagementChips then
		local var2 = signalsReactModule.useSignalState(var1.getUserTrustedConnections().data)
		local var3 = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			if not p1 then
				return {}
			end
			local t = {}
			
			for i, v in p1 do
				t[v.id] = true
			end
			return t
		end, { p1 })
		local var4 = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			if not var2 then
				return {}
			end
			local t = {}
			
			for i, v in var2 do
				t[v.id] = true
			end
			return t
		end, { var2 })
		
		return reactModule.useMemo(function()
			-- upvalues: var2 (ref), cryoModule (copy), p1 (ref), var4 (ref), var3 (ref)
			return if var2 then cryoModule.List.join(cryoModule.List.filter(p1 or {}, function(p2)
				-- upvalues: var4 (copy)
				return var4[p2.id] == true
			end), cryoModule.List.filter(var2, function(p2)
				-- upvalues: var3 (copy)
				return var3[p2.id] ~= true
			end)) else {}
		end, { var4, var2, var3 })
	end
end