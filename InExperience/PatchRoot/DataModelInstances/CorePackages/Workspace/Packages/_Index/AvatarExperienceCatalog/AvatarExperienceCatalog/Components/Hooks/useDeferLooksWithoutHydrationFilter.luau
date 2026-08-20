local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local itemTypeEnum = require(parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local fIntAXLookImpressionDeferTimeoutMs = require(parent.AvatarExperienceFlags).FIntAXLookImpressionDeferTimeoutMs
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local selectHydratedLookTypeModule = require(avatarExperienceCatalog.State.Selectors.selectHydratedLookType)

return function(p0) --[[ line: 48 | named "useDeferLooksWithoutHydrationFilter" ]]
	-- upvalues: useStore (ref), reactModule (ref), fIntAXLookImpressionDeferTimeoutMs (ref), itemTypeEnum (ref), selectHydratedLookTypeModule (ref)
	local var3 = useStore()
	local var4 = if p0 then p0.content else nil
	local var5 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var5 (ref), fIntAXLookImpressionDeferTimeoutMs (copy)
		var5.current = false
		local delayedThread = task.delay(math.max(0, fIntAXLookImpressionDeferTimeoutMs) / 1000, function() --[[ line: 58 ]]
			-- upvalues: var5 (copy)
			var5.current = true
		end)
		
		return function() --[[ line: 62 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {})
	
	return reactModule.useCallback(function(p1) --[[ line: 67 ]]
		-- upvalues: var5 (ref), var4 (ref), itemTypeEnum (copy), selectHydratedLookTypeModule (copy), var3 (ref)
		if var5.current then
			return true
		end
		local var7 = if var4 then var4[p1] else nil
		
		if var7 == nil then
			return true
		elseif var7.type ~= itemTypeEnum.Look then
			return true
		end
		local id = var7.id
		
		return id == nil or selectHydratedLookTypeModule(var3:getState(), tostring(id)) ~= nil
	end, { var4, var3 })
end