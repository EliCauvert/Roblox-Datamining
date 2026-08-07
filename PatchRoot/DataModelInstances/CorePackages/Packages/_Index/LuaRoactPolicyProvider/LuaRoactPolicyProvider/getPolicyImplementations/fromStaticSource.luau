-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:43 2026 Pacific Standard Time.

local function noOpt() --[[ line: 1 ]] end

return function() --[[ line: 3 ]]
	-- upvalues: noOpt (ref)
	return function(p0) --[[ line: 4 ]]
		-- upvalues: noOpt (copy)
		assert(p0, "expected externalPolicy")
		
		return {
			read = function() --[[ line: 8 ]]
				-- upvalues: p0 (ref)
				return p0
			end,
			onPolicyChanged = function(p1) --[[ line: 12 ]]
				-- upvalues: noOpt (copy)
				return Instance.new("BindableEvent").Event:Connect(p1 or noOpt)
			end
		}
	end
end