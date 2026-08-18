local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local _ = require(avatarViewport.Types)

local function _(p0) --[[ line: 25 | named "destroyLoadedModel" ]]
	local current = p0.current
	
	if current then
		current:Destroy()
		p0.current = nil
	end
end

return function(p1) --[[ line: 33 | named "useViewportModelLoader" ]]
	-- upvalues: reactModule (ref)
	local var2, var3 = reactModule.useState(true)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useRef(0)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(p1.onModelReady)
	local var11 = reactModule.useRef(p1.onLoadFailed)
	var10.current = p1.onModelReady
	var11.current = p1.onLoadFailed
	local var12 = reactModule.useCallback(function(p2) --[[ line: 45 ]]
		-- upvalues: p1 (ref), var8 (ref), var3 (ref), var5 (ref), var7 (ref), var9 (ref), var11 (ref), var10 (ref)
		local modelSource = p1.modelSource
		var8.current += 1
		local current = var8.current
		
		if p2 then
			var3(true)
		end
		var5(false)
		var7(nil)
		local current_1 = var9.current
		
		if current_1 then
			current_1:Destroy()
			var9.current = nil
		end
		task.spawn(function() --[[ line: 57 ]]
			-- upvalues: var8 (copy), current (ref), modelSource (ref), p2 (ref), var3 (copy), var11 (copy), p1 (copy), var9 (copy), var7 (copy), var5 (copy), var10 (copy)
			local var13 = modelSource({
				isCancelled = function() --[[ line: 58 ]]
					-- upvalues: var8 (copy), current (copy)
					return var8.current ~= current
				end
			})
			
			if var8.current ~= current then
				if var13 and var13.model then
					var13.model:Destroy()
				end
				return
			elseif var13 then
				local current_1 = p1.worldModelRef.current
				
				if current_1 then
					var13.model.Parent = current_1
					var9.current = var13.model
					var7(var13.model)
					var5(true)
					
					if p2 then
						var3(false)
					end
					if var10.current then
						var10.current(var13)
					end
					return
				else
					var13.model:Destroy()
					
					if p2 then
						var3(false)
					end
					return
				end
			elseif p2 then
				var3(false)
			end
			if var11.current then
				var11.current()
			end
		end)
	end, { p1.modelSource, p1.worldModelRef })
	reactModule.useLayoutEffect(function() --[[ line: 104 ]]
		-- upvalues: var12 (ref), var8 (ref), var5 (ref), var7 (ref), var9 (ref)
		var12(true)
		
		return function() --[[ line: 106 ]]
			-- upvalues: var8 (copy), var5 (copy), var7 (copy), var9 (copy)
			var8.current += 1
			var5(false)
			var7(nil)
			local current = var9.current
			
			if current then
				current:Destroy()
				var9.current = nil
			end
		end
	end, { var12 })
	
	return { isLoading = var2, isReady = var4, model = var6 }
end