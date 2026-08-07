local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local utilAndTabModule = require(script.Parent.Parent.Parent.Components.UtilAndTab)
local mainViewRequestOrchestrator = roactModule.PureComponent:extend("MainViewRequestOrchestrator")

function mainViewRequestOrchestrator.render(p0) --[[ line: 9 ]]
	-- upvalues: roactModule (ref), utilAndTabModule (ref)
	local size = p0.props.size
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3, Size = size }, {
		UtilAndTab = roactModule.createElement(utilAndTabModule, {
			layoutOrder = 1,
			windowWidth = size.X.Offset,
			formFactor = p0.props.formFactor,
			tabList = p0.props.tabList
		})
	})
end

return mainViewRequestOrchestrator