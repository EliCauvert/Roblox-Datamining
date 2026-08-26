local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local hoverTileCoordinatorModule = require(gameTile.HoverTileCoordinator)

return function(p1, p2, p3, p4)
	-- upvalues: hoverTileCoordinatorModule (ref), reactModule (ref)
	p4 = p4 or hoverTileCoordinatorModule.default
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), p2 (ref), var2 (ref), p4 (ref)
		if not p3 then return end
		local function _(p5)
			-- upvalues: p2 (copy), var2 (copy)
			var2(p5 ~= nil and p5 == p2)
		end
		
		local hoveredKey = p4.hoveredKey
		var2(hoveredKey ~= nil and hoveredKey == p2)
		local changedConnection = p4.changed:connect(function(p5)
			-- upvalues: p2 (copy), var2 (copy)
			var2(p5 ~= nil and p5 == p2)
		end)
		
		return function()
			-- upvalues: changedConnection (write)
			if changedConnection ~= nil then
				changedConnection:disconnect()
				changedConnection = nil
			end
		end
	end, { p3, p2, p4 })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), p1 (ref), p4 (ref), p2 (ref)
		if not p3 then return end
		local t = {}
		
		if p1.current ~= nil then
			table.insert(t, p1.current.MouseLeave:Connect(function()
				-- upvalues: p4 (copy), p2 (copy)
				p4:cancelHover(p2)
			end))
			table.insert(t, p1.current.MouseEnter:Connect(function()
				-- upvalues: p4 (copy), p2 (copy)
				p4:requestHover(p2)
			end))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p2, p1, p3, p4 })
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p4 (ref)
		return function()
			-- upvalues: p2 (copy), p4 (copy)
			if p2 then
				p4:cancelHover(p2)
			end
		end
	end, { p2, p4 })
	
	return p3 and var1
end