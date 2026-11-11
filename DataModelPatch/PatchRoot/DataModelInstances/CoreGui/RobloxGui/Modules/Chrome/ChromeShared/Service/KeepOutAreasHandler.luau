local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector

local function v3(Vector, Vector1, List)
	local List1 = {}
	local Y = Vector.Y
	local X: number = Vector1.X
	local YDelta = Vector1.Y - Y
	local X1 = Vector.X
	local X2 = 0
	
	for _, value in ipairs(List) do
		local NewX = X1 + X2
		table.insert(List1, {
			Position = { X = NewX, Y = Y },
			Size = { X = value.position.X - NewX, Y = YDelta }
		})
		X1 = value.position.X
		X2 = value.size.X
	end
	local NewX = X1 + X2
	table.insert(List1, {
		Position = { X = NewX, Y = Y },
		Size = { X = X - NewX, Y = YDelta }
	})
	
	return List1
end

local function v4(p1, List): Rect
	-- upvalues: GuiService (copy), v3 (copy)
	local List1 = {}
	
	for _, value in pairs(List) do
		table.insert(List1, {
			id = value.id,
			size = value.size,
			position = value.position
		})
	end
	table.sort(List1, function(A, B): boolean
		return A.position.X < B.position.X and A.position.X + A.size.X < B.size.X + B.position.X
	end)
	local GuiInset, _ = GuiService:GetGuiInset()
	local v1: Rect? = nil
	
	for _, value1 in ipairs((v3(Vector2.new(0, 0), Vector2.new(p1.X, GuiInset.Y), List1))) do
		if not v1 or v1.Width < value1.Size.X then
			v1 = Rect.new(value1.Position.X, value1.Position.Y, value1.Position.X + value1.Size.X, value1.Position.Y + value1.Size.Y)
		end
	end
	return v1
end

local function _(p2, p3)
	-- upvalues: v4 (copy), GuiService (copy)
	local TopbarInset = v4(p2, p3)
	
	if TopbarInset then
		GuiService:SetTopbarInset(TopbarInset)
	end
end

function KeepOutAreasHandler(_)
	-- upvalues: UseSelectorFunction (copy), ReactModule (copy), v4 (copy), GuiService (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.displayOptions.screenSize
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.displayOptions.keepOutAreas
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseSelectorResult1 (copy), v4 (upval), GuiService (upval)
		local TopbarInset = v4(UseSelectorResult, UseSelectorResult1)
		
		if TopbarInset then
			GuiService:SetTopbarInset(TopbarInset)
		end
	end, { UseSelectorResult, UseSelectorResult1 })
end

return KeepOutAreasHandler