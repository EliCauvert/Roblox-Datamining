local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local _ = require(AvatarViewport.Types)

local function _(p1) --[[ Line: 25 | Named "destroyLoadedModel" ]]
	local Current = p1.current
	
	if Current then
		Current:Destroy()
		p1.current = nil
	end
end

return function(p1) --[[ Line: 33 | Named "useViewportModelLoader" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(p1.onModelReady)
	local UseRefResult3 = ReactModule.useRef(p1.onLoadFailed)
	UseRefResult2.current = p1.onModelReady
	UseRefResult3.current = p1.onLoadFailed
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 45 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy)
		local ModelSourceFunction = p1.modelSource
		UseRefResult.current += 1
		local Current = UseRefResult.current
		
		if p2 then
			UseStateResult2(true)
		end
		UseStateResult2_1(false)
		UseStateResult2_2(nil)
		local Current1 = UseRefResult1.current
		
		if Current1 then
			Current1:Destroy()
			UseRefResult1.current = nil
		end
		task.spawn(function() --[[ Line: 57 ]]
			-- upvalues: UseRefResult (upval), Current (copy), ModelSourceFunction (copy), p2 (copy), UseStateResult2 (upval), UseRefResult3 (upval), p1 (upval), UseRefResult1 (upval), UseStateResult2_2 (upval), UseStateResult2_1 (upval), UseRefResult2 (upval)
			local ModelSourceResult = ModelSourceFunction({
				isCancelled = function(): boolean --[[ Line: 58 ]]
					-- upvalues: UseRefResult (upval), Current (upval)
					return UseRefResult.current ~= Current
				end
			})
			
			if UseRefResult.current == Current then
				if ModelSourceResult then
					local Current1 = p1.worldModelRef.current
					
					if Current1 then
						ModelSourceResult.model.Parent = Current1
						UseRefResult1.current = ModelSourceResult.model
						UseStateResult2_2(ModelSourceResult.model)
						UseStateResult2_1(true)
						
						if p2 then
							UseStateResult2(false)
						end
						if UseRefResult2.current then
							UseRefResult2.current(ModelSourceResult)
						end
						return
					else
						ModelSourceResult.model:Destroy()
						
						if p2 then
							UseStateResult2(false)
						end
						return
					end
				else
					if p2 then
						UseStateResult2(false)
					end
					if UseRefResult3.current then
						UseRefResult3.current()
					end
					return
				end
			elseif ModelSourceResult and ModelSourceResult.model then
				ModelSourceResult.model:Destroy()
			end
		end)
	end, { p1.modelSource, p1.worldModelRef })
	ReactModule.useLayoutEffect(function() --[[ Line: 104 ]]
		-- upvalues: UseResult (copy), UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult1 (copy)
		UseResult(true)
		
		return function() --[[ Line: 106 ]]
			-- upvalues: UseRefResult (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseRefResult1 (upval)
			UseRefResult.current += 1
			UseStateResult2_1(false)
			UseStateResult2_2(nil)
			local Current = UseRefResult1.current
			
			if Current then
				Current:Destroy()
				UseRefResult1.current = nil
			end
		end
	end, { UseResult })
	
	return {
		isLoading = UseStateResult,
		isReady = UseStateResult1,
		model = UseStateResult3
	}
end