local immutableModule = require(script.Parent.Parent.Immutable)
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local setTabListModule = require(script.Parent.Parent.Actions.SetTabList)

return function(p1, p2)
	-- upvalues: setActiveTabModule (ref), immutableModule (ref), setTabListModule (ref)
	p1 = p1 or {
		isDeveloperView = false,
		isClientView = true,
		currTabIndex = nil,
		tabList = {}
	}
	
	if p2.type == setActiveTabModule.name then
		if not p1.tabList[p2.newTabIndex] then
		end
		local t = {
			currTabIndex = p2.newTabIndex,
			isClientView = p2.isClientView
		}
		
		if p1.currTabIndex ~= p2.newTabIndex then
			t.isClientView = true
		end
		local var1 = immutableModule.JoinDictionaries(p1, t)
		
		if t.isClientView == nil then
			var1 = immutableModule.RemoveFromDictionary(var1, "isClientView")
		end
		return var1
	else
		return if p2.type == setTabListModule.name and p2.tabList[p2.initIndex] then immutableModule.JoinDictionaries(p1, {
			isClientView = true,
			currTabIndex = p2.initIndex,
			tabList = p2.tabList,
			isDeveloperView = p2.isDeveloperView
		}) else p1
	end
end