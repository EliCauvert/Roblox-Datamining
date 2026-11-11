local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local BuilderIconsModule = require(Parent.BuilderIcons)
local GetSelectedUsersStoreModule = require(AppChat.Stores.GetSelectedUsersStore)

return ReactModule.memo(function()
	-- upvalues: GetSelectedUsersStoreModule (copy), SignalsReactModule (copy), FoundationModule (copy), ReactModule (copy), BuilderIconsModule (copy)
	local SelectedUsersStoreModule = GetSelectedUsersStoreModule(false)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col auto-xy padding-y-small gap-small align-x-center"
	}, {
		ReactModule.createElement(FoundationModule.Icon, {
			LayoutOrder = 1,
			style = FoundationModule.Hooks.useTokens().Color.Content.Emphasis,
			name = BuilderIconsModule.Migration.uiblox["icons/actions/friend_sort/add_friends"].name,
			variant = FoundationModule.Enums.IconVariant.Filled,
			size = FoundationModule.Enums.IconSize.Large
		}),
		Label = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-truncate-end text-caption-large content-emphasis",
			LayoutOrder = 2,
			Text = ReactModule.joinBindings({
				SignalsReactModule.useSignalBinding(SelectedUsersStoreModule.getSelectedUserIdsCount()),
				(SignalsReactModule.useSignalBinding(SelectedUsersStoreModule.getMaxSize()))
			}):map(function(Entry): string
				return `{Entry[1]}/{Entry[2]}`
			end)
		})
	})
end)