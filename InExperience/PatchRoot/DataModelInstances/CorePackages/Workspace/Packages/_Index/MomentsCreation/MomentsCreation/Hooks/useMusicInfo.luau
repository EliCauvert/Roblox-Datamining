local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getMusicStoreModule = require(momentsCreation.Stores.GetMusicStore)
local _ = require(momentsCreation.Stores.createMusicStore)

return function(p0) --[[ line: 18 | named "useMusicInfo" ]]
	-- upvalues: getMusicStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var4 = getMusicStoreModule()
	local var5, var6 = reactModule.useState(var4.getInfoMap(false))
	reactModule.useEffect(function() --[[ line: 22 ]]
		-- upvalues: signalsModule (copy), var6 (ref), var4 (ref)
		return signalsModule.createEffect(function(p1) --[[ line: 23 ]]
			-- upvalues: var6 (copy), var4 (copy)
			var6(var4.getInfoMap(p1))
		end)
	end, { var4 })
	local var7 = if p0 ~= nil then nil else var5[p0]
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: p0 (ref), var7 (ref), var4 (ref)
		if p0 ~= nil and var7 == nil then
			var4.fetchInfo(p0)
		end
	end, { p0, var7, var4 })
	
	return var7
end