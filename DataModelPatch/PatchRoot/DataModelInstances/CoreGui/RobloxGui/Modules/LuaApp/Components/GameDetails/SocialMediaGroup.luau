local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local SocialMediaButtonModule = require(Modules.LuaApp.Components.GameDetails.SocialMediaButton)
local FFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp
local SocialMediaGroup = RoactModule.PureComponent:extend("SocialMediaGroup")

function SocialMediaGroup.render(p1)
	-- upvalues: RoactModule (copy), SocialMediaButtonModule (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy)
	local LayoutOrder = p1.props.LayoutOrder
	local SocialLinks = p1.props.socialLinks
	
	if not SocialLinks or #SocialLinks == 0 then
		return nil
	end
	local config = {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 20)
		})
	}
	
	for LayoutOrder1, socialLink in ipairs(p1.props.socialLinks) do
		config["SocialButton_" .. socialLink.type] = RoactModule.createElement(SocialMediaButtonModule, {
			Size = UDim2.new(0, 44, 0, 44),
			LayoutOrder = LayoutOrder1,
			socialType = socialLink.type,
			socialUrl = socialLink.url,
			index = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then LayoutOrder1 else nil,
			impressionsTag = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then p1.props.impressionsTag else nil,
			universeId = if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then p1.props.universeId else nil
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 44),
		LayoutOrder = LayoutOrder
	}, config)
end

return RoactRoduxModule.connect(function(p2, p3)
	local GameSocialLink = p2.GameSocialLinks[p3.universeId]
	
	return {
		socialLinks = GameSocialLink and GameSocialLink.externalLinks
	}
end)(SocialMediaGroup)