local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local sduiFocusTagsModule = require(script.Parent.SduiFocusTags)

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), collectionService (ref), sduiFocusTagsModule (ref), reactFocusNavigationModule (ref)
	local var4, var5 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: collectionService (copy), sduiFocusTagsModule (copy), p0 (ref), var5 (ref)
		local function updateSuppression()
			-- upvalues: collectionService (copy), sduiFocusTagsModule (copy), p0 (copy), var5 (copy)
			local var9 = false
			
			for i, v in collectionService:GetTagged(sduiFocusTagsModule.SuppressBindings) do
				if p0.current and v:IsDescendantOf(p0.current) then
					var9 = true
					break
				end
			end
			var5(not var9)
		end
		
		updateSuppression()
		local var7 = collectionService:GetInstanceAddedSignal(sduiFocusTagsModule.SuppressBindings):Connect(updateSuppression)
		local var8 = collectionService:GetInstanceRemovedSignal(sduiFocusTagsModule.SuppressBindings):Connect(updateSuppression)
		
		return function()
			-- upvalues: var7 (ref), var8 (ref)
			var7:Disconnect()
			var8:Disconnect()
		end
	end, { p0 })
	
	return reactFocusNavigationModule.useEventHandlerMap(if var4 then p2 else {}, reactFocusNavigationModule.useEventMap(if var4 then p1 else {}, reactModule.useRef(nil)))
end