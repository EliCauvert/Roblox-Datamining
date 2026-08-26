local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
local parent = script.Parent.Parent
local fFlagLuaMenuPerfImprovementsModule = require(parent.Flags.FFlagLuaMenuPerfImprovements)
local assetsModule = require(parent.Resources.Assets)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local moreButton = roact.PureComponent:extend("MoreButton")
moreButton.validateProps = t.strictInterface({
	onActivated = t.callback,
	LayoutOrder = t.integer,
	userId = if fFlagLuaMenuPerfImprovementsModule then t.number else nil
})

function moreButton.init(p1)
	-- upvalues: fFlagLuaMenuPerfImprovementsModule (ref)
	if fFlagLuaMenuPerfImprovementsModule then
		function p0.onActivated()
			-- upvalues: p1 (ref)
			p1.props.onActivated(p1.props.userId)
		end
	end
end

function moreButton.render(p1)
	-- upvalues: withStyle (ref), fFlagLuaMenuPerfImprovementsModule (ref), roact (ref), imageSetButton (ref), assetsModule (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), fFlagLuaMenuPerfImprovementsModule (copy), roact (copy), imageSetButton (copy), assetsModule (copy)
		return roact.createElement(imageSetButton, {
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Image = assetsModule.Images.MoreActions,
			ImageColor3 = p2.Theme.IconEmphasis.Color,
			LayoutOrder = p1.props.LayoutOrder,
			[roact.Event.Activated] = if fFlagLuaMenuPerfImprovementsModule then if p1.props.onActivated then p1.onActivated else nil else p1.props.onActivated
		})
	end)
end

return moreButton