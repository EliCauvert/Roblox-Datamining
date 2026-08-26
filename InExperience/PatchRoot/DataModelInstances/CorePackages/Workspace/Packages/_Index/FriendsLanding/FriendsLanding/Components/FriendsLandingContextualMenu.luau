local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local withStyle = UIBlox.Style.withStyle
local withLocalization = dependenciesModule.withLocalization
local contextualMenu = UIBlox.App.Menu.ContextualMenu
local menuDirection = UIBlox.App.Menu.MenuDirection
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local images = UIBlox.App.ImageSet.Images
local mapStateToPropsModule = require(friendsLanding.Components.FriendsLandingContainer.mapStateToProps)
local roactRodux = dependenciesModule.RoactRodux
local compose = dependenciesModule.SocialLibraries.RoduxTools.compose
local friendsNetworking = dependenciesModule.FriendsNetworking
local enumScreensModule = require(friendsLanding.EnumScreens)
local memoize = dependenciesModule.memoize
local otter = dependenciesModule.Otter
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()
local friendsLandingContextualMenu = roact.PureComponent:extend("FriendsLandingContextualMenu")
local t = {
	motorCallback = otter.instant,
	open = { targetValue = 1 },
	close = { targetValue = 0 }
}

function friendsLandingContextualMenu.init(p1)
	-- upvalues: memoize (ref), enumScreensModule (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), images (ref)
	function p0.onClose()
		-- upvalues: p1 (ref)
		if p1.props.navigation then
			p1.props.navigation.goBack()
		end
	end
	
	p1.onUnfriend = memoize(function(p2, p3)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.GenericToast, {
			toastProps = { toastContent = { toastTitle = p2, iconImage = p3 } }
		})
	end)
	p1.onActivated = memoize(function(p2, p3)
		-- upvalues: p1 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), images (copy)
		return function()
			-- upvalues: p1 (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), p2 (ref), images (copy), p3 (ref)
			local userId = p1.props.navigation.state.params.userId
			
			if userId ~= nil then
				(if fFlagMigrateFriendshipStatusesRemainingActions then var1.Unfriend(userId) else p1.props.unfriendTargetUserId({
					targetUserId = userId,
					currentUserId = p1.props.localUserId
				})):andThen(function()
					-- upvalues: p1 (copy), p2 (copy), images (copy)
					p1.onUnfriend(p2, images["icons/actions/friends/friendRemove"])
				end):catch(function()
					-- upvalues: p1 (copy), p3 (copy)
					p1.onUnfriend(p3)
				end)
			end
			p1.onClose()
		end
	end)
end

function friendsLandingContextualMenu.render(p1)
	-- upvalues: withStyle (ref), withLocalization (ref), roact (ref), contextualMenu (ref), images (ref), menuDirection (ref), t (ref)
	return withStyle(function(_)
		-- upvalues: withLocalization (copy), roact (copy), contextualMenu (copy), images (copy), p1 (ref), menuDirection (copy), t (copy)
		return withLocalization({
			unfriend = "Feature.Friends.Action.Unfriend",
			error = "Feature.Toast.NetworkingError.SomethingIsWrong",
			success = "Feature.Friends.Action.FriendRemoved"
		})(function(p2)
			-- upvalues: roact (copy), contextualMenu (copy), images (copy), p1 (copy), menuDirection (copy), t (copy)
			return roact.createElement(contextualMenu, {
				open = true,
				closeBackgroundVisible = false,
				buttonProps = {
					{
						icon = images["icons/actions/friends/friendRemove"],
						text = p2.unfriend,
						onActivated = p1.onActivated(p2.success, p2.error)
					}
				},
				menuDirection = menuDirection.Up,
				openPositionY = UDim.new(1, -24),
				screenSize = p1.props.screenSize,
				onDismiss = p1.onClose,
				motorOverrideOptions = t
			})
		end)
	end)
end

return compose(roactRodux.connect(mapStateToPropsModule, function(p1)
	-- upvalues: friendsNetworking (ref)
	return {
		unfriendTargetUserId = function(p2)
			-- upvalues: p1 (ref), friendsNetworking (copy)
			return p1(friendsNetworking.UnfriendTargetUserId.API(p2))
		end
	}
end), friendsLandingContextModule.connect(function(p1, _)
	return { screenSize = p1.screenSize }
end))(friendsLandingContextualMenu)