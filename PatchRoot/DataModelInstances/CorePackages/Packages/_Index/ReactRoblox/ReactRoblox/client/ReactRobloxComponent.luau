-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:37 2026 Pacific Standard Time.

local object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local robloxComponentPropsModule = require(script.Parent.roblox.RobloxComponentProps)
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])

return {
	setInitialProperties = robloxComponentPropsModule.setInitialProperties,
	diffProperties = function(_, _, p0, p1, _) --[[ line: 32 ]]
		-- upvalues: object (ref)
		local var1 = nil
		
		for i, v in p0 do
			if p1[i] == nil then
				var1 = var1 or table.create(2)
				table.insert(var1, i)
				table.insert(var1, object.None)
			end
		end
		for i_1, v_1 in p1 do
			if v_1 ~= (if p0 ~= nil then nil else p0[i_1]) then
				var1 = var1 or table.create(2)
				table.insert(var1, i_1)
				table.insert(var1, v_1)
			end
		end
		return var1
	end,
	updateProperties = robloxComponentPropsModule.updateProperties,
	cleanupHostComponent = robloxComponentPropsModule.cleanupHostComponent
}