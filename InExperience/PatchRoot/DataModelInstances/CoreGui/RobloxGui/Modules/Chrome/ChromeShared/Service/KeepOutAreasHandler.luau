local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local reactModule = require(corePackagesService.Packages.React)
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector

local var1 = function(p1, p2, p3)
	local t = {}
	local x = p1.X
	local y = p1.Y
	local x_1 = p2.X
	local var2 = p2.Y - y
	local var3 = x
	local var4 = 0
	
	for i, v in ipairs(p3) do
		local var5 = var3 + var4
		table.insert(t, {
			Position = { X = var5, Y = y },
			Size = { X = v.position.X - var5, Y = var2 }
		})
		var3 = v.position.X
		var4 = v.size.X
	end
	local var6 = var3 + var4
	table.insert(t, {
		Position = { X = var6, Y = y },
		Size = { X = x_1 - var6, Y = var2 }
	})
	
	return t
end

local var7 = function(p4, p5)
	-- upvalues: guiService (ref), var1 (ref)
	local _ = {}
	local t = {}
	
	for i, v in pairs(p5) do
		table.insert(t, { id = v.id, size = v.size, position = v.position })
	end
	table.sort(t, function(p6, p7)
		return p6.position.X < p7.position.X and p6.position.X + p6.size.X < p7.size.X + p7.position.X
	end)
	local guiInset, _ = guiService:GetGuiInset()
	local rect = nil
	
	for i_1, v_1 in ipairs(var1(Vector2.new(0, 0), Vector2.new(p4.X, guiInset.Y), t)) do
		if not rect or rect.Width < v_1.Size.X then
			rect = Rect.new(v_1.Position.X, v_1.Position.Y, v_1.Position.X + v_1.Size.X, v_1.Position.Y + v_1.Size.Y)
		end
	end
	return rect
end

local _ = function(p6, p7)
	-- upvalues: var7 (ref), guiService (ref)
	local var8 = var7(p6, p7)
	
	if var8 then
		guiService:SetTopbarInset(var8)
	end
end

function KeepOutAreasHandler(_)
	-- upvalues: useSelector (ref), reactModule (ref), var7 (ref), guiService (ref)
	local var8 = useSelector(function(p6)
		return p6.displayOptions.screenSize
	end)
	local var9 = useSelector(function(p6)
		return p6.displayOptions.keepOutAreas
	end)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var9 (ref), var7 (copy), guiService (copy)
		local var10 = var7(var8, var9)
		
		if var10 then
			guiService:SetTopbarInset(var10)
		end
	end, { var8, var9 })
end

return KeepOutAreasHandler