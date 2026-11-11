local CaptureService = game:GetService("CaptureService")
local Parent = script.Parent.Parent
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

function formatBytes(p1: number): string
	local list = {
		"Bytes",
		"KB",
		"MB",
		"GB",
		"TB"
	}
	local Floored = math.floor(math.log(p1) / 6.931471805599453)
	local Value = p1 / math.pow(1024, Floored)
	local Template = "%.2f%s"
	
	if Floored <= 2 then
		Value = math.round(Value)
		Template = "%d%s"
	end
	return if list[Floored + 1] then string.format(Template, Value, list[Floored + 1]) else ""
end

return function(List)
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), FFlagUseRbxstorageInGalleryModule (copy), CaptureTypeModule (copy), CaptureService (copy)
	if #List == 0 then return end
	local FilePaths = {}
	
	if not FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
		for _, value in ipairs(List) do
			if not FFlagUseRbxstorageInGalleryModule or value.type ~= CaptureTypeModule.Video then
				table.insert(FilePaths, value.filePath)
			end
		end
	end
	local _, Result = pcall(function()
		-- upvalues: CaptureService (upval), FilePaths (copy)
		return CaptureService:GetCaptureStorageSizeAsync(FilePaths)
	end)
	
	return formatBytes(Result)
end