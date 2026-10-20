local Parent = script:FindFirstAncestor("AccountRecovery").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Dropdown = FoundationModule.Dropdown

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Dropdown (copy)
	local UseStateResult2
	p1.dropdownProps.width, UseStateResult2 = ReactModule.useState(p1.initialWidth or UDim.new(0, 300))
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(UDim.new(0, Frame.AbsoluteSize.X))
		end
	}, {
		Dropdown = ReactModule.createElement(Dropdown.Root, p1.dropdownProps)
	})
end