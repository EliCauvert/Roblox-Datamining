-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local _nil = require(script.Parent.Parent.Parent.Parent.Shared).Symbol.named("Nil")
local t = {}

local function tryPropertyName(p0, p1) --[[ line: 33 ]]
	return p0[p1]
end

return function(p2, p3) --[[ line: 37 | named "getDefaultInstanceProperty" ]]
	-- upvalues: t (ref), _nil (ref), tryPropertyName (ref)
	local var3 = t[p2]
	
	if var3 then
		local var4 = var3[p3]
		
		if var4 == _nil then
			return true, nil
		elseif var4 ~= nil then
			return true, var4
		end
	else
		var3 = {}
		t[p2] = var3
	end
	local var5 = Instance.new(p2)
	local ok, status = pcall(tryPropertyName, var5, p3)
	var5:Destroy()
	
	if ok then
		if status == nil then
			var3[p3] = _nil
			
			return ok, status
		end
		var3[p3] = status
	end
	return ok, status
end