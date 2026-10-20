local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local ReactModule = require(CoreScriptsPlayerFeedback.Parent.React)
local _ = require(CoreScriptsPlayerFeedback.CaptureTypes)
local FetchGalleryCapturesModule = require(CoreScriptsPlayerFeedback.Utils.fetchGalleryCaptures)

return function()
	-- upvalues: ReactModule (copy), FetchGalleryCapturesModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult2 (copy)
		local Current = UseRefResult2.current
		
		if #Current == 0 then return end
		local List = {}
		
		for i = 1, math.min(30, #Current) do
			table.insert(List, Current[i])
		end
		local Current1 = {}
		
		for i1 = 31, #Current do
			table.insert(Current1, Current[i1])
		end
		UseRefResult2.current = Current1
		UseStateResult2(function(Tbl)
			-- upvalues: List (copy)
			local Copy = table.clone(Tbl)
			
			for _, value in List do
				table.insert(Copy, value)
			end
			return Copy
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseRefResult2 (copy), UseResult (copy)
		local Current = UseRefResult1.current
		
		if Current == nil or Current.IsFinished then
			UseStateResult2_2(false)
			UseStateResult2_1(false)
			
			return
		else
			UseStateResult2_1(true)
			task.spawn(function()
				-- upvalues: UseRefResult2 (upval), Current (copy), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseResult (upval)
				local GameId = game.GameId
				while #UseRefResult2.current == 0 do
					if not pcall(function()
						-- upvalues: Current (upval)
						Current:AdvanceToNextPageAsync()
					end) then
						UseStateResult2_1(false)
						UseStateResult2_2(false)
						
						return
					end
					for _, value in Current:GetCurrentPage() do
						if GameId == 0 or value.SourceUniverseId == GameId then
							table.insert(UseRefResult2.current, value)
						end
					end
					if Current.IsFinished then break end
				end
				UseResult()
				UseStateResult2_2(#UseRefResult2.current > 0 or not Current.IsFinished)
				UseStateResult2_1(false)
			end)
		end
	end, { UseResult })
	
	return {
		captures = UseStateResult,
		isLoading = UseStateResult1,
		hasMore = UseStateResult3,
		load = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), FetchGalleryCapturesModule (upval), UseStateResult2_2 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseResult (copy)
			if not UseRefResult.current and not UseStateResult1 then
				UseRefResult.current = true
				UseStateResult2_1(true)
				task.spawn(function()
					-- upvalues: FetchGalleryCapturesModule (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseResult (upval)
					local GalleryCapturesModule = FetchGalleryCapturesModule()
					
					if GalleryCapturesModule == nil then
						UseStateResult2_1(false)
						UseStateResult2_2(false)
						
						return
					end
					UseRefResult1.current = GalleryCapturesModule
					local GameId = game.GameId
					repeat
						for _, value in GalleryCapturesModule:GetCurrentPage() do
							if GameId == 0 or value.SourceUniverseId == GameId then
								table.insert(UseRefResult2.current, value)
							end
						end
					until #UseRefResult2.current >= 30 or GalleryCapturesModule.IsFinished or not pcall(function()
						-- upvalues: GalleryCapturesModule (copy)
						GalleryCapturesModule:AdvanceToNextPageAsync()
					end)
					UseResult()
					UseStateResult2_2(#UseRefResult2.current > 0 or not GalleryCapturesModule.IsFinished)
					UseStateResult2_1(false)
				end)
				
				return
			end
		end, { UseStateResult1, UseResult }),
		loadMore = ReactModule.useCallback(function()
			-- upvalues: UseStateResult1 (copy), UseRefResult2 (copy), UseResult (copy), UseRefResult1 (copy), UseStateResult2_2 (copy), UseResult1 (copy)
			if UseStateResult1 then return end
			if #UseRefResult2.current > 0 then
				UseResult()
				local Current = UseRefResult1.current
				UseStateResult2_2(#UseRefResult2.current > 0 or Current ~= nil and not Current.IsFinished)
				
				return
			else
				UseResult1()
			end
		end, { UseStateResult1, UseResult, UseResult1 })
	}
end