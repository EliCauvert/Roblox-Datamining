local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local _ = require(Parent.DiscoveryTypes)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, IsOmni, p2, SortPageId, Detail, PageContext) --[[ Line: 18 | Named "useNavigateToSeeAll" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return (ReactModule.useCallback(function() --[[ Line: 29 ]]
		-- upvalues: p1 (copy), AppPage (upval), Detail (copy), SortPageId (copy), PageContext (copy), IsOmni (copy), p2 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if p1 == nil then return end
		local config = {
			name = AppPage.GamesList,
			detail = Detail,
			extraProps = {
				sortPageId = SortPageId,
				sortName = Detail,
				pageContext = PageContext,
				isOmni = IsOmni,
				sortIndex = if IsOmni then p2 else nil
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseDispatchResult, IsOmni, p1, p2, Detail, PageContext, SortPageId
	}))
end