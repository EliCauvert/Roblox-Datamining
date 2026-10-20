local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local ActionBindingsChartModule = require(Components.ActionBindings.ActionBindingsChart)
local UtilAndTabModule = require(Components.UtilAndTab)
local ActionBindingsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ActionBindingsUpdateSearchFilter)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MainViewActionBindings = RoactModule.Component:extend("MainViewActionBindings")

function MainViewActionBindings.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onSearchTermChanged(p2)
		-- upvalues: p1 (copy)
		p1.props.dispatchActionBindingsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewActionBindings.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewActionBindings.didUpdate(p1)
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewActionBindings.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), ActionBindingsChartModule (copy)
	local Size = p1.props.size
	local BindingsSearchTerm = p1.props.bindingsSearchTerm
	local UtilTabHeight: number = p1.state.utilTabHeight
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = Size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, MainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = p1.props.formFactor,
			tabList = p1.props.tabList,
			searchTerm = BindingsSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		ActionBindings = UtilTabHeight > 0 and RoactModule.createElement(ActionBindingsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -UtilTabHeight),
			searchTerm = BindingsSearchTerm
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		bindingsSearchTerm = p1.ActionBindingsData.bindingsSearchTerm
	}
end, function(Callback)
	-- upvalues: ActionBindingsUpdateSearchFilterModule (copy)
	return {
		dispatchActionBindingsUpdateSearchFilter = function(p1, p2)
			-- upvalues: Callback (copy), ActionBindingsUpdateSearchFilterModule (upval)
			Callback(ActionBindingsUpdateSearchFilterModule(p1, p2))
		end
	}
end)(MainViewActionBindings)