local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local reactModule = require(corePackagesService.Packages.React)
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector

local var3 = function(p0, p1, p2)
	local t = {}
	local x = p0.X
	local y = p0.Y
	local x_1 = p1.X
	local var6 = p1.Y - y
	local var7 = x
	local var8 = 0
	
	for i, v in ipairs(p2) do
		local var10 = var7 + var8
		table.insert(t, {
			Position = { X = var10, Y = y },
			Size = { X = v.position.X - var10, Y = var6 }
		})
		var7 = v.position.X
		var8 = v.size.X
	end
	local var9 = var7 + var8
	table.insert(t, {
		Position = { X = var9, Y = y },
		Size = { X = x_1 - var9, Y = var6 }
	})
	
	return t
end

local var4 = function(p3, p4)
	-- upvalues: guiService (ref), var3 (ref)
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
	
	for i_1, v_1 in ipairs(var3(Vector2.new(0, 0), Vector2.new(p3.X, guiInset.Y), t)) do
		if not rect or rect.Width < v_1.Size.X then
			rect = Rect.new(v_1.Position.X, v_1.Position.Y, v_1.Position.X + v_1.Size.X, v_1.Position.Y + v_1.Size.Y)
		end
	end
	return rect
end

local _ = function(p7, p8)
	-- upvalues: var4 (ref), guiService (ref)
	local var14 = var4(p7, p8)
	
	if var14 then
		guiService:SetTopbarInset(var14)
	end
end

function KeepOutAreasHandler(_)
	-- upvalues: useSelector (ref), reactModule (ref), var4 (ref), guiService (ref)
	local var15 = useSelector(function(p9)
		return p9.displayOptions.screenSize
	end)
	local var16 = useSelector(function(p10)
		return p10.displayOptions.keepOutAreas
	end)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var16 (ref), var4 (copy), guiService (copy)
		local var17 = var4(var15, var16)
		
		if var17 then
			guiService:SetTopbarInset(var17)
		end
	end, { var15, var16 })
end

return KeepOutAreasHandler