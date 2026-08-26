local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local sduiFocusTagsModule = require(script.Parent.SduiFocusTags)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), collectionService (ref), sduiFocusTagsModule (ref), reactFocusNavigationModule (ref)
	local var1, var2 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: collectionService (copy), sduiFocusTagsModule (copy), p1 (ref), var2 (ref)
		local function updateSuppression()
			-- upvalues: collectionService (copy), sduiFocusTagsModule (copy), p1 (copy), var2 (copy)
			local var3 = false
			
			for i, v in collectionService:GetTagged(sduiFocusTagsModule.SuppressBindings) do
				if p1.current and v:IsDescendantOf(p1.current) then
					var3 = true
					break
				end
			end
			var2(not var3)
		end
		
		updateSuppression()
		local var4 = collectionService:GetInstanceAddedSignal(sduiFocusTagsModule.SuppressBindings):Connect(updateSuppression)
		local var5 = collectionService:GetInstanceRemovedSignal(sduiFocusTagsModule.SuppressBindings):Connect(updateSuppression)
		
		return function()
			-- upvalues: var4 (ref), var5 (ref)
			var4:Disconnect()
			var5:Disconnect()
		end
	end, { p1 })
	
	return reactFocusNavigationModule.useEventHandlerMap(if var1 then p3 else {}, reactFocusNavigationModule.useEventMap(if var1 then p2 else {}, reactModule.useRef(nil)))
end