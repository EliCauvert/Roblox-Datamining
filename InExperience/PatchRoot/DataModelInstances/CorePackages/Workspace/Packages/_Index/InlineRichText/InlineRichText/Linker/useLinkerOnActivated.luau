local inlineRichText = script:FindFirstAncestor("InlineRichText")
local reactModule = require(inlineRichText.Parent.React)
local useNavigateToWebviewModule = require(inlineRichText.Linker.Behaviors.useNavigateToWebview)
local useInvokeLinkingProtocolModule = require(inlineRichText.Linker.Behaviors.useInvokeLinkingProtocol)
local useShowErrorToastModule = require(inlineRichText.Linker.Behaviors.useShowErrorToast)
local linkBehaviorModule = require(inlineRichText.Enums.LinkBehavior)
local name = require(inlineRichText.Logger):new(script.Name)
local _ = require(inlineRichText.Types)

return function(p0) --[[ line: 18 | named "useLinkerOnActivated" ]]
	-- upvalues: useNavigateToWebviewModule (ref), useInvokeLinkingProtocolModule (ref), useShowErrorToastModule (ref), linkBehaviorModule (ref), reactModule (ref), name (ref)
	local t = {
		[linkBehaviorModule.Webview] = useNavigateToWebviewModule(),
		[linkBehaviorModule.LinkingProtocol] = useInvokeLinkingProtocolModule(),
		[linkBehaviorModule.ErrorToast] = useShowErrorToastModule({ errorToastTextOverride = p0.errorToastTextOverride })
	}
	
	return reactModule.useCallback(function(p1) --[[ line: 31 ]]
		-- upvalues: t (ref), name (copy)
		local linkBehavior = t[p1.linkBehavior]
		
		if linkBehavior then
			linkBehavior(p1.url)
			
			return
		end
		name:error(`Link activation failed with invalid link behavior: {p1.linkBehavior}. This behavior is either invalid or doesn't support activation.`)
	end, { t })
end