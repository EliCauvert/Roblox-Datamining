local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local signalsModule = require(parent.Signals)
local constantsModule = require(momentsCreation.Constants)
local getFFlagMomentsCreationMusicSearchStateFixModule = require(momentsCreation.Flags.GetFFlagMomentsCreationMusicSearchStateFix)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

local function makeDefaultSource() --[[ line: 71 ]]
	-- upvalues: dashModule (ref), constantsModule (ref)
	local function formatMusic(p0) --[[ line: 72 ]]
		local t = {}
		
		for i, v in p0 do
			local var8 = tonumber(v.AssetId)
			
			if var8 ~= nil and v.RecordingCode ~= nil then
				table.insert(t, {
					Artist = v.Artist,
					AssetId = var8,
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
		searchMusic = function(p1, p2) --[[ line: 94 ]]
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
		getMetadata = function(p3) --[[ line: 114 ]]
			-- upvalues: formatMusic (ref)
			return formatMusic(game:GetService("AssetService"):GetAudioMetadataAsync(p3))
		end
	}
end

return function(p4) --[[ line: 121 | named "createMusicStore" ]]
	-- upvalues: makeDefaultSource (ref), createSignal (ref), createComputed (ref), getFFlagMomentsCreationMusicSearchStateFixModule (ref)
	p4 = p4 or makeDefaultSource()
	local var13, var14 = createSignal({})
	local var15, var16 = createSignal({})
	local var17, var18 = createSignal("idle")
	local var19 = 0
	local t = {}
	local var21 = createComputed(function(p5) --[[ line: 134 ]]
		-- upvalues: var13 (ref), var15 (ref)
		local var22 = var13(p5)
		local t = {}
		
		for i, v in var15(p5) do
			local var24 = var22[v]
			
			if var24 ~= nil then
				table.insert(t, var24)
			end
		end
		return t
	end)
	
	local function _(p6) --[[ line: 146 | named "mergeInfo" ]]
		-- upvalues: var13 (ref), var14 (ref)
		if #p6 == 0 then return end
		local cloned = table.clone(var13(false))
		
		for i, v in p6 do
			cloned[v.AssetId] = v
		end
		var14(cloned)
	end
	
	local _ = function(p7) --[[ line: 157 | named "extractIds" ]]
		local t = {}
		
		for i, v in p7 do
			table.insert(t, v.AssetId)
		end
		return t
	end
	
	return {
		getInfoMap = var13,
		getResults = var21,
		getSearchStatus = var17,
		search = function(p8, p9) --[[ line: 165 ]]
			-- upvalues: getFFlagMomentsCreationMusicSearchStateFixModule (copy), p4 (ref), var13 (ref), var14 (ref), var16 (ref), var19 (write), var18 (ref)
			if getFFlagMomentsCreationMusicSearchStateFixModule() then
				var19 += 1
				local var27 = var19
				var18("loading")
				var16({})
				task.spawn(function() --[[ line: 185 ]]
					-- upvalues: p4 (copy), p8 (ref), p9 (ref), var27 (ref), var19 (copy), var18 (copy), var13 (copy), var14 (copy), var16 (copy)
					local ok, status = pcall(p4.searchMusic, p8, p9 or 30)
					
					if var27 ~= var19 then return end
					if not ok then
						var18("error")
						
						return
					elseif #status ~= 0 then
						local cloned = table.clone(var13(false))
						
						for i, v in status do
							cloned[v.AssetId] = v
						end
						var14(cloned)
					end
					local t = {}
					
					for i, v in status do
						table.insert(t, v.AssetId)
					end
					var16(t)
					var18("success")
				end)
				
				return
			end
			task.spawn(function() --[[ line: 167 ]]
				-- upvalues: p4 (copy), p8 (ref), p9 (ref), var13 (copy), var14 (copy), var16 (copy)
				local ok, status = pcall(p4.searchMusic, p8, p9 or 30)
				
				if not ok then return end
				if #status ~= 0 then
					local cloned = table.clone(var13(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var14(cloned)
				end
				local t = {}
				
				for i, v in status do
					table.insert(t, v.AssetId)
				end
				var16(t)
			end)
		end,
		fetchInfo = function(p10) --[[ line: 201 ]]
			-- upvalues: var13 (ref), getFFlagMomentsCreationMusicSearchStateFixModule (copy), t (ref), p4 (ref), var14 (ref)
			if var13(false)[p10] ~= nil then return end
			if not getFFlagMomentsCreationMusicSearchStateFixModule() then
				task.spawn(function() --[[ line: 220 ]]
					-- upvalues: p4 (copy), p10 (ref), var13 (copy), var14 (copy)
					local ok, status = pcall(p4.getMetadata, { p10 })
					
					if ok then
						if #status == 0 then return end
						local cloned = table.clone(var13(false))
						
						for i, v in status do
							cloned[v.AssetId] = v
						end
						var14(cloned)
					end
				end)
				
				return
			elseif t[p10] then
				return
			end
			t[p10] = true
			task.spawn(function() --[[ line: 211 ]]
				-- upvalues: p4 (copy), p10 (ref), t (copy), var13 (copy), var14 (copy)
				local ok, status = pcall(p4.getMetadata, { p10 })
				t[p10] = nil
				
				if ok then
					if #status == 0 then return end
					local cloned = table.clone(var13(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var14(cloned)
				end
			end)
		end
	}
end