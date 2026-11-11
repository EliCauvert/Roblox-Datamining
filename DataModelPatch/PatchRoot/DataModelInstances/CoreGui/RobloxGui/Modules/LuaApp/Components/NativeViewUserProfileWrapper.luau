local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local NativeViewProfileWrapperModule = require(Modules.LuaApp.Components.NativeViewProfileWrapper)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local NativeViewUserProfileWrapper = RoactModule.PureComponent:extend("NativeViewUserProfileWrapper")

function NativeViewUserProfileWrapper.render(p1)
	-- upvalues: UrlBuilderModule (copy), RoactModule (copy), NativeViewProfileWrapperModule (copy)
	return RoactModule.createElement(NativeViewProfileWrapperModule, {
		isVisible = p1.props.isVisible,
		DisplayOrder = p1.props.DisplayOrder,
		url = UrlBuilderModule.user.profile({ userId = p1.props.userId }),
		onClose = p1.props.onClose
	})
end

return NativeViewUserProfileWrapper