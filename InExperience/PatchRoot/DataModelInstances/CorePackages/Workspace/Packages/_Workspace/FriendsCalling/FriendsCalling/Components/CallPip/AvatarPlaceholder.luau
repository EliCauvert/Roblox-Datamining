local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1) --[[ Line: 16 | Named "AvatarPlaceholder" ]]
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "align-x-center align-y-center radius-circle bg-surface-300",
		Size = UDim2.fromOffset(p1.size, p1.size),
		testId = p1.testId
	}, {
		Label = ReactModule.createElement(Text, {
			Text = "Avatar Here",
			tag = "auto-xy text-body-small content-default"
		})
	})
end