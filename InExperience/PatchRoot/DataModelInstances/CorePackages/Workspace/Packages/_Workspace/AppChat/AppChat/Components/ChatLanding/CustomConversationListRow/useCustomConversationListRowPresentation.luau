local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local UseThemeBackgroundFunction = require(Parent.ThemeBackground).useThemeBackground
local FFlagAppThemeHalloween2026ChatBackgroundModule = require(AppChat.Flags.FFlagAppThemeHalloween2026ChatBackground)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)

return function(p1)
	-- upvalues: UseChatPagePaddingModule (copy), ChatPlacementContextModule (copy), FFlagAppThemeHalloween2026ChatBackgroundModule (copy), UseThemeBackgroundFunction (copy), ReactModule (copy)
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local HasUseThemeBackgroundResult: boolean = if FFlagAppThemeHalloween2026ChatBackgroundModule then UseThemeBackgroundFunction() ~= nil else false
	local OnActivatedFunction = p1.onActivated
	
	return {
		entryHeight = p1.entryHeight or 64,
		pagePaddingLeft = UseChatPagePaddingModuleResult.left,
		pagePaddingRight = UseChatPagePaddingModuleResult.right,
		showBackground = not ChatPlacementContextModule.isPlacementInExperience(ChatPlacementContextModule.useChatPlacementContext().chatPlacement) and not HasUseThemeBackgroundResult,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: OnActivatedFunction (copy)
			if OnActivatedFunction ~= nil then
				OnActivatedFunction()
			end
		end, { OnActivatedFunction })
	}
end