local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.TenFootUiCommon)
local TenFootUiSwitchViewCardModule = require(TenFootUiShell.ReactNavigationExtend.Views.Cards.TenFootUiSwitchViewCard)
local _ = require(Parent.Navigation)

local function useTabIndeces(Current)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ current = Current, previous = Current })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Current (copy)
		UseStateResult2(function(p1)
			-- upvalues: Current (upval)
			return if Current == p1.current then p1 else { current = Current, previous = p1.current }
		end)
	end, { Current })
	
	return UseStateResult.current, UseStateResult.previous
end

return function(p1)
	-- upvalues: useTabIndeces (copy), ReactModule (copy), TenFootUiSwitchViewCardModule (copy)
	local Descriptors = p1.descriptors
	local Navigation = p1.navigation
	local State = Navigation.state
	local Key = State.routes[State.index].key
	local UseTabIndecesResult, UseTabIndecesResult2 = useTabIndeces(State.index)
	local Elements = {}
	
	for i, descriptor in Descriptors do
		Elements[i] = ReactModule.createElement(TenFootUiSwitchViewCardModule, {
			descriptor = descriptor,
			screenProps = p1.screenProps,
			navigation = Navigation,
			isActiveTab = i == Key,
			currentTabIndex = UseTabIndecesResult,
			previousTabIndex = UseTabIndecesResult2
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end