-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

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