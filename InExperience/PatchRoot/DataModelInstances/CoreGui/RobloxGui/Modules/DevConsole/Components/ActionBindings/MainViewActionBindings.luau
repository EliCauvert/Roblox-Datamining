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

function mainViewActionBindings.init(p0)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p1)
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onSearchTermChanged(p2)
		-- upvalues: p0 (ref)
		p0.props.dispatchActionBindingsUpdateSearchFilter(p2, {})
	end
	
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0 }
end

function mainViewActionBindings.didMount(p3)
	p3:setState({ utilTabHeight = p3.utilRef.current.Size.Y.Offset })
end

function mainViewActionBindings.didUpdate(p4)
	local size = p4.utilRef.current.Size
	
	if size.Y.Offset ~= p4.state.utilTabHeight then
		p4:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewActionBindings.render(p5)
	-- upvalues: roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), actionBindingsChartModule (ref)
	local size = p5.props.size
	local formFactor = p5.props.formFactor
	local tabList = p5.props.tabList
	local bindingsSearchTerm = p5.props.bindingsSearchTerm
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
			searchTerm = bindingsSearchTerm,
			refForParent = p5.utilRef,
			onHeightChanged = p5.onUtilTabHeightChanged,
			onSearchTermChanged = p5.onSearchTermChanged
		}),
		ActionBindings = utilTabHeight > 0 and roactModule.createElement(actionBindingsChartModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = bindingsSearchTerm
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _)
	return {
		bindingsSearchTerm = p6.ActionBindingsData.bindingsSearchTerm
	}
end, function(p7)
	-- upvalues: actionBindingsUpdateSearchFilterModule (ref)
	return {
		dispatchActionBindingsUpdateSearchFilter = function(p8, p9)
			-- upvalues: p7 (ref), actionBindingsUpdateSearchFilterModule (copy)
			p7(actionBindingsUpdateSearchFilterModule(p8, p9))
		end
	}
end)(mainViewActionBindings)