local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(inlineRichText.Types)
local fFlagInlineRichTextUseWebViewService = require(parent.SharedFlags).FFlagInlineRichTextUseWebViewService
local openWebViewModule = require(inlineRichText.Utils.openWebView)

return function(_)
	-- upvalues: fFlagInlineRichTextUseWebViewService (ref), reactModule (ref), openWebViewModule (ref), useDispatch (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	if fFlagInlineRichTextUseWebViewService then
		return reactModule.useCallback(function(p1)
			-- upvalues: openWebViewModule (copy)
			openWebViewModule(p1)
		end, {})
	end
	local var2 = useDispatch()
	
	return reactModule.useCallback(function(p1)
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		local t = { name = appPage.GenericWebPage, detail = p1 }
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, { var2 })
end