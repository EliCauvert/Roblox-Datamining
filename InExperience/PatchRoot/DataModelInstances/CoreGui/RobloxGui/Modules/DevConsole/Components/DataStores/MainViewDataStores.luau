local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local DataStoresChartModule = require(Components.DataStores.DataStoresChart)
local UtilAndTabModule = require(Components.UtilAndTab)
local DataStoresUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.DataStoresUpdateSearchFilter)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MainViewDataStores = RoactModule.PureComponent:extend("MainViewDataStores")

function MainViewDataStores.init(p1) --[[ Line: 17 ]]
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight) --[[ Line: 18 ]]
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onSearchTermChanged(p2) --[[ Line: 24 ]]
		-- upvalues: p1 (copy)
		p1.props.dispatchDataStoresUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewDataStores.didMount(p1) --[[ Line: 35 ]]
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewDataStores.didUpdate(p1) --[[ Line: 42 ]]
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewDataStores.render(p1) --[[ Line: 51 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), DataStoresChartModule (copy)
	local Size = p1.props.size
	local StoresSearchTerm = p1.props.storesSearchTerm
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
			searchTerm = StoresSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		DataStores = UtilTabHeight > 0 and RoactModule.createElement(DataStoresChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -UtilTabHeight),
			searchTerm = StoresSearchTerm
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 91 | Named "mapStateToProps" ]]
	return { storesSearchTerm = p1.DataStoresData.storesSearchTerm }
end, function(Callback) --[[ Line: 97 | Named "mapDispatchToProps" ]]
	-- upvalues: DataStoresUpdateSearchFilterModule (copy)
	return {
		dispatchDataStoresUpdateSearchFilter = function(p1, p2) --[[ Line: 99 ]]
			-- upvalues: Callback (copy), DataStoresUpdateSearchFilterModule (upval)
			Callback(DataStoresUpdateSearchFilterModule(p1, p2))
		end
	}
end)(MainViewDataStores)