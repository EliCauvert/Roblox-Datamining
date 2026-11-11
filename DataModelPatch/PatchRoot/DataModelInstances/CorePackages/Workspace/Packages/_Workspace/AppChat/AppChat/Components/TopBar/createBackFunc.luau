local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local FFlagAppChatFixBackButtonOnRotationModule = require(AppChat.Flags.FFlagAppChatFixBackButtonOnRotation)
local CanPopParentStackModule = require(AppChat.Utils.canPopParentStack)

return function(p1)
	-- upvalues: FFlagAppChatFixBackButtonOnRotationModule (copy), CanPopParentStackModule (copy), EnumScreensModule (copy)
	local NavigateToRootStackFunction = p1.navigateToRootStack
	
	return if NavigateToRootStackFunction then function()
		-- upvalues: p1 (copy), FFlagAppChatFixBackButtonOnRotationModule (upval), CanPopParentStackModule (upval), EnumScreensModule (upval), NavigateToRootStackFunction (copy)
		if p1.closeInputBar then
			p1.closeInputBar()
		end
		if not p1.isRoot then
			p1.navigation.pop()
			
			return
		end
		if FFlagAppChatFixBackButtonOnRotationModule and CanPopParentStackModule(p1.navigation) then
			p1.navigation.pop()
			
			return
		else
			p1.navigation.navigate(EnumScreensModule.EmptyConversation)
			NavigateToRootStackFunction()
		end
	end else p1.navigation.pop
end