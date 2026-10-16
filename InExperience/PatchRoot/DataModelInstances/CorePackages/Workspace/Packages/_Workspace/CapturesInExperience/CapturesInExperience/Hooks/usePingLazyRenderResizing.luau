local UseEffectFunction = require(script.Parent.Parent.Parent.React).useEffect

function usePingLazyRenderResizing(p1, p2) --[[ Line: 6 ]]
	-- upvalues: UseEffectFunction (copy)
	UseEffectFunction(function() --[[ Line: 7 ]]
		-- upvalues: p1 (copy)
		if p1.current then
			local _ = p1.current.AbsoluteSize
		end
	end, { p2 })
end

return usePingLazyRenderResizing