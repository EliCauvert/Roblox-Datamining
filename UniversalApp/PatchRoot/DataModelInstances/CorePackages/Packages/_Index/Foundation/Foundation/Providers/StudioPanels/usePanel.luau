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
		isFocusable = if FlagsModule.FoundationPopoverPluginFocusable then p1.isFocusable else nil,
		initialSize = if FlagsModule.FoundationPopoverPluginPoolReclaim then p1.initialSize else nil
	})
	local UseRefResult1 = ReactModule.useRef(p1.onClose)
	UseRefResult1.current = p1.onClose
	local UseRefResult2 = ReactModule.useRef(p1.registerPanelAsync)
	UseRefResult2.current = p1.registerPanelAsync
	local UseStateResult3 = nil
	local UseRefResult3 = if FlagsModule.FoundationPopoverPluginSettleRenders then ReactModule.useRef(nil) else nil
	
	if FlagsModule.FoundationPopoverPluginSettleRenders then
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy), UseRefResult1 (copy)
			UseStateResult2(true)
			UseRefResult1.current()
		end, {})
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
		local NoUseStateResult: boolean = p1.isOpen and not UseStateResult
		ReactModule.useEffect(function()
			-- upvalues: NoUseStateResult (copy), UseRefResult (copy), UseRefResult3 (copy), UseStateResult2_1 (copy), UseRefToStateResult (copy), UseRefResult2 (copy), UseResult (copy), FlagsModule (upval)
			if NoUseStateResult then
				local Current = UseRefToStateResult.current
				local SpawnedThread = task.spawn(function()
					-- upvalues: UseRefResult2 (upval), Current (copy), UseResult (upval), FlagsModule (upval), UseStateResult2_1 (upval), UseRefResult (upval), UseRefResult3 (upval)
					local Success, Result, Result3 = pcall(UseRefResult2.current, Current.anchorUri, Current.position, UseResult, Current.depth, Current.parentPopoverId, if FlagsModule.FoundationPopoverPluginFocusable then Current.isFocusable else nil, if FlagsModule.FoundationPopoverPluginPoolReclaim then Current.initialSize else nil)
					
					if Success then
						UseRefResult.current = Result3
						UseRefResult3.current = {
							anchorUri = Current.anchorUri,
							position = Current.position
						}
						UseStateResult2_1(Result)
						
						return
					else
						UseStateResult2_1(nil)
					end
				end)
				
				return function()
					-- upvalues: SpawnedThread (copy)
					task.cancel(SpawnedThread)
				end
			end
			if UseRefResult.current then
				UseRefResult.current()
				UseRefResult.current = nil
			end
			UseRefResult3.current = nil
			UseStateResult2_1(nil)
			
			return nil
		end, { NoUseStateResult })
		UseStateResult3 = if UseStateResult then nil else UseStateResult1
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseStateResult2 (copy)
			if not p1.isOpen then
				UseStateResult2(false)
			end
		end, { p1.isOpen })
	else
		local UseStateResult4, UseStateResult2_2 = ReactModule.useState(false)
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_2 (copy), UseRefResult1 (copy)
			UseStateResult2_2(true)
			UseRefResult1.current()
		end, {})
		local UseAsyncResult = ReactUtilsModule.useAsync(function()
			-- upvalues: p1 (copy), UseStateResult4 (copy), UseRefResult2 (copy), UseRefToStateResult (copy), UseResult1 (copy), FlagsModule (upval), UseRefResult (copy)
			if p1.isOpen and not UseStateResult4 then
				local CurrentResult, CurrentResult2 = UseRefResult2.current(UseRefToStateResult.current.anchorUri, UseRefToStateResult.current.position, UseResult1, UseRefToStateResult.current.depth, UseRefToStateResult.current.parentPopoverId, if FlagsModule.FoundationPopoverPluginFocusable then UseRefToStateResult.current.isFocusable else nil, if FlagsModule.FoundationPopoverPluginPoolReclaim then UseRefToStateResult.current.initialSize else nil)
				UseRefResult.current = CurrentResult2
				
				return CurrentResult
			end
			if UseRefResult.current then
				UseRefResult.current()
				UseRefResult.current = nil
			end
			return nil
		end, { p1.isOpen, UseRefToStateResult, UseStateResult4 })
		UseStateResult3 = if UseStateResult4 or UseAsyncResult.status ~= "ok" then nil else UseAsyncResult.value
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseStateResult2_2 (copy)
			if not p1.isOpen then
				UseStateResult2_2(false)
			end
		end, { p1.isOpen })
	end
	if FlagsModule.FoundationPopoverPluginSettleRenders then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult3 (ref), UseRefResult3 (copy), p1 (copy)
			if not UseStateResult3 then
				return nil
			end
			local Current = UseRefResult3.current
			
			if Current and Current.anchorUri == p1.anchorUri and Current.position == p1.position then
				return nil
			else
				UseRefResult3.current = { anchorUri = p1.anchorUri, position = p1.position }
				local SpawnedThread = task.spawn(function()
					-- upvalues: UseStateResult3 (upval), p1 (upval)
					UseStateResult3.updateAsync({
						targetWidgetUri = p1.anchorUri,
						targetAnchorPoint = p1.position.targetAnchorPoint,
						subjectAnchorPoint = p1.position.subjectAnchorPoint,
						offset = p1.position.offset
					})
				end)
				
				return function()
					-- upvalues: SpawnedThread (copy)
					task.cancel(SpawnedThread)
				end
			end
		end, { UseStateResult3, p1.anchorUri, p1.position })
	else
		ReactUtilsModule.useAsync(function()
			-- upvalues: UseStateResult3 (ref), p1 (copy)
			if UseStateResult3 then
				UseStateResult3.updateAsync({
					targetWidgetUri = p1.anchorUri,
					targetAnchorPoint = p1.position.targetAnchorPoint,
					subjectAnchorPoint = p1.position.subjectAnchorPoint,
					offset = p1.position.offset
				})
				
				return nil
			else
				return nil
			end
		end, { UseStateResult3, p1.anchorUri, p1.position })
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current()
			end
		end
	end, {})
	
	return UseStateResult3
end