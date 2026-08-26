local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: reactModule (ref), reactUtilsModule (ref), flagsModule (ref)
	local var1
	local var2 = reactModule.useRef(nil)
	local var3 = reactUtilsModule.useRefToState({
		anchorUri = p1.anchorUri,
		position = p1.position,
		depth = p1.depth,
		parentPopoverId = p1.parentPopoverId
	})
	local var4 = reactModule.useRef(p1.onClose)
	var4.current = p1.onClose
	local var5 = reactModule.useRef(p1.registerPanelAsync)
	var5.current = p1.registerPanelAsync
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local var6, var7 = reactModule.useState(false)
		local var8 = reactModule.useCallback(function()
			-- upvalues: var7 (ref), var4 (ref)
			var7(true)
			var4.current()
		end, {})
		local var9 = reactUtilsModule.useAsync(function()
			-- upvalues: p1 (ref), var6 (ref), var5 (ref), var3 (ref), var8 (ref), var2 (ref)
			if p1.isOpen and not var6 then
				local var10, var11 = var5.current(var3.current.anchorUri, var3.current.position, var8, var3.current.depth, var3.current.parentPopoverId)
				var11.current = var11
				
				return var10
			elseif var11.current then
				var11.current()
				var11.current = nil
			end
			return nil
		end, { p1.isOpen, var3, var6 })
		var1 = if var6 or var9.status ~= "ok" then nil else var9.value
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var7 (ref)
			if not p1.isOpen then
				var7(false)
			end
		end, { p1.isOpen })
	else
		local var10 = reactUtilsModule.useAsync(function()
			-- upvalues: p1 (ref), var5 (ref), var3 (ref), var4 (ref), var2 (ref)
			if p1.isOpen then
				local var11, var12 = var5.current(var3.current.anchorUri, var3.current.position, var4.current, var3.current.depth, var3.current.parentPopoverId)
				var12.current = var12
				
				return var11
			elseif var12.current then
				var12.current()
				var12.current = nil
			end
			return nil
		end, { p1.isOpen, var3 })
		var1 = if var10.status == "ok" then var10.value else nil
	end
	reactUtilsModule.useAsync(function()
		-- upvalues: var1 (write), p1 (ref)
		if var1 then
			var1.updateAsync({
				targetWidgetUri = p1.anchorUri,
				targetAnchorPoint = p1.position.targetAnchorPoint,
				subjectAnchorPoint = p1.position.subjectAnchorPoint,
				offset = p1.position.offset
			})
			
			return nil
		end
		return nil
	end, { var1, p1.anchorUri, p1.position })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			if var2.current then
				var2.current()
			end
		end
	end, {})
	
	return var1
end