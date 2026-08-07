-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:22 2026 Pacific Standard Time.

local roact = require(script.Parent.Parent.Parent.dependencies).Roact
local mockProvidersModule = require(script.Parent.mockProviders)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: mockProvidersModule (ref), roact (ref)
	if p1 == nil then
		p1 = Instance.new("Frame")
	end
	local var1 = roact.mount(mockProvidersModule(p0), p1)
	
	return p1, function() --[[ line: 14 ]]
		-- upvalues: roact (copy), var1 (ref), p1 (write)
		roact.unmount(var1)
		p1:Destroy()
	end
end