local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 15 | named "usePanel" ]]
	-- upvalues: reactModule (ref), reactUtilsModule (ref), flagsModule (ref)
	local var9
	local var4 = reactModule.useRef(nil)
	local var5 = reactUtilsModule.useRefToState({
		anchorUri = p0.anchorUri,
		position = p0.position,
		depth = p0.depth,
		parentPopoverId = p0.parentPopoverId,
		isFocusable = if flagsModule.FoundationPopoverPluginFocusable then p0.isFocusable else nil
	})
	local var6 = reactModule.useRef(p0.onClose)
	var6.current = p0.onClose
	local var7 = reactModule.useRef(p0.registerPanelAsync)
	var7.current = p0.registerPanelAsync
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local var10, var11 = reactModule.useState(false)
		local var12 = reactModule.useCallback(function() --[[ line: 54 ]]
			-- upvalues: var11 (ref), var6 (ref)
			var11(true)
			var6.current()
		end, {})
		local var13 = reactUtilsModule.useAsync(function() --[[ line: 59 ]]
			-- upvalues: p0 (ref), var10 (ref), var7 (ref), var5 (ref), var12 (ref), flagsModule (copy), var4 (ref)
			if p0.isOpen and not var10 then
				local var14, var15 = var7.current(var5.current.anchorUri, var5.current.position, var12, var5.current.depth, var5.current.parentPopoverId, if flagsModule.FoundationPopoverPluginFocusable then var5.current.isFocusable else nil)
				var4.current = var15
				
				return var14
			elseif var4.current then
				var4.current()
				var4.current = nil
			end
			return nil
		end, { p0.isOpen, var5, var10 })
		var9 = if var10 or var13.status ~= "ok" then nil else var13.value
		reactModule.useEffect(function() --[[ line: 85 ]]
			-- upvalues: p0 (ref), var11 (ref)
			if not p0.isOpen then
				var11(false)
			end
		end, { p0.isOpen })
	else
		local var8 = reactUtilsModule.useAsync(function() --[[ line: 91 ]]
			-- upvalues: p0 (ref), var7 (ref), var5 (ref), var6 (ref), flagsModule (copy), var4 (ref)
			if p0.isOpen then
				local var16, var17 = var7.current(var5.current.anchorUri, var5.current.position, var6.current, var5.current.depth, var5.current.parentPopoverId, if flagsModule.FoundationPopoverPluginFocusable then var5.current.isFocusable else nil)
				var4.current = var17
				
				return var16
			elseif var4.current then
				var4.current()
				var4.current = nil
			end
			return nil
		end, { p0.isOpen, var5 })
		var9 = if var8.status == "ok" then var8.value else nil
	end
	reactUtilsModule.useAsync(function() --[[ line: 116 ]]
		-- upvalues: var9 (write), p0 (ref)
		if var9 then
			var9.updateAsync({
				targetWidgetUri = p0.anchorUri,
				targetAnchorPoint = p0.position.targetAnchorPoint,
				subjectAnchorPoint = p0.position.subjectAnchorPoint,
				offset = p0.position.offset
			})
			
			return nil
		end
		return nil
	end, { var9, p0.anchorUri, p0.position })
	reactModule.useEffect(function() --[[ line: 129 ]]
		-- upvalues: var4 (ref)
		return function() --[[ line: 130 ]]
			-- upvalues: var4 (copy)
			if var4.current then
				var4.current()
			end
		end
	end, {})
	
	return var9
end