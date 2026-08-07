local parent = script.Parent.Parent
local parent_1 = parent.Parent
local memoize = require(parent_1.AppCommonLib).memoize
local images = require(parent_1.UIBlox).App.ImageSet.Images
local foundationModule = require(parent_1.Foundation)
local fFlagPlayerListFoundationSubscriptionIconModule = require(parent.Flags.FFlagPlayerListFoundationSubscriptionIcon)

return memoize(function(p0, p1) --[[ line: 165 ]]
	-- upvalues: images (ref), fFlagPlayerListFoundationSubscriptionIconModule (ref), foundationModule (ref)
	local t = { IsTenFoot = p0 }
	
	if p0 then
		t.ContainerPosition = UDim2.new(0.5, 0, 0.5, 0)
		t.ContainerSize = UDim2.new(0, 350, 0, 720)
		t.AnchorPoint = Vector2.new(0.5, 0.5)
		t.PlayerDropDownSizeX = 0
		t.PlayerScrollListPosition = UDim2.new(0, 0, 0, 105)
		t.PlayerScrollListSize = UDim2.new(1, 19, 1, 0)
		t.PlayerScrollListInnerFramePosition = UDim2.new(0, 0, 0, 0)
		t.PlayerScrollListInnerFrameSize = UDim2.new(1, 0, 1, 0)
		t.EntrySizeX = 350
		t.PlayerEntrySizeY = 100
		t.EntryPadding = 5
		t.TeamEntrySizeY = 32
		t.StatEntrySizeX = 250
		t.EntryXOffset = -20
		t.BackgroundStyle = {
			Selected = nil,
			Default = { Transparency = 0.25, Color = Color3.fromRGB(60, 60, 60) },
			Hovered = {
				Transparency = 0.25,
				Color = Color3.fromRGB(50, 181, 255)
			},
			HoveredTitle = { Transparency = 0, Color = Color3.fromRGB(50, 181, 255) },
			Title = { Transparency = 0, Color = Color3.fromRGB(25, 25, 25) }
		}
		t.TeamEntryBackgroundTransparency = 0.25
		t.DefaultTextStyle = {
			Transparency = 0,
			StrokeTransparency = 0.75,
			Color = Color3.fromRGB(255, 255, 243),
			StrokeColor = Color3.fromRGB(34, 34, 34)
		}
		t.HoveredTextStyle = {
			Transparency = 0,
			StrokeTransparency = 0.75,
			Color = Color3.fromRGB(19, 19, 19),
			StrokeColor = Color3.fromRGB(34, 34, 34)
		}
		t.PlayerIconSize = UDim2.new(0, 64, 0, 64)
		t.InitalPlayerEntryPadding = 18
		t.PlayerEntryPadding = 8
		t.PlayerEntryNamePadding = 8
		t.TeamEntryTextPadding = 5
		t.StatTextPadding = 0
		t.PlayerNameSize = UDim2.new(1, -88, 1, 0)
		t.PlayerNameTextSize = 32
		t.StatTextSize = 32
		t.ScrollImageColor = Color3.fromRGB(31, 31, 31)
		t.ScrollImageTransparency = 0.5
	else
		t.ContainerPadding = 4
		t.ContainerPosition = UDim2.new(1, -4, 0, 4)
		t.ContainerSize = UDim2.new(0, 0, 0.5, 0)
		t.ExtraContainerPadding = 16
		t.AnchorPoint = Vector2.new(1, 0)
		t.PlayerDropDownSizeX = 300
		t.PlayerDropDownOffset = 4
		t.PlayerScrollListPosition = UDim2.new(0, 0, 0, 0)
		t.PlayerScrollListSize = UDim2.new(1, -1, 1, 0)
		t.EntryBaseSizeX = 150
		t.EntrySizeIncreasePerStat = 11
		t.PlayerEntrySizeY = 40
		t.EntryPadding = 0
		t.TeamEntrySizeY = 24
		t.StatEntrySizeX = 66
		t.TitleBarSizeY = 20
		t.EntryXOffset = 0
		t.TeamEntryBackgroundTransparency = 0.5
		t.IconButtonBackgroundTransparency = 0.3
		t.DropDownHeaderBackgroundTransparency = 0.1
		t.OverrideBackgroundTransparency = 0.3
		t.FadedBackgroundTransparency = 0.65
		t.FadedBackgroundScaleDelta = 0.05
		t.PlayerIconSize = UDim2.new(0, 16, 0, 16)
		t.InitalPlayerEntryPadding = 12
		t.PlayerEntryPadding = 12
		t.PlayerEntryNamePadding = 4
		t.TeamEntryTextPadding = 15
		t.StatTextPadding = 4
		t.PlayerNameSize = UDim2.new(1, -34, 1, 0)
		t.PlayerNameTextSize = 14
		t.StatTextSize = 14
		t.ScrollImageColor = Color3.fromRGB(216, 216, 216)
		t.ScrollImageTransparency = 0.5
		t.ScrollBarOffset = 4
		t.ScrollBarSize = 8
	end
	t.TopBarOffset = p1.TopBarHeight
	t.PlayerDropDownSizeXMobile = 327
	t.ScrollBarSizeMobile = 2
	t.PlayerNameSizeXMobile = 194
	t.PlayerIconSizeMobile = UDim2.fromOffset(20, 20)
	t.PlayerNameTextSizeMobile = 16
	t.StatTextSizeMobile = 16
	t.PlayerNamePaddingXMobile = 14
	t.TeamEntryTextPadding = 15
	t.TeamEntryTextPaddingMobile = 14
	t.RowHoverColor = Color3.fromRGB(0, 0, 0)
	t.RowDefaultColor = Color3.fromRGB(84, 84, 84)
	t.MaxLeaderstats = 4
	t.MaxLeaderstatsSmallScreen = 1
	t.PlayerEntryFont = Enum.Font.SourceSans
	t.TitlePlayerEntryFont = Enum.Font.SourceSansBold
	t.TeamEntryFont = Enum.Font.SourceSans
	t.StatFont = Enum.Font.SourceSans
	t.TitleStatFont = Enum.Font.SourceSansBold
	t.TeamStatFont = Enum.Font.SourceSansBold
	t.StatNameFont = Enum.Font.SourceSans
	t.PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66)
	t.PlayerBackgroundImage = "rbxasset://textures/ui/PlayerList/CharacterImageBackground.png"
	t.RobloxIconImage = "rbxasset://textures/ui/Shell/Icons/RobloxIcon24.png"
	t.IconSelectedColor = Color3.fromRGB(19, 19, 19)
	t.IconUnSelectedColor = Color3.fromRGB(255, 255, 255)
	t.SelectedEntryColor = Color3.fromRGB(0, 255, 255)
	t.ShadowImage = "rbxasset://textures/ui/PlayerList/TileShadowMissingTop.png"
	t.ShadowSize = 5
	t.ShadowSliceRect = Rect.new(6, 6, 9, 9)
	t.DefaultThumbnail = "rbxasset://textures/ui/Shell/Icons/DefaultProfileIcon.png"
	t.BlockedIcon = images["icons/status/unavailable_small"]
	t.FriendIcons = {
		[Enum.FriendStatus.Friend] = images["icons/status/player/friend"],
		[Enum.FriendStatus.FriendRequestReceived] = images["icons/status/player/pending"]
	}
	t.FollowingIcon = images["icons/status/player/following"]
	t.PlaceOwnerIcon = images["icons/status/player/developer"]
	t.MembershipIcons = {
		[Enum.MembershipType.Premium] = images["icons/status/premium_small"]
	}
	
	if fFlagPlayerListFoundationSubscriptionIconModule then
		t.SubscriptionIcon = {
			isFoundationIcon = true,
			name = foundationModule.Enums.IconName.RobloxPlus
		}
	else
		t.SubscriptionIcon = images["icons/menu/gem_small"]
	end
	t.CustomPlayerIcons = {
		[7210880] = "rbxassetid://134032333",
		[13268404] = "rbxassetid://113059239",
		[261] = "rbxassetid://105897927"
	}
	t.NeutralTeamColor = BrickColor.new("White")
	t.NeutralTeamName = "Neutral"
	t.DropDownButtonSizeY = 56
	t.DropDownButtonPadding = 0
	t.DropDownPadding = 10
	t.DropDownRightOptionSize = 55
	t.DropDownIconSize = 36
	t.DropDownHeaderSizeY = 80
	t.DropDownHeaderBackgroundSize = 65
	t.DropDownScreenSidePadding = 4
	
	return t
end)