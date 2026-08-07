local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local fFlagAppChatFixBackButtonOnRotationModule = require(appChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local canPopParentStackModule = require(appChat.Utils.canPopParentStack)

return function(p0) --[[ line: 14 | named "createBackFunc" ]]
	-- upvalues: fFlagAppChatFixBackButtonOnRotationModule (ref), canPopParentStackModule (ref), enumScreensModule (ref)
	local navigateToRootStack = p0.navigateToRootStack
	
	return if navigateToRootStack then function() --[[ line: 18 ]]
		-- upvalues: p0 (ref), fFlagAppChatFixBackButtonOnRotationModule (copy), canPopParentStackModule (copy), enumScreensModule (copy), navigateToRootStack (ref)
		if p0.closeInputBar then
			p0.closeInputBar()
		end
		if not p0.isRoot then
			p0.navigation.pop()
			
			return
		elseif fFlagAppChatFixBackButtonOnRotationModule and canPopParentStackModule(p0.navigation) then
			p0.navigation.pop()
			
			return
		end
		p0.navigation.navigate(enumScreensModule.EmptyConversation)
		navigateToRootStack()
	end else p0.navigation.pop
end