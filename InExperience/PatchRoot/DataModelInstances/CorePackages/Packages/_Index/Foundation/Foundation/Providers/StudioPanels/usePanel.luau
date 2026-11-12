local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: ReactModule (copy), ReactUtilsModule (copy), FlagsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefToStateResult = ReactUtilsModule.useRefToState({
		anchorUri = p1.anchorUri,
		position = p1.position,
		depth = p1.depth,
		parentPopoverId = p1.parentPopoverId,
		isFocusable = if FlagsModule.FoundationPopoverPluginFocusable then p1.isFocusable else nil
	})
	local UseRefResult1 = ReactModule.useRef(p1.onClose)
	UseRefResult1.current = p1.onClose
	local UseRefResult2 = ReactModule.useRef(p1.registerPanelAsync)
	UseRefResult2.current = p1.registerPanelAsync
	local Value = nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), UseRefResult1 (copy)
			UseStateResult2(true)
			UseRefResult1.current()
		end, {})
		local UseAsyncResult = ReactUtilsModule.useAsync(function()
			-- upvalues: p1 (copy), UseStateResult (copy), UseRefResult2 (copy), UseRefToStateResult (copy), UseResult (copy), FlagsModule (upval), UseRefResult (copy)
			if p1.isOpen and not UseStateResult then
				local CurrentResult, CurrentResult2 = UseRefResult2.current(UseRefToStateResult.current.anchorUri, UseRefToStateResult.current.position, UseResult, UseRefToStateResult.current.depth, UseRefToStateResult.current.parentPopoverId, if FlagsModule.FoundationPopoverPluginFocusable then UseRefToStateResult.current.isFocusable else nil)
				UseRefResult.current = CurrentResult2
				
				return CurrentResult
			end
			if UseRefResult.current then
				UseRefResult.current()
				UseRefResult.current = nil
			end
			return nil
		end, { p1.isOpen, UseRefToStateResult, UseStateResult })
		Value = if UseStateResult or UseAsyncResult.status ~= "ok" then nil else UseAsyncResult.value
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseStateResult2 (copy)
			if not p1.isOpen then
				UseStateResult2(false)
			end
		end, { p1.isOpen })
	else
		local UseAsyncResult = ReactUtilsModule.useAsync(function()
			-- upvalues: p1 (copy), UseRefResult2 (copy), UseRefToStateResult (copy), UseRefResult1 (copy), FlagsModule (upval), UseRefResult (copy)
			if p1.isOpen then
				local CurrentResult, CurrentResult2 = UseRefResult2.current(UseRefToStateResult.current.anchorUri, UseRefToStateResult.current.position, UseRefResult1.current, UseRefToStateResult.current.depth, UseRefToStateResult.current.parentPopoverId, if FlagsModule.FoundationPopoverPluginFocusable then UseRefToStateResult.current.isFocusable else nil)
				UseRefResult.current = CurrentResult2
				
				return CurrentResult
			end
			if UseRefResult.current then
				UseRefResult.current()
				UseRefResult.current = nil
			end
			return nil
		end, { p1.isOpen, UseRefToStateResult })
		Value = if UseAsyncResult.status == "ok" then UseAsyncResult.value else nil
	end
	ReactUtilsModule.useAsync(function()
		-- upvalues: Value (ref), p1 (copy)
		if Value then
			Value.updateAsync({
				targetWidgetUri = p1.anchorUri,
				targetAnchorPoint = p1.position.targetAnchorPoint,
				subjectAnchorPoint = p1.position.subjectAnchorPoint,
				offset = p1.position.offset
			})
			
			return nil
		else
			return nil
		end
	end, { Value, p1.anchorUri, p1.position })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current()
			end
		end
	end, {})
	
	return Value
end