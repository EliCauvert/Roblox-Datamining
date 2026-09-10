local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local fFlagLuaAppMediaGalleryGamepadSupport = require(parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport

return function(p1, p2)
	-- upvalues: fFlagLuaAppMediaGalleryGamepadSupport (ref), responsiveModule (ref), reactFocusNavigationModule (ref), reactModule (ref), collectionService (ref)
	local var1
	if fFlagLuaAppMediaGalleryGamepadSupport then
		var1 = responsiveModule.useLastInput() == responsiveModule.Input.Directional
		var1 = nil
	else
		var1 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	end
	local var2 = reactFocusNavigationModule.useFocusGuiObject()
	local var3 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p2 (ref), collectionService (copy), p1 (ref), var3 (ref), var2 (ref)
		if not var1 then return end
		local current = p2.current
		
		if not current then return end
		for i, v in collectionService:GetTagged(p1) do
			if not var3.current and v:IsDescendantOf(current) then
				var3.current = true
				var2(v)
				
				return
			end
		end
		local var4 = collectionService:GetInstanceAddedSignal(p1):Connect(function(p3)
			-- upvalues: var3 (copy), current (ref), var2 (copy)
			if not var3.current and current and p3:IsDescendantOf(current) then
				var3.current = true
				var2(p3)
			end
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, { var1, p1, var2 })
end