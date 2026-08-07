local captureService = game:GetService("CaptureService")
local parent = script.Parent.Parent
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

function formatBytes(p0) --[[ line: 12 ]]
	local list = {
		"Bytes",
		"KB",
		"MB",
		"GB",
		"TB"
	}
	local floored = math.floor(math.log(p0) / 6.931471805599)
	local var6 = p0 / math.pow(1024, floored)
	local var7 = "%.2f%s"
	
	if floored <= 2 then
		var6 = math.round(var6)
		var7 = "%d%s"
	end
	return if list[floored + 1] then string.format(var7, var6, list[floored + 1]) else ""
end

return function(p1) --[[ line: 31 | named "getCaptureStorageUsage" ]]
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), fFlagUseRbxstorageInGalleryModule (ref), captureTypeModule (ref), captureService (ref)
	if #p1 == 0 then return end
	local t = {}
	
	if not fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		for i, v in ipairs(p1) do
			if not fFlagUseRbxstorageInGalleryModule or v.type ~= captureTypeModule.Video then
				table.insert(t, v.filePath)
			end
		end
	end
	local _, status = pcall(function() --[[ line: 47 ]]
		-- upvalues: captureService (copy), t (ref)
		return captureService:GetCaptureStorageSizeAsync(t)
	end)
	
	return formatBytes(status)
end