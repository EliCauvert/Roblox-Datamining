local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)

return function(Tag, p1)
	-- upvalues: ResponsiveModule (copy), ReactFocusNavigationModule (copy), ReactModule (copy), CollectionService (copy)
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: IsUsePreferredInputResultMatch (copy), p1 (copy), CollectionService (upval), Tag (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if not IsUsePreferredInputResultMatch then return end
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
	end, {
		IsUsePreferredInputResultMatch,
		Tag,
		UseFocusGuiObjectResult
	})
end