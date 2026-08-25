local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local useAXAnimateScrollFrameModule = require(script.Parent.useAXAnimateScrollFrame)

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: reactModule (ref), useAXAnimateScrollFrameModule (ref)
	local var2 = reactModule.useRef(nil)
	useAXAnimateScrollFrameModule(var2)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), p1 (ref)
		var2.current = p2
		
		if typeof(p1) == "table" then
			p1.current = p2
			
			return
		elseif typeof(p1) == "function" then
			p1(p2)
		end
	end, { p1 })
	local cloned = table.clone(p0)
	cloned.children = nil
	cloned.ref = var3
	
	return reactModule.createElement("ScrollingFrame", cloned, p0.children)
end)