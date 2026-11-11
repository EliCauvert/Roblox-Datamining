local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local LandingPageConstants = require(CorePackages.Workspace.Packages.LandingPage).Constants.LandingPageConstants
local Image = FoundationModule.Image
local View = FoundationModule.View
local BackgroundStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) }

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), BackgroundStyle (copy), Image (copy), LandingPageConstants (copy)
	return ReactModule.createElement(View, { tag = "size-full", backgroundStyle = BackgroundStyle }, {
		BackgroundImage = ReactModule.createElement(Image, {
			tag = "size-full",
			Image = p1.backgroundImage,
			backgroundStyle = BackgroundStyle,
			ScaleType = Enum.ScaleType.Crop
		}, {
			UIGradient = ReactModule.createElement("UIGradient", LandingPageConstants.CustomizedLandingPage.BackgroundGradient)
		})
	})
end