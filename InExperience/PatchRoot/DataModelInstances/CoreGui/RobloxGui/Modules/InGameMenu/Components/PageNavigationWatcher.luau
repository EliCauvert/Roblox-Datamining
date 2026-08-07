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

function pageNavigationWatcher.init(p0, p1) --[[ line: 25 ]]
	p0:setState({ lastPage = p1.currentPage, lastMenuOpen = p1.menuOpen })
end

function pageNavigationWatcher.render(p2) --[[ line: 32 ]]
	-- upvalues: roact (ref)
	return roact.createFragment(p2.props[roact.Children])
end

function pageNavigationWatcher.didUpdate(p3) --[[ line: 36 ]]
	local lastPage = p3.state.lastPage
	local lastMenuOpen = p3.state.lastMenuOpen
	local currentPage = p3.props.currentPage
	local menuOpen = p3.props.menuOpen
	
	if lastPage ~= currentPage or lastMenuOpen ~= menuOpen then
		p3:setState({ lastPage = currentPage, lastMenuOpen = menuOpen })
		
		if currentPage == p3.props.desiredPage and menuOpen and p3.props.onNavigateTo ~= nil then
			p3.props.onNavigateTo()
			
			return
		elseif lastPage == p3.props.desiredPage and lastMenuOpen and p3.props.onNavigateAway ~= nil then
			p3.props.onNavigateAway()
			
			return
		elseif lastMenuOpen and not menuOpen and p3.props.onNavigateAway ~= nil then
			p3.props.onNavigateAway()
		end
	end
end

return roactRodux.UNSTABLE_connect2(function(p4) --[[ line: 58 ]]
	return { currentPage = p4.menuPage, menuOpen = p4.isMenuOpen }
end)(pageNavigationWatcher)