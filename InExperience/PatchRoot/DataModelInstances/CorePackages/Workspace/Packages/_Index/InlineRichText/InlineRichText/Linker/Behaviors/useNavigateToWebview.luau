local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(InlineRichText.Types)
local FFlagInlineRichTextUseWebViewService = require(Parent.SharedFlags).FFlagInlineRichTextUseWebViewService
local OpenWebViewModule = require(InlineRichText.Utils.openWebView)

return function(_) --[[ Line: 20 ]]
	-- upvalues: FFlagInlineRichTextUseWebViewService (copy), ReactModule (copy), OpenWebViewModule (copy), UseDispatchFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	if FFlagInlineRichTextUseWebViewService then
		return ReactModule.useCallback(function(p1) --[[ Line: 22 ]]
			-- upvalues: OpenWebViewModule (upval)
			OpenWebViewModule(p1)
		end, {})
	else
		local UseDispatchResult = UseDispatchFunction()
		
		return ReactModule.useCallback(function(Detail) --[[ Line: 27 ]]
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
			local config = { name = AppPage.GenericWebPage, detail = Detail }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownFunction(config))
			end
		end, { UseDispatchResult })
	end
end