local friendsLanding = script:FindFirstAncestor("FriendsLanding")
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
local friendsLandingContextualMenu = roact.PureComponent:extend("FriendsLandingContextualMenu")
local t = {
	motorCallback = dependenciesModule.Otter.instant,
	open = { targetValue = 1 },
	close = { targetValue = 0 }
}

function friendsLandingContextualMenu.init(p0) --[[ line: 35 ]]
	-- upvalues: memoize (ref), enumScreensModule (ref), images (ref)
	function p0.onClose() --[[ line: 36 ]]
		-- upvalues: p0 (ref)
		if p0.props.navigation then
			p0.props.navigation.goBack()
		end
	end
	
	p0.onUnfriend = memoize(function(p1, p2) --[[ line: 42 ]]
		-- upvalues: p0 (ref), enumScreensModule (copy)
		p0.props.navigation.navigate(enumScreensModule.GenericToast, {
			toastProps = { toastContent = { toastTitle = p1, iconImage = p2 } }
		})
	end)
	p0.onActivated = memoize(function(p3, p4) --[[ line: 53 ]]
		-- upvalues: p0 (ref), images (copy)
		return function() --[[ line: 54 ]]
			-- upvalues: p0 (copy), p3 (ref), images (copy), p4 (ref)
			local userId = p0.props.navigation.state.params.userId
			
			if userId ~= nil then
				p0.props.unfriendTargetUserId({
					targetUserId = userId,
					currentUserId = p0.props.localUserId
				}):andThen(function() --[[ line: 59 ]]
					-- upvalues: p0 (copy), p3 (copy), images (copy)
					p0.onUnfriend(p3, images["icons/actions/friends/friendRemove"])
				end):catch(function() --[[ line: 62 ]]
					-- upvalues: p0 (copy), p4 (copy)
					p0.onUnfriend(p4)
				end)
			end
			p0.onClose()
		end
	end)
end

function friendsLandingContextualMenu.render(p5) --[[ line: 71 ]]
	-- upvalues: withStyle (ref), withLocalization (ref), roact (ref), contextualMenu (ref), images (ref), menuDirection (ref), t (ref)
	return withStyle(function(_) --[[ line: 72 ]]
		-- upvalues: withLocalization (copy), roact (copy), contextualMenu (copy), images (copy), p5 (ref), menuDirection (copy), t (copy)
		return withLocalization({
			unfriend = "Feature.Friends.Action.Unfriend",
			error = "Feature.Toast.NetworkingError.SomethingIsWrong",
			success = "Feature.Friends.Action.FriendRemoved"
		})(function(p6) --[[ line: 77 ]]
			-- upvalues: roact (copy), contextualMenu (copy), images (copy), p5 (copy), menuDirection (copy), t (copy)
			return roact.createElement(contextualMenu, {
				open = true,
				closeBackgroundVisible = false,
				buttonProps = {
					{
						icon = images["icons/actions/friends/friendRemove"],
						text = p6.unfriend,
						onActivated = p5.onActivated(p6.success, p6.error)
					}
				},
				menuDirection = menuDirection.Up,
				openPositionY = UDim.new(1, -24),
				screenSize = p5.props.screenSize,
				onDismiss = p5.onClose,
				motorOverrideOptions = t
			})
		end)
	end)
end

return compose(roactRodux.connect(mapStateToPropsModule, function(p7) --[[ line: 103 ]]
	-- upvalues: friendsNetworking (ref)
	return {
		unfriendTargetUserId = function(p8) --[[ line: 105 ]]
			-- upvalues: p7 (ref), friendsNetworking (copy)
			return p7(friendsNetworking.UnfriendTargetUserId.API(p8))
		end
	}
end), friendsLandingContextModule.connect(function(p9, _) --[[ line: 110 ]]
	return { screenSize = p9.screenSize }
end))(friendsLandingContextualMenu)