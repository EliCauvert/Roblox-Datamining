-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local motion = script:FindFirstAncestor("Motion")
local reactModule = require(motion.Parent.React)
local presenceContextModule = require(motion.AnimatePresence.PresenceContext)
local useIdFallback = require(motion.AnimatePresence.utils).useIdFallback

return function(p0) --[[ line: 30 | named "PresenceProvider" ]]
	-- upvalues: useIdFallback (ref), reactModule (ref), presenceContextModule (ref)
	if p0 == nil then
		error("PresenceProvider: props cannot be nil")
	end
	local children = p0.children
	local isPresent = p0.isPresent
	
	if isPresent == nil then
		isPresent = true
	end
	local passThroughData = p0.passThroughData
	local text = nil
	local ok, status = pcall(function() --[[ line: 53 ]]
		-- upvalues: text (write), useIdFallback (copy)
		text = useIdFallback()
	end)
	
	if not ok then
		warn("PresenceProvider: Error generating ID:", status)
		text = "presence-" .. useIdFallback()
	end
	local t = nil
	local ok_1, status_1 = pcall(function() --[[ line: 64 ]]
		-- upvalues: t (write), reactModule (copy)
		t = reactModule.useRef({})
	end)
	
	if not ok_1 then
		warn("PresenceProvider: Error creating childrenPresence ref:", status_1)
		t = { current = {} }
	end
	local t_1 = {
		id = text,
		isPresent = isPresent,
		register = function(p1) --[[ line: 95 ]]
			-- upvalues: t (write)
			t.current[p1] = false
			
			return function() --[[ line: 99 ]]
				-- upvalues: t (copy), p1 (ref)
				t.current[p1] = nil
			end
		end,
		onExitComplete = function(p2) --[[ line: 74 ]]
			-- upvalues: t (write), p0 (ref)
			if t.current then
				t.current[p2] = true
			end
			local var7 = true
			
			for i, v in pairs(t.current) do
				if not v then
					var7 = false
					break
				end
			end
			if var7 and p0.onExitComplete then
				p0.onExitComplete()
			end
		end,
		passThroughData = passThroughData
	}
	local var6 = nil
	local ok_2, status_2 = pcall(function() --[[ line: 114 ]]
		-- upvalues: var6 (write), reactModule (copy), presenceContextModule (copy), t_1 (ref), children (ref)
		var6 = reactModule.createElement(presenceContextModule.Provider, { value = t_1 }, children)
	end)
	
	if not ok_2 then
		warn("PresenceProvider: Error creating PresenceContext.Provider:", status_2)
	end
	return var6 or reactModule.createElement(reactModule.Fragment, {}, children)
end