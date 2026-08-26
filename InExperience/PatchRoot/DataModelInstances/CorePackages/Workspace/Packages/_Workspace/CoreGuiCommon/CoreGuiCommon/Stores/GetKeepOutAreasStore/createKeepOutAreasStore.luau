local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent.Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local displayModule = require(parent.Display)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect

return function()
	-- upvalues: createSignal (ref), cryoModule (ref), guiService (ref), displayModule (ref), createEffect (ref)
	local var1, var2 = createSignal({}, cryoModule.Dictionary.equals)
	
	local var3 = function(p1, p2, p3)
		local t = {}
		local x = p1.X
		local y = p1.Y
		local x_1 = p2.X
		local var4 = p2.Y - y
		local var5 = x
		local var6 = 0
		
		for i, v in ipairs(p3) do
			local var7 = var5 + var6
			table.insert(t, {
				Position = { X = var7, Y = y },
				Size = { X = v.position.X - var7, Y = var4 }
			})
			var5 = v.position.X
			var6 = v.size.X
		end
		local var8 = var5 + var6
		table.insert(t, {
			Position = { X = var8, Y = y },
			Size = { X = x_1 - var8, Y = var4 }
		})
		
		return t
	end
	
	local var9 = function(p4)
		-- upvalues: guiService (copy), displayModule (copy), var3 (ref)
		local _ = {}
		local t = {}
		
		for i, v in pairs(p4) do
			table.insert(t, { id = v.id, size = v.size, position = v.position })
		end
		table.sort(t, function(p5, p6)
			return p5.position.X < p6.position.X and p5.position.X + p5.size.X < p6.size.X + p6.position.X
		end)
		local guiInset, _ = guiService:GetGuiInset()
		local rect = nil
		
		for i_1, v_1 in ipairs(var3(Vector2.new(0, 0), Vector2.new(displayModule.GetDisplayStore(false).getViewportSize(false).X, guiInset.Y), t)) do
			if not rect or rect.Width < v_1.Size.X then
				rect = Rect.new(v_1.Position.X, v_1.Position.Y, v_1.Position.X + v_1.Size.X, v_1.Position.Y + v_1.Size.Y)
			end
		end
		return rect
	end
	
	local var10 = createEffect(function(p5)
		-- upvalues: displayModule (copy), var9 (ref), var1 (ref), guiService (copy)
		local _ = displayModule.GetDisplayStore(p5).getViewportSize(p5)
		local var11 = var9(var1(p5))
		
		if var11 then
			guiService:SetTopbarInset(var11)
		end
	end)
	
	return {
		getKeepOutAreas = var1,
		setKeepOutArea = function(value, p5, p6)
			-- upvalues: var2 (ref), cryoModule (copy), var1 (ref)
			var2(cryoModule.Dictionary.join(var1(false), { [value] = { id = value, position = p5, size = p6 } }))
		end,
		removeKeepOutArea = function(p5)
			-- upvalues: var1 (ref), var2 (ref)
			local var11 = var1(false)
			var11[p5] = nil
			var2(var11)
		end,
		cleanup = function()
			-- upvalues: var10 (ref)
			var10()
		end
	}
end