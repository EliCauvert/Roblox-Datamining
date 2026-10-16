local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local ServerJobsChartModule = require(Components.ServerJobs.ServerJobsChart)
local UtilAndTabModule = require(Components.UtilAndTab)
local ServerJobsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ServerJobsUpdateSearchFilter)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MainViewServerJobs = RoactModule.Component:extend("MainViewServerJobs")

function MainViewServerJobs.init(p1) --[[ Line: 17 ]]
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight) --[[ Line: 18 ]]
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onSearchTermChanged(p2) --[[ Line: 24 ]]
		-- upvalues: p1 (copy)
		p1.props.dispatchServerJobsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewServerJobs.didMount(p1) --[[ Line: 35 ]]
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewServerJobs.didUpdate(p1) --[[ Line: 42 ]]
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewServerJobs.render(p1) --[[ Line: 51 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), ServerJobsChartModule (copy)
	local Size = p1.props.size
	local JobsSearchTerm = p1.props.jobsSearchTerm
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
			searchTerm = JobsSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		ServerJobs = UtilTabHeight > 0 and RoactModule.createElement(ServerJobsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -UtilTabHeight),
			searchTerm = JobsSearchTerm
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 91 | Named "mapStateToProps" ]]
	return { jobsSearchTerm = p1.ServerJobsData.jobsSearchTerm }
end, function(Callback) --[[ Line: 97 | Named "mapDispatchToProps" ]]
	-- upvalues: ServerJobsUpdateSearchFilterModule (copy)
	return {
		dispatchServerJobsUpdateSearchFilter = function(p1, p2) --[[ Line: 99 ]]
			-- upvalues: Callback (copy), ServerJobsUpdateSearchFilterModule (upval)
			Callback(ServerJobsUpdateSearchFilterModule(p1, p2))
		end
	}
end)(MainViewServerJobs)