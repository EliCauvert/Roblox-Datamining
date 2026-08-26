local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local itemTypeEnum = require(parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local fIntAXLookImpressionDeferTimeoutMs = require(parent.AvatarExperienceFlags).FIntAXLookImpressionDeferTimeoutMs
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local selectHydratedLookTypeModule = require(avatarExperienceCatalog.State.Selectors.selectHydratedLookType)

return function(p1)
	-- upvalues: useStore (ref), reactModule (ref), fIntAXLookImpressionDeferTimeoutMs (ref), itemTypeEnum (ref), selectHydratedLookTypeModule (ref)
	local var1 = useStore()
	local var2 = if p1 then p1.content else nil
	local var3 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), fIntAXLookImpressionDeferTimeoutMs (copy)
		var3.current = false
		local delayedThread = task.delay(math.max(0, fIntAXLookImpressionDeferTimeoutMs) / 1000, function()
			-- upvalues: var3 (copy)
			var3.current = true
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {})
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var2 (ref), itemTypeEnum (copy), selectHydratedLookTypeModule (copy), var1 (ref)
		if var3.current then
			return true
		end
		local var4 = if var2 then var2[p2] else nil
		
		if var4 == nil then
			return true
		elseif var4.type ~= itemTypeEnum.Look then
			return true
		end
		local id = var4.id
		
		return id == nil or selectHydratedLookTypeModule(var1:getState(), tostring(id)) ~= nil
	end, { var2, var1 })
end