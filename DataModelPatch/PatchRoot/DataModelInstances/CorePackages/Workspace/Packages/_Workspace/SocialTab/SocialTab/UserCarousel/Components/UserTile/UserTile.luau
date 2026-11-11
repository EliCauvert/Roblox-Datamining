local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local Skeleton = DependenciesModule.Foundation.Skeleton
local WithStyleFunction = UIBlox.Style.withStyle
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local T = DependenciesModule.t
local Images = UIBlox.App.ImageSet.Images
local StyledImageSetLabelModule = require(SocialTab.Components.StyledImageSetLabel)
local StyledTextLabelModule = require(SocialTab.Components.StyledTextLabel)
local GetSocialTabUserProfileApiEnabledModule = require(SocialTab.Flags.getSocialTabUserProfileApiEnabled)
local CalculateTextSizeModule = require(SocialTab.utils.calculateTextSize)
local IsSocialTabAutoSizedCarouselAndTileEnabled2Module = require(SocialTab.Flags.isSocialTabAutoSizedCarouselAndTileEnabled2)

local function _(Text: string): string
	return Text and Text:gsub("^Playing%s*", "") or ""
end

local UserTile = Roact.PureComponent:extend("UserTile")
UserTile.defaultProps = {
	enableDisplayNamePolicy = false,
	height = 120,
	layoutOrder = 0,
	thumbnailSize = 96,
	absolutePosition = 1,
	onActivated = function() end
}
UserTile.validateProps = T.interface({
	enableDisplayNamePolicy = T.optional(T.boolean),
	height = T.optional(T.number),
	layoutOrder = T.optional(T.number),
	onActivated = T.optional(T.union(T.callback, DependenciesModule.Mock.MagicMock.is)),
	thumbnailSize = T.optional(T.number),
	user = require(SocialTab.User).validateUser,
	absolutePosition = T.optional(T.number),
	shouldShimmerName = T.optional(T.boolean),
	combinedName = T.optional(T.string)
})

function UserTile.init(p1)
	-- upvalues: Roact (copy), CalculateTextSizeModule (copy)
	p1.userTileRef = Roact.createRef()
	
	function p1.onActivated()
		-- upvalues: p1 (copy)
		local User = p1.props.user
		
		if User and p1.userTileRef.current then
			p1.props.onActivated({
				source = "SocialTab",
				user = User,
				positionIndex = p1.props.layoutOrder,
				absolutePosition = p1.props.absolutePosition,
				anchorSpaceSize = p1.userTileRef.current.AbsoluteSize,
				anchorSpacePosition = p1.userTileRef.current.AbsolutePosition
			})
		end
	end
	
	p1.calculateTextBounds = CalculateTextSizeModule()
end

function UserTile.render(p1)
	-- upvalues: GetSocialTabUserProfileApiEnabledModule (copy), PresenceType (copy), WithStyleFunction (copy), Roact (copy), IsSocialTabAutoSizedCarouselAndTileEnabled2Module (copy), StyledImageSetLabelModule (copy), Images (copy), StyledTextLabelModule (copy), Skeleton (copy)
	local User = p1.props.user
	local CombinedName = if GetSocialTabUserProfileApiEnabledModule() or not p1.props.enableDisplayNamePolicy then if GetSocialTabUserProfileApiEnabledModule() and p1.props.combinedName then p1.props.combinedName else User.username elseif GetSocialTabUserProfileApiEnabledModule() and p1.props.combinedName then p1.props.combinedName else User.displayName or User.username
	local IsNotUserPresenceTypeMatch = User.userPresenceType ~= PresenceType.Offline
	local LastLocation: string = User.lastLocation
	local PlayingS = LastLocation and LastLocation:gsub("^Playing%s*", "") or ""
	local PlayingS1 = if User.userPresenceType == PresenceType.InGame then PlayingS else User.userPresenceType == PresenceType.InStudio and PlayingS
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), PlayingS (copy), CombinedName (ref), Roact (upval), IsSocialTabAutoSizedCarouselAndTileEnabled2Module (upval), StyledImageSetLabelModule (upval), IsNotUserPresenceTypeMatch (copy), Images (upval), StyledTextLabelModule (upval), Skeleton (upval), PlayingS1 (copy)
		local CaptionHeader = p2.Font.CaptionHeader
		local CaptionSubHeader = p2.Font.CaptionSubHeader
		local TextBounds = p1.calculateTextBounds(PlayingS .. "...", CaptionSubHeader, p2.Font.BaseSize)
		local TextBounds1 = p1.calculateTextBounds(CombinedName, CaptionHeader, p2.Font.BaseSize)
		local Smallest = math.min(p1.props.thumbnailSize - 12 - 4, TextBounds1.X)
		
		return Roact.createElement("TextButton", {
			AutomaticSize = IsSocialTabAutoSizedCarouselAndTileEnabled2Module() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
			Size = UDim2.new(0, p1.props.thumbnailSize, 0, p1.props.height + TextBounds.Y),
			BackgroundTransparency = 1,
			Text = "",
			LayoutOrder = p1.props.layoutOrder,
			[Roact.Ref] = p1.userTileRef,
			[Roact.Event.Activated] = p1.onActivated
		}, {
			Layout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8)
			}),
			Thumbnail = Roact.createElement(StyledImageSetLabelModule, {
				LayoutOrder = 1,
				BackgroundStyle = p2.Theme.PlaceHolder,
				Image = p1.props.user.thumbnail,
				Size = UDim2.new(0, p1.props.thumbnailSize, 0, p1.props.thumbnailSize)
			}, {
				UICorner = Roact.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			}),
			UserInfo = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = IsSocialTabAutoSizedCarouselAndTileEnabled2Module() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
				Size = UDim2.new(1, 0, 0, p1.props.height - p1.props.thumbnailSize)
			}, {
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				UsernameFrame = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, CaptionHeader.RelativeSize * p2.Font.BaseSize)
				}, {
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 4)
					}),
					PresenceIcon = IsNotUserPresenceTypeMatch and Roact.createElement(StyledImageSetLabelModule, {
						LayoutOrder = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = Images["component_assets/circle_25"],
						ImageStyle = p2.Theme.OnlineStatus,
						Position = UDim2.fromScale(0.5, 0.5),
						ScaleType = Enum.ScaleType.Slice,
						Size = UDim2.new(0, 12, 0, 12),
						SliceCenter = Rect.new(12, 12, 13, 13)
					}) or nil,
					Username = if p1.props.shouldShimmerName then nil else Roact.createElement(StyledTextLabelModule, {
						LayoutOrder = 2,
						FontStyle = CaptionHeader,
						Size = UDim2.new(0, Smallest, 0, TextBounds1.Y),
						TextStyle = p2.Theme.TextEmphasis,
						Text = CombinedName,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					ShimmerName = if p1.props.shouldShimmerName then Roact.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.fromScale(0.8, 0.8) }) else nil
				}),
				InGameOrStudioTitle = Roact.createElement(StyledTextLabelModule, {
					LayoutOrder = 2,
					FontStyle = CaptionSubHeader,
					Size = UDim2.new(1, 0, 0, TextBounds.Y),
					TextStyle = p2.Theme.TextMuted,
					Text = PlayingS1 and PlayingS or "",
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Center
				})
			})
		})
	end)
end

return UserTile