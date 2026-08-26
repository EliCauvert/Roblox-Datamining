local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local globalConfigModule = require(parent.GlobalConfig)
local var1 = t.strictInterface({ onClick = t.callback })

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), roact (ref), imageSetButton (ref), assetsModule (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return roact.createElement(imageSetButton, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = assetsModule.Images.RobloxLogo,
		Position = UDim2.new(0, 50, 0.5, 0),
		Size = UDim2.new(0, 32, 0, 32),
		[roact.Event.Activated] = p1.onClick
	})
end