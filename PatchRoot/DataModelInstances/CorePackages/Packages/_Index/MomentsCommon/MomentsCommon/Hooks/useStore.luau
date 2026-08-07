-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("MomentsCommon").Parent
local reactModule = require(parent.React)
local storeContext = require(parent.RoactRodux).StoreContext

return function() --[[ line: 9 | named "useStore" ]]
	-- upvalues: reactModule (ref), storeContext (ref)
	local var1 = reactModule.useContext(storeContext)
	assert(var1, "useDispatch and useSelector can only be called from a descendant of the Rodux Store Provider")
	
	return var1
end