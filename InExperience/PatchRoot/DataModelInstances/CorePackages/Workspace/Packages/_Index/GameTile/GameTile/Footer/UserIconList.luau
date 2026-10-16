local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local RoactModule = require(Parent.Roact)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local FriendIconModule = require(GameTile.Footer.FriendIcon)
local SourceSans = Enum.Font.SourceSans
local _Color3 = Color3.fromRGB(117, 117, 117)

local function NumberedIcon(p1) --[[ Line: 22 ]]
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), SourceSans (copy), _Color3 (copy)
	local Size = p1.size
	
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, Size, 0, Size),
		LayoutOrder = p1.layoutOrder,
		Image = GetImageDataFunction("LuaApp/graphic/gr-counter-slot-32x32") or "LuaApp/graphic/gr-counter-slot-32x32"
	}, {
		Count = RoactModule.createElement("TextLabel", {
			TextSize = 15,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Font = SourceSans,
			Text = "+" .. p1.count,
			TextColor3 = _Color3
		})
	})
end

local UserIconList = RoactModule.PureComponent:extend("UserIconList")
UserIconList.defaultProps = { users = {} }

function UserIconList.render(p1) --[[ Line: 52 ]]
	-- upvalues: RoactModule (copy), FriendIconModule (copy), NumberedIcon (copy)
	local Width: number = p1.props.width
	local Height: number = p1.props.height
	local LayoutOrder = p1.props.layoutOrder
	local Users = p1.props.users
	local CountUsers = #Users
	local Count = 0
	local MaskColor = p1.props.maskColor
	
	if CountUsers <= 0 then
		return nil
	end
	local function _(p2: number, p3: number): number --[[ Line: 65 | Named "GetMaxNumberOfIconsInWidth" ]]
		return (math.floor((p3 + 3) / (p2 + 3)))
	end
	
	local Height1 = if Height >= 32 and math.floor((Width + 3) / 35) >= 3 then 32 elseif Height >= 24 then 24 else Height
	local Elements = {}
	local Floored = math.floor((Width + 3) / (Height1 + 3))
	
	if Floored > 0 then
		if Floored < CountUsers then
			Count = CountUsers - (Floored - 1)
		end
		Elements.ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 3)
		})
		local FlooredDelta: number = Count > 0 and Floored - 1 or math.min(Floored, CountUsers)
		for i = 1, FlooredDelta do
			Elements["UserIcon" .. i] = RoactModule.createElement(FriendIconModule, {
				user = Users[i],
				itemSize = Height1,
				layoutOrder = i,
				maskColor = MaskColor
			})
		end
		Elements.NumberedIcon = Count > 0 and RoactModule.createElement(NumberedIcon, { size = Height1, layoutOrder = Floored, count = Count })
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, Width, 0, Height),
		LayoutOrder = LayoutOrder
	}, Elements)
end

return UserIconList