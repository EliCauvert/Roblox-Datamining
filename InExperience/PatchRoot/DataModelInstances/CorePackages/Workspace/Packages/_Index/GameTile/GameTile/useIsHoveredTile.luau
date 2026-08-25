local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)
local hoverTileCoordinatorModule = require(gameTile.HoverTileCoordinator)

return function(p0, p1, p2, p3)
	-- upvalues: hoverTileCoordinatorModule (ref), reactModule (ref)
	p3 = p3 or hoverTileCoordinatorModule.default
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p1 (ref), var5 (ref), p3 (ref)
		if not p2 then return end
		local function _(p4)
			-- upvalues: p1 (copy), var5 (copy)
			var5(p4 ~= nil and p4 == p1)
		end
		
		local hoveredKey = p3.hoveredKey
		var5(hoveredKey ~= nil and hoveredKey == p1)
		local changedConnection = p3.changed:connect(function(p5)
			-- upvalues: p1 (copy), var5 (copy)
			var5(p5 ~= nil and p5 == p1)
		end)
		
		return function()
			-- upvalues: changedConnection (write)
			if changedConnection ~= nil then
				changedConnection:disconnect()
				changedConnection = nil
			end
		end
	end, { p2, p1, p3 })
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p0 (ref), p3 (ref), p1 (ref)
		if not p2 then return end
		local t = {}
		
		if p0.current ~= nil then
			table.insert(t, p0.current.MouseLeave:Connect(function()
				-- upvalues: p3 (copy), p1 (copy)
				p3:cancelHover(p1)
			end))
			table.insert(t, p0.current.MouseEnter:Connect(function()
				-- upvalues: p3 (copy), p1 (copy)
				p3:requestHover(p1)
			end))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1, p0, p2, p3 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref)
		return function()
			-- upvalues: p1 (copy), p3 (copy)
			if p1 then
				p3:cancelHover(p1)
			end
		end
	end, { p1, p3 })
	
	return p2 and var4
end