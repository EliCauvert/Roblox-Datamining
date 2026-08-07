local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent.Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local displayModule = require(parent.Display)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect

return function() --[[ line: 41 ]]
	-- upvalues: createSignal (ref), cryoModule (ref), guiService (ref), displayModule (ref), createEffect (ref)
	local var4, var5 = createSignal({}, cryoModule.Dictionary.equals)
	
	local var6 = function(p0, p1, p2) --[[ line: 44 ]]
		local t = {}
		local x = p0.X
		local y = p0.Y
		local x_1 = p1.X
		local var10 = p1.Y - y
		local var11 = x
		local var12 = 0
		
		for i, v in ipairs(p2) do
			local var14 = var11 + var12
			table.insert(t, {
				Position = { X = var14, Y = y },
				Size = { X = v.position.X - var14, Y = var10 }
			})
			var11 = v.position.X
			var12 = v.size.X
		end
		local var13 = var11 + var12
		table.insert(t, {
			Position = { X = var13, Y = y },
			Size = { X = x_1 - var13, Y = var10 }
		})
		
		return t
	end
	
	local var7 = function(p3) --[[ line: 96 ]]
		-- upvalues: guiService (copy), displayModule (copy), var6 (ref)
		local _ = {}
		local t = {}
		
		for i, v in pairs(p3) do
			table.insert(t, { id = v.id, size = v.size, position = v.position })
		end
		table.sort(t, function(p4, p5) --[[ line: 111 ]]
			return p4.position.X < p5.position.X and p4.position.X + p4.size.X < p5.size.X + p5.position.X
		end)
		local guiInset, _ = guiService:GetGuiInset()
		local rect = nil
		
		for i_1, v_1 in ipairs(var6(Vector2.new(0, 0), Vector2.new(displayModule.GetDisplayStore(false).getViewportSize(false).X, guiInset.Y), t)) do
			if not rect or rect.Width < v_1.Size.X then
				rect = Rect.new(v_1.Position.X, v_1.Position.Y, v_1.Position.X + v_1.Size.X, v_1.Position.Y + v_1.Size.Y)
			end
		end
		return rect
	end
	
	local var8 = createEffect(function(p6) --[[ line: 157 ]]
		-- upvalues: displayModule (copy), var7 (ref), var4 (ref), guiService (copy)
		local _ = displayModule.GetDisplayStore(p6).getViewportSize(p6)
		local var18 = var7(var4(p6))
		
		if var18 then
			guiService:SetTopbarInset(var18)
		end
	end)
	
	return {
		getKeepOutAreas = var4,
		setKeepOutArea = function(value, p7, p8) --[[ line: 140 ]]
			-- upvalues: var5 (ref), cryoModule (copy), var4 (ref)
			var5(cryoModule.Dictionary.join(var4(false), { [value] = { id = value, position = p7, size = p8 } }))
		end,
		removeKeepOutArea = function(p9) --[[ line: 151 ]]
			-- upvalues: var4 (ref), var5 (ref)
			local var19 = var4(false)
			var19[p9] = nil
			var5(var19)
		end,
		cleanup = function() --[[ line: 165 ]]
			-- upvalues: var8 (ref)
			var8()
		end
	}
end