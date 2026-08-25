local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local colorsModule = require(parent.Colors)
local avatarHeadShot = roactModule.PureComponent:extend("AvatarHeadShot")
local headshot = require(coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules").Common.LegacyThumbnailUrls).Headshot

function avatarHeadShot.render(p0)
	-- upvalues: headshot (ref), roactModule (ref), colorsModule (ref)
	local playerId = p0.props.playerId
	local var6 = if playerId and playerId ~= "" then headshot:format(playerId, 48, 48) else nil
	
	return if var6 then roactModule.createElement("ImageLabel", {
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Size = UDim2.new(0, 48, 0, 48),
		BackgroundColor3 = colorsModule.GrayBackground,
		Image = var6
	}, {
		MaskFrame = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar mask-90x90.png",
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = colorsModule.Carbon
		})
	}) else nil
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return { playerId = p1.playerId }
end)(avatarHeadShot)