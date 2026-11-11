local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateChatTopBarModule = require(AppChat.createChatTopBar)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local TopBarContextModule = require(AppChat.TopBarContext)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)

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

local function TopBarFromContext(p1)
	-- upvalues: RoactNavigationModule (copy), RoactModule (copy), TopBarContextModule (copy), ArgCheckModule (copy), CryoModule (copy), CreateChatTopBarModule (copy)
	local Navigation = p1.navigation
	local ActiveChildNavigationOptions = RoactNavigationModule.getActiveChildNavigationOptions(Navigation)
	
	return RoactModule.createElement(TopBarContextModule.Consumer, {
		render = function(p2)
			-- upvalues: Navigation (copy), ArgCheckModule (upval), CryoModule (upval), CreateChatTopBarModule (upval), ActiveChildNavigationOptions (copy)
			local State = Navigation.state
			local Route = State.routes[State.index]
			local ScreenTopBar = p2.getScreenTopBar(Route.routeName)
			ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
			local UnionResult = ScreenTopBar
			local ConversationId = Route.params and Route.params.conversationId
			local ConversationId1 = ScreenTopBar.conversationId
			
			if ConversationId and ConversationId1 and ConversationId ~= ConversationId1 then
				UnionResult = CryoModule.Dictionary.union(ScreenTopBar, { headerText = { raw = "", shouldLocalize = false } })
			end
			return CreateChatTopBarModule(CryoModule.Dictionary.join(UnionResult, ActiveChildNavigationOptions, { navigation = Navigation }))
		end
	})
end

return function(Navigation)
	-- upvalues: FFlagAppChatTopBarSignalsStoreModule (copy), TopBarFromStore (copy), TopBarFromContext (copy), RoactModule (copy)
	return RoactModule.createElement(if FFlagAppChatTopBarSignalsStoreModule then TopBarFromStore else TopBarFromContext, { navigation = Navigation })
end