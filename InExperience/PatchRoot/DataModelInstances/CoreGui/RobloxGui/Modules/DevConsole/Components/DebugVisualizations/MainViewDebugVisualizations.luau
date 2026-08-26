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

function mainViewDebugVisualizations.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onCheckboxChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1.props.dispatchDebugVisualizationsUpdateSearchFilter(nil, { [p2] = p3 })
	end
	
	function p0.onSearchTermChanged(p2)
		-- upvalues: p1 (ref)
		p1.props.dispatchDebugVisualizationsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function mainViewDebugVisualizations.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewDebugVisualizations.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewDebugVisualizations.render(p1)
	-- upvalues: list (ref), roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), debugVisualizationsChartModule (ref)
	local size = p1.props.size
	local formFactor = p1.props.formFactor
	local tabList = p1.props.tabList
	local debugVisualizationsSearchTerm = p1.props.debugVisualizationsSearchTerm
	local debugVisualizationsTypeFilters = p1.props.debugVisualizationsTypeFilters
	local utilTabHeight = p1.state.utilTabHeight
	local t = {}
	
	for i, v in ipairs(list) do
		local var1 = debugVisualizationsTypeFilters[v]
		
		if var1 == nil then
			var1 = false
		end
		t[i] = { name = v, state = var1 }
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
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onCheckboxChanged = p1.onCheckboxChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		DebugVisualizations = utilTabHeight > 0 and roactModule.createElement(debugVisualizationsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = debugVisualizationsSearchTerm,
			typeFilters = debugVisualizationsTypeFilters
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return {
		debugVisualizationsSearchTerm = p2.DebugVisualizationsData.debugVisualizationsSearchTerm,
		debugVisualizationsTypeFilters = p2.DebugVisualizationsData.debugVisualizationsTypeFilters
	}
end, function(p2)
	-- upvalues: debugVisualizationsUpdateSearchFilterModule (ref)
	return {
		dispatchDebugVisualizationsUpdateSearchFilter = function(p3, p4)
			-- upvalues: p2 (ref), debugVisualizationsUpdateSearchFilterModule (copy)
			p2(debugVisualizationsUpdateSearchFilterModule(p3, p4))
		end
	}
end)(mainViewDebugVisualizations)