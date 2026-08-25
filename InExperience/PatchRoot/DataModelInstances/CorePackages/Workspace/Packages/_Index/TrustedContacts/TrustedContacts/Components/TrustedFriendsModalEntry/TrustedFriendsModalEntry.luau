local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local trustedFriendsModalNavigatorModule = require(script.Parent.TrustedFriendsModalNavigator)
local useExternalNavigationSetUpModule = require(script.Parent.useExternalNavigationSetUp)
local _ = require(trustedContacts.Common.Types)

local function TrustedFriendsModalEntry(p0)
	-- upvalues: reactModule (ref), roactNavigationModule (ref), trustedFriendsModalNavigatorModule (ref), useExternalNavigationSetUpModule (ref)
	local navigation = p0.navigation
	local var7 = if navigation then navigation.getParam("props") else p0
	
	return reactModule.createElement(if navigation then trustedFriendsModalNavigatorModule else reactModule.useMemo(function()
		-- upvalues: roactNavigationModule (copy), trustedFriendsModalNavigatorModule (copy)
		return roactNavigationModule.createAppContainer(trustedFriendsModalNavigatorModule)
	end, {}), {
		navigation = navigation,
		screenProps = {
			modalProps = {
				onClosed = nil,
				userId = var7.userId,
				source = var7.source,
				isVerticallyConstrained = var7.isVerticallyConstrained,
				onRequestAccepted = var7.onRequestAccepted,
				onRequestSent = var7.onRequestSent,
				onAcknowledged = var7.onAcknowledged,
				modalVariantOverride = var7.modalVariantOverride,
				tokens = var7.tokens,
				sentFromQrCode = var7.sentFromQrCode
			},
			externalNavigation = useExternalNavigationSetUpModule({ navigation = navigation, onClosed = var7.onClosed })
		}
	})
end

local classWrapper = reactModule.PureComponent:extend("classWrapper")

function classWrapper.render(p1)
	-- upvalues: reactModule (ref), TrustedFriendsModalEntry (ref)
	return reactModule.createElement(TrustedFriendsModalEntry, p1.props)
end

classWrapper.router = trustedFriendsModalNavigatorModule.router

return classWrapper