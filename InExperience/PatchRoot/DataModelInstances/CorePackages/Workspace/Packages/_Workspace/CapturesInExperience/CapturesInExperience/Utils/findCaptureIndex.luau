local Parent = script.Parent.Parent
local _ = require(Parent.Types)
local GetCaptureObjectModule = require(Parent.Utils.getCaptureObject)

return function(List, p1, FilePath)
	-- upvalues: GetCaptureObjectModule (copy)
	local LocalId = p1.LocalId
	
	for i, value in List do
		if FilePath and typeof(value) == "table" and value.filePath == FilePath then
			return i
		end
		local CaptureObjectModule = GetCaptureObjectModule(value)
		
		if LocalId and CaptureObjectModule and CaptureObjectModule.LocalId == LocalId then
			return i
		end
	end
	return nil
end