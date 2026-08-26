local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local serverStatsChartModule = require(components.ServerStats.ServerStatsChart)
local utilAndTabModule = require(components.UtilAndTab)
local serverStatsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ServerStatsUpdateSearchFilter)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local mainViewServerStats = roactModule.Component:extend("MainViewServerStats")

function mainViewServerStats.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onSearchTermChanged(p2)
		-- upvalues: p1 (ref)
		p1.props.dispatchServerStatsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function mainViewServerStats.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewServerStats.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewServerStats.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), serverStatsChartModule (ref)
	local size = p1.props.size
	local formFactor = p1.props.formFactor
	local tabList = p1.props.tabList
	local statsSearchTerm = p1.props.statsSearchTerm
	local utilTabHeight = p1.state.utilTabHeight
	
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
			searchTerm = statsSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		ServerStats = utilTabHeight > 0 and roactModule.createElement(serverStatsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = statsSearchTerm
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return { statsSearchTerm = p1.ServerStatsData.statsSearchTerm }
end, function(p1)
	-- upvalues: serverStatsUpdateSearchFilterModule (ref)
	return {
		dispatchServerStatsUpdateSearchFilter = function(p2, p3)
			-- upvalues: p1 (ref), serverStatsUpdateSearchFilterModule (copy)
			p1(serverStatsUpdateSearchFilterModule(p2, p3))
		end
	}
end)(mainViewServerStats)