local guiService = game:GetService("GuiService")
local corePackages = script:FindFirstAncestor("CorePackages")
local ok, status = pcall(guiService.GetResolutionScale, guiService)
local parent = script.Parent
local getImageSetDataModule = require(parent.Generated.GetImageSetData)

if not ok or not require(parent.Flags).FixBlurryImages and not corePackages then
	status = 1
end
if guiService:IsTenFootInterface() then
	status = 3
end
return function() --[[ line: 21 | named "getResolutionScale" ]]
	-- upvalues: getImageSetDataModule (ref), status (write)
	local _, var3 = getImageSetDataModule(status)
	
	return var3
end