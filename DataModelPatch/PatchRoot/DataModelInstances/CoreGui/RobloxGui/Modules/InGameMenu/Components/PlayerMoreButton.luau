local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local WithStyleFunction = UIBlox.Core.Style.withStyle
local Parent = script.Parent.Parent
local FFlagLuaMenuPerfImprovementsModule = require(Parent.Flags.FFlagLuaMenuPerfImprovements)
local AssetsModule = require(Parent.Resources.Assets)
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local MoreButton = Roact.PureComponent:extend("MoreButton")
MoreButton.validateProps = T.strictInterface({
	onActivated = T.callback,
	LayoutOrder = T.integer,
	userId = FFlagLuaMenuPerfImprovementsModule and T.number or nil
})

function MoreButton.init(p1)
	-- upvalues: FFlagLuaMenuPerfImprovementsModule (copy)
	if FFlagLuaMenuPerfImprovementsModule then
		function p1.onActivated()
			-- upvalues: p1 (copy)
			p1.props.onActivated(p1.props.userId)
		end
	end
end

function MoreButton.render(p1)
	-- upvalues: WithStyleFunction (copy), FFlagLuaMenuPerfImprovementsModule (copy), Roact (copy), ImageSetButton (copy), AssetsModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), FFlagLuaMenuPerfImprovementsModule (upval), Roact (upval), ImageSetButton (upval), AssetsModule (upval)
		return Roact.createElement(ImageSetButton, {
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Image = AssetsModule.Images.MoreActions,
			ImageColor3 = p2.Theme.IconEmphasis.Color,
			LayoutOrder = p1.props.LayoutOrder,
			[Roact.Event.Activated] = if FFlagLuaMenuPerfImprovementsModule then p1.props.onActivated and p1.onActivated or nil else p1.props.onActivated
		})
	end)
end

return MoreButton