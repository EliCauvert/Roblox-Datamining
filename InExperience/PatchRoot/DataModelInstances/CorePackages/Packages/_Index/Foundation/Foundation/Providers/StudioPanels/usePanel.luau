local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 15 | named "usePanel" ]]
	-- upvalues: reactModule (ref), reactUtilsModule (ref), flagsModule (ref)
	local var12
	local var4 = reactModule.useRef(nil)
	local var5 = reactUtilsModule.useRefToState({
		anchorUri = p0.anchorUri,
		position = p0.position,
		depth = p0.depth,
		parentPopoverId = p0.parentPopoverId
	})
	local var6 = reactModule.useRef(p0.onClose)
	var6.current = p0.onClose
	local var7 = reactModule.useRef(p0.registerPanelAsync)
	var7.current = p0.registerPanelAsync
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local var8, var9 = reactModule.useState(false)
		local var10 = reactModule.useCallback(function() --[[ line: 51 ]]
			-- upvalues: var9 (ref), var6 (ref)
			var9(true)
			var6.current()
		end, {})
		local var11 = reactUtilsModule.useAsync(function() --[[ line: 56 ]]
			-- upvalues: p0 (ref), var8 (ref), var7 (ref), var5 (ref), var10 (ref), var4 (ref)
			if p0.isOpen and not var8 then
				local var14, var15 = var7.current(var5.current.anchorUri, var5.current.position, var10, var5.current.depth, var5.current.parentPopoverId)
				var4.current = var15
				
				return var14
			elseif var4.current then
				var4.current()
				var4.current = nil
			end
			return nil
		end, { p0.isOpen, var5, var8 })
		var12 = if var8 or var11.status ~= "ok" then nil else var11.value
		reactModule.useEffect(function() --[[ line: 81 ]]
			-- upvalues: p0 (ref), var9 (ref)
			if not p0.isOpen then
				var9(false)
			end
		end, { p0.isOpen })
	else
		local var13 = reactUtilsModule.useAsync(function() --[[ line: 87 ]]
			-- upvalues: p0 (ref), var7 (ref), var5 (ref), var6 (ref), var4 (ref)
			if p0.isOpen then
				local var16, var17 = var7.current(var5.current.anchorUri, var5.current.position, var6.current, var5.current.depth, var5.current.parentPopoverId)
				var4.current = var17
				
				return var16
			elseif var4.current then
				var4.current()
				var4.current = nil
			end
			return nil
		end, { p0.isOpen, var5 })
		var12 = if var13.status == "ok" then var13.value else nil
	end
	reactUtilsModule.useAsync(function() --[[ line: 111 ]]
		-- upvalues: var12 (write), p0 (ref)
		if var12 then
			var12.updateAsync({
				targetWidgetUri = p0.anchorUri,
				targetAnchorPoint = p0.position.targetAnchorPoint,
				subjectAnchorPoint = p0.position.subjectAnchorPoint,
				offset = p0.position.offset
			})
			
			return nil
		end
		return nil
	end, { var12, p0.anchorUri, p0.position })
	reactModule.useEffect(function() --[[ line: 124 ]]
		-- upvalues: var4 (ref)
		return function() --[[ line: 125 ]]
			-- upvalues: var4 (copy)
			if var4.current then
				var4.current()
			end
		end
	end, {})
	
	return var12
end