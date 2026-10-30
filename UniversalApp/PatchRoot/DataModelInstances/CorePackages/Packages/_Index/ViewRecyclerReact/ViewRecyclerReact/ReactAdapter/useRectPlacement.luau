local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RectPlacementModule = require(ViewRecyclerReact.ReactAdapter.Private.RectPlacement)
local UseRecyclingScopeModule = require(ViewRecyclerReact.ReactAdapter.Private.useRecyclingScope)

return function(Current)
	-- upvalues: UseRecyclingScopeModule (copy), ReactModule (copy), RectPlacementModule (copy)
	local UseRectPlacement = UseRecyclingScopeModule("useRectPlacement")
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: RectPlacementModule (upval), UseRectPlacement (copy), UseRefResult (copy)
		local NewRectPlacement = RectPlacementModule.new(UseRectPlacement, function()
			-- upvalues: UseRefResult (upval)
			return UseRefResult.current
		end)
		
		return {
			internal = NewRectPlacement,
			public = table.freeze({ sync = NewRectPlacement.sync })
		}
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy)
		return UseStateResult.internal.releaseAll
	end, { UseStateResult })
	
	return UseStateResult.public
end