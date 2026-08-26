local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getMusicStore = require(parent.MomentsCreation).Stores.GetMusicStore

return function(p1)
	-- upvalues: getMusicStore (ref), reactModule (ref), signalsModule (ref)
	local var1 = getMusicStore()
	local var2, var3 = reactModule.useState(var1.getInfoMap(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var3 (ref), var1 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var3 (copy), var1 (copy)
			var3(var1.getInfoMap(p2))
		end)
	end, { var1 })
	local var4 = if p1 ~= nil then nil else var2[p1]
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var1 (ref)
		if p1 ~= nil and var4 == nil then
			var1.fetchInfo(p1)
		end
	end, { p1, var4, var1 })
	
	return var4
end