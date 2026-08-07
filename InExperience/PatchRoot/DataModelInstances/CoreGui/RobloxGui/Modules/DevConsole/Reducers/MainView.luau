local immutableModule = require(script.Parent.Parent.Immutable)
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local setTabListModule = require(script.Parent.Parent.Actions.SetTabList)

return function(p0, p1) --[[ line: 14 ]]
	-- upvalues: setActiveTabModule (ref), immutableModule (ref), setTabListModule (ref)
	p0 = p0 or {
		isDeveloperView = false,
		isClientView = true,
		currTabIndex = nil,
		tabList = {}
	}
	
	if p1.type == setActiveTabModule.name then
		if not p0.tabList[p1.newTabIndex] then
		end
		local t = {
			currTabIndex = p1.newTabIndex,
			isClientView = p1.isClientView
		}
		
		if p0.currTabIndex ~= p1.newTabIndex then
			t.isClientView = true
		end
		local var5 = immutableModule.JoinDictionaries(p0, t)
		
		if t.isClientView == nil then
			var5 = immutableModule.RemoveFromDictionary(var5, "isClientView")
		end
		return var5
	else
		return if p1.type == setTabListModule.name and p1.tabList[p1.initIndex] then immutableModule.JoinDictionaries(p0, {
			isClientView = true,
			currTabIndex = p1.initIndex,
			tabList = p1.tabList,
			isDeveloperView = p1.isDeveloperView
		}) else p0
	end
end