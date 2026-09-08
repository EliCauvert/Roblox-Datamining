local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local signalsReactModule = require(parent.SignalsReact)
local createChatTopBarModule = require(appChat.createChatTopBar)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)

local function TopBarFromStore(p1)
	-- upvalues: roactNavigationModule (ref), getTopBarStoreModule (ref), signalsReactModule (ref), argCheckModule (ref), cryoModule (ref), createChatTopBarModule (ref)
	local navigation = p1.navigation
	local activeChildNavigationOptions = roactNavigationModule.getActiveChildNavigationOptions(navigation)
	local state = navigation.state
	local index = state.routes[state.index]
	local var1 = signalsReactModule.useSignalState(getTopBarStoreModule(false).getScreenTopBar(index.routeName))
	argCheckModule.isType(var1, "table", "screenTopBar")
	local var2 = var1
	local conversationId = index.params and index.params.conversationId
	local conversationId_1 = var1.conversationId
	
	if conversationId and conversationId_1 and conversationId ~= conversationId_1 then
		var2 = cryoModule.Dictionary.union(var1, { headerText = { raw = "", shouldLocalize = false } })
	end
	return createChatTopBarModule(cryoModule.Dictionary.join(var2, activeChildNavigationOptions, { navigation = navigation }))
end

return function(p1)
	-- upvalues: roactModule (ref), TopBarFromStore (ref)
	return roactModule.createElement(TopBarFromStore, { navigation = p1 })
end