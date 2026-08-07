local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local _ = require(parent.DiscoveryTypes)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, p1, p2, p3, p4, p5) --[[ line: 18 | named "useNavigateToSeeAll" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = useDispatch()
	
	return reactModule.useCallback(function() --[[ line: 29 ]]
		-- upvalues: p0 (ref), appPage (copy), p4 (ref), p3 (ref), p5 (ref), p1 (ref), p2 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		if p0 == nil then return end
		local t = {
			name = appPage.GamesList,
			detail = p4,
			extraProps = {
				sortPageId = p3,
				sortName = p4,
				pageContext = p5,
				isOmni = p1,
				sortIndex = if p1 then p2 else nil
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, {
		var2, p1, p0, p2, p4, p5, p3
	})
end