local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local signalsReactModule = require(parent.SignalsReact)
local createChatTopBarModule = require(appChat.createChatTopBar)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local topBarContextModule = require(appChat.TopBarContext)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)

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

local function TopBarFromContext(p1)
	-- upvalues: roactNavigationModule (ref), roactModule (ref), topBarContextModule (ref), argCheckModule (ref), cryoModule (ref), createChatTopBarModule (ref)
	local navigation = p1.navigation
	local activeChildNavigationOptions = roactNavigationModule.getActiveChildNavigationOptions(navigation)
	
	return roactModule.createElement(topBarContextModule.Consumer, {
		render = function(p2)
			-- upvalues: navigation (ref), argCheckModule (copy), cryoModule (copy), createChatTopBarModule (copy), activeChildNavigationOptions (ref)
			local state = navigation.state
			local index = state.routes[state.index]
			local screenTopBar = p2.getScreenTopBar(index.routeName)
			argCheckModule.isType(screenTopBar, "table", "screenTopBar")
			local var1 = screenTopBar
			local conversationId = index.params and index.params.conversationId
			local conversationId_1 = screenTopBar.conversationId
			
			if conversationId and conversationId_1 and conversationId ~= conversationId_1 then
				var1 = cryoModule.Dictionary.union(screenTopBar, { headerText = { raw = "", shouldLocalize = false } })
			end
			return createChatTopBarModule(cryoModule.Dictionary.join(var1, activeChildNavigationOptions, { navigation = navigation }))
		end
	})
end

return function(p1)
	-- upvalues: fFlagAppChatTopBarSignalsStoreModule (ref), TopBarFromStore (ref), TopBarFromContext (ref), roactModule (ref)
	return roactModule.createElement(if fFlagAppChatTopBarSignalsStoreModule then TopBarFromStore else TopBarFromContext, { navigation = p1 })
end