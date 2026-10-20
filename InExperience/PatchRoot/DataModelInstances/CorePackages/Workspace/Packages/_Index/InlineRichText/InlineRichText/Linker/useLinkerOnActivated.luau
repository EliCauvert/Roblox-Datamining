local InlineRichText = script:FindFirstAncestor("InlineRichText")
local ReactModule = require(InlineRichText.Parent.React)
local UseNavigateToWebviewModule = require(InlineRichText.Linker.Behaviors.useNavigateToWebview)
local UseInvokeLinkingProtocolModule = require(InlineRichText.Linker.Behaviors.useInvokeLinkingProtocol)
local UseShowErrorToastModule = require(InlineRichText.Linker.Behaviors.useShowErrorToast)
local LinkBehaviorModule = require(InlineRichText.Enums.LinkBehavior)
local NewResult = require(InlineRichText.Logger):new(script.Name)
local _ = require(InlineRichText.Types)

return function(p1)
	-- upvalues: UseNavigateToWebviewModule (copy), UseInvokeLinkingProtocolModule (copy), UseShowErrorToastModule (copy), LinkBehaviorModule (copy), ReactModule (copy), NewResult (copy)
	local config = {
		[LinkBehaviorModule.Webview] = UseNavigateToWebviewModule(),
		[LinkBehaviorModule.LinkingProtocol] = UseInvokeLinkingProtocolModule(),
		[LinkBehaviorModule.ErrorToast] = UseShowErrorToastModule({ errorToastTextOverride = p1.errorToastTextOverride })
	}
	
	return (ReactModule.useCallback(function(p2)
		-- upvalues: config (copy), NewResult (upval)
		local Entry: (any) -> () = config[p2.linkBehavior]
		
		if Entry then
			Entry(p2.url)
			
			return
		else
			NewResult:error(`Link activation failed with invalid link behavior: {p2.linkBehavior}. This behavior is either invalid or doesn't support activation.`)
		end
	end, { config }))
end