local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local ImageSetButton = InGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetButton
local GlobalConfigModule = require(Parent.GlobalConfig)
local StrictInterfaceResult = T.strictInterface({ onClick = T.callback })

return function(p1) --[[ Line: 24 | Named "OpenMenuButton" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), Roact (copy), ImageSetButton (copy), AssetsModule (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return Roact.createElement(ImageSetButton, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = AssetsModule.Images.RobloxLogo,
		Position = UDim2.new(0, 50, 0.5, 0),
		Size = UDim2.new(0, 32, 0, 32),
		[Roact.Event.Activated] = p1.onClick
	})
end