local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local DataSource = require(ViewRecyclerReact.Parent.ViewRecycler).DataSource
local ReactModule = require(ViewRecyclerReact.Parent.React)

return function(Tbl, p1) --[[ Line: 7 | Named "useReconciledDataSource" ]]
	-- upvalues: ReactModule (copy), DataSource (copy)
	local UseStateResult = ReactModule.useState(function() --[[ Line: 8 ]]
		-- upvalues: DataSource (upval), Tbl (copy), p1 (copy)
		return DataSource.sequence(Tbl, p1)
	end)
	local UseRefResult = ReactModule.useRef(table.clone(Tbl))
	ReactModule.useLayoutEffect(function() --[[ Line: 13 ]]
		-- upvalues: DataSource (upval), UseStateResult (copy), UseRefResult (copy), Tbl (copy), p1 (copy)
		DataSource.reconcileSnapshot(UseStateResult, UseRefResult.current, Tbl, p1)
		UseRefResult.current = table.clone(Tbl)
	end, { UseStateResult, Tbl, p1 })
	
	return UseStateResult
end