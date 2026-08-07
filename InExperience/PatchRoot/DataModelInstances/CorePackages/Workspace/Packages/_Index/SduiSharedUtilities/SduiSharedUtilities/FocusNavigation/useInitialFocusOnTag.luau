local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)

return function(p0, p1) --[[ line: 12 | named "useInitialFocusOnTag" ]]
	-- upvalues: responsiveModule (ref), reactFocusNavigationModule (ref), reactModule (ref), collectionService (ref)
	local var4 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var5 = reactFocusNavigationModule.useFocusGuiObject()
	local var6 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 17 ]]
		-- upvalues: var4 (ref), p1 (ref), collectionService (copy), p0 (ref), var6 (ref), var5 (ref)
		if not var4 then return end
		local current = p1.current
		
		if not current then return end
		for i, v in collectionService:GetTagged(p0) do
			if not var6.current and v:IsDescendantOf(current) then
				var6.current = true
				var5(v)
				
				return
			end
		end
		local var7 = collectionService:GetInstanceAddedSignal(p0):Connect(function(p2) --[[ line: 35 ]]
			-- upvalues: var6 (copy), current (ref), var5 (copy)
			if not var6.current and current and p2:IsDescendantOf(current) then
				var6.current = true
				var5(p2)
			end
		end)
		
		return function() --[[ line: 42 ]]
			-- upvalues: var7 (ref)
			var7:Disconnect()
		end
	end, { var4, p0, var5 })
end