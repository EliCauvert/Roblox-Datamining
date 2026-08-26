local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local pageNavigationWatcher = roact.PureComponent:extend("PageNavigationWatcher")
pageNavigationWatcher.validateProps = t.strictInterface({
	desiredPage = t.string,
	onNavigateTo = t.optional(t.callback),
	onNavigateAway = t.optional(t.callback),
	currentPage = t.string,
	menuOpen = t.boolean
})

function pageNavigationWatcher.init(p1, p2)
	p1:setState({ lastPage = p2.currentPage, lastMenuOpen = p2.menuOpen })
end

function pageNavigationWatcher.render(p1)
	-- upvalues: roact (ref)
	return roact.createFragment(p1.props[roact.Children])
end

function pageNavigationWatcher.didUpdate(p1)
	local lastPage = p1.state.lastPage
	local lastMenuOpen = p1.state.lastMenuOpen
	local currentPage = p1.props.currentPage
	local menuOpen = p1.props.menuOpen
	
	if lastPage ~= currentPage or lastMenuOpen ~= menuOpen then
		p1:setState({ lastPage = currentPage, lastMenuOpen = menuOpen })
		
		if currentPage == p1.props.desiredPage and menuOpen and p1.props.onNavigateTo ~= nil then
			p1.props.onNavigateTo()
			
			return
		elseif lastPage == p1.props.desiredPage and lastMenuOpen and p1.props.onNavigateAway ~= nil then
			p1.props.onNavigateAway()
			
			return
		elseif lastMenuOpen and not menuOpen and p1.props.onNavigateAway ~= nil then
			p1.props.onNavigateAway()
		end
	end
end

return roactRodux.UNSTABLE_connect2(function(p1)
	return { currentPage = p1.menuPage, menuOpen = p1.isMenuOpen }
end)(pageNavigationWatcher)