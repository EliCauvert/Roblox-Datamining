local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ExperienceTileV3 = UIBloxModule.App.Tile.ExperienceTileV3
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetCurrentPageModule = require(Modules.LuaApp.getCurrentPage)
local AspectRatioModeEnum = UIBloxModule.App.Tile.AspectRatioModeEnum
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local SetGamePlaySessionFunction = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagSignalsNavP3hMisc = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3hMisc
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local UseImpressionsTaggerFunction = require(CorePackages.Workspace.Packages.Impressions).useImpressionsTagger
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local JoinGameModule = require(Modules.LuaApp.Util.joinGame)
local JoinGameInPlacesListModule = require(Modules.LuaApp.Analytics.Events.joinGameInPlacesList)
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local GameTileConstants = require(CorePackages.Workspace.Packages.GameTile).GameTileConstants

local function _(p1, p2, p3)
	p3:sendEventDeferred(p1, "joinYourFriendProfileViewOpen", {
		friendId = p2.friendUserId,
		universeId = p2.universeId,
		rootPlaceId = p2.rootPlaceId
	})
end

local function createJoinButtonOverlay(Id, Text, p1, RootPlaceId, p2, p3, Size)
	-- upvalues: ReactModule (copy), Button (copy), ButtonType (copy), GameTileConstants (copy), StandardButtonSize (copy), SetGamePlaySessionFunction (copy), SessionType (copy), JoinGameInPlacesListModule (copy), JoinGameModule (copy)
	return ReactModule.createElement(Button, {
		fitContent = true,
		isDisabled = false,
		isLoading = false,
		buttonType = ButtonType.PrimaryContextual,
		position = GameTileConstants.TileOverlay.BottomRightPosition,
		anchorPoint = Vector2.new(1, 1),
		text = Text,
		fontStyle = p1.Font.CaptionHeader,
		standardSize = StandardButtonSize.XSmall,
		maxWidth = Size.X * 0.92,
		onActivated = function()
			-- upvalues: SetGamePlaySessionFunction (upval), p3 (copy), SessionType (upval), JoinGameInPlacesListModule (upval), p2 (copy), Id (copy), RootPlaceId (copy), JoinGameModule (upval)
			SetGamePlaySessionFunction(p3, SessionType.StructuralIdentifier.GamePlayFromJoinYourFriends, true)
			JoinGameInPlacesListModule(p2, Id, RootPlaceId, tonumber(RootPlaceId), nil, nil, "JoinYourFriends")
			JoinGameModule:ByUserAndPlaceId({ id = Id }, RootPlaceId, "JoinYourFriends")
		end
	})
end

local function v27(Image, ImageTransparency, p1)
	-- upvalues: ReactModule (copy), LoadableImage (copy)
	return ReactModule.createElement(LoadableImage, {
		BackgroundTransparency = 1,
		ImageTransparency = ImageTransparency,
		Image = Image,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 1),
		ScaleType = Enum.ScaleType.Fit,
		cornerRadius = if p1 then p1.CornerRadius else nil
	})
end

local _ = function(Text): string
	return if Text then "rbxthumb://type=AvatarBust&id=" .. Text .. "&w=150&h=150" else ""
end

local _ = function(Text): string
	return if Text then "rbxthumb://type=Asset&id=" .. Text .. "&w=420&h=420" else ""
end

local function getTextForBottomContent(Text, FontStyle, ColorStyle, LayoutOrder, Spacing, Size)
	-- upvalues: ReactModule (copy), StyledTextLabel (copy)
	return ReactModule.createElement(StyledTextLabel, {
		lineHeight = 1,
		fluidSizing = false,
		richText = false,
		text = Text,
		size = UDim2.new(0, Size.X - Spacing.Leading - Spacing.Trailing, 0, 20),
		automaticSize = Enum.AutomaticSize.X,
		fontStyle = FontStyle,
		colorStyle = ColorStyle,
		textTruncate = Enum.TextTruncate.AtEnd,
		layoutOrder = LayoutOrder
	})
end

local function getUsernameWithPresenceIcon(DisplayName, p1, Size)
	-- upvalues: ReactModule (copy), ImageSetLabel (copy), Images (copy), getTextForBottomContent (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		}),
		PresenceIcon = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Visible = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = Images["component_assets/circle_25"],
			ImageColor3 = p1.Theme.OnlineStatus.Color,
			ImageTransparency = p1.Theme.OnlineStatus.Transparency,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0, 12, 0, 12),
			ScaleType = Enum.ScaleType.Slice
		}),
		FriendName = getTextForBottomContent(DisplayName, p1.Font.Header2, p1.Theme.TextEmphasis, 2, p1.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing, Size)
	})
end

local function getStyleProps(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	local Spacing = p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing
	local Spacing1 = p1.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing
	
	return {
		contentTitlePadding = 8,
		backgroundColor = {
			Transparency = 0,
			Color = p1.Theme.BackgroundUIDefault.Color
		},
		dropShadow = {},
		overlayColors = {},
		contentTitleFont = p1.Font.Header2,
		border = {
			BorderColor = {
				Color = (if FFlagRenameDeprecatedUIBloxTokens then p1.Tokens.Color.Stroke.Emphasis else p1.Tokens.Component.VerticalTile.Base.Container.BorderColor).Color3,
				Transparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Tokens.Color.Stroke.Emphasis else p1.Tokens.Component.VerticalTile.Base.Container.BorderColor).Transparency
			},
			CornerRadius = UDim.new(0, 12),
			Width = if FFlagRenameDeprecatedUIBloxTokens then p1.Tokens.Stroke.Standard else p1.Tokens.Component.VerticalTile.Base.Container.BorderWidth
		},
		topContentPadding = {
			Left = Spacing.Leading,
			Right = Spacing.Trailing,
			Top = Spacing.Top,
			Bottom = Spacing.Bottom
		},
		bottomContentPadding = {
			Left = 0,
			Top = 3,
			Right = Spacing1.Trailing,
			Bottom = Spacing1.Bottom
		},
		selectionCursorPadding = { Left = 0, Right = 0, Top = 0, Bottom = 0 }
	}
end

return function(Frame: Frame)
	-- upvalues: UseSelectorFunction (copy), UseDispatchFunction (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), GetCurrentPageModule (copy), UseRoactServiceModule (copy), AppEventIngestServiceModule (copy), AppSessionService (copy), UseStyleFunction (copy), ReactModule (copy), getUsernameWithPresenceIcon (copy), getTextForBottomContent (copy), UseLocalizationFunction (copy), UseImpressionsTaggerFunction (copy), ExperienceTileV3 (copy), AspectRatioModeEnum (copy), v27 (copy), createJoinButtonOverlay (copy), OpenProfilePeekViewModule (copy), getStyleProps (copy)
	local FriendUserId = Frame.friendUserId
	local ThumbnailAssetId = Frame.thumbnailAssetId
	local ExperienceName = Frame.experienceName
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: FriendUserId (copy)
		return p1.Users[FriendUserId]
	end)
	local UseDispatchResult = UseDispatchFunction()
	local Name = nil
	Name = if FFlagSignalsNavP3hMisc then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage).name else UseSelectorFunction(function(p1)
		-- upvalues: GetCurrentPageModule (upval)
		return GetCurrentPageModule(p1)
	end)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppEventIngestServiceModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AppSessionService)
	local UseStyleResult = UseStyleFunction()
	local Spacing = UseStyleResult.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing
	local Size = Frame.size or Vector2.new(0, 0)
	
	local function RenderBottomContent()
		-- upvalues: ReactModule (upval), getUsernameWithPresenceIcon (upval), UseSelectorResult (copy), UseStyleResult (copy), Size (copy), getTextForBottomContent (upval), ExperienceName (copy), Spacing (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 2)
			}),
			Title = getUsernameWithPresenceIcon(if UseSelectorResult then UseSelectorResult.displayName else "", UseStyleResult, Size),
			Padding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 4) }),
			SubTitle = getTextForBottomContent(ExperienceName, UseStyleResult.Font.CaptionHeader, UseStyleResult.Theme.TextDefault, 2, Spacing, Size)
		})
	end
	
	local UseLocalizationResult = UseLocalizationFunction({ joinButtonText = "Feature.Home.Button.Join" })
	local Ref = ReactModule.createRef()
	UseImpressionsTaggerFunction(Ref, Frame.impressionsTag, Frame.LayoutOrder)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, Size.X, 0, Size.Y),
		LayoutOrder = Frame.LayoutOrder,
		ref = Ref
	}, {
		Tile = ReactModule.createElement(ExperienceTileV3, {
			hasBackground = false,
			hasOutline = false,
			isActive = true,
			isHoverEnabled = false,
			isExperienceActionRowEnabled = true,
			contentTextLineCount = 1,
			contentTitlePadding = 0,
			tileWidth = Size.X,
			thumbnailAspectRatioOverride = AspectRatioModeEnum.Wide,
			renderTopContentOverlay = function(_, p1)
				-- upvalues: v27 (upval), FriendUserId (copy), createJoinButtonOverlay (upval), UseLocalizationResult (copy), UseStyleResult (copy), Frame (copy), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), Size (copy)
				return {
					gradient = v27("rbxassetid://13074142871", 0.3, p1),
					avatar = v27(if FriendUserId then "rbxthumb://type=AvatarBust&id=" .. FriendUserId .. "&w=150&h=150" else "", 0, p1),
					joinButton = createJoinButtonOverlay(FriendUserId, UseLocalizationResult.joinButtonText, UseStyleResult, Frame.rootPlaceId, UseRoactServiceModuleResult, UseRoactServiceModuleResult1, Size)
				}
			end,
			onActivated = function()
				-- upvalues: Name (ref), Frame (copy), UseRoactServiceModuleResult (copy), UseDispatchResult (copy), OpenProfilePeekViewModule (upval), FriendUserId (copy)
				UseRoactServiceModuleResult:sendEventDeferred(Name, "joinYourFriendProfileViewOpen", {
					friendId = Frame.friendUserId,
					universeId = Frame.universeId,
					rootPlaceId = Frame.rootPlaceId
				})
				UseDispatchResult(OpenProfilePeekViewModule(FriendUserId, { source = "JoinYourFriends" }))
			end,
			wideThumbnail = if ThumbnailAssetId then "rbxthumb://type=Asset&id=" .. ThumbnailAssetId .. "&w=420&h=420" else "",
			renderBottomContent = RenderBottomContent,
			styleProps = getStyleProps(UseStyleResult)
		})
	})
end