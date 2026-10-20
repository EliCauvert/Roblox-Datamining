local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local SignalsModule = require(Parent.Signals)
local ConstantsModule = require(MomentsCreation.Constants)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

local function makeDefaultSource()
	-- upvalues: DashModule (copy), ConstantsModule (copy)
	local function formatMusic(AudioMetadataAsync)
		local List = {}
		
		for _, value in AudioMetadataAsync do
			local Number: number? = tonumber(value.AssetId)
			
			if Number ~= nil and value.RecordingCode ~= nil then
				table.insert(List, {
					Artist = value.Artist,
					AssetId = Number,
					AudioType = value.AudioType,
					Duration = value.Duration,
					RecordingCode = value.RecordingCode,
					Title = value.Title
				})
			end
		end
		return List
	end
	
	return {
		searchMusic = function(SearchKeyword, MinDuration)
			-- upvalues: DashModule (upval), ConstantsModule (upval), formatMusic (copy)
			local AssetService = game:GetService("AssetService")
			local AudioSearchParams = Instance.new("AudioSearchParams")
			AudioSearchParams.SearchKeyword = SearchKeyword
			AudioSearchParams.AudioSubType = Enum.AudioSubType.Music
			AudioSearchParams.MinDuration = MinDuration
			local Ids = {}
			
			for _, value in AssetService:SearchAudio(AudioSearchParams):GetCurrentPage() do
				if not DashModule.includes(ConstantsModule.SearchMusicCreatorFilter, value.Creator.Id) then
					table.insert(Ids, value.Id)
				end
			end
			return if #Ids == 0 then {} else formatMusic(AssetService:GetAudioMetadataAsync(Ids))
		end,
		getMetadata = function(IdList)
			-- upvalues: formatMusic (copy)
			return (formatMusic(game:GetService("AssetService"):GetAudioMetadataAsync(IdList)))
		end
	}
end

return function(p1)
	-- upvalues: makeDefaultSource (copy), CreateSignalFunction (copy), CreateComputedFunction (copy)
	local P4 = p1 or makeDefaultSource()
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction({})
	
	local function _(List)
		-- upvalues: Signal (copy), Signal2 (copy)
		if #List == 0 then return end
		local Copy = table.clone(Signal(false))
		
		for _, value in List do
			Copy[value.AssetId] = value
		end
		Signal2(Copy)
	end
	
	return {
		getInfoMap = Signal,
		getResults = CreateComputedFunction(function(p2)
			-- upvalues: Signal (copy), Signal1 (copy)
			local SignalResult = Signal(p2)
			local List = {}
			
			for _, value in Signal1(p2) do
				local SignalResultEntry = SignalResult[value]
				
				if SignalResultEntry ~= nil then
					table.insert(List, SignalResultEntry)
				end
			end
			return List
		end),
		search = function(p3, p4)
			-- upvalues: P4 (copy), Signal (copy), Signal2 (copy), Signal2_1 (copy)
			task.spawn(function()
				-- upvalues: P4 (upval), p3 (copy), p4 (copy), Signal (upval), Signal2 (upval), Signal2_1 (upval)
				local Success, Result = pcall(P4.searchMusic, p3, p4 or 30)
				
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
			end)
		end,
		fetchInfo = function(p5)
			-- upvalues: Signal (copy), P4 (copy), Signal2 (copy)
			if Signal(false)[p5] == nil then
				task.spawn(function()
					-- upvalues: P4 (upval), p5 (copy), Signal (upval), Signal2 (upval)
					local Success, Result = pcall(P4.getMetadata, { p5 })
					
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