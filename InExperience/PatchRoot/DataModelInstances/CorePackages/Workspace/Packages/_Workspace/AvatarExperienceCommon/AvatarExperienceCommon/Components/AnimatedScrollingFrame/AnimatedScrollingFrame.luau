local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local useAXAnimateScrollFrameModule = require(script.Parent.useAXAnimateScrollFrame)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), useAXAnimateScrollFrameModule (ref)
	local var1 = reactModule.useRef(nil)
	useAXAnimateScrollFrameModule(var1)
	local var2 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), p2 (ref)
		var1.current = p3
		
		if typeof(p2) == "table" then
			p2.current = p3
			
			return
		elseif typeof(p2) == "function" then
			p2(p3)
		end
	end, { p2 })
	local cloned = table.clone(p1)
	cloned.children = nil
	cloned.ref = var2
	
	return reactModule.createElement("ScrollingFrame", cloned, p1.children)
end)