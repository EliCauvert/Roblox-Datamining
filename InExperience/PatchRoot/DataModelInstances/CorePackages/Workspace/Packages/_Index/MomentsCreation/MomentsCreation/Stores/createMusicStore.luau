local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local signalsModule = require(parent.Signals)
local constantsModule = require(momentsCreation.Constants)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

local function makeDefaultSource() --[[ line: 65 ]]
	-- upvalues: dashModule (ref), constantsModule (ref)
	local function formatMusic(p0) --[[ line: 66 ]]
		local t = {}
		
		for i, v in p0 do
			local var7 = tonumber(v.AssetId)
			
			if var7 ~= nil and v.RecordingCode ~= nil then
				table.insert(t, {
					Artist = v.Artist,
					AssetId = var7,
					AudioType = v.AudioType,
					Duration = v.Duration,
					RecordingCode = v.RecordingCode,
					Title = v.Title
				})
			end
		end
		return t
	end
	
	return {
		searchMusic = function(p1, p2) --[[ line: 88 ]]
			-- upvalues: dashModule (copy), constantsModule (copy), formatMusic (ref)
			local assetService = game:GetService("AssetService")
			local audioSearchParams = Instance.new("AudioSearchParams")
			audioSearchParams.SearchKeyword = p1
			audioSearchParams.AudioSubType = Enum.AudioSubType.Music
			audioSearchParams.MinDuration = p2
			local t = {}
			
			for i, v in assetService:SearchAudio(audioSearchParams):GetCurrentPage() do
				if not dashModule.includes(constantsModule.SearchMusicCreatorFilter, v.Creator.Id) then
					table.insert(t, v.Id)
				end
			end
			return if #t == 0 then {} else formatMusic(assetService:GetAudioMetadataAsync(t))
		end,
		getMetadata = function(p3) --[[ line: 108 ]]
			-- upvalues: formatMusic (ref)
			return formatMusic(game:GetService("AssetService"):GetAudioMetadataAsync(p3))
		end
	}
end

return function(p4) --[[ line: 115 | named "createMusicStore" ]]
	-- upvalues: makeDefaultSource (ref), createSignal (ref), createComputed (ref)
	p4 = p4 or makeDefaultSource()
	local var12, var13 = createSignal({})
	local var14, var15 = createSignal({})
	
	local function _(p5) --[[ line: 134 | named "mergeInfo" ]]
		-- upvalues: var12 (ref), var13 (ref)
		if #p5 == 0 then return end
		local cloned = table.clone(var12(false))
		
		for i, v in p5 do
			cloned[v.AssetId] = v
		end
		var13(cloned)
	end
	
	return {
		getInfoMap = var12,
		getResults = createComputed(function(p6) --[[ line: 122 ]]
			-- upvalues: var12 (ref), var14 (ref)
			local var17 = var12(p6)
			local t = {}
			
			for i, v in var14(p6) do
				local var19 = var17[v]
				
				if var19 ~= nil then
					table.insert(t, var19)
				end
			end
			return t
		end),
		search = function(p7, p8) --[[ line: 145 ]]
			-- upvalues: p4 (ref), var12 (ref), var13 (ref), var15 (ref)
			task.spawn(function() --[[ line: 146 ]]
				-- upvalues: p4 (copy), p7 (ref), p8 (ref), var12 (copy), var13 (copy), var15 (copy)
				local ok, status = pcall(p4.searchMusic, p7, p8 or 30)
				
				if not ok then return end
				if #status ~= 0 then
					local cloned = table.clone(var12(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var13(cloned)
				end
				local t = {}
				
				for i, v in status do
					table.insert(t, v.AssetId)
				end
				var15(t)
			end)
		end,
		fetchInfo = function(p9) --[[ line: 162 ]]
			-- upvalues: var12 (ref), p4 (ref), var13 (ref)
			if var12(false)[p9] == nil then
				task.spawn(function() --[[ line: 166 ]]
					-- upvalues: p4 (copy), p9 (ref), var12 (copy), var13 (copy)
					local ok, status = pcall(p4.getMetadata, { p9 })
					
					if ok then
						if #status == 0 then return end
						local cloned = table.clone(var12(false))
						
						for i, v in status do
							cloned[v.AssetId] = v
						end
						var13(cloned)
					end
				end)
				
				return
			end
		end
	}
end