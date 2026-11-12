local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		return Instance.new("Folder")
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:Destroy()
		end
	end, { UseMemoResult })
	
	return UseMemoResult, (ReactModule.useCallback(function(Parent)
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.Parent = Parent
	end, { UseMemoResult }))
end