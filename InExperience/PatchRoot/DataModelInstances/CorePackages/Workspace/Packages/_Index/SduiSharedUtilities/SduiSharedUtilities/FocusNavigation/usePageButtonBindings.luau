local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SduiFocusTagsModule = require(script.Parent.SduiFocusTags)

return function(p1, p2, p3) --[[ Line: 16 | Named "usePageButtonBindings" ]]
	-- upvalues: ReactModule (copy), CollectionService (copy), SduiFocusTagsModule (copy), ReactFocusNavigationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	ReactModule.useEffect(function() --[[ Line: 23 ]]
		-- upvalues: CollectionService (upval), SduiFocusTagsModule (upval), p1 (copy), UseStateResult2 (copy)
		local function updateSuppression() --[[ Line: 24 ]]
			-- upvalues: CollectionService (upval), SduiFocusTagsModule (upval), p1 (upval), UseStateResult2 (upval)
			local Flag = false
			
			for _, value in CollectionService:GetTagged(SduiFocusTagsModule.SuppressBindings) do
				if p1.current and value:IsDescendantOf(p1.current) then
					Flag = true
					break
				end
			end
			UseStateResult2(not Flag)
		end
		
		updateSuppression()
		local Connection = CollectionService:GetInstanceAddedSignal(SduiFocusTagsModule.SuppressBindings):Connect(updateSuppression)
		local Connection1 = CollectionService:GetInstanceRemovedSignal(SduiFocusTagsModule.SuppressBindings):Connect(updateSuppression)
		
		return function() --[[ Line: 42 ]]
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, { p1 })
	
	return (ReactFocusNavigationModule.useEventHandlerMap(if UseStateResult then p3 else {}, (ReactFocusNavigationModule.useEventMap(if UseStateResult then p2 else {}, (ReactModule.useRef(nil))))))
end