local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local UsePlayerCountText = require(CorePackages.Workspace.Packages.GameTile).usePlayerCountText
local CryoModule = require(CorePackages.Packages.Cryo)
local UseAbbreviatedNumberLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useAbbreviatedNumberLocalization
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local GameCardLayoutType = DiscoveryTypesModule.GameCardLayoutType
local GameBasicStatsLayoutType = DiscoveryTypesModule.GameBasicStatsLayoutType
local FitImageTextFrameModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.FitImageTextFrame)
local IconsStatusGamesRatingSmall = Images["icons/status/games/rating_small"]
local IconsStatusGamesPeoplePlayingSmall = Images["icons/status/games/people-playing_small"]
local IconsStatusGamesSessionsLarge = Images["icons/status/games/sessions_large"]
local config = {
	[GameBasicStatsLayoutType[GameCardLayoutType.Small]] = {
		Padding = 6,
		TextSize = 14,
		IconSize = 10,
		IconTextPadding = 3
	},
	[GameBasicStatsLayoutType[GameCardLayoutType.Medium]] = {
		Padding = 12,
		TextSize = 14,
		IconSize = 10,
		IconTextPadding = 3
	},
	[GameBasicStatsLayoutType[GameCardLayoutType.Large]] = {
		Padding = 12,
		TextSize = 16,
		IconSize = 12,
		IconTextPadding = 3
	},
	[GameBasicStatsLayoutType.GameDetails] = {
		Padding = 13,
		TextSize = 22,
		IconSize = 17,
		IconTextPadding = 5
	}
}
local GameBasicStats = RoactModule.PureComponent:extend("GameBasicStats")

function GameBasicStats.init(p1)
	-- upvalues: config (copy)
	function p1.getImageProps(Image, p2)
		-- upvalues: config (upval), p1 (copy)
		local Entry = config[p1.props.layoutType]
		
		return {
			Size = UDim2.new(0, Entry.IconSize, 0, Entry.IconSize),
			Image = Image,
			ImageColor3 = p2.Theme.TextMuted.Color,
			ImageTransparency = p2.Theme.TextMuted.Transparency
		}
	end
	
	function p1.getTextProps(Text, p2)
		-- upvalues: config (upval), p1 (copy)
		return {
			Text = Text,
			Font = p2.Font.SubHeader1.Font,
			TextSize = config[p1.props.layoutType].TextSize,
			TextColor3 = p2.Theme.TextMuted.Color,
			TextTransparency = p2.Theme.TextMuted.Transparency
		}
	end
end

function GameBasicStats.render(p1)
	-- upvalues: config (copy), WithStyleFunction (copy), RoactModule (copy), FitImageTextFrameModule (copy), IconsStatusGamesRatingSmall (copy), IconsStatusGamesPeoplePlayingSmall (copy), IconsStatusGamesSessionsLarge (copy)
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local UpVotes = p1.props.upVotes
	local DownVotes = p1.props.downVotes
	local ShowGlobalCounters = p1.props.showGlobalCounters
	local Visits = p1.props.visits
	local LayoutType = p1.props.layoutType
	assert(LayoutType ~= nil, "GameBasicStats expects a layoutType props")
	local Entry = config[LayoutType]
	assert(Entry ~= nil, "GameBasicStats expects a supported layoutType props; was given: " .. LayoutType)
	local PlayerCountText = p1.props.playerCountText
	local VisitsText = p1.props.visitsText
	local v1 = "--"
	
	if UpVotes == nil or UpVotes < 0 then
		UpVotes = 0
	end
	if DownVotes == nil or DownVotes < 0 then
		DownVotes = 0
	end
	local NewUpVotes = UpVotes + DownVotes
	
	if NewUpVotes > 0 then
		v1 = math.floor(UpVotes / NewUpVotes * 100) .. "%"
	end
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), Entry (copy), Position (copy), LayoutOrder (copy), FitImageTextFrameModule (upval), p1 (copy), IconsStatusGamesRatingSmall (upval), v1 (ref), IconsStatusGamesPeoplePlayingSmall (upval), PlayerCountText (copy), ShowGlobalCounters (copy), Visits (copy), IconsStatusGamesSessionsLarge (upval), VisitsText (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 0, Entry.TextSize),
			AutomaticSize = Enum.AutomaticSize.X,
			Position = Position,
			LayoutOrder = LayoutOrder
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, Entry.Padding)
			}),
			VoteInfo = RoactModule.createElement(FitImageTextFrameModule, {
				LayoutOrder = 1,
				padding = Entry.IconTextPadding,
				imageProps = p1.getImageProps(IconsStatusGamesRatingSmall, p2),
				textProps = p1.getTextProps(v1, p2)
			}),
			PlayerCountInfo = RoactModule.createElement(FitImageTextFrameModule, {
				LayoutOrder = 2,
				padding = Entry.IconTextPadding,
				imageProps = p1.getImageProps(IconsStatusGamesPeoplePlayingSmall, p2),
				textProps = p1.getTextProps(PlayerCountText, p2)
			}),
			VisitsInfo = ShowGlobalCounters and (Visits and RoactModule.createElement(FitImageTextFrameModule, {
				LayoutOrder = 3,
				padding = Entry.IconTextPadding,
				imageProps = p1.getImageProps(IconsStatusGamesSessionsLarge, p2),
				textProps = p1.getTextProps(VisitsText, p2)
			}))
		})
	end)
end

return (RoactAppPolicy.connect(function(p1, _)
	return { showGlobalCounters = p1.getShowGlobalCounters() }
end)(function(p1)
	-- upvalues: UsePlayerCountText (copy), UseAbbreviatedNumberLocalization (copy), RoactModule (copy), GameBasicStats (copy), CryoModule (copy)
	return RoactModule.createElement(GameBasicStats, CryoModule.Dictionary.join(p1, {
		playerCountText = UsePlayerCountText(p1.playerCount),
		visitsText = UseAbbreviatedNumberLocalization(p1.visits)
	}))
end))