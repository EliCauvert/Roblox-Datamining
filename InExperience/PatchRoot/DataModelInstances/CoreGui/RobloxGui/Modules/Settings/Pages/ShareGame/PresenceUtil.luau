local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local PresenceType = {
	Offline = "OFFLINE",
	Online = "ONLINE",
	InGame = "IN_GAME",
	InStudio = "IN_STUDIO"
}
local config = {
	[PresenceType.Online] = {
		Image = "component_assets/circle_16",
		Color = Color3.fromRGB(0, 180, 109),
		Size = UDim2.new(0, 12, 0, 12)
	},
	[PresenceType.InGame] = { Image = "icons/menu/games_small" },
	[PresenceType.InStudio] = { Image = "icons/logo/studiologo_small" }
}

return {
	PresenceType = PresenceType,
	GetIcon = function(p1)
		-- upvalues: config (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy), IconSize (copy)
		local Entry = config[p1]
		
		if not Entry then return end
		return ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = Images[Entry.Image],
			ImageColor3 = Entry.Color,
			Size = Entry.Size or UDim2.new(0, IconSize.Small, 0, IconSize.Small)
		})
	end
}