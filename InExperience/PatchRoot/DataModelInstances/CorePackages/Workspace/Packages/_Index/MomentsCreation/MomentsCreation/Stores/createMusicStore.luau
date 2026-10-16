local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local SignalsModule = require(MomentsCreation.Parent.Signals)
local CreateMusicSourceModule = require(MomentsCreation.Stores.createMusicSource)
local GetFFlagMomentsCreationMusicSearchStateFixModule = require(MomentsCreation.Flags.GetFFlagMomentsCreationMusicSearchStateFix)
local _ = require(MomentsCreation.Types.Music)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function(p1) --[[ Line: 54 | Named "createMusicStore" ]]
	-- upvalues: CreateMusicSourceModule (copy), CreateSignalFunction (copy), CreateComputedFunction (copy), GetFFlagMomentsCreationMusicSearchStateFixModule (copy)
	local P0 = p1 or CreateMusicSourceModule()
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction({})
	local Idle, Idle2 = CreateSignalFunction("idle")
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	local Count = 0
	local t = {}
	local v1 = ""
	local v2 = nil
	local Cursor = nil
	
	local function _(List) --[[ Line: 87 | Named "mergeInfo" ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		if #List == 0 then return end
		local Copy = table.clone(Signal(false))
		
		for _, value in List do
			Copy[value.AssetId] = value
		end
		Signal2(Copy)
	end
	
	local _ = function(List) --[[ Line: 98 | Named "extractIds" ]]
		local AssetIds = {}
		
		for _, value in List do
			table.insert(AssetIds, value.AssetId)
		end
		return AssetIds
	end
	
	local _ = function(Value) --[[ Line: 106 | Named "setCursor" ]]
		-- upvalues: Cursor (ref), Signal2_2 (copy), Signal2_3 (copy)
		Cursor = Value
		Signal2_2(Value ~= nil and not Value.isFinished())
		Signal2_3(false)
	end
	
	local function search(p2, p3) --[[ Line: 112 ]]
		-- upvalues: v1 (ref), v2 (ref), Cursor (ref), Signal2_2 (copy), Signal2_3 (copy), GetFFlagMomentsCreationMusicSearchStateFixModule (upval), P0 (copy), Signal (copy), Signal2 (copy), Signal2_1 (copy), Count (ref), Idle2 (copy)
		v1 = p2
		v2 = p3
		Cursor = nil
		Signal2_2(false)
		Signal2_3(false)
		
		if GetFFlagMomentsCreationMusicSearchStateFixModule() then
			Count += 1
			local Count1: number = Count
			Idle2("loading")
			Signal2_1({})
			task.spawn(function() --[[ Line: 137 ]]
				-- upvalues: P0 (upval), p2 (copy), p3 (copy), Count1 (copy), Count (upval), Idle2 (upval), Signal (upval), Signal2 (upval), Signal2_1 (upval), Cursor (upval), Signal2_2 (upval), Signal2_3 (upval)
				local Success, Result, Result3 = pcall(P0.searchMusic, p2, p3 or 30)
				
				if Count1 ~= Count then return end
				if not Success then
					Idle2("error")
					
					return
				end
				if #Result ~= 0 then
					local Copy = table.clone(Signal(false))
					
					for _, value in Result do
						Copy[value.AssetId] = value
					end
					Signal2(Copy)
				end
				local AssetIds = {}
				
				for _, value1 in Result do
					table.insert(AssetIds, value1.AssetId)
				end
				Signal2_1(AssetIds)
				Cursor = Result3
				Signal2_2(Result3 ~= nil and not Result3.isFinished())
				Signal2_3(false)
				Idle2("success")
			end)
			
			return
		else
			task.spawn(function() --[[ Line: 117 ]]
				-- upvalues: P0 (upval), p2 (copy), p3 (copy), Signal (upval), Signal2 (upval), Signal2_1 (upval), Cursor (upval), Signal2_2 (upval), Signal2_3 (upval)
				local Success, Result, Result3 = pcall(P0.searchMusic, p2, p3 or 30)
				
				if not Success then return end
				if #Result ~= 0 then
					local Copy = table.clone(Signal(false))
					
					for _, value in Result do
						Copy[value.AssetId] = value
					end
					Signal2(Copy)
				end
				local AssetIds = {}
				
				for _, value1 in Result do
					table.insert(AssetIds, value1.AssetId)
				end
				Signal2_1(AssetIds)
				Cursor = Result3
				Signal2_2(Result3 ~= nil and not Result3.isFinished())
				Signal2_3(false)
			end)
		end
	end
	
	return {
		getInfoMap = Signal,
		getResults = CreateComputedFunction(function(p4) --[[ Line: 75 ]]
			-- upvalues: Signal (copy), Signal1 (copy)
			local SignalResult = Signal(p4)
			local List = {}
			
			for _, value in Signal1(p4) do
				local SignalResultEntry = SignalResult[value]
				
				if SignalResultEntry ~= nil then
					table.insert(List, SignalResultEntry)
				end
			end
			return List
		end),
		getSearchStatus = Idle,
		search = search,
		retry = function() --[[ Line: 181 ]]
			-- upvalues: search (copy), v1 (ref), v2 (ref)
			search(v1, v2)
		end,
		getHasMore = Signal3,
		getIsLoadingMore = Signal4,
		loadMore = function() --[[ Line: 185 ]]
			-- upvalues: Cursor (ref), Signal3 (copy), Signal4 (copy), Signal2_3 (copy), Signal2_2 (copy), Signal (copy), Signal2 (copy), Signal1 (copy), Signal2_1 (copy)
			local Cursor1 = Cursor
			
			if Cursor1 ~= nil and Signal3(false) and not Signal4(false) then
				Signal2_3(true)
				task.spawn(function() --[[ Line: 191 ]]
					-- upvalues: Cursor1 (copy), Cursor (upval), Signal2_2 (upval), Signal2_3 (upval), Signal (upval), Signal2 (upval), Signal1 (upval), Signal2_1 (upval)
					local Success, Result = pcall(Cursor1.nextPage)
					
					if Cursor ~= Cursor1 then return end
					if not Success then
						Cursor = nil
						Signal2_2(false)
						Signal2_3(false)
						
						return
					end
					if #Result ~= 0 then
						local Copy = table.clone(Signal(false))
						
						for _, value in Result do
							Copy[value.AssetId] = value
						end
						Signal2(Copy)
					end
					local Copy1 = table.clone(Signal1(false))
					local t = {}
					
					for _, value1 in Copy1 do
						t[value1] = true
					end
					for _, value2 in Result do
						if not t[value2.AssetId] then
							t[value2.AssetId] = true
							table.insert(Copy1, value2.AssetId)
						end
					end
					Signal2_1(Copy1)
					Cursor = Cursor1
					Signal2_2(Cursor1 ~= nil and not Cursor1.isFinished())
					Signal2_3(false)
				end)
				
				return
			end
		end,
		fetchInfo = function(Key) --[[ Line: 154 ]]
			-- upvalues: Signal (copy), GetFFlagMomentsCreationMusicSearchStateFixModule (upval), t (copy), P0 (copy), Signal2 (copy)
			if Signal(false)[Key] ~= nil then return end
			if not GetFFlagMomentsCreationMusicSearchStateFixModule() then
				task.spawn(function() --[[ Line: 173 ]]
					-- upvalues: P0 (upval), Key (copy), Signal (upval), Signal2 (upval)
					local Success, Result = pcall(P0.getMetadata, { Key })
					
					if Success then
						if #Result == 0 then return end
						local Copy = table.clone(Signal(false))
						
						for _, value in Result do
							Copy[value.AssetId] = value
						end
						Signal2(Copy)
					end
				end)
				
				return
			end
			if not t[Key] then
				t[Key] = true
				task.spawn(function() --[[ Line: 164 ]]
					-- upvalues: P0 (upval), Key (copy), t (upval), Signal (upval), Signal2 (upval)
					local Success, Result = pcall(P0.getMetadata, { Key })
					t[Key] = nil
					
					if Success then
						if #Result == 0 then return end
						local Copy = table.clone(Signal(false))
						
						for _, value in Result do
							Copy[value.AssetId] = value
						end
						Signal2(Copy)
					end
				end)
				
				return
			end
		end
	}
end