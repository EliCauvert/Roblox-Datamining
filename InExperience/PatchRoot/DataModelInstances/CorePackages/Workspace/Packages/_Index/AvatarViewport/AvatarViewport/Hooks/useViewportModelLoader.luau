local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local _ = require(avatarViewport.Types)

local function _(p1)
	local current = p1.current
	
	if current then
		current:Destroy()
		p1.current = nil
	end
end

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(true)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useRef(0)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(p1.onModelReady)
	local var10 = reactModule.useRef(p1.onLoadFailed)
	var9.current = p1.onModelReady
	var10.current = p1.onLoadFailed
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var7 (ref), var2 (ref), var4 (ref), var6 (ref), var8 (ref), var10 (ref), var9 (ref)
		local modelSource = p1.modelSource
		var7.current += 1
		local current = var7.current
		
		if p2 then
			var2(true)
		end
		var4(false)
		var6(nil)
		local current_1 = var8.current
		
		if current_1 then
			current_1:Destroy()
			var8.current = nil
		end
		task.spawn(function()
			-- upvalues: var7 (copy), current (ref), modelSource (ref), p2 (ref), var2 (copy), var10 (copy), p1 (copy), var8 (copy), var6 (copy), var4 (copy), var9 (copy)
			local var12 = modelSource({
				isCancelled = function()
					-- upvalues: var7 (copy), current (copy)
					return var7.current ~= current
				end
			})
			
			if var7.current ~= current then
				if var12 and var12.model then
					var12.model:Destroy()
				end
				return
			elseif var12 then
				local current_1 = p1.worldModelRef.current
				
				if current_1 then
					var12.model.Parent = current_1
					var8.current = var12.model
					var6(var12.model)
					var4(true)
					
					if p2 then
						var2(false)
					end
					if var9.current then
						var9.current(var12)
					end
					return
				else
					var12.model:Destroy()
					
					if p2 then
						var2(false)
					end
					return
				end
			elseif p2 then
				var2(false)
			end
			if var10.current then
				var10.current()
			end
		end)
	end, { p1.modelSource, p1.worldModelRef })
	reactModule.useLayoutEffect(function()
		-- upvalues: var11 (ref), var7 (ref), var4 (ref), var6 (ref), var8 (ref)
		var11(true)
		
		return function()
			-- upvalues: var7 (copy), var4 (copy), var6 (copy), var8 (copy)
			var7.current += 1
			var4(false)
			var6(nil)
			local current = var8.current
			
			if current then
				current:Destroy()
				var8.current = nil
			end
		end
	end, { var11 })
	
	return { isLoading = var1, isReady = var3, model = var5 }
end