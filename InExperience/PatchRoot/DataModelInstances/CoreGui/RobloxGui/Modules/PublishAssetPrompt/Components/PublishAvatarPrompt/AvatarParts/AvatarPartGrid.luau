local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local gridMetrics = UIBloxModule.App.Grid.GridMetrics
local defaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local constantsModule = require(script.Parent.Parent.Parent.Parent.Constants)
local avatarItemCardModule = require(script.Parent.AvatarItemCard)
local itemTile = UIBloxModule.Tile.ItemTile
local vector2 = Vector2.new(20, 20)

local function _(p0)
	local r15ArtistIntent = Instance.new("Folder")
	r15ArtistIntent.Name = "R15ArtistIntent"
	
	for i, v in p0 do
		v.Parent = r15ArtistIntent
	end
	return { [1] = r15ArtistIntent }
end

local _ = function(p1, p2)
	return p1:FindFirstChild(p2)
end

local function getItems(p3, _)
	local var8 = nil
	local var9 = nil
	local var10 = nil
	
	for i, v in ipairs(p3:GetChildren()) do
		if v:IsA("Accessory") then
			if v.AccessoryType == Enum.AccessoryType.Eyebrow then
				var9 = v
			elseif v.AccessoryType == Enum.AccessoryType.Eyelash then
				var8 = v
			elseif v.AccessoryType == Enum.AccessoryType.Hair then
				var10 = v
			end
		end
	end
	local t = {}
	local t_1 = { partName = "Head", asset = p3:FindFirstChild("Head") }
	local t_2 = { partName = "Torso" }
	local list = {
		p3:FindFirstChild("UpperTorso"),
		p3:FindFirstChild("LowerTorso")
	}
	local r15ArtistIntent = Instance.new("Folder")
	r15ArtistIntent.Name = "R15ArtistIntent"
	
	for i_1, v_1 in list do
		v_1.Parent = r15ArtistIntent
	end
	t_2.asset = { [1] = r15ArtistIntent }
	local t_3 = { partName = "Left Arm" }
	local list_1 = {
		p3:FindFirstChild("LeftUpperArm"),
		p3:FindFirstChild("LeftLowerArm"),
		p3:FindFirstChild("LeftHand")
	}
	local r15ArtistIntent_1 = Instance.new("Folder")
	r15ArtistIntent_1.Name = "R15ArtistIntent"
	
	for i_2, v_2 in list_1 do
		v_2.Parent = r15ArtistIntent_1
	end
	t_3.asset = { [1] = r15ArtistIntent_1 }
	local t_4 = { partName = "Left Leg" }
	local list_2 = {
		p3:FindFirstChild("LeftUpperLeg"),
		p3:FindFirstChild("LeftLowerLeg"),
		p3:FindFirstChild("LeftFoot")
	}
	local r15ArtistIntent_2 = Instance.new("Folder")
	r15ArtistIntent_2.Name = "R15ArtistIntent"
	
	for i_3, v_3 in list_2 do
		v_3.Parent = r15ArtistIntent_2
	end
	t_4.asset = { [1] = r15ArtistIntent_2 }
	local t_5 = { partName = "Right Arm" }
	local list_3 = {
		p3:FindFirstChild("RightUpperArm"),
		p3:FindFirstChild("RightLowerArm"),
		p3:FindFirstChild("RightHand")
	}
	local r15ArtistIntent_3 = Instance.new("Folder")
	r15ArtistIntent_3.Name = "R15ArtistIntent"
	
	for i_4, v_4 in list_3 do
		v_4.Parent = r15ArtistIntent_3
	end
	t_5.asset = { [1] = r15ArtistIntent_3 }
	local t_6 = { partName = "Right Leg" }
	local list_4 = {
		p3:FindFirstChild("RightUpperLeg"),
		p3:FindFirstChild("RightLowerLeg"),
		p3:FindFirstChild("RightFoot")
	}
	local r15ArtistIntent_4 = Instance.new("Folder")
	r15ArtistIntent_4.Name = "R15ArtistIntent"
	
	for i_5, v_5 in list_4 do
		v_5.Parent = r15ArtistIntent_4
	end
	t_6.asset = { [1] = r15ArtistIntent_4 }
	-- Unknown statement at pc 1: <SetList>
	
	if var9 then
		table.insert(t, { partName = "Eyebrows", asset = var9 })
	end
	if var8 then
		table.insert(t, { partName = "Eyelashes", asset = var8 })
	end
	if var10 then
		table.insert(t, { partName = "Hair", asset = var10 })
	end
	return t
end

return function(p4)
	-- upvalues: reactModule (ref), getItems (ref), constantsModule (ref), avatarItemCardModule (ref), itemTile (ref), defaultMetricsGridView (ref), gridMetrics (ref), vector2 (ref)
	local var28, var29 = reactModule.useState({})
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var29 (ref), getItems (copy)
		if p4.humanoidModel then
			var29(getItems(p4.humanoidModel:Clone(), p4.name))
			
			return
		end
		local t = {}
		
		for i = 1, 6 do
			t[i] = {}
		end
		var29(t)
	end, { p4.humanoidModel })
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var29 (ref)
		if var28[1] and var28[1].asset then
			local t = {}
			
			for i, v in var28 do
				t[i] = { asset = v.asset, partName = v.partName }
			end
			var29(t)
		end
	end, { p4.name })
	local var30 = if p4.screenSize.X < p4.screenSize.Y then constantsModule.ItemCardWidthPortrait else constantsModule.ItemCardWidthLandscape
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p4.LayoutOrder
	}, {
		Grid = reactModule.createElement(defaultMetricsGridView, {
			getItemHeight = function(p5)
				return p5 * 1.333333333333
			end,
			getItemMetrics = gridMetrics.makeCustomMetricsGetter({ minimumItemsPerRow = 2, minimumItemWidth = var30 }),
			renderItem = reactModule.useCallback(function(p6)
				-- upvalues: reactModule (copy), avatarItemCardModule (copy), p4 (ref), var30 (ref), itemTile (copy)
				return if p6.asset then reactModule.createElement(avatarItemCardModule, {
					asset = p6.asset,
					bodyName = p4.name,
					partName = p6.partName,
					viewportSize = var30
				}) else reactModule.createElement(itemTile)
			end, { var30, p4.name }),
			itemPadding = vector2,
			items = var28
		})
	})
end