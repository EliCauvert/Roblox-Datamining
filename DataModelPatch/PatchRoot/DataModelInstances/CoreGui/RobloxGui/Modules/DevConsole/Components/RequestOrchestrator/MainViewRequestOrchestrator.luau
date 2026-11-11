local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local UtilAndTabModule = require(script.Parent.Parent.Parent.Components.UtilAndTab)
local MainViewRequestOrchestrator = RoactModule.PureComponent:extend("MainViewRequestOrchestrator")

function MainViewRequestOrchestrator.render(p1)
	-- upvalues: RoactModule (copy), UtilAndTabModule (copy)
	local Size = p1.props.size
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3, Size = Size }, {
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = p1.props.formFactor,
			tabList = p1.props.tabList
		})
	})
end

return MainViewRequestOrchestrator