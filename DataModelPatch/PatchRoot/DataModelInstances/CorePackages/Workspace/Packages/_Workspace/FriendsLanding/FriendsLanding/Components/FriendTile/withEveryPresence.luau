local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local ParentModule = require(script.Parent)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local FriendsWithPresenceModule = require(script.Parent.friendsWithPresence)

return function(p1)
	-- upvalues: Roact (copy), ParentModule (copy), Llama (copy), FriendsWithPresenceModule (copy)
	return Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		frame = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 150, 0, 0)
		}, {
			layout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 6)
			}),
			OnlineFriend = Roact.createElement(ParentModule, Llama.Dictionary.join(p1, { user = FriendsWithPresenceModule.OnlineFriend })),
			DeletedFriend = Roact.createElement(ParentModule, Llama.Dictionary.join(p1, { user = FriendsWithPresenceModule.DeletedFriend })),
			OfflineFriend = Roact.createElement(ParentModule, Llama.Dictionary.join(p1, { user = FriendsWithPresenceModule.OfflineFriend })),
			InGameFriend = Roact.createElement(ParentModule, Llama.Dictionary.join(p1, { user = FriendsWithPresenceModule.InGameFriend })),
			InGameWithoutLastLocationFriend = Roact.createElement(ParentModule, Llama.Dictionary.join(p1, {
				user = FriendsWithPresenceModule.InGameWithoutLastLocationFriend
			})),
			InStudioFriend = Roact.createElement(ParentModule, Llama.Dictionary.join(p1, { user = FriendsWithPresenceModule.InStudioFriend })),
			InStudioWithoutLastLocationFriend = Roact.createElement(ParentModule, Llama.Dictionary.join(p1, {
				user = FriendsWithPresenceModule.InStudioWithoutLastLocationFriend
			}))
		})
	})
end