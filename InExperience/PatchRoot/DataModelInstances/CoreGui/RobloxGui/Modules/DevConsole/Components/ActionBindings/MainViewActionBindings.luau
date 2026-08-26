local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local actionBindingsChartModule = require(components.ActionBindings.ActionBindingsChart)
local utilAndTabModule = require(components.UtilAndTab)
local actionBindingsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ActionBindingsUpdateSearchFilter)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local mainViewActionBindings = roactModule.Component:extend("MainViewActionBindings")

function mainViewActionBindings.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onSearchTermChanged(p2)
		-- upvalues: p1 (ref)
		p1.props.dispatchActionBindingsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function mainViewActionBindings.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewActionBindings.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewActionBindings.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), actionBindingsChartModule (ref)
	local size = p1.props.size
	local formFactor = p1.props.formFactor
	local tabList = p1.props.tabList
	local bindingsSearchTerm = p1.props.bindingsSearchTerm
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
			searchTerm = bindingsSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		ActionBindings = utilTabHeight > 0 and roactModule.createElement(actionBindingsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = bindingsSearchTerm
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		bindingsSearchTerm = p1.ActionBindingsData.bindingsSearchTerm
	}
end, function(p1)
	-- upvalues: actionBindingsUpdateSearchFilterModule (ref)
	return {
		dispatchActionBindingsUpdateSearchFilter = function(p2, p3)
			-- upvalues: p1 (ref), actionBindingsUpdateSearchFilterModule (copy)
			p1(actionBindingsUpdateSearchFilterModule(p2, p3))
		end
	}
end)(mainViewActionBindings)