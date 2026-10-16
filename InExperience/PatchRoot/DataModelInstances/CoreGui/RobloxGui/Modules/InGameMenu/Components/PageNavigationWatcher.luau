local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local PageNavigationWatcher = Roact.PureComponent:extend("PageNavigationWatcher")
PageNavigationWatcher.validateProps = T.strictInterface({
	desiredPage = T.string,
	onNavigateTo = T.optional(T.callback),
	onNavigateAway = T.optional(T.callback),
	currentPage = T.string,
	menuOpen = T.boolean
})

function PageNavigationWatcher.init(p1, p2) --[[ Line: 25 ]]
	p1:setState({ lastPage = p2.currentPage, lastMenuOpen = p2.menuOpen })
end

function PageNavigationWatcher.render(p1) --[[ Line: 32 ]]
	-- upvalues: Roact (copy)
	return Roact.createFragment(p1.props[Roact.Children])
end

function PageNavigationWatcher.didUpdate(p1) --[[ Line: 36 ]]
	local LastPage = p1.state.lastPage
	local LastMenuOpen = p1.state.lastMenuOpen
	local CurrentPage = p1.props.currentPage
	local MenuOpen = p1.props.menuOpen
	
	if LastPage ~= CurrentPage or LastMenuOpen ~= MenuOpen then
		p1:setState({ lastPage = CurrentPage, lastMenuOpen = MenuOpen })
		
		if CurrentPage == p1.props.desiredPage and MenuOpen and p1.props.onNavigateTo ~= nil then
			p1.props.onNavigateTo()
			
			return
		end
		if LastPage == p1.props.desiredPage and LastMenuOpen and p1.props.onNavigateAway ~= nil then
			p1.props.onNavigateAway()
			
			return
		end
		if LastMenuOpen and not MenuOpen and p1.props.onNavigateAway ~= nil then
			p1.props.onNavigateAway()
		end
	end
end

return RoactRodux.UNSTABLE_connect2(function(p1) --[[ Line: 58 ]]
	return { currentPage = p1.menuPage, menuOpen = p1.isMenuOpen }
end)(PageNavigationWatcher)