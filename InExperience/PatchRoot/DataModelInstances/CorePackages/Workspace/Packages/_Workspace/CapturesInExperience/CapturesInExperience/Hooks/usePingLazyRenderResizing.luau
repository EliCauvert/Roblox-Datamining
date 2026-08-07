local useEffect = require(script.Parent.Parent.Parent.React).useEffect

function usePingLazyRenderResizing(p0, p1) --[[ line: 6 ]]
	-- upvalues: useEffect (ref)
	useEffect(function() --[[ line: 7 ]]
		-- upvalues: p0 (ref)
		local _ = p0.current and p0.current.AbsoluteSize
	end, { p1 })
end

return usePingLazyRenderResizing