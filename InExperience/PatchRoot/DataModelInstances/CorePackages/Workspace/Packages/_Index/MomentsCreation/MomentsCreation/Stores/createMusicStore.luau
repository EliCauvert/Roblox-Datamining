local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local signalsModule = require(parent.Signals)
local constantsModule = require(momentsCreation.Constants)
local getFFlagMomentsCreationMusicSearchStateFixModule = require(momentsCreation.Flags.GetFFlagMomentsCreationMusicSearchStateFix)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

local function makeDefaultSource()
	-- upvalues: dashModule (ref), constantsModule (ref)
	local function formatMusic(p1)
		local t = {}
		
		for i, v in p1 do
			local var1 = tonumber(v.AssetId)
			
			if var1 ~= nil and v.RecordingCode ~= nil then
				table.insert(t, {
					Artist = v.Artist,
					AssetId = var1,
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
		searchMusic = function(p2, p3)
			-- upvalues: dashModule (copy), constantsModule (copy), formatMusic (ref)
			local assetService = game:GetService("AssetService")
			local audioSearchParams = Instance.new("AudioSearchParams")
			audioSearchParams.SearchKeyword = p2
			audioSearchParams.AudioSubType = Enum.AudioSubType.Music
			audioSearchParams.MinDuration = p3
			local t = {}
			
			for i, v in assetService:SearchAudio(audioSearchParams):GetCurrentPage() do
				if not dashModule.includes(constantsModule.SearchMusicCreatorFilter, v.Creator.Id) then
					table.insert(t, v.Id)
				end
			end
			return if #t == 0 then {} else formatMusic(assetService:GetAudioMetadataAsync(t))
		end,
		getMetadata = function(p4)
			-- upvalues: formatMusic (ref)
			return formatMusic(game:GetService("AssetService"):GetAudioMetadataAsync(p4))
		end
	}
end

return function(p2)
	-- upvalues: makeDefaultSource (ref), createSignal (ref), createComputed (ref), getFFlagMomentsCreationMusicSearchStateFixModule (ref)
	p2 = p2 or makeDefaultSource()
	local var2, var3 = createSignal({})
	local var4, var5 = createSignal({})
	local var6, var7 = createSignal("idle")
	local var8 = 0
	local t = {}
	local var9 = createComputed(function(p3)
		-- upvalues: var2 (ref), var4 (ref)
		local var10 = var2(p3)
		local t = {}
		
		for i, v in var4(p3) do
			local var11 = var10[v]
			
			if var11 ~= nil then
				table.insert(t, var11)
			end
		end
		return t
	end)
	
	local function _(p4)
		-- upvalues: var2 (ref), var3 (ref)
		if #p4 == 0 then return end
		local cloned = table.clone(var2(false))
		
		for i, v in p4 do
			cloned[v.AssetId] = v
		end
		var3(cloned)
	end
	
	local _ = function(p5)
		local t = {}
		
		for i, v in p5 do
			table.insert(t, v.AssetId)
		end
		return t
	end
	
	return {
		getInfoMap = var2,
		getResults = var9,
		getSearchStatus = var6,
		search = function(p6, p7)
			-- upvalues: getFFlagMomentsCreationMusicSearchStateFixModule (copy), p2 (ref), var2 (ref), var3 (ref), var5 (ref), var8 (write), var7 (ref)
			if getFFlagMomentsCreationMusicSearchStateFixModule() then
				var8 += 1
				local var12 = var8
				var7("loading")
				var5({})
				task.spawn(function()
					-- upvalues: p2 (copy), p6 (ref), p7 (ref), var12 (ref), var8 (copy), var7 (copy), var2 (copy), var3 (copy), var5 (copy)
					local ok, status = pcall(p2.searchMusic, p6, p7 or 30)
					
					if var12 ~= var8 then return end
					if not ok then
						var7("error")
						
						return
					elseif #status ~= 0 then
						local cloned = table.clone(var2(false))
						
						for i, v in status do
							cloned[v.AssetId] = v
						end
						var3(cloned)
					end
					local t = {}
					
					for i, v in status do
						table.insert(t, v.AssetId)
					end
					var5(t)
					var7("success")
				end)
				
				return
			end
			task.spawn(function()
				-- upvalues: p2 (copy), p6 (ref), p7 (ref), var2 (copy), var3 (copy), var5 (copy)
				local ok, status = pcall(p2.searchMusic, p6, p7 or 30)
				
				if not ok then return end
				if #status ~= 0 then
					local cloned = table.clone(var2(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var3(cloned)
				end
				local t = {}
				
				for i, v in status do
					table.insert(t, v.AssetId)
				end
				var5(t)
			end)
		end,
		fetchInfo = function(p8)
			-- upvalues: var2 (ref), getFFlagMomentsCreationMusicSearchStateFixModule (copy), t (ref), p2 (ref), var3 (ref)
			if var2(false)[p8] ~= nil then return end
			if not getFFlagMomentsCreationMusicSearchStateFixModule() then
				task.spawn(function()
					-- upvalues: p2 (copy), p8 (ref), var2 (copy), var3 (copy)
					local ok, status = pcall(p2.getMetadata, { p8 })
					
					if ok then
						if #status == 0 then return end
						local cloned = table.clone(var2(false))
						
						for i, v in status do
							cloned[v.AssetId] = v
						end
						var3(cloned)
					end
				end)
				
				return
			elseif t[p8] then
				return
			end
			t[p8] = true
			task.spawn(function()
				-- upvalues: p2 (copy), p8 (ref), t (copy), var2 (copy), var3 (copy)
				local ok, status = pcall(p2.getMetadata, { p8 })
				t[p8] = nil
				
				if ok then
					if #status == 0 then return end
					local cloned = table.clone(var2(false))
					
					for i, v in status do
						cloned[v.AssetId] = v
					end
					var3(cloned)
				end
			end)
		end
	}
end