local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local debugVisualizationsChartModule = require(components.DebugVisualizations.DebugVisualizationsChart)
local utilAndTabModule = require(components.UtilAndTab)
local debugVisualizationsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.DebugVisualizationsUpdateSearchFilter)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local list = {
	"Performance", "Behavior", "Constraints", "Forces", "Networking", "Collision"
}
local mainViewDebugVisualizations = roactModule.Component:extend("MainViewDebugVisualizations")

function mainViewDebugVisualizations.init(p0) --[[ line: 26 ]]
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p1) --[[ line: 27 ]]
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onCheckboxChanged(p2, p3) --[[ line: 33 ]]
		-- upvalues: p0 (ref)
		p0.props.dispatchDebugVisualizationsUpdateSearchFilter(nil, { [p2] = p3 })
	end
	
	function p0.onSearchTermChanged(p4) --[[ line: 39 ]]
		-- upvalues: p0 (ref)
		p0.props.dispatchDebugVisualizationsUpdateSearchFilter(p4, {})
	end
	
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0 }
end

function mainViewDebugVisualizations.didMount(p5) --[[ line: 50 ]]
	p5:setState({ utilTabHeight = p5.utilRef.current.Size.Y.Offset })
end

function mainViewDebugVisualizations.didUpdate(p6) --[[ line: 57 ]]
	local size = p6.utilRef.current.Size
	
	if size.Y.Offset ~= p6.state.utilTabHeight then
		p6:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewDebugVisualizations.render(p7) --[[ line: 66 ]]
	-- upvalues: list (ref), roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), debugVisualizationsChartModule (ref)
	local size = p7.props.size
	local formFactor = p7.props.formFactor
	local tabList = p7.props.tabList
	local debugVisualizationsSearchTerm = p7.props.debugVisualizationsSearchTerm
	local debugVisualizationsTypeFilters = p7.props.debugVisualizationsTypeFilters
	local utilTabHeight = p7.state.utilTabHeight
	local t = {}
	
	for i, v in ipairs(list) do
		local var10 = debugVisualizationsTypeFilters[v]
		
		if var10 == nil then
			var10 = false
		end
		t[i] = { name = v, state = var10 }
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, mainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UtilAndTab = roactModule.createElement(utilAndTabModule, {
			layoutOrder = 1,
			windowWidth = size.X.Offset,
			formFactor = formFactor,
			tabList = tabList,
			orderedCheckboxState = t,
			searchTerm = debugVisualizationsSearchTerm,
			refForParent = p7.utilRef,
			onHeightChanged = p7.onUtilTabHeightChanged,
			onCheckboxChanged = p7.onCheckboxChanged,
			onSearchTermChanged = p7.onSearchTermChanged
		}),
		DebugVisualizations = utilTabHeight > 0 and roactModule.createElement(debugVisualizationsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = debugVisualizationsSearchTerm,
			typeFilters = debugVisualizationsTypeFilters
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p8, _) --[[ line: 121 | named "mapStateToProps" ]]
	return {
		debugVisualizationsSearchTerm = p8.DebugVisualizationsData.debugVisualizationsSearchTerm,
		debugVisualizationsTypeFilters = p8.DebugVisualizationsData.debugVisualizationsTypeFilters
	}
end, function(p9) --[[ line: 128 | named "mapDispatchToProps" ]]
	-- upvalues: debugVisualizationsUpdateSearchFilterModule (ref)
	return {
		dispatchDebugVisualizationsUpdateSearchFilter = function(p10, p11) --[[ line: 130 ]]
			-- upvalues: p9 (ref), debugVisualizationsUpdateSearchFilterModule (copy)
			p9(debugVisualizationsUpdateSearchFilterModule(p10, p11))
		end
	}
end)(mainViewDebugVisualizations)