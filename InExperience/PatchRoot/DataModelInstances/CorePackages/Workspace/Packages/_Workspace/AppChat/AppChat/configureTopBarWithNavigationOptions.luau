local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateChatTopBarModule = require(AppChat.createChatTopBar)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)

local function TopBarFromStore(p1)
	-- upvalues: RoactNavigationModule (copy), GetTopBarStoreModule (copy), SignalsReactModule (copy), ArgCheckModule (copy), CryoModule (copy), CreateChatTopBarModule (copy)
	local Navigation = p1.navigation
	local ActiveChildNavigationOptions = RoactNavigationModule.getActiveChildNavigationOptions(Navigation)
	local State = Navigation.state
	local Route = State.routes[State.index]
	local UseSignalStateResult = SignalsReactModule.useSignalState((GetTopBarStoreModule(false).getScreenTopBar(Route.routeName)))
	ArgCheckModule.isType(UseSignalStateResult, "table", "screenTopBar")
	local UnionResult = UseSignalStateResult
	local ConversationId = Route.params and Route.params.conversationId
	local ConversationId1 = UseSignalStateResult.conversationId
	
	if ConversationId and ConversationId1 and ConversationId ~= ConversationId1 then
		UnionResult = CryoModule.Dictionary.union(UseSignalStateResult, { headerText = { raw = "", shouldLocalize = false } })
	end
	return CreateChatTopBarModule(CryoModule.Dictionary.join(UnionResult, ActiveChildNavigationOptions, { navigation = Navigation }))
end

return function(Navigation)
	-- upvalues: RoactModule (copy), TopBarFromStore (copy)
	return RoactModule.createElement(TopBarFromStore, { navigation = Navigation })
end