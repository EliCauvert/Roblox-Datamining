local motion = script:FindFirstAncestor("Motion")
local reactModule = require(motion.Parent.React)
local presenceContextModule = require(motion.AnimatePresence.PresenceContext)
local useIdFallback = require(motion.AnimatePresence.utils).useIdFallback

return function(p1)
	-- upvalues: useIdFallback (ref), reactModule (ref), presenceContextModule (ref)
	if p1 == nil then
		error("PresenceProvider: props cannot be nil")
	end
	local children = p1.children
	local isPresent = p1.isPresent
	
	if isPresent == nil then
		isPresent = true
	end
	local passThroughData = p1.passThroughData
	local text = nil
	local ok, status = pcall(function()
		-- upvalues: text (write), useIdFallback (copy)
		text = useIdFallback()
	end)
	
	if not ok then
		warn("PresenceProvider: Error generating ID:", status)
		text = "presence-" .. useIdFallback()
	end
	local t = nil
	local ok_1, status_1 = pcall(function()
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
		register = function(p2)
			-- upvalues: t (write)
			t.current[p2] = false
			
			return function()
				-- upvalues: t (copy), p2 (ref)
				t.current[p2] = nil
			end
		end,
		onExitComplete = function(p2)
			-- upvalues: t (write), p1 (ref)
			if t.current then
				t.current[p2] = true
			end
			local var1 = true
			
			for i, v in pairs(t.current) do
				if not v then
					var1 = false
					break
				end
			end
			if var1 and p1.onExitComplete then
				p1.onExitComplete()
			end
		end,
		passThroughData = passThroughData
	}
	local var2 = nil
	local ok_2, status_2 = pcall(function()
		-- upvalues: var2 (write), reactModule (copy), presenceContextModule (copy), t_1 (ref), children (ref)
		var2 = reactModule.createElement(presenceContextModule.Provider, { value = t_1 }, children)
	end)
	
	if not ok_2 then
		warn("PresenceProvider: Error creating PresenceContext.Provider:", status_2)
	end
	return var2 or reactModule.createElement(reactModule.Fragment, {}, children)
end