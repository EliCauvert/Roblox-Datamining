local Foundation = script:FindFirstAncestor("Foundation")
local PopoverContextModule = require(script.Parent.Parent.PopoverContext)
local StudioUriModule = require(Foundation.Utility.Plugin.StudioUri)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local ReactModule = require(Foundation.Parent.React)

return ReactModule.forwardRef(function(p1, p2) --[[ Line: 21 | Named "PopoverAnchor" ]]
	-- upvalues: ReactModule (copy), PopoverContextModule (copy), StudioUriModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local UseContextResult = ReactModule.useContext(PopoverContextModule)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p2, function() --[[ Line: 26 ]]
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	ReactModule.useLayoutEffect(function() --[[ Line: 30 ]]
		-- upvalues: StudioUriModule (upval), p1 (copy), UseContextResult (copy), UseRefResult (copy)
		if StudioUriModule.isStudioUri(p1.anchorRef) then
			UseContextResult.setAnchorUri(p1.anchorRef)
			
			return
		end
		if typeof(p1.anchorRef) == "table" and p1.anchorRef.current then
			UseContextResult.setAnchor(p1.anchorRef.current)
			
			return
		else
			UseContextResult.setAnchor(UseRefResult.current)
		end
	end)
	
	if p1.anchorRef then
		return nil
	else
		p1.testId = `{UseContextResult.testId}--anchor`
		
		return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, { tag = "auto-xy", ref = UseRefResult }), p1.children)
	end
end)