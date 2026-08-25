local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local images = UIBloxModule.App.ImageSet.Images
local t = {
	Offline = "OFFLINE",
	Online = "ONLINE",
	InGame = "IN_GAME",
	InStudio = "IN_STUDIO"
}
local t_1 = {
	[t.Online] = {
		Image = "component_assets/circle_16",
		Color = Color3.fromRGB(0, 180, 109),
		Size = UDim2.new(0, 12, 0, 12)
	},
	[t.InGame] = { Image = "icons/menu/games_small" },
	[t.InStudio] = { Image = "icons/logo/studiologo_small" }
}

return {
	PresenceType = t,
	GetIcon = function(p0)
		-- upvalues: t_1 (ref), reactModule (ref), imageSetLabel (ref), images (ref), iconSize (ref)
		local var5 = t_1[p0]
		
		if var5 then
			return reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images[var5.Image],
				ImageColor3 = var5.Color,
				Size = var5.Size or UDim2.new(0, iconSize.Small, 0, iconSize.Small)
			})
		end
	end
}