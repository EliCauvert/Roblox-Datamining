local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local dashModule = require(momentsCreation.Parent.Dash)
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Types.Music)

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

return function(p2)
	-- upvalues: dashModule (ref), constantsModule (ref), formatMusic (ref)
	local function _()
		-- upvalues: p2 (ref)
		return p2 or game:GetService("AssetService")
	end
	
	return {
		searchMusic = function(p3, p4)
			-- upvalues: p2 (ref), dashModule (copy), constantsModule (copy), formatMusic (copy)
			local p5 = p2 or game:GetService("AssetService")
			local audioSearchParams = Instance.new("AudioSearchParams")
			audioSearchParams.SearchKeyword = p3
			audioSearchParams.AudioSubType = Enum.AudioSubType.Music
			audioSearchParams.MinDuration = p4
			local t = {}
			
			for i, v in p5:SearchAudio(audioSearchParams):GetCurrentPage() do
				if not dashModule.includes(constantsModule.SearchMusicCreatorDenylist, v.Creator.Id) then
					table.insert(t, v.Id)
				end
			end
			return if #t == 0 then {} else formatMusic(p5:GetAudioMetadataAsync(t))
		end,
		getMetadata = function(p6)
			-- upvalues: formatMusic (copy), p2 (ref)
			return formatMusic((p2 or game:GetService("AssetService")):GetAudioMetadataAsync(p6))
		end
	}
end