local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Images = require(Parent1.UIBlox).App.ImageSet.Images
local FoundationModule = require(Parent1.Foundation)
local FFlagPlayerListFoundationSubscriptionIconModule = require(Parent.Flags.FFlagPlayerListFoundationSubscriptionIcon)

return (require(Parent1.AppCommonLib).memoize(function(IsTenFoot, p1)
	-- upvalues: Images (copy), FFlagPlayerListFoundationSubscriptionIconModule (copy), FoundationModule (copy)
	local config = { IsTenFoot = IsTenFoot }
	
	if IsTenFoot then
		config.ContainerPosition = UDim2.new(0.5, 0, 0.5, 0)
		config.ContainerSize = UDim2.new(0, 350, 0, 720)
		config.AnchorPoint = Vector2.new(0.5, 0.5)
		config.PlayerDropDownSizeX = 0
		config.PlayerScrollListPosition = UDim2.new(0, 0, 0, 105)
		config.PlayerScrollListSize = UDim2.new(1, 19, 1, 0)
		config.PlayerScrollListInnerFramePosition = UDim2.new(0, 0, 0, 0)
		config.PlayerScrollListInnerFrameSize = UDim2.new(1, 0, 1, 0)
		config.EntrySizeX = 350
		config.PlayerEntrySizeY = 100
		config.EntryPadding = 5
		config.TeamEntrySizeY = 32
		config.StatEntrySizeX = 250
		config.EntryXOffset = -20
		config.BackgroundStyle = {
			Selected = nil,
			Default = { Transparency = 0.25, Color = Color3.fromRGB(60, 60, 60) },
			Hovered = {
				Transparency = 0.25,
				Color = Color3.fromRGB(50, 181, 255)
			},
			HoveredTitle = { Transparency = 0, Color = Color3.fromRGB(50, 181, 255) },
			Title = { Transparency = 0, Color = Color3.fromRGB(25, 25, 25) }
		}
		config.TeamEntryBackgroundTransparency = 0.25
		config.DefaultTextStyle = {
			Transparency = 0,
			StrokeTransparency = 0.75,
			Color = Color3.fromRGB(255, 255, 243),
			StrokeColor = Color3.fromRGB(34, 34, 34)
		}
		config.HoveredTextStyle = {
			Transparency = 0,
			StrokeTransparency = 0.75,
			Color = Color3.fromRGB(19, 19, 19),
			StrokeColor = Color3.fromRGB(34, 34, 34)
		}
		config.PlayerIconSize = UDim2.new(0, 64, 0, 64)
		config.InitalPlayerEntryPadding = 18
		config.PlayerEntryPadding = 8
		config.PlayerEntryNamePadding = 8
		config.TeamEntryTextPadding = 5
		config.StatTextPadding = 0
		config.PlayerNameSize = UDim2.new(1, -88, 1, 0)
		config.PlayerNameTextSize = 32
		config.StatTextSize = 32
		config.ScrollImageColor = Color3.fromRGB(31, 31, 31)
		config.ScrollImageTransparency = 0.5
	else
		config.ContainerPadding = 4
		config.ContainerPosition = UDim2.new(1, -4, 0, 4)
		config.ContainerSize = UDim2.new(0, 0, 0.5, 0)
		config.ExtraContainerPadding = 16
		config.AnchorPoint = Vector2.new(1, 0)
		config.PlayerDropDownSizeX = 300
		config.PlayerDropDownOffset = 4
		config.PlayerScrollListPosition = UDim2.new(0, 0, 0, 0)
		config.PlayerScrollListSize = UDim2.new(1, -1, 1, 0)
		config.EntryBaseSizeX = 150
		config.EntrySizeIncreasePerStat = 11
		config.PlayerEntrySizeY = 40
		config.EntryPadding = 0
		config.TeamEntrySizeY = 24
		config.StatEntrySizeX = 66
		config.TitleBarSizeY = 20
		config.EntryXOffset = 0
		config.TeamEntryBackgroundTransparency = 0.5
		config.IconButtonBackgroundTransparency = 0.3
		config.DropDownHeaderBackgroundTransparency = 0.1
		config.OverrideBackgroundTransparency = 0.3
		config.FadedBackgroundTransparency = 0.65
		config.FadedBackgroundScaleDelta = 0.05
		config.PlayerIconSize = UDim2.new(0, 16, 0, 16)
		config.InitalPlayerEntryPadding = 12
		config.PlayerEntryPadding = 12
		config.PlayerEntryNamePadding = 4
		config.TeamEntryTextPadding = 15
		config.StatTextPadding = 4
		config.PlayerNameSize = UDim2.new(1, -34, 1, 0)
		config.PlayerNameTextSize = 14
		config.StatTextSize = 14
		config.ScrollImageColor = Color3.fromRGB(216, 216, 216)
		config.ScrollImageTransparency = 0.5
		config.ScrollBarOffset = 4
		config.ScrollBarSize = 8
	end
	config.TopBarOffset = p1.TopBarHeight
	config.PlayerDropDownSizeXMobile = 327
	config.ScrollBarSizeMobile = 2
	config.PlayerNameSizeXMobile = 194
	config.PlayerIconSizeMobile = UDim2.fromOffset(20, 20)
	config.PlayerNameTextSizeMobile = 16
	config.StatTextSizeMobile = 16
	config.PlayerNamePaddingXMobile = 14
	config.TeamEntryTextPadding = 15
	config.TeamEntryTextPaddingMobile = 14
	config.RowHoverColor = Color3.fromRGB(0, 0, 0)
	config.RowDefaultColor = Color3.fromRGB(84, 84, 84)
	config.MaxLeaderstats = 4
	config.MaxLeaderstatsSmallScreen = 1
	config.PlayerEntryFont = Enum.Font.SourceSans
	config.TitlePlayerEntryFont = Enum.Font.SourceSansBold
	config.TeamEntryFont = Enum.Font.SourceSans
	config.StatFont = Enum.Font.SourceSans
	config.TitleStatFont = Enum.Font.SourceSansBold
	config.TeamStatFont = Enum.Font.SourceSansBold
	config.StatNameFont = Enum.Font.SourceSans
	config.PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66)
	config.PlayerBackgroundImage = "rbxasset://textures/ui/PlayerList/CharacterImageBackground.png"
	config.RobloxIconImage = "rbxasset://textures/ui/Shell/Icons/RobloxIcon24.png"
	config.IconSelectedColor = Color3.fromRGB(19, 19, 19)
	config.IconUnSelectedColor = Color3.fromRGB(255, 255, 255)
	config.SelectedEntryColor = Color3.fromRGB(0, 255, 255)
	config.ShadowImage = "rbxasset://textures/ui/PlayerList/TileShadowMissingTop.png"
	config.ShadowSize = 5
	config.ShadowSliceRect = Rect.new(6, 6, 9, 9)
	config.DefaultThumbnail = "rbxasset://textures/ui/Shell/Icons/DefaultProfileIcon.png"
	config.BlockedIcon = Images["icons/status/unavailable_small"]
	config.FriendIcons = {
		[Enum.FriendStatus.Friend] = Images["icons/status/player/friend"],
		[Enum.FriendStatus.FriendRequestReceived] = Images["icons/status/player/pending"]
	}
	config.FollowingIcon = Images["icons/status/player/following"]
	config.PlaceOwnerIcon = Images["icons/status/player/developer"]
	config.MembershipIcons = {
		[Enum.MembershipType.Premium] = Images["icons/status/premium_small"]
	}
	
	if FFlagPlayerListFoundationSubscriptionIconModule then
		config.SubscriptionIcon = {
			isFoundationIcon = true,
			name = FoundationModule.Enums.IconName.RobloxPlus
		}
	else
		config.SubscriptionIcon = Images["icons/menu/gem_small"]
	end
	config.CustomPlayerIcons = {
		[7210880] = "rbxassetid://134032333",
		[13268404] = "rbxassetid://113059239",
		[261] = "rbxassetid://105897927"
	}
	config.NeutralTeamColor = BrickColor.new("White")
	config.NeutralTeamName = "Neutral"
	config.DropDownButtonSizeY = 56
	config.DropDownButtonPadding = 0
	config.DropDownPadding = 10
	config.DropDownRightOptionSize = 55
	config.DropDownIconSize = 36
	config.DropDownHeaderSizeY = 80
	config.DropDownHeaderBackgroundSize = 65
	config.DropDownScreenSidePadding = 4
	
	return config
end))