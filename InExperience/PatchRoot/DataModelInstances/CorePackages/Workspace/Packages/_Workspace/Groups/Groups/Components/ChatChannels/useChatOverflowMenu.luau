local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local _ = require(script.Parent.ChatOverflowMenuView)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseResult (copy)
		local List = {}
		local P0 = p1 or {}
		for i, value in P0 do
			table.insert(List, {
				id = tostring(i),
				text = value.title,
				onActivated = function()
					-- upvalues: UseResult (upval), value (copy)
					UseResult()
					value.action()
				end
			})
		end
		return List
	end, { p1, UseResult })
	local v1 = #UseMemoResult > 0
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseStateResult2 (copy)
		if not v1 then
			UseStateResult2(false)
		end
	end, { v1 })
	
	return {
		menuItems = UseMemoResult,
		isMenuOpen = UseStateResult,
		onToggleMenu = UseResult1,
		onCloseMenu = UseResult
	}
end