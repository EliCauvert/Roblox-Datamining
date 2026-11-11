local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local RoactAnalyticsCommonGameEvents = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local ConstantsModule = require(Modules.LuaApp.Constants)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FitImageTextButtonModule = require(Modules.LuaApp.Components.FitImageTextButton)
local UserModule = require(Modules.LuaApp.Models.User)
local FriendIcon = require(CorePackages.Workspace.Packages.GameTile).FriendIcon
local JoinGameModule = require(Modules.LuaApp.Util.joinGame)
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local SourceSans = Enum.Font.SourceSans
local AvatarSize = ConstantsModule.PlacesList.ContextualMenu.AvatarSize
local HorizontalInnerPadding = ConstantsModule.PlacesList.ContextualMenu.HorizontalInnerPadding
local HorizontalOuterPadding = ConstantsModule.PlacesList.ContextualMenu.HorizontalOuterPadding
local XOffset = HorizontalOuterPadding + AvatarSize + HorizontalInnerPadding
local JoinableFriendEntry = RoactModule.PureComponent:extend("JoinableFriendEntry")
JoinableFriendEntry.defaultProps = { layoutOrder = 0 }

function JoinableFriendEntry.init(p1)
	-- upvalues: RoactModule (copy), JoinGameModule (copy), ConstantsModule (copy)
	p1.state = { joinButtonWidth = 60 }
	p1.joinButtonRef = RoactModule.createRef()
	
	function p1.onJoinButtonActivated()
		-- upvalues: p1 (copy), JoinGameModule (upval), ConstantsModule (upval)
		local Analytics = p1.props.analytics
		local UpToDateUser = p1.props.upToDateUser
		local UniversePlaceInfo = p1.props.universePlaceInfo
		local PlaceId = UniversePlaceInfo.placeId
		local UniverseRootPlaceId = UniversePlaceInfo.universeRootPlaceId
		JoinGameModule:ByUser(UpToDateUser, ConstantsModule.AnalyticsContext.GamePlayIntentInPlacesList, function(p2)
			-- upvalues: Analytics (copy), UpToDateUser (copy), PlaceId (copy), UniverseRootPlaceId (copy)
			Analytics.reportJoinGameInPlacesList(UpToDateUser.id, PlaceId, UniverseRootPlaceId, UpToDateUser.gameInstanceId, p2)
		end)
	end
	
	function p1.updateJoinButtonWidth()
		-- upvalues: p1 (copy)
		local Current = p1.joinButtonRef.current
		
		if Current then
			p1:setState({ joinButtonWidth = Current.AbsoluteSize.X })
		end
	end
end

function JoinableFriendEntry.didMount(p1)
	p1.updateJoinButtonWidth()
end

function JoinableFriendEntry.render(p1)
	-- upvalues: HorizontalInnerPadding (copy), HorizontalOuterPadding (copy), AvatarSize (copy), ConstantsModule (copy), SourceSans (copy), UserModule (copy), RoactModule (copy), FriendIcon (copy), XOffset (copy), Skeleton (copy), FitImageTextButtonModule (copy), WithStyleFunction (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationModule (copy)
	local UpToDateUser = p1.props.upToDateUser
	local LayoutOrder = p1.props.layoutOrder
	local EntryHeight = p1.props.entryHeight
	local EntryWidth: number = p1.props.entryWidth
	local UniverseId = p1.props.universeId
	local Localization = p1.props.localization
	local UniversePlaceInfo = p1.props.universePlaceInfo
	local Largest = nil
	local IsPlayable = UniversePlaceInfo and UniversePlaceInfo.isPlayable or false
	Largest = if EntryWidth then math.max((EntryWidth - HorizontalInnerPadding) / 2 - HorizontalInnerPadding, 60) else 60
	local NewHorizontalOuterPadding = HorizontalOuterPadding * 2 + AvatarSize + HorizontalInnerPadding * 2 + p1.state.joinButtonWidth
	
	local function v37(p2, p3)
		-- upvalues: ConstantsModule (upval), SourceSans (upval), p1 (copy), UpToDateUser (copy), UserModule (upval), UniverseId (copy), IsPlayable (copy), RoactModule (upval), EntryWidth (copy), EntryHeight (copy), LayoutOrder (copy), AvatarSize (upval), HorizontalOuterPadding (upval), FriendIcon (upval), NewHorizontalOuterPadding (copy), XOffset (upval), Skeleton (upval), FitImageTextButtonModule (upval), Largest (ref)
		local GREENPRIMARY = ConstantsModule.Color.GREEN_PRIMARY
		local Transparency = 0
		local WHITE = ConstantsModule.Color.WHITE
		local Transparency1 = 0
		local HeaderFont = SourceSans
		local BodyFont = SourceSans
		local BLACK = ConstantsModule.Color.BLACK
		local Transparency2 = 0
		local ScaledBaseSize = 22
		local WHITE1 = ConstantsModule.Color.WHITE
		local Transparency3 = 0
		local CombinedName = if p1.props.enableDisplayNamePolicy then p1.props.combinedName else p1.props.userName
		
		if p2 then
			GREENPRIMARY = p2.Theme.ContextualPrimaryDefault.Color
			Transparency = p2.Theme.ContextualPrimaryDefault.Transparency
			WHITE = p2.Theme.ContextualPrimaryContent.Color
			Transparency1 = p2.Theme.ContextualPrimaryContent.Transparency
			HeaderFont = p2.Font.Header2.Font
			BodyFont = p2.Font.Body.Font
			BLACK = p2.Theme.TextDefault.Color
			Transparency2 = p2.Theme.TextDefault.Transparency
			ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
			WHITE1 = p2.Theme.BackgroundUIDefault.Color
			Transparency3 = p2.Theme.BackgroundUIDefault.Transparency
		end
		local OnJoinButtonActivated = nil
		if UpToDateUser.presence == UserModule.PresenceType.IN_GAME and tostring(UpToDateUser.universeId) == tostring(UniverseId) and IsPlayable then
			OnJoinButtonActivated = p1.onJoinButtonActivated
		else
			OnJoinButtonActivated = nil
			
			if p2 then
				Transparency *= 0.5
				Transparency1 *= 0.5
			else
				GREENPRIMARY = ConstantsModule.Color.GREEN_DISABLED
			end
		end
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, EntryWidth, 0, EntryHeight),
			BackgroundColor3 = WHITE1,
			BackgroundTransparency = Transparency3,
			LayoutOrder = LayoutOrder
		}, {
			AvatarHolder = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, AvatarSize, 0, AvatarSize),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, HorizontalOuterPadding, 0.5, 0)
			}, {
				Avatar = RoactModule.createElement(FriendIcon, {
					layoutOrder = 1,
					user = UpToDateUser,
					itemSize = AvatarSize,
					maskColor = WHITE1
				})
			}),
			Username = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -NewHorizontalOuterPadding, 1, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, XOffset, 0.5, 0)
			}, {
				Text = if p1.props.shouldShimmerName then nil else RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Text = CombinedName,
					TextSize = ScaledBaseSize,
					Font = BodyFont,
					TextColor3 = BLACK,
					TextTransparency = Transparency2,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center
				}),
				ShimmerName = if p1.props.shouldShimmerName then RoactModule.createElement(Skeleton, {
					Size = UDim2.fromScale(0.8, 0.5),
					Position = UDim2.new(0, 0, 0.25, 0)
				}) else nil
			}),
			JoinButton = RoactModule.createElement(FitImageTextButtonModule, {
				backgroundColor = GREENPRIMARY,
				backgroundTransparency = Transparency,
				backgroundImage = "LuaApp/9-slice/input-default",
				leftIconEnabled = false,
				height = 32,
				minWidth = 60,
				maxWidth = Largest,
				text = p3.joinText,
				textFont = HeaderFont,
				textColor = WHITE,
				textTransparency = Transparency1,
				anchorPoint = Vector2.new(1, 0.5),
				position = UDim2.new(1, -HorizontalOuterPadding, 0.5, 0),
				onActivated = OnJoinButtonActivated,
				[RoactModule.Ref] = p1.joinButtonRef,
				[RoactModule.Change.AbsoluteSize] = p1.updateJoinButtonWidth
			})
		})
	end
	
	local function v38(p2)
		-- upvalues: WithStyleFunction (upval), v37 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: v37 (upval), p2 (copy)
			return v37(p3, p2)
		end)
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then WithLocalizationModule({ joinText = "Feature.Chat.Drawer.Join" })(v38) else v38({
		joinText = Localization:Format("Feature.Chat.Drawer.Join")
	})
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), RoactLocalizationModule (copy), UseAppPolicyFunction (copy), UserProfilesModule (copy), RoactModule (copy), JoinableFriendEntry (copy), CryoModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		return {
			upToDateUser = p2.Users[p1.user.id],
			universePlaceInfo = p2.UniversePlaceInfos[p1.universeId]
		}
	end)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.user.id },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	
	return RoactModule.createElement(JoinableFriendEntry, CryoModule.Dictionary.join(p1, {
		upToDateUser = UseSelectorResult.upToDateUser,
		universePlaceInfo = UseSelectorResult.universePlaceInfo,
		analytics = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents),
		localization = UseRoactServiceFunction(RoactLocalizationModule),
		enableDisplayNamePolicy = UseAppPolicyFunction(function(p2)
			return p2.getShowDisplayName()
		end),
		userName = if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, p1.user.id) else nil,
		combinedName = if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.user.id) else nil,
		shouldShimmerName = not UseUserProfilesFetchResult or UseUserProfilesFetchResult.loading or UseUserProfilesFetchResult.error
	}))
end