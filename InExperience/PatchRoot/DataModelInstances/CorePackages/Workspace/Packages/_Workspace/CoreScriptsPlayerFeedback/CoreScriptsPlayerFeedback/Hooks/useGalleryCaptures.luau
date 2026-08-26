local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local reactModule = require(coreScriptsPlayerFeedback.Parent.React)
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)
local fetchGalleryCapturesModule = require(coreScriptsPlayerFeedback.Utils.fetchGalleryCaptures)

return function()
	-- upvalues: reactModule (ref), fetchGalleryCapturesModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef({})
	local var8, var9 = reactModule.useState(true)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var2 (ref)
		local current = var7.current
		
		if #current == 0 then return end
		local t = {}
		
		for i = 1, math.min(30, #current) do
			table.insert(t, current[i])
		end
		local t_1 = {}
		
		for i_1 = 31, #current do
			table.insert(t_1, current[i_1])
		end
		var7.current = t_1
		var2(function(p1)
			-- upvalues: t (ref)
			local cloned = table.clone(p1)
			
			for i, v in t do
				table.insert(cloned, v)
			end
			return cloned
		end)
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var9 (ref), var4 (ref), var7 (ref), var10 (ref)
		local current = var6.current
		
		if current == nil or current.IsFinished then
			var9(false)
			var4(false)
			
			return
		end
		var4(true)
		task.spawn(function()
			-- upvalues: var7 (copy), current (ref), var4 (copy), var9 (copy), var10 (copy)
			local gameId = game.GameId
			repeat
				if #var7.current ~= 0 then break end
				if pcall(function()
					-- upvalues: current (copy)
					current:AdvanceToNextPageAsync()
				end) then
					for i, v in current:GetCurrentPage() do
						if gameId == 0 or v.SourceUniverseId == gameId then
							table.insert(var7.current, v)
						end
					end
				end
				var4(false)
				var9(false)
				
				return
			until current.IsFinished
			var10()
			var9(if #var7.current <= 0 then not current.IsFinished else true)
			var4(false)
		end)
	end, { var10 })
	
	return {
		captures = var1,
		isLoading = var3,
		hasMore = var8,
		load = reactModule.useCallback(function()
			-- upvalues: var5 (ref), var3 (ref), var4 (ref), fetchGalleryCapturesModule (copy), var9 (ref), var6 (ref), var7 (ref), var10 (ref)
			if var5.current or var3 then
				return
			end
			var5.current = true
			var4(true)
			task.spawn(function()
				-- upvalues: fetchGalleryCapturesModule (copy), var4 (copy), var9 (copy), var6 (copy), var7 (copy), var10 (copy)
				local var12 = fetchGalleryCapturesModule()
				
				if var12 == nil then
					var4(false)
					var9(false)
					
					return
				end
				var6.current = var12
				local gameId = game.GameId
				repeat
					for i, v in var12:GetCurrentPage() do
						if gameId == 0 or v.SourceUniverseId == gameId then
							table.insert(var7.current, v)
						end
					end
				until #var7.current >= 30 or var12.IsFinished or not pcall(function()
					-- upvalues: var12 (ref)
					var12:AdvanceToNextPageAsync()
				end)
				var10()
				var9(if #var7.current <= 0 then not var12.IsFinished else true)
				var4(false)
			end)
		end, { var3, var10 }),
		loadMore = reactModule.useCallback(function()
			-- upvalues: var3 (ref), var7 (ref), var10 (ref), var6 (ref), var9 (ref), var11 (ref)
			if var3 then return end
			if #var7.current <= 0 then
				var11()
				
				return
			end
			var10()
			local current = var6.current
			var9(if #var7.current <= 0 then current ~= nil and not current.IsFinished else true)
		end, { var3, var10, var11 })
	}
end