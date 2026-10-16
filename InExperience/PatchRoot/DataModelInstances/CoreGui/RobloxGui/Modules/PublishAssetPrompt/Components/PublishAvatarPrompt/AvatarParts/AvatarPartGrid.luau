local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local ConstantsModule = require(script.Parent.Parent.Parent.Parent.Constants)
local AvatarItemCardModule = require(script.Parent.AvatarItemCard)
local ItemTile = UIBloxModule.Tile.ItemTile
local _Vector2 = Vector2.new(20, 20)

local function _(List) --[[ Line: 33 | Named "createObjectsFolder" ]]
	local R15ArtistIntent = Instance.new("Folder")
	R15ArtistIntent.Name = "R15ArtistIntent"
	
	for _, value in List do
		value.Parent = R15ArtistIntent
	end
	return { [1] = R15ArtistIntent }
end

local _ = function(Object, ChildName) --[[ Line: 43 | Named "getPart" ]]
	return (Object:FindFirstChild(ChildName))
end

local function getItems(Object, _) --[[ Line: 47 ]]
	local Asset = nil
	local Asset1 = nil
	local Asset2 = nil
	
	for _, Accessory in ipairs(Object:GetChildren()) do
		if Accessory:IsA("Accessory") then
			if Accessory.AccessoryType == Enum.AccessoryType.Eyebrow then
				Asset1 = Accessory
			elseif Accessory.AccessoryType == Enum.AccessoryType.Eyelash then
				Asset = Accessory
			elseif Accessory.AccessoryType == Enum.AccessoryType.Hair then
				Asset2 = Accessory
			end
		end
	end
	local List = {}
	local config = { partName = "Head", asset = Object:FindFirstChild("Head") }
	local config1 = { partName = "Torso" }
	local R15ArtistIntent = Instance.new("Folder")
	R15ArtistIntent.Name = "R15ArtistIntent"
	
	for _, value in {
		Object:FindFirstChild("UpperTorso"),
		(Object:FindFirstChild("LowerTorso"))
	} do
		value.Parent = R15ArtistIntent
	end
	config1.asset = { [1] = R15ArtistIntent }
	local config2 = { partName = "Left Arm" }
	local R15ArtistIntent1 = Instance.new("Folder")
	R15ArtistIntent1.Name = "R15ArtistIntent"
	
	for _, value1 in {
		Object:FindFirstChild("LeftUpperArm"),
		Object:FindFirstChild("LeftLowerArm"),
		(Object:FindFirstChild("LeftHand"))
	} do
		value1.Parent = R15ArtistIntent1
	end
	config2.asset = { [1] = R15ArtistIntent1 }
	local config3 = { partName = "Left Leg" }
	local R15ArtistIntent2 = Instance.new("Folder")
	R15ArtistIntent2.Name = "R15ArtistIntent"
	
	for _, value2 in {
		Object:FindFirstChild("LeftUpperLeg"),
		Object:FindFirstChild("LeftLowerLeg"),
		(Object:FindFirstChild("LeftFoot"))
	} do
		value2.Parent = R15ArtistIntent2
	end
	config3.asset = { [1] = R15ArtistIntent2 }
	local config4 = { partName = "Right Arm" }
	local R15ArtistIntent3 = Instance.new("Folder")
	R15ArtistIntent3.Name = "R15ArtistIntent"
	
	for _, value3 in {
		Object:FindFirstChild("RightUpperArm"),
		Object:FindFirstChild("RightLowerArm"),
		(Object:FindFirstChild("RightHand"))
	} do
		value3.Parent = R15ArtistIntent3
	end
	config4.asset = { [1] = R15ArtistIntent3 }
	local config5 = { partName = "Right Leg" }
	local R15ArtistIntent4 = Instance.new("Folder")
	R15ArtistIntent4.Name = "R15ArtistIntent"
	
	for _, value4 in {
		Object:FindFirstChild("RightUpperLeg"),
		Object:FindFirstChild("RightLowerLeg"),
		(Object:FindFirstChild("RightFoot"))
	} do
		value4.Parent = R15ArtistIntent4
	end
	config5.asset = { [1] = R15ArtistIntent4 }
	List[1] = config
	List[2] = config1
	List[3] = config2
	List[4] = config3
	List[5] = config4
	List[6] = config5
	
	if Asset1 then
		table.insert(List, { partName = "Eyebrows", asset = Asset1 })
	end
	if Asset then
		table.insert(List, { partName = "Eyelashes", asset = Asset })
	end
	if Asset2 then
		table.insert(List, { partName = "Hair", asset = Asset2 })
	end
	return List
end

return function(Frame) --[[ Line: 132 | Named "AvatarPartGrid" ]]
	-- upvalues: ReactModule (copy), getItems (copy), ConstantsModule (copy), AvatarItemCardModule (copy), ItemTile (copy), DefaultMetricsGridView (copy), GridMetrics (copy), _Vector2 (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	ReactModule.useEffect(function() --[[ Line: 134 ]]
		-- upvalues: Frame (copy), UseStateResult2 (copy), getItems (upval)
		if Frame.humanoidModel then
			UseStateResult2((getItems(Frame.humanoidModel:Clone(), Frame.name)))
			
			return
		end
		local t = {}
		
		for i = 1, 6 do
			t[i] = {}
		end
		UseStateResult2(t)
	end, { Frame.humanoidModel })
	ReactModule.useEffect(function() --[[ Line: 150 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if UseStateResult[1] and UseStateResult[1].asset then
			local t = {}
			
			for i, value in UseStateResult do
				t[i] = { asset = value.asset, partName = value.partName }
			end
			UseStateResult2(t)
		end
	end, { Frame.name })
	local IsXBelow = Frame.screenSize.X < Frame.screenSize.Y
	local ItemCardWidthPortrait = if IsXBelow then ConstantsModule.ItemCardWidthPortrait else ConstantsModule.ItemCardWidthLandscape
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Grid = ReactModule.createElement(DefaultMetricsGridView, {
			getItemHeight = function(p1: number): number --[[ Line: 190 ]]
				return p1 * 1.3333333333333333
			end,
			getItemMetrics = GridMetrics.makeCustomMetricsGetter({
				minimumItemsPerRow = 2,
				minimumItemWidth = ItemCardWidthPortrait
			}),
			renderItem = ReactModule.useCallback(function(p1) --[[ Line: 168 ]]
				-- upvalues: ReactModule (upval), AvatarItemCardModule (upval), Frame (copy), ItemCardWidthPortrait (copy), ItemTile (upval)
				return if p1.asset then ReactModule.createElement(AvatarItemCardModule, {
					asset = p1.asset,
					bodyName = Frame.name,
					partName = p1.partName,
					viewportSize = ItemCardWidthPortrait
				}) else ReactModule.createElement(ItemTile)
			end, { ItemCardWidthPortrait, Frame.name }),
			itemPadding = _Vector2,
			items = UseStateResult
		})
	})
end