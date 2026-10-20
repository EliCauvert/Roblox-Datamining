local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local ServerScriptsModule = require(Components.Scripts.ServerScripts)
local UtilAndTabModule = require(Components.UtilAndTab)
local ServerScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local Names = { "Active", "Inactive" }
local MainViewScripts = RoactModule.PureComponent:extend("MainViewScripts")

function MainViewScripts.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onCheckboxChanged(p2, p3)
		-- upvalues: p1 (copy)
		p1.props.dispatchServerScriptsUpdateSearchFilter(nil, { [p2] = p3 })
	end
	
	function p1.onSearchTermChanged(p2)
		-- upvalues: p1 (copy)
		p1.props.dispatchServerScriptsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0, isClientView = true }
end

function MainViewScripts.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewScripts.didUpdate(p1)
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewScripts.render(p1)
	-- upvalues: Names (copy), RoactModule (copy), ConstantsModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), ServerScriptsModule (copy)
	local Size = p1.props.size
	local FormFactor = p1.props.formFactor
	local TabList = p1.props.tabList
	local ServerTypeFilters = p1.props.serverTypeFilters
	local UtilTabHeight: number = p1.state.utilTabHeight
	local ServerSearchTerm = p1.props.serverSearchTerm
	local OrderedCheckboxState = {}
	
	for i, name in ipairs(Names) do
		local ServerTypeFilter = ServerTypeFilters[name]
		
		if ServerTypeFilter == nil then
			ServerTypeFilter = true
		end
		OrderedCheckboxState[i] = { name = name, state = ServerTypeFilter }
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
			searchTerm = ServerSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onCheckboxChanged = p1.onCheckboxChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		ServerScripts = UtilTabHeight > 0 and RoactModule.createElement(ServerScriptsModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -UtilTabHeight),
			searchTerm = ServerSearchTerm,
			scriptFilters = ServerTypeFilters
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return {
		serverSearchTerm = p2.ScriptsData.serverSearchTerm,
		serverTypeFilters = p2.ScriptsData.serverTypeFilters
	}
end, function(Callback)
	-- upvalues: ServerScriptsUpdateSearchFilterModule (copy)
	return {
		dispatchServerScriptsUpdateSearchFilter = function(p2, p3)
			-- upvalues: Callback (copy), ServerScriptsUpdateSearchFilterModule (upval)
			Callback(ServerScriptsUpdateSearchFilterModule(p2, p3))
		end
	}
end)(MainViewScripts)