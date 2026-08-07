-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local flagsModule = require(foundation.Utility.Flags)
local popoverContextModule = require(script.Parent.Parent.PopoverContext)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local reactModule = require(parent.React)

return reactModule.forwardRef(function(p0, p1) --[[ line: 22 | named "PopoverAnchor" ]]
	-- upvalues: reactModule (ref), popoverContextModule (ref), flagsModule (ref), studioUriModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var7 = reactModule.useContext(popoverContextModule)
	local var8 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p1, function() --[[ line: 27 ]]
		-- upvalues: var8 (ref)
		return var8.current
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 31 ]]
		-- upvalues: flagsModule (copy), studioUriModule (copy), p0 (ref), var7 (ref), var8 (ref)
		if flagsModule.FoundationPopoverPluginUriAnchor and studioUriModule.isStudioUri(p0.anchorRef) then
			var7.setAnchorUri(p0.anchorRef)
			
			return
		elseif typeof(p0.anchorRef) == "table" and p0.anchorRef.current then
			var7.setAnchor(p0.anchorRef.current)
			
			return
		end
		var7.setAnchor(var8.current)
	end)
	
	if p0.anchorRef then
		return nil
	end
	p0.testId = `{var7.testId}--anchor`
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, { tag = "auto-xy", ref = var8 }), p0.children)
end)