local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local fFlagAppChatFixBackButtonOnRotationModule = require(appChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local canPopParentStackModule = require(appChat.Utils.canPopParentStack)

return function(p1)
	-- upvalues: fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref), enumScreensModule (ref)
	local navigateToRootStack = p1.navigateToRootStack
	
	return if navigateToRootStack then function()
		-- upvalues: p1 (ref), fFlagAppChatFixBackButtonOnRotationModule (copy), canPopParentStackModule (copy), enumScreensModule (copy), navigateToRootStack (ref)
		if p1.closeInputBar then
			p1.closeInputBar()
		end
		if not p1.isRoot then
			p1.navigation.pop()
			
			return
		elseif fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(p1.navigation) then
			p1.navigation.pop()
			
			return
		end
		p1.navigation.navigate(enumScreensModule.EmptyConversation)
		navigateToRootStack()
	end else p1.navigation.pop
end