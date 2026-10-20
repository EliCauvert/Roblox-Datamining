local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local MemoizeModule = require(Modules.Common.memoize)
local SortFriendsByPresenceAndRecencyModule = require(Modules.LuaApp.sortFriendsByPresenceAndRecency)
local ConstantsModule = require(Modules.LuaApp.Constants)
local JoinableFriendEntryModule = require(Modules.LuaApp.Components.Home.JoinableFriendEntry)
local NewHorizontalOuterPadding = ConstantsModule.PlacesList.ContextualMenu.HorizontalOuterPadding + ConstantsModule.PlacesList.ContextualMenu.AvatarSize + ConstantsModule.PlacesList.ContextualMenu.HorizontalInnerPadding
local JoinableFriendsList = RoactModule.PureComponent:extend("JoinableFriendsList")

local function CreateDivider(p1)
	-- upvalues: RoactModule (copy), NewHorizontalOuterPadding (copy), ConstantsModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		LayoutOrder = p1.layoutOrder
	}, {
		BottomDivider = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, -NewHorizontalOuterPadding, 1, 0),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = ConstantsModule.Color.GRAY4
		})
	})
end

JoinableFriendsList.defaultProps = { layoutOrder = 0 }

function JoinableFriendsList.init(p1)
	p1.state = { friends = p1.props.friends }
end

function JoinableFriendsList.render(p1)
	-- upvalues: RoactModule (copy), JoinableFriendEntryModule (copy), CreateDivider (copy), ConstantsModule (copy)
	local LayoutOrder = p1.props.LayoutOrder
	local MaxHeight: number = p1.props.maxHeight
	local Width = p1.props.width
	local UniverseId = p1.props.universeId
	local Friends = p1.state.friends or {}
	local Elements = {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, friend in ipairs(Friends) do
		local LayoutOrder1 = i * 2
		local v1 = i < #Friends
		Elements["Entry_" .. friend.id] = RoactModule.createElement(JoinableFriendEntryModule, {
			entryHeight = 67,
			user = friend,
			layoutOrder = LayoutOrder1,
			entryWidth = Width,
			universeId = UniverseId
		})
		Elements["Divider_" .. friend.id] = v1 and RoactModule.createElement(CreateDivider, { layoutOrder = LayoutOrder1 + 1 })
	end
	local YOffset = #Friends * 67 + (#Friends - 1) * 1
	
	return RoactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		ScrollBarThickness = 0,
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(1, 0, 0, (math.min(MaxHeight, YOffset))),
		CanvasSize = UDim2.new(1, 0, 0, YOffset),
		BackgroundColor3 = ConstantsModule.Color.WHITE
	}, Elements)
end

local Callback = MemoizeModule(function(p2, List)
	-- upvalues: SortFriendsByPresenceAndRecencyModule (copy)
	if not p2 or not List then
		return {}
	end
	local List1 = {}
	
	for _, value in pairs(List) do
		local v2 = p2[value]
		
		if v2 and v2.isFriend then
			table.insert(List1, v2)
		end
	end
	table.sort(List1, SortFriendsByPresenceAndRecencyModule)
	
	return List1
end)

return (RoactRoduxModule.connect(function(p3, p4)
	-- upvalues: Callback (copy)
	return {
		friends = Callback(p3.Users, p3.InGameUsersByGame[p4.universeId])
	}
end)(JoinableFriendsList))