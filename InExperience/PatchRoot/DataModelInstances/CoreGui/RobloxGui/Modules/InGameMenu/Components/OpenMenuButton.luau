local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local globalConfigModule = require(parent.GlobalConfig)
local var3 = t.strictInterface({ onClick = t.callback })

return function(p0) --[[ line: 24 | named "OpenMenuButton" ]]
	-- upvalues: globalConfigModule (ref), var3 (ref), roact (ref), imageSetButton (ref), assetsModule (ref)
	if globalConfigModule.propValidation then
		assert(var3(p0))
	end
	return roact.createElement(imageSetButton, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = assetsModule.Images.RobloxLogo,
		Position = UDim2.new(0, 50, 0.5, 0),
		Size = UDim2.new(0, 32, 0, 32),
		[roact.Event.Activated] = p0.onClick
	})
end