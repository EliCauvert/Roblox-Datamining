local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getMusicStore = require(parent.MomentsCreation).Stores.GetMusicStore

return function(p0)
	-- upvalues: getMusicStore (ref), reactModule (ref), signalsModule (ref)
	local var2 = getMusicStore()
	local var3, var4 = reactModule.useState(var2.getInfoMap(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var4 (ref), var2 (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var4 (copy), var2 (copy)
			var4(var2.getInfoMap(p1))
		end)
	end, { var2 })
	local var5 = if p0 ~= nil then nil else var3[p0]
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var5 (ref), var2 (ref)
		if p0 ~= nil and var5 == nil then
			var2.fetchInfo(p0)
		end
	end, { p0, var5, var2 })
	
	return var5
end