local captureService = game:GetService("CaptureService")
local parent = script.Parent.Parent
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

function formatBytes(p1)
	local list = {
		"Bytes",
		"KB",
		"MB",
		"GB",
		"TB"
	}
	local floored = math.floor(math.log(p1) / 6.931471805599)
	local var1 = p1 / math.pow(1024, floored)
	local var2 = "%.2f%s"
	
	if floored <= 2 then
		var1 = math.round(var1)
		var2 = "%d%s"
	end
	return if list[floored + 1] then string.format(var2, var1, list[floored + 1]) else ""
end

return function(p1)
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
	local _, status = pcall(function()
		-- upvalues: captureService (copy), t (ref)
		return captureService:GetCaptureStorageSizeAsync(t)
	end)
	
	return formatBytes(status)
end