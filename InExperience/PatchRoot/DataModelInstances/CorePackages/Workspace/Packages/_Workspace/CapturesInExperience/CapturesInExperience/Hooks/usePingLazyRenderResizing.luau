local useEffect = require(script.Parent.Parent.Parent.React).useEffect

function usePingLazyRenderResizing(p1, p2)
	-- upvalues: useEffect (ref)
	useEffect(function()
		-- upvalues: p1 (ref)
		local _ = p1.current and p1.current.AbsoluteSize
	end, { p2 })
end

return usePingLazyRenderResizing