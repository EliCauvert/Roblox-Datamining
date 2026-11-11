local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local AppUserGameSettings = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUserGameSettings
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local ExitFullscreenToastModule = require(Modules.LuaApp.Components.ExitFullscreenToast)
local FullscreenEventReceiver = RoactModule.PureComponent:extend("FullscreenEventReceiver")

function FullscreenEventReceiver.init(p1)
	p1:setState({
		fullscreenEnabled = p1.props.appUserGameSettings:InFullScreen()
	})
	
	function p1.onFullscreenChanged(FullscreenEnabled)
		-- upvalues: p1 (copy)
		p1:setState({ fullscreenEnabled = FullscreenEnabled })
	end
end

function FullscreenEventReceiver.sendAnalytics(p1)
	p1.props.analytics.EventStream:setRBXEventStream("LuaApp", "FullscreenMode", { enabled = p1.state.fullscreenEnabled })
end

function FullscreenEventReceiver.render(p1)
	-- upvalues: ResponsiveModule (copy), RoactModule (copy), ExternalEventConnectionModule (copy), ExitFullscreenToastModule (copy)
	return RoactModule.createFragment({
		EventConnector = RoactModule.createElement(ExternalEventConnectionModule, {
			event = p1.props.appUserGameSettings.FullscreenChanged,
			callback = p1.onFullscreenChanged
		}),
		ExitFullscreenToast = p1.props.preferredInputRef and p1.props.preferredInputRef.current == ResponsiveModule.Input.Pointer and (p1.state.fullscreenEnabled and RoactModule.createElement(ExitFullscreenToastModule))
	})
end

function FullscreenEventReceiver.didMount(p1)
	p1:sendAnalytics()
end

function FullscreenEventReceiver.didUpdate(p1, _, p2)
	if p2.fullscreenEnabled ~= p1.state.fullscreenEnabled then
		p1:sendAnalytics()
	end
end

local v1 = RoactServices.connect({
	analytics = RoactAnalyticsModule,
	appUserGameSettings = AppUserGameSettings
})(FullscreenEventReceiver)

return function(p1)
	-- upvalues: ResponsiveModule (copy), ReactModule (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = ResponsiveModule.usePreferredInput()
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { preferredInputRef = UseRefResult }))
end