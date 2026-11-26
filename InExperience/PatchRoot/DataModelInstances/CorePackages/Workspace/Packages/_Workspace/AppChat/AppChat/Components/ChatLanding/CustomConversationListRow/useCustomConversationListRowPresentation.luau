local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local UseThemeBackgroundFunction = require(Parent.ThemeBackground).useThemeBackground
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)

return function(p1)
	-- upvalues: UseChatPagePaddingModule (copy), ChatPlacementContextModule (copy), UseThemeBackgroundFunction (copy), ReactModule (copy)
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseChatPlacementContextResult = ChatPlacementContextModule.useChatPlacementContext()
	local HasUseThemeBackgroundResult = UseThemeBackgroundFunction() ~= nil
	local OnActivatedFunction = p1.onActivated
	
	return {
		entryHeight = p1.entryHeight or 64,
		pagePaddingLeft = UseChatPagePaddingModuleResult.left,
		pagePaddingRight = UseChatPagePaddingModuleResult.right,
		showBackground = not ChatPlacementContextModule.isPlacementInExperience(UseChatPlacementContextResult.chatPlacement) and not HasUseThemeBackgroundResult,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: OnActivatedFunction (copy)
			if OnActivatedFunction ~= nil then
				OnActivatedFunction()
			end
		end, { OnActivatedFunction })
	}
end