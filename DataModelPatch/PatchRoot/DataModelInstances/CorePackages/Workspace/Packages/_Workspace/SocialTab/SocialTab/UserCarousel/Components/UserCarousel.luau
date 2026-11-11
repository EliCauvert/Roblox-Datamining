local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local Text = DependenciesModule.Text
local T = DependenciesModule.t
local Llama = DependenciesModule.llama
local Mock = DependenciesModule.Mock
local UserModule = require(SocialTab.User)
local EnumScreensModule = require(SocialTab.EnumScreens)
local AddFriendsTileModule = require(script.Parent.AddFriendsTile)
local UserTileModule = require(script.Parent.UserTile)
local UserCarouselHeaderModule = require(script.Parent.UserCarouselHeader)
local UIBloxCarouselAdaptorModule = require(script.Parent.UIBloxCarouselAdaptor)
local Sources = require(SocialTab.Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local v1: number = if require(SocialTab.Flags.getFFlagUserCarouselPaddingFixEnabled)() then 12 else 8
local UserCarousel = Roact.PureComponent:extend("UserCarousel")
UserCarousel.defaultProps = {
	accountProviderName = "",
	enableDisplayNamePolicy = false,
	friendThumbnailSize = 96,
	LayoutOrder = 0,
	peopleListFrozen = false,
	shouldInviteFromAccountProvider = false,
	wideMode = false,
	hasFriendRequests = false,
	addFriendOnActivated = function() end,
	friends = {},
	Logger = require(SocialTab.Logger),
	onFriendSelected = function() end,
	screenSize = Vector2.new(1000, 1000)
}
UserCarousel.validateProps = T.interface({
	analytics = T.table,
	accountProviderName = T.optional(T.string),
	addFriendOnActivated = T.optional(T.callback),
	enableDisplayNamePolicy = T.optional(T.boolean),
	friends = T.array(UserModule.validateUser),
	friendThumbnailSize = T.optional(T.number),
	LayoutOrder = T.optional(T.number),
	onFriendSelected = T.optional(T.callback),
	peopleListFrozen = T.optional(T.boolean),
	screenSize = T.optional(T.union(T.Vector2, Mock.MagicMock.is)),
	shouldInviteFromAccountProvider = T.optional(T.boolean),
	wideMode = T.optional(T.boolean),
	hasFriendRequests = T.boolean,
	navigateToLuaAppPages = T.optional(T.table),
	goToFriendsLanding = T.optional(T.callback),
	goToAddFriends = T.optional(T.callback),
	isLuaProfilePageEnabled = T.optional(T.boolean),
	luaAddFriendsPageEnabled = T.optional(T.boolean)
})

function UserCarousel.init(p1)
	-- upvalues: Llama (copy), Sources (copy), EnumScreensModule (copy)
	p1.state = { friends = {} }
	
	function p1.onFriendSelected(p2)
		-- upvalues: p1 (copy), Llama (upval), Sources (upval), EnumScreensModule (upval)
		p1.props.Logger:info("Going to ViewUser")
		p1.props.analytics:buttonClick("UserTile", {
			friendId = p2.user.id,
			position = p2.positionIndex,
			subpage = if p1.props.isLuaProfilePageEnabled then "peekView" else nil,
			page = if p1.props.isLuaProfilePageEnabled then "playerProfile" else nil
		})
		
		if p1.props.isLuaProfilePageEnabled then
			p1.props.analytics:navigate("ViewUserProfile")
		end
		local JoinResult = Llama.Dictionary.join(p2, {
			onOpen = function()
				-- upvalues: p1 (upval)
				p1.props.setPeopleListFrozen(true)
			end,
			onClose = function()
				-- upvalues: p1 (upval)
				p1.props.setPeopleListFrozen(false)
			end
		})
		
		if p1.props.isLuaProfilePageEnabled then
			p1.props.navigateToLuaAppPages[EnumScreensModule.ViewUserProfile](p2.user.id, {
				openJoinable = true,
				contextualMenuProps = JoinResult,
				profilePeekViewProps = {
					absolutePosition = p2.absolutePosition,
					source = Sources.SocialTab
				}
			})
			
			return
		else
			p1.props.navigateToLuaAppPages[EnumScreensModule.ViewUser](JoinResult)
		end
	end
	
	function p1.goToFriendRequestsPage()
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		p1.props.navigateToLuaAppPages[p1.props.enableFriendFinder and EnumScreensModule.FriendFinder or EnumScreensModule.AddFriends]()
	end
	
	function p1.goToFriendsPage()
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		p1.props.Logger:info("Going to FriendsPage")
		p1.props.analytics:buttonClick("CarouselTitle")
		p1.props.analytics:navigate("CarouselTitle")
		
		if p1.props.goToFriendsLanding then
			p1.props.analytics:buttonClick("friendsLanding")
			p1.props.analytics:navigate("FriendsLandingPage")
		end
		if p1.props.goToFriendsLanding then
			p1.props.goToFriendsLanding()
			
			return
		else
			p1.props.navigateToLuaAppPages[EnumScreensModule.AddFriends]()
		end
	end
	
	function p1.activatedAddFriendsTile()
		-- upvalues: p1 (copy)
		p1.props.Logger:info("Going to AddFriends")
		p1.props.analytics:buttonClick("AddFriends")
		p1.props.analytics:navigate("AddFriends")
		p1.props.goToAddFriends()
	end
	
	function p1.activatedFriendRequestsButton()
		-- upvalues: p1 (copy)
		p1.props.Logger:info("Going to FriendRequests")
		p1.props.analytics:buttonClick("FriendRequests", { isBadgeShown = p1.props.hasFriendRequests })
		p1.props.analytics:navigate("FriendRequests")
		p1.props.goToAddFriends()
	end
end

function UserCarousel.getDerivedStateFromProps(DefaultProps)
	return if DefaultProps.peopleListFrozen then nil else { friends = DefaultProps.friends }
end

function UserCarousel.render(p1)
	-- upvalues: WithStyleFunction (copy), Text (copy), v1 (copy), Roact (copy), AddFriendsTileModule (copy), UserTileModule (copy), UIBloxCarouselAdaptorModule (copy), UserCarouselHeaderModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: Text (upval), p1 (copy), v1 (upval), Roact (upval), AddFriendsTileModule (upval), UserTileModule (upval), UIBloxCarouselAdaptorModule (upval), UserCarouselHeaderModule (upval)
		local NewFriendThumbnailSize = p1.props.friendThumbnailSize + Text.GetTextBounds("SampleText", p2.Font.CaptionHeader.Font, p2.Font.CaptionHeader.RelativeSize * p2.Font.BaseSize, Vector2.new(10000, 10000)).Y + v1
		
		local function createAddFriendButton()
			-- upvalues: Roact (upval), AddFriendsTileModule (upval), p1 (upval), NewFriendThumbnailSize (copy)
			return Roact.createElement(AddFriendsTileModule, {
				layoutOrder = 1,
				accountProviderName = p1.props.getAccountProviderName,
				onActivated = p1.activatedAddFriendsTile,
				shouldInviteFromAccountProvider = p1.props.shouldInviteFromAccountProvider,
				thumbnailSize = p1.props.friendThumbnailSize,
				totalHeight = NewFriendThumbnailSize
			})
		end
		
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, NewFriendThumbnailSize)
		}, {
			Layout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 0)
			}),
			UserCarouselHeader = Roact.createElement(UserCarouselHeaderModule, {
				layoutOrder = 1,
				friendCount = #p1.state.friends,
				hasFriendRequests = p1.props.hasFriendRequests,
				goToFriendRequestsPage = p1.activatedFriendRequestsButton,
				goToFriendsPage = p1.goToFriendsPage
			}),
			UserCarousel = Roact.createElement(UIBloxCarouselAdaptorModule, {
				LayoutOrder = 2,
				createUserEntry = function(p3)
					-- upvalues: createAddFriendButton (copy), Roact (upval), UserTileModule (upval), p1 (upval), NewFriendThumbnailSize (copy)
					return if p3.user == nil then createAddFriendButton() else Roact.createElement(UserTileModule, {
						enableDisplayNamePolicy = p1.props.enableDisplayNamePolicy,
						height = NewFriendThumbnailSize,
						layoutOrder = p3.index,
						onActivated = p1.onFriendSelected,
						thumbnailSize = p1.props.friendThumbnailSize,
						user = p3.user,
						absolutePosition = p3.absolutePosition
					})
				end,
				friends = p1.state.friends,
				friendThumbnailSize = p1.props.friendThumbnailSize,
				wideMode = p1.props.wideMode,
				tileHeight = NewFriendThumbnailSize
			})
		})
	end)
end

return UserCarousel