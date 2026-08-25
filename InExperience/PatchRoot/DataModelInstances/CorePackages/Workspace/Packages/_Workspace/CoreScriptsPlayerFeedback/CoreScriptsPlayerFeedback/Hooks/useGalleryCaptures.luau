local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local reactModule = require(coreScriptsPlayerFeedback.Parent.React)
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)
local fetchGalleryCapturesModule = require(coreScriptsPlayerFeedback.Utils.fetchGalleryCaptures)

return function()
	-- upvalues: reactModule (ref), fetchGalleryCapturesModule (ref)
	local var3, var4 = reactModule.useState({})
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef({})
	local var10, var11 = reactModule.useState(true)
	local var12 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var4 (ref)
		local current = var9.current
		
		if #current == 0 then return end
		local t = {}
		
		for i = 1, math.min(30, #current) do
			table.insert(t, current[i])
		end
		local t_1 = {}
		
		for i_1 = 31, #current do
			table.insert(t_1, current[i_1])
		end
		var9.current = t_1
		var4(function(p0)
			-- upvalues: t (ref)
			local cloned = table.clone(p0)
			
			for i, v in t do
				table.insert(cloned, v)
			end
			return cloned
		end)
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var11 (ref), var6 (ref), var9 (ref), var12 (ref)
		local current = var8.current
		
		if current == nil or current.IsFinished then
			var11(false)
			var6(false)
			
			return
		end
		var6(true)
		task.spawn(function()
			-- upvalues: var9 (copy), current (ref), var6 (copy), var11 (copy), var12 (copy)
			local gameId = game.GameId
			repeat
				if #var9.current ~= 0 then break end
				if pcall(function()
					-- upvalues: current (copy)
					current:AdvanceToNextPageAsync()
				end) then
					for i, v in current:GetCurrentPage() do
						if gameId == 0 or v.SourceUniverseId == gameId then
							table.insert(var9.current, v)
						end
					end
				end
				var6(false)
				var11(false)
				
				return
			until current.IsFinished
			var12()
			var11(if #var9.current <= 0 then not current.IsFinished else true)
			var6(false)
		end)
	end, { var12 })
	
	return {
		captures = var3,
		isLoading = var5,
		hasMore = var10,
		load = reactModule.useCallback(function()
			-- upvalues: var7 (ref), var5 (ref), var6 (ref), fetchGalleryCapturesModule (copy), var11 (ref), var8 (ref), var9 (ref), var12 (ref)
			if var7.current or var5 then
				return
			end
			var7.current = true
			var6(true)
			task.spawn(function()
				-- upvalues: fetchGalleryCapturesModule (copy), var6 (copy), var11 (copy), var8 (copy), var9 (copy), var12 (copy)
				local var17 = fetchGalleryCapturesModule()
				
				if var17 == nil then
					var6(false)
					var11(false)
					
					return
				end
				var8.current = var17
				local gameId = game.GameId
				repeat
					for i, v in var17:GetCurrentPage() do
						if gameId == 0 or v.SourceUniverseId == gameId then
							table.insert(var9.current, v)
						end
					end
				until #var9.current >= 30 or var17.IsFinished or not pcall(function()
					-- upvalues: var17 (ref)
					var17:AdvanceToNextPageAsync()
				end)
				var12()
				var11(if #var9.current <= 0 then not var17.IsFinished else true)
				var6(false)
			end)
		end, { var5, var12 }),
		loadMore = reactModule.useCallback(function()
			-- upvalues: var5 (ref), var9 (ref), var12 (ref), var8 (ref), var11 (ref), var13 (ref)
			if var5 then return end
			if #var9.current <= 0 then
				var13()
				
				return
			end
			var12()
			local current = var8.current
			var11(if #var9.current <= 0 then current ~= nil and not current.IsFinished else true)
		end, { var5, var12, var13 })
	}
end