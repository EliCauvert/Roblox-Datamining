local CorePackages = game:GetService("CorePackages")
local Lighting = game:GetService("Lighting")
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local config = {
	LightTheme = {
		SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png"
	},
	DarkTheme = {
		SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png"
	}
}

local function _(p1)
	-- upvalues: config (copy)
	return if p1.SelectedTheme:lower() == "dark" then config.DarkTheme.SkyboxAssetLocation else config.LightTheme.SkyboxAssetLocation
end

local AvatarSceneSky = RoactModule.Component:extend("AvatarSceneSky")
AvatarSceneSky.defaultProps = {
	isVRAppBuild = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild()
}
AvatarSceneSky.validateProps = TModule.interface({
	notificationService = TModule.any,
	lightingService = TModule.optional(TModule.Instance),
	isVRAppBuild = TModule.boolean
})

function AvatarSceneSky.init(p1)
	-- upvalues: config (copy)
	p1.state = {
		skyTexture = if p1.props.notificationService.SelectedTheme:lower() == "dark" then config.DarkTheme.SkyboxAssetLocation else config.LightTheme.SkyboxAssetLocation
	}
	
	function p1.onThemeChanged()
		-- upvalues: p1 (copy), config (upval)
		p1:setState({
			skyTexture = if p1.props.notificationService.SelectedTheme:lower() == "dark" then config.DarkTheme.SkyboxAssetLocation else config.LightTheme.SkyboxAssetLocation
		})
	end
end

function AvatarSceneSky.render(p1)
	-- upvalues: Lighting (copy), RoactModule (copy), ExternalEventConnection (copy)
	local Props = p1.props
	local SkyTexture = p1.state.skyTexture
	
	return RoactModule.createElement(RoactModule.Portal, { target = Props.lightingService or Lighting }, {
		SelectedThemeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = Props.notificationService:GetPropertyChangedSignal("SelectedTheme"),
			callback = p1.onThemeChanged
		}),
		AvatarSceneSky = if p1.props.isVRAppBuild then nil else RoactModule.createElement("Sky", {
			CelestialBodiesShown = true,
			StarCount = 3000,
			SkyboxBk = SkyTexture,
			SkyboxDn = SkyTexture,
			SkyboxFt = SkyTexture,
			SkyboxLf = SkyTexture,
			SkyboxRt = SkyTexture,
			SkyboxUp = SkyTexture
		})
	})
end

function AvatarSceneSky.didMount(p1)
	p1.onThemeChanged()
end

return (RoactServices.connect({ notificationService = AppNotificationService })(AvatarSceneSky))