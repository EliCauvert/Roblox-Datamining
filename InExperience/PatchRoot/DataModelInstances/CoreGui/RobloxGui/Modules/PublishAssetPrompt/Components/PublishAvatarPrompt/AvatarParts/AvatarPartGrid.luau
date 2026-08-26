local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local gridMetrics = UIBloxModule.App.Grid.GridMetrics
local defaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local constantsModule = require(script.Parent.Parent.Parent.Parent.Constants)
local avatarItemCardModule = require(script.Parent.AvatarItemCard)
local itemTile = UIBloxModule.Tile.ItemTile
local vector2 = Vector2.new(20, 20)

local function _(p1)
	local r15ArtistIntent = Instance.new("Folder")
	r15ArtistIntent.Name = "R15ArtistIntent"
	
	for i, v in p1 do
		v.Parent = r15ArtistIntent
	end
	return { [1] = r15ArtistIntent }
end

local _ = function(p2, p3)
	return p2:FindFirstChild(p3)
end

local function getItems(p2, _)
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	for i, v in ipairs(p2:GetChildren()) do
		if v:IsA("Accessory") then
			if v.AccessoryType == Enum.AccessoryType.Eyebrow then
				var2 = v
			elseif v.AccessoryType == Enum.AccessoryType.Eyelash then
				var1 = v
			elseif v.AccessoryType == Enum.AccessoryType.Hair then
				var3 = v
			end
		end
	end
	local t = {}
	local t_1 = { partName = "Head", asset = p2:FindFirstChild("Head") }
	local t_2 = { partName = "Torso" }
	local list = {
		p2:FindFirstChild("UpperTorso"),
		p2:FindFirstChild("LowerTorso")
	}
	local r15ArtistIntent = Instance.new("Folder")
	r15ArtistIntent.Name = "R15ArtistIntent"
	
	for i_1, v_1 in list do
		v_1.Parent = r15ArtistIntent
	end
	t_2.asset = { [1] = r15ArtistIntent }
	local t_3 = { partName = "Left Arm" }
	local list_1 = {
		p2:FindFirstChild("LeftUpperArm"),
		p2:FindFirstChild("LeftLowerArm"),
		p2:FindFirstChild("LeftHand")
	}
	local r15ArtistIntent_1 = Instance.new("Folder")
	r15ArtistIntent_1.Name = "R15ArtistIntent"
	
	for i_2, v_2 in list_1 do
		v_2.Parent = r15ArtistIntent_1
	end
	t_3.asset = { [1] = r15ArtistIntent_1 }
	local t_4 = { partName = "Left Leg" }
	local list_2 = {
		p2:FindFirstChild("LeftUpperLeg"),
		p2:FindFirstChild("LeftLowerLeg"),
		p2:FindFirstChild("LeftFoot")
	}
	local r15ArtistIntent_2 = Instance.new("Folder")
	r15ArtistIntent_2.Name = "R15ArtistIntent"
	
	for i_3, v_3 in list_2 do
		v_3.Parent = r15ArtistIntent_2
	end
	t_4.asset = { [1] = r15ArtistIntent_2 }
	local t_5 = { partName = "Right Arm" }
	local list_3 = {
		p2:FindFirstChild("RightUpperArm"),
		p2:FindFirstChild("RightLowerArm"),
		p2:FindFirstChild("RightHand")
	}
	local r15ArtistIntent_3 = Instance.new("Folder")
	r15ArtistIntent_3.Name = "R15ArtistIntent"
	
	for i_4, v_4 in list_3 do
		v_4.Parent = r15ArtistIntent_3
	end
	t_5.asset = { [1] = r15ArtistIntent_3 }
	local t_6 = { partName = "Right Leg" }
	local list_4 = {
		p2:FindFirstChild("RightUpperLeg"),
		p2:FindFirstChild("RightLowerLeg"),
		p2:FindFirstChild("RightFoot")
	}
	local r15ArtistIntent_4 = Instance.new("Folder")
	r15ArtistIntent_4.Name = "R15ArtistIntent"
	
	for i_5, v_5 in list_4 do
		v_5.Parent = r15ArtistIntent_4
	end
	t_6.asset = { [1] = r15ArtistIntent_4 }
	-- Unknown statement at pc 1: <SetList>
	
	if var2 then
		table.insert(t, { partName = "Eyebrows", asset = var2 })
	end
	if var1 then
		table.insert(t, { partName = "Eyelashes", asset = var1 })
	end
	if var3 then
		table.insert(t, { partName = "Hair", asset = var3 })
	end
	return t
end

return function(p3)
	-- upvalues: reactModule (ref), getItems (ref), constantsModule (ref), avatarItemCardModule (ref), itemTile (ref), defaultMetricsGridView (ref), gridMetrics (ref), vector2 (ref)
	local var4, var5 = reactModule.useState({})
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var5 (ref), getItems (copy)
		if p3.humanoidModel then
			var5(getItems(p3.humanoidModel:Clone(), p3.name))
			
			return
		end
		local t = {}
		
		for i = 1, 6 do
			t[i] = {}
		end
		var5(t)
	end, { p3.humanoidModel })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref)
		if var4[1] and var4[1].asset then
			local t = {}
			
			for i, v in var4 do
				t[i] = { asset = v.asset, partName = v.partName }
			end
			var5(t)
		end
	end, { p3.name })
	local var6 = if p3.screenSize.X < p3.screenSize.Y then constantsModule.ItemCardWidthPortrait else constantsModule.ItemCardWidthLandscape
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p3.LayoutOrder
	}, {
		Grid = reactModule.createElement(defaultMetricsGridView, {
			getItemHeight = function(p4)
				return p4 * 1.333333333333
			end,
			getItemMetrics = gridMetrics.makeCustomMetricsGetter({ minimumItemsPerRow = 2, minimumItemWidth = var6 }),
			renderItem = reactModule.useCallback(function(p4)
				-- upvalues: reactModule (copy), avatarItemCardModule (copy), p3 (ref), var6 (ref), itemTile (copy)
				return if p4.asset then reactModule.createElement(avatarItemCardModule, {
					asset = p4.asset,
					bodyName = p3.name,
					partName = p4.partName,
					viewportSize = var6
				}) else reactModule.createElement(itemTile)
			end, { var6, p3.name }),
			itemPadding = vector2,
			items = var4
		})
	})
end