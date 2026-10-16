local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local HoverTileCoordinatorModule = require(GameTile.HoverTileCoordinator)

return function(p1, HoveredKey, p2, p3) --[[ Line: 11 | Named "useIsHoveredTile" ]]
	-- upvalues: HoverTileCoordinatorModule (copy), ReactModule (copy)
	local P3 = p3 or HoverTileCoordinatorModule.default
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: p2 (copy), HoveredKey (copy), UseStateResult2 (copy), P3 (copy)
		if not p2 then return end
		local function _(HoveredKey1) --[[ Line: 31 | Named "checkAndUpdateState" ]]
			-- upvalues: HoveredKey (upval), UseStateResult2 (upval)
			UseStateResult2(HoveredKey1 ~= nil and HoveredKey1 == HoveredKey)
		end
		
		local HoveredKey1 = P3.hoveredKey
		UseStateResult2(HoveredKey1 ~= nil and HoveredKey1 == HoveredKey)
		local ChangedConnection = P3.changed:connect(function(HoveredKey1) --[[ Line: 38 ]]
			-- upvalues: HoveredKey (upval), UseStateResult2 (upval)
			UseStateResult2(HoveredKey1 ~= nil and HoveredKey1 == HoveredKey)
		end)
		
		return function() --[[ Line: 42 ]]
			-- upvalues: ChangedConnection (ref)
			if ChangedConnection ~= nil then
				ChangedConnection:disconnect()
				ChangedConnection = nil
			end
		end
	end, { p2, HoveredKey, P3 })
	ReactModule.useEffect(function() --[[ Line: 50 ]]
		-- upvalues: p2 (copy), p1 (copy), P3 (copy), HoveredKey (copy)
		if not p2 then return end
		local List = {}
		
		if p1.current ~= nil then
			table.insert(List, p1.current.MouseLeave:Connect(function() --[[ Line: 59 ]]
				-- upvalues: P3 (upval), HoveredKey (upval)
				P3:cancelHover(HoveredKey)
			end))
			table.insert(List, p1.current.MouseEnter:Connect(function() --[[ Line: 65 ]]
				-- upvalues: P3 (upval), HoveredKey (upval)
				P3:requestHover(HoveredKey)
			end))
		end
		return function() --[[ Line: 70 ]]
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { HoveredKey, p1, p2, P3 })
	ReactModule.useEffect(function() --[[ Line: 78 ]]
		-- upvalues: HoveredKey (copy), P3 (copy)
		return function() --[[ Line: 79 ]]
			-- upvalues: HoveredKey (upval), P3 (upval)
			if HoveredKey then
				P3:cancelHover(HoveredKey)
			end
		end
	end, { HoveredKey, P3 })
	
	return p2 and UseStateResult
end