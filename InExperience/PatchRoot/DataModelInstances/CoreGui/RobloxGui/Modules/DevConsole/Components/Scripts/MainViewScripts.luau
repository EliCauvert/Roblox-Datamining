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

function mainViewScripts.init(p0)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p1)
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onCheckboxChanged(p2, p3)
		-- upvalues: p0 (ref)
		p0.props.dispatchServerScriptsUpdateSearchFilter(nil, { [p2] = p3 })
	end
	
	function p0.onSearchTermChanged(p4)
		-- upvalues: p0 (ref)
		p0.props.dispatchServerScriptsUpdateSearchFilter(p4, {})
	end
	
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0, isClientView = true }
end

function mainViewScripts.didMount(p5)
	p5:setState({ utilTabHeight = p5.utilRef.current.Size.Y.Offset })
end

function mainViewScripts.didUpdate(p6)
	local size = p6.utilRef.current.Size
	
	if size.Y.Offset ~= p6.state.utilTabHeight then
		p6:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewScripts.render(p7)
	-- upvalues: list (ref), roactModule (ref), constantsModule (ref), mainRowPadding (ref), utilAndTabModule (ref), serverScriptsModule (ref)
	local size = p7.props.size
	local formFactor = p7.props.formFactor
	local tabList = p7.props.tabList
	local serverTypeFilters = p7.props.serverTypeFilters
	local utilTabHeight = p7.state.utilTabHeight
	local serverSearchTerm = p7.props.serverSearchTerm
	local t = {}
	
	for i, v in ipairs(list) do
		local var10 = serverTypeFilters[v]
		
		if var10 == nil then
			var10 = true
		end
		t[i] = { name = v, state = var10 }
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
			refForParent = p7.utilRef,
			onHeightChanged = p7.onUtilTabHeightChanged,
			onCheckboxChanged = p7.onCheckboxChanged,
			onSearchTermChanged = p7.onSearchTermChanged
		}),
		ServerScripts = utilTabHeight > 0 and roactModule.createElement(serverScriptsModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 1, -utilTabHeight),
			searchTerm = serverSearchTerm,
			scriptFilters = serverTypeFilters
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p8, _)
	return {
		serverSearchTerm = p8.ScriptsData.serverSearchTerm,
		serverTypeFilters = p8.ScriptsData.serverTypeFilters
	}
end, function(p9)
	-- upvalues: serverScriptsUpdateSearchFilterModule (ref)
	return {
		dispatchServerScriptsUpdateSearchFilter = function(p10, p11)
			-- upvalues: p9 (ref), serverScriptsUpdateSearchFilterModule (copy)
			p9(serverScriptsUpdateSearchFilterModule(p10, p11))
		end
	}
end)(mainViewScripts)