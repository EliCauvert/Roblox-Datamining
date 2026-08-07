local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local serverJobsChartModule = require(components.ServerJobs.ServerJobsChart)
local utilAndTabModule = require(components.UtilAndTab)
local serverJobsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ServerJobsUpdateSearchFilter)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local mainViewServerJobs = roactModule.Component:extend("MainViewServerJobs")

function mainViewServerJobs.init(p0) --[[ line: 17 ]]
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p1) --[[ line: 18 ]]
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onSearchTermChanged(p2) --[[ line: 24 ]]
		-- upvalues: p0 (ref)
		p0.props.dispatchServerJobsUpdateSearchFilter(p2, {})
	end
	
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0 }
end

function mainViewServerJobs.didMount(p3) --[[ line: 35 ]]
	p3:setState({ utilTabHeight = p3.utilRef.current.Size.Y.Offset })
end

function mainViewServerJobs.didUpdate(p4) --[[ line: 42 ]]
	local size = p4.utilRef.current.Size
	
	if size.Y.Offset ~= p4.state.utilTabHeight then
		p4:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewServerJobs.render(p5) --[[ line: 51 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), serverJobsChartModule (ref)
	local size = p5.props.size
	local formFactor = p5.props.formFactor
	local tabList = p5.props.tabList
	local jobsSearchTerm = p5.props.jobsSearchTerm
	local utilTabHeight = p5.state.utilTabHeight
	
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
			searchTerm = jobsSearchTerm,
			refForParent = p5.utilRef,
			onHeightChanged = p5.onUtilTabHeightChanged,
			onSearchTermChanged = p5.onSearchTermChanged
		}),
		ServerJobs = utilTabHeight > 0 and roactModule.createElement(serverJobsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = jobsSearchTerm
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _) --[[ line: 91 | named "mapStateToProps" ]]
	return { jobsSearchTerm = p6.ServerJobsData.jobsSearchTerm }
end, function(p7) --[[ line: 97 | named "mapDispatchToProps" ]]
	-- upvalues: serverJobsUpdateSearchFilterModule (ref)
	return {
		dispatchServerJobsUpdateSearchFilter = function(p8, p9) --[[ line: 99 ]]
			-- upvalues: p7 (ref), serverJobsUpdateSearchFilterModule (copy)
			p7(serverJobsUpdateSearchFilterModule(p8, p9))
		end
	}
end)(mainViewServerJobs)