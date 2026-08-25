local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local popoverContextModule = require(script.Parent.Parent.PopoverContext)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local reactModule = require(parent.React)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), popoverContextModule (ref), studioUriModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var1 = reactModule.useContext(popoverContextModule)
	local var2 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var2 (ref)
		return var2.current
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: studioUriModule (copy), p1 (ref), var1 (ref), var2 (ref)
		if studioUriModule.isStudioUri(p1.anchorRef) then
			var1.setAnchorUri(p1.anchorRef)
			
			return
		elseif typeof(p1.anchorRef) == "table" and p1.anchorRef.current then
			var1.setAnchor(p1.anchorRef.current)
			
			return
		end
		var1.setAnchor(var2.current)
	end)
	
	if p1.anchorRef then
		return nil
	end
	p1.testId = `{var1.testId}--anchor`
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, { tag = "auto-xy", ref = var2 }), p1.children)
end)