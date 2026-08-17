local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local popoverContextModule = require(script.Parent.Parent.PopoverContext)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local reactModule = require(parent.React)

return reactModule.forwardRef(function(p0, p1) --[[ line: 21 | named "PopoverAnchor" ]]
	-- upvalues: reactModule (ref), popoverContextModule (ref), studioUriModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var6 = reactModule.useContext(popoverContextModule)
	local var7 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p1, function() --[[ line: 26 ]]
		-- upvalues: var7 (ref)
		return var7.current
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 30 ]]
		-- upvalues: studioUriModule (copy), p0 (ref), var6 (ref), var7 (ref)
		if studioUriModule.isStudioUri(p0.anchorRef) then
			var6.setAnchorUri(p0.anchorRef)
			
			return
		elseif typeof(p0.anchorRef) == "table" and p0.anchorRef.current then
			var6.setAnchor(p0.anchorRef.current)
			
			return
		end
		var6.setAnchor(var7.current)
	end)
	
	if p0.anchorRef then
		return nil
	end
	p0.testId = `{var6.testId}--anchor`
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, { tag = "auto-xy", ref = var7 }), p0.children)
end)