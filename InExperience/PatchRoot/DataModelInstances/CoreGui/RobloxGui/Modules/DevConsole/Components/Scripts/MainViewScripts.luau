local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local serverScriptsModule = require(components.Scripts.ServerScripts)
local utilAndTabModule = require(components.UtilAndTab)
local serverScriptsUpdateSearchFilterModule = require(script.Parent.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local list = { "Active", "Inactive" }
local mainViewScripts = roactModule.PureComponent:extend("MainViewScripts")

function mainViewScripts.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onCheckboxChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1.props.dispatchServerScriptsUpdateSearchFilter(nil, { [p2] = p3 })
	end
	
	function p0.onSearchTermChanged(p2)
		-- upvalues: p1 (ref)
		p1.props.dispatchServerScriptsUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0, isClientView = true }
end

function mainViewScripts.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewScripts.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewScripts.render(p1)
	-- upvalues: list (ref), roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), serverScriptsModule (ref)
	local size = p1.props.size
	local formFactor = p1.props.formFactor
	local tabList = p1.props.tabList
	local serverTypeFilters = p1.props.serverTypeFilters
	local utilTabHeight = p1.state.utilTabHeight
	local serverSearchTerm = p1.props.serverSearchTerm
	local t = {}
	
	for i, v in ipairs(list) do
		local var1 = serverTypeFilters[v]
		
		if var1 == nil then
			var1 = true
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
			searchTerm = serverSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onCheckboxChanged = p1.onCheckboxChanged,
			onSearchTermChanged = p1.onSearchTermChanged
		}),
		ServerScripts = utilTabHeight > 0 and roactModule.createElement(serverScriptsModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = serverSearchTerm,
			scriptFilters = serverTypeFilters
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return {
		serverSearchTerm = p2.ScriptsData.serverSearchTerm,
		serverTypeFilters = p2.ScriptsData.serverTypeFilters
	}
end, function(p2)
	-- upvalues: serverScriptsUpdateSearchFilterModule (ref)
	return {
		dispatchServerScriptsUpdateSearchFilter = function(p3, p4)
			-- upvalues: p2 (ref), serverScriptsUpdateSearchFilterModule (copy)
			p2(serverScriptsUpdateSearchFilterModule(p3, p4))
		end
	}
end)(mainViewScripts)