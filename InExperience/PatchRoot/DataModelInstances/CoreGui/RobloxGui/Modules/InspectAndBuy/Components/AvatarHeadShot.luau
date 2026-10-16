local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ColorsModule = require(script.Parent.Parent.Colors)
local AvatarHeadShot = RoactModule.PureComponent:extend("AvatarHeadShot")
local Headshot = require(game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules").Common.LegacyThumbnailUrls).Headshot

function AvatarHeadShot.render(p1) --[[ Line: 19 ]]
	-- upvalues: Headshot (copy), RoactModule (copy), ColorsModule (copy)
	local PlayerId = p1.props.playerId
	local FormatResult = if PlayerId and PlayerId ~= "" then Headshot:format(PlayerId, 48, 48) else nil
	
	return if FormatResult then RoactModule.createElement("ImageLabel", {
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Size = UDim2.new(0, 48, 0, 48),
		BackgroundColor3 = ColorsModule.GrayBackground,
		Image = FormatResult
	}, {
		MaskFrame = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar mask-90x90.png",
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = ColorsModule.Carbon
		})
	}) else nil
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 50 ]]
	return { playerId = p1.playerId }
end)(AvatarHeadShot)