local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local ItemTypeEnum = require(Parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local FIntAXLookImpressionDeferTimeoutMs = require(Parent.AvatarExperienceFlags).FIntAXLookImpressionDeferTimeoutMs
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local SelectHydratedLookTypeModule = require(AvatarExperienceCatalog.State.Selectors.selectHydratedLookType)

return function(p1)
	-- upvalues: UseStoreFunction (copy), ReactModule (copy), FIntAXLookImpressionDeferTimeoutMs (copy), ItemTypeEnum (copy), SelectHydratedLookTypeModule (copy)
	local UseStoreResult = UseStoreFunction()
	local Content = if p1 then p1.content else nil
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), FIntAXLookImpressionDeferTimeoutMs (upval)
		UseRefResult.current = false
		local DelayedThread = task.delay(math.max(0, FIntAXLookImpressionDeferTimeoutMs) / 1000, function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = true
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, {})
	
	return ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseRefResult (copy), Content (copy), ItemTypeEnum (upval), SelectHydratedLookTypeModule (upval), UseStoreResult (copy)
		if UseRefResult.current then
			return true
		end
		local ContentEntry = Content and Content[p2] or nil
		
		if ContentEntry == nil then
			return true
		elseif ContentEntry.type == ItemTypeEnum.Look then
			local Id = ContentEntry.id
			
			return Id == nil or SelectHydratedLookTypeModule(UseStoreResult:getState(), (tostring(Id))) ~= nil
		else
			return true
		end
	end, { Content, UseStoreResult })
end