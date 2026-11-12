local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact084
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local DataSource = require(ViewRecyclerReact.Parent.ViewRecycler).DataSource
local ReactModule = require(ViewRecyclerReact.Parent.React)

return function(Tbl, p1)
	-- upvalues: ReactModule (copy), DataSource (copy), FFlagViewRecyclerReact084 (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: DataSource (upval), FFlagViewRecyclerReact084 (upval), Tbl (copy), p1 (copy)
		return DataSource.sequence(if FFlagViewRecyclerReact084 then Tbl or {} else Tbl, p1)
	end)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = table.clone(if FFlagViewRecyclerReact084 then Tbl or {} else Tbl)
	end
	ReactModule.useLayoutEffect(function()
		-- upvalues: FFlagViewRecyclerReact084 (upval), Tbl (copy), p1 (copy), DataSource (upval), UseStateResult (copy), UseRefResult (copy)
		if not FFlagViewRecyclerReact084 or Tbl ~= nil and p1 ~= nil then
			DataSource.reconcileSnapshot(UseStateResult, UseRefResult.current, Tbl, p1)
			UseRefResult.current = table.clone(Tbl)
			
			return
		end
	end, { UseStateResult, Tbl, p1 })
	
	return UseStateResult
end