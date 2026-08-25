local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local parentModule = require(script.Parent)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local friendsWithPresenceModule = require(script.Parent.friendsWithPresence)

return function(p0)
	-- upvalues: roact (ref), parentModule (ref), llama (ref), friendsWithPresenceModule (ref)
	return roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		frame = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 150, 0, 0)
		}, {
			layout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 6)
			}),
			OnlineFriend = roact.createElement(parentModule, llama.Dictionary.join(p0, { user = friendsWithPresenceModule.OnlineFriend })),
			DeletedFriend = roact.createElement(parentModule, llama.Dictionary.join(p0, { user = friendsWithPresenceModule.DeletedFriend })),
			OfflineFriend = roact.createElement(parentModule, llama.Dictionary.join(p0, { user = friendsWithPresenceModule.OfflineFriend })),
			InGameFriend = roact.createElement(parentModule, llama.Dictionary.join(p0, { user = friendsWithPresenceModule.InGameFriend })),
			InGameWithoutLastLocationFriend = roact.createElement(parentModule, llama.Dictionary.join(p0, {
				user = friendsWithPresenceModule.InGameWithoutLastLocationFriend
			})),
			InStudioFriend = roact.createElement(parentModule, llama.Dictionary.join(p0, { user = friendsWithPresenceModule.InStudioFriend })),
			InStudioWithoutLastLocationFriend = roact.createElement(parentModule, llama.Dictionary.join(p0, {
				user = friendsWithPresenceModule.InStudioWithoutLastLocationFriend
			}))
		})
	})
end