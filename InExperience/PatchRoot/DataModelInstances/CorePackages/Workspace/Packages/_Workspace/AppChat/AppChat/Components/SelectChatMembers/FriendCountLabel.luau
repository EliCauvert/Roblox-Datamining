local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local builderIconsModule = require(parent.BuilderIcons)
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)

return reactModule.memo(function() --[[ line: 13 | named "FriendCountLabel" ]]
	-- upvalues: getSelectedUsersStoreModule (ref), signalsReactModule (ref), foundationModule (ref), reactModule (ref), builderIconsModule (ref)
	local var6 = getSelectedUsersStoreModule(false)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col auto-xy padding-y-small gap-small align-x-center"
	}, {
		reactModule.createElement(foundationModule.Icon, {
			LayoutOrder = 1,
			style = foundationModule.Hooks.useTokens().Color.Content.Emphasis,
			name = builderIconsModule.Migration.uiblox["icons/actions/friend_sort/add_friends"].name,
			variant = foundationModule.Enums.IconVariant.Filled,
			size = foundationModule.Enums.IconSize.Large
		}),
		Label = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-truncate-end text-caption-large content-emphasis",
			LayoutOrder = 2,
			Text = reactModule.joinBindings({
				signalsReactModule.useSignalBinding(var6.getSelectedUserIdsCount()),
				signalsReactModule.useSignalBinding(var6.getMaxSize())
			}):map(function(p0) --[[ line: 32 ]]
				return `{p0[1]}/{p0[2]}`
			end)
		})
	})
end)