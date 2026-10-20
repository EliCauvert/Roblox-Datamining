local ImmutableModule = require(script.Parent.Parent.Immutable)
local SetActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local SetTabListModule = require(script.Parent.Parent.Actions.SetTabList)
local FFlagDevConsoleTabReselectKeepsClientViewModule = require(script.Parent.Flags.FFlagDevConsoleTabReselectKeepsClientView)

return function(p1, p2)
	-- upvalues: SetActiveTabModule (copy), FFlagDevConsoleTabReselectKeepsClientViewModule (copy), ImmutableModule (copy), SetTabListModule (copy)
	local P0 = p1 or {
		isDeveloperView = false,
		isClientView = true,
		currTabIndex = nil,
		tabList = {}
	}
	
	if p2.type == SetActiveTabModule.name then
		if P0.tabList[p2.newTabIndex] then
			local config = {
				currTabIndex = p2.newTabIndex,
				isClientView = p2.isClientView
			}
			
			if P0.currTabIndex ~= p2.newTabIndex then
				config.isClientView = true
			end
			if FFlagDevConsoleTabReselectKeepsClientViewModule and config.isClientView == nil then
				config.isClientView = true
			end
			local JoinDictionariesResult = ImmutableModule.JoinDictionaries(P0, config)
			
			if config.isClientView == nil then
				JoinDictionariesResult = ImmutableModule.RemoveFromDictionary(JoinDictionariesResult, "isClientView")
			end
			return JoinDictionariesResult
		end
	elseif p2.type == SetTabListModule.name and p2.tabList[p2.initIndex] then
		return ImmutableModule.JoinDictionaries(P0, {
			isClientView = true,
			currTabIndex = p2.initIndex,
			tabList = p2.tabList,
			isDeveloperView = p2.isDeveloperView
		})
	end
	return P0
end