local guiService = game:GetService("GuiService")
local ok, status = pcall(guiService.GetResolutionScale, guiService)
local getImageSetDataModule = require(script.Parent.Generated.GetImageSetData)

if not ok then
	status = 1
end
if guiService:IsTenFootInterface() then
	status = 3
end
return function() --[[ line: 18 | named "getResolutionScale" ]]
	-- upvalues: getImageSetDataModule (ref), status (write)
	local _, var2 = getImageSetDataModule(status)
	
	return var2
end