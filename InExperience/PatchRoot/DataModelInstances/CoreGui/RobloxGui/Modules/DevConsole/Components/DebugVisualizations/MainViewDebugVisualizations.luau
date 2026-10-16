local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local DebugVisualizationsChartModule = require(Components.DebugVisualizations.DebugVisualizationsChart)
local UtilAndTabModule = require(Components.UtilAndTab)
local DebugVisualizationsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.DebugVisualizationsUpdateSearchFilter)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local Names = {
	"Performance", "Behavior", "Constraints", "Forces", "Networking", "Collision"
}
local MainViewDebugVisualizations = RoactModule.Component:extend("MainViewDebugVisualizations")

function MainViewDebugVisualizations.init(p1) --[[ Line: 26 ]]
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight) --[[ Line: 27 ]]
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onCheckboxChanged(p2, p3) --[[ Line: 33 ]]
		-- upvalues: p1 (copy)
		p1.props.dispatchDebugVisualizationsUpdateSearchFilter(nil, { [p2] = p3 })
	end
	
	function p1.onSearchTermChanged(p2) --[[ Line: 39 ]]
		-- upvalues: p1 (copy)
		p1.props.dispatchDebugVisualizationsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewDebugVisualizations.didMount(p1) --[[ Line: 50 ]]
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewDebugVisualizations.didUpdate(p1) --[[ Line: 57 ]]
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewDebugVisualizations.render(p1) --[[ Line: 66 ]]
	-- upvalues: Names (copy), RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), DebugVisualizationsChartModule (copy)
	local Size = p1.props.size
	local FormFactor = p1.props.formFactor
	local TabList = p1.props.tabList
	local DebugVisualizationsSearchTerm = p1.props.debugVisualizationsSearchTerm
	local DebugVisualizationsTypeFilters = p1.props.debugVisualizationsTypeFilters
	local UtilTabHeight: number = p1.state.utilTabHeight
	local OrderedCheckboxState = {}
	
	for i, name in ipairs(Names) do
		local DebugVisualizationsTypeFilter = DebugVisualizationsTypeFilters[name]
		
		if DebugVisualizationsTypeFilter == nil then
			DebugVisualizationsTypeFilter = false
		end
		OrderedCheckboxState[i] = { name = name, state = DebugVisualizationsTypeFilter }
	end
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
			formFactor = FormFactor,
			tabList = TabList,
			orderedCheckboxState = OrderedCheckboxState,
			searchTerm = DebugVisualizationsSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onCheckboxChanged = p1.onCheckboxChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		DebugVisualizations = UtilTabHeight > 0 and RoactModule.createElement(DebugVisualizationsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -UtilTabHeight),
			searchTerm = DebugVisualizationsSearchTerm,
			typeFilters = DebugVisualizationsTypeFilters
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p2, _) --[[ Line: 121 | Named "mapStateToProps" ]]
	return {
		debugVisualizationsSearchTerm = p2.DebugVisualizationsData.debugVisualizationsSearchTerm,
		debugVisualizationsTypeFilters = p2.DebugVisualizationsData.debugVisualizationsTypeFilters
	}
end, function(Callback) --[[ Line: 128 | Named "mapDispatchToProps" ]]
	-- upvalues: DebugVisualizationsUpdateSearchFilterModule (copy)
	return {
		dispatchDebugVisualizationsUpdateSearchFilter = function(p2, p3) --[[ Line: 130 ]]
			-- upvalues: Callback (copy), DebugVisualizationsUpdateSearchFilterModule (upval)
			Callback(DebugVisualizationsUpdateSearchFilterModule(p2, p3))
		end
	}
end)(MainViewDebugVisualizations)