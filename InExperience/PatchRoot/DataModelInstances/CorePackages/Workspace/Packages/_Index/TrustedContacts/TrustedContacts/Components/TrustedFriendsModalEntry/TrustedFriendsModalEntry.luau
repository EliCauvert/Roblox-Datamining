local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local trustedFriendsModalNavigatorModule = require(script.Parent.TrustedFriendsModalNavigator)
local useExternalNavigationSetUpModule = require(script.Parent.useExternalNavigationSetUp)
local _ = require(trustedContacts.Common.Types)

local function TrustedFriendsModalEntry(p1)
	-- upvalues: reactModule (ref), roactNavigationModule (ref), trustedFriendsModalNavigatorModule (ref), useExternalNavigationSetUpModule (ref)
	local navigation = p1.navigation
	local var1 = if navigation then navigation.getParam("props") else p1
	
	return reactModule.createElement(if navigation then trustedFriendsModalNavigatorModule else reactModule.useMemo(function()
		-- upvalues: roactNavigationModule (copy), trustedFriendsModalNavigatorModule (copy)
		return roactNavigationModule.createAppContainer(trustedFriendsModalNavigatorModule)
	end, {}), {
		navigation = navigation,
		screenProps = {
			modalProps = {
				onClosed = nil,
				userId = var1.userId,
				source = var1.source,
				isVerticallyConstrained = var1.isVerticallyConstrained,
				onRequestAccepted = var1.onRequestAccepted,
				onRequestSent = var1.onRequestSent,
				onAcknowledged = var1.onAcknowledged,
				modalVariantOverride = var1.modalVariantOverride,
				tokens = var1.tokens,
				sentFromQrCode = var1.sentFromQrCode
			},
			externalNavigation = useExternalNavigationSetUpModule({ navigation = navigation, onClosed = var1.onClosed })
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