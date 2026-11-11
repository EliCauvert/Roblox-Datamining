local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local TrustedFriendsModalNavigatorModule = require(script.Parent.TrustedFriendsModalNavigator)
local UseExternalNavigationSetUpModule = require(script.Parent.useExternalNavigationSetUp)
local _ = require(TrustedContacts.Common.Types)

local function TrustedFriendsModalEntry(p1)
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy), TrustedFriendsModalNavigatorModule (copy), UseExternalNavigationSetUpModule (copy)
	local Navigation = p1.navigation
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RoactNavigationModule (upval), TrustedFriendsModalNavigatorModule (upval)
		return RoactNavigationModule.createAppContainer(TrustedFriendsModalNavigatorModule)
	end, {})
	local PropsParam = if Navigation then Navigation.getParam("props") else p1
	
	return ReactModule.createElement(if Navigation then TrustedFriendsModalNavigatorModule else UseMemoResult, {
		navigation = Navigation,
		screenProps = {
			modalProps = {
				onClosed = nil,
				userId = PropsParam.userId,
				source = PropsParam.source,
				isVerticallyConstrained = PropsParam.isVerticallyConstrained,
				onRequestAccepted = PropsParam.onRequestAccepted,
				onRequestSent = PropsParam.onRequestSent,
				onAcknowledged = PropsParam.onAcknowledged,
				modalVariantOverride = PropsParam.modalVariantOverride,
				tokens = PropsParam.tokens,
				sentFromQrCode = PropsParam.sentFromQrCode
			},
			externalNavigation = UseExternalNavigationSetUpModule({ navigation = Navigation, onClosed = PropsParam.onClosed })
		}
	})
end

local ClassWrapper = ReactModule.PureComponent:extend("classWrapper")

function ClassWrapper.render(p1)
	-- upvalues: ReactModule (copy), TrustedFriendsModalEntry (copy)
	return ReactModule.createElement(TrustedFriendsModalEntry, p1.props)
end

ClassWrapper.router = TrustedFriendsModalNavigatorModule.router

return ClassWrapper