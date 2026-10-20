local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local ServerStatsChartModule = require(Components.ServerStats.ServerStatsChart)
local UtilAndTabModule = require(Components.UtilAndTab)
local ServerStatsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ServerStatsUpdateSearchFilter)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MainViewServerStats = RoactModule.Component:extend("MainViewServerStats")

function MainViewServerStats.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onSearchTermChanged(p2)
		-- upvalues: p1 (copy)
		p1.props.dispatchServerStatsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewServerStats.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewServerStats.didUpdate(p1)
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewServerStats.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), ServerStatsChartModule (copy)
	local Size = p1.props.size
	local StatsSearchTerm = p1.props.statsSearchTerm
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
			searchTerm = StatsSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		ServerStats = UtilTabHeight > 0 and RoactModule.createElement(ServerStatsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -UtilTabHeight),
			searchTerm = StatsSearchTerm
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return { statsSearchTerm = p1.ServerStatsData.statsSearchTerm }
end, function(Callback)
	-- upvalues: ServerStatsUpdateSearchFilterModule (copy)
	return {
		dispatchServerStatsUpdateSearchFilter = function(p1, p2)
			-- upvalues: Callback (copy), ServerStatsUpdateSearchFilterModule (upval)
			Callback(ServerStatsUpdateSearchFilterModule(p1, p2))
		end
	}
end)(MainViewServerStats)