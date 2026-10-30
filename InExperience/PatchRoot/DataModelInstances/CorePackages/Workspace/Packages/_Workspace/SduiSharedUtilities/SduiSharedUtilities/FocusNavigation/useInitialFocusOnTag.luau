local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local FFlagLuaAppMediaGalleryGamepadSupport = require(Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport

return function(Tag, p1)
	-- upvalues: FFlagLuaAppMediaGalleryGamepadSupport (copy), ResponsiveModule (copy), ReactFocusNavigationModule (copy), ReactModule (copy), CollectionService (copy)
	local IsUseLastInputResultMatch: boolean = if FFlagLuaAppMediaGalleryGamepadSupport then ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional else ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: IsUseLastInputResultMatch (copy), p1 (copy), CollectionService (upval), Tag (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if not IsUseLastInputResultMatch then return end
		local Current = p1.current
		
		if not Current then return end
		for _, value in CollectionService:GetTagged(Tag) do
			if not UseRefResult.current and value:IsDescendantOf(Current) then
				UseRefResult.current = true
				UseFocusGuiObjectResult(value)
				
				return
			end
		end
		local Connection = CollectionService:GetInstanceAddedSignal(Tag):Connect(function(Tagged)
			-- upvalues: UseRefResult (upval), Current (copy), UseFocusGuiObjectResult (upval)
			if not UseRefResult.current and Current and Tagged:IsDescendantOf(Current) then
				UseRefResult.current = true
				UseFocusGuiObjectResult(Tagged)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { IsUseLastInputResultMatch, Tag, UseFocusGuiObjectResult })
end