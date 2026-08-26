local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local _ = require(parent.DiscoveryTypes)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = useDispatch()
	
	return reactModule.useCallback(function()
		-- upvalues: p1 (ref), appPage (copy), p5 (ref), p4 (ref), p6 (ref), p2 (ref), p3 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		if p1 == nil then return end
		local t = {
			name = appPage.GamesList,
			detail = p5,
			extraProps = {
				sortPageId = p4,
				sortName = p5,
				pageContext = p6,
				isOmni = p2,
				sortIndex = if p2 then p3 else nil
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, {
		var2, p2, p1, p3, p5, p6, p4
	})
end