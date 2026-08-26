local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local roactModule = require(parent.Roact)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local friendIconModule = require(gameTile.Footer.FriendIcon)
local sourceSans = Enum.Font.SourceSans
local color = Color3.fromRGB(117, 117, 117)

local function NumberedIcon(p1)
	-- upvalues: roactModule (ref), imageSetLabel (ref), getImageData (ref), sourceSans (ref), color (ref)
	local size = p1.size
	
	return roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, size, 0, size),
		LayoutOrder = p1.layoutOrder,
		Image = getImageData("LuaApp/graphic/gr-counter-slot-32x32") or "LuaApp/graphic/gr-counter-slot-32x32"
	}, {
		Count = roactModule.createElement("TextLabel", {
			TextSize = 15,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Font = sourceSans,
			Text = "+" .. p0.count,
			TextColor3 = color
		})
	})
end

local userIconList = roactModule.PureComponent:extend("UserIconList")
userIconList.defaultProps = { users = {} }

function userIconList.render(p1)
	-- upvalues: roactModule (ref), friendIconModule (ref), NumberedIcon (ref)
	local width = p1.props.width
	local height = p1.props.height
	local layoutOrder = p1.props.layoutOrder
	local users = p1.props.users
	local usersCount = #users
	local var1 = 0
	local maskColor = p1.props.maskColor
	
	if usersCount <= 0 then
		return nil
	end
	local function _(a, b)
		return math.floor((b + 3) / (a + 3))
	end
	
	local _ = nil
	local var2 = if height >= 32 and math.floor((width + 3) / 35) >= 3 then 32 elseif height >= 24 then 24 else height
	local t = {}
	local floored = math.floor((width + 3) / (var2 + 3))
	
	if floored > 0 then
		if floored < usersCount then
			var1 = usersCount - (floored - 1)
		end
		t.ListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 3)
		})
		
		for i = 1, if var1 > 0 then floored - 1 else math.min(floored, usersCount) do
			t["UserIcon" .. i] = roactModule.createElement(friendIconModule, {
				user = users[i],
				itemSize = var2,
				layoutOrder = i,
				maskColor = maskColor
			})
		end
		t.NumberedIcon = var1 > 0 and roactModule.createElement(NumberedIcon, { size = var2, layoutOrder = floored, count = var1 })
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, width, 0, height),
		LayoutOrder = layoutOrder
	}, t)
end

return userIconList