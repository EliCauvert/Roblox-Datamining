local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FIntAXCarouselWidgetMaxItemsModule = require(Modules.AvatarExperience.Flags.FIntAXCarouselWidgetMaxItems)
local GetFFlagAXDisableWidgetHydrationCacheForLooksModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableWidgetHydrationCacheForLooks)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)

return function(p1, p2, p3)
	-- upvalues: CryoModule (copy), FIntAXCarouselWidgetMaxItemsModule (copy), GetFFlagAXDisableWidgetHydrationCacheForLooksModule (copy), ConstantsModule (copy)
	local ContentEntries = {}
	
	if p1 and p1.content and not CryoModule.isEmpty(p1.content) then
		local Smallest = if p3 then p3 else math.min(#p1.content, FIntAXCarouselWidgetMaxItemsModule)
		for i = 1, Smallest do
			local ContentEntry = p1.content[i]
			
			if ContentEntry and (GetFFlagAXDisableWidgetHydrationCacheForLooksModule() and ContentEntry.type == ConstantsModule.ItemType.Look or not p2[ContentEntry.type] or not p2[ContentEntry.type][tostring(ContentEntry.id)]) then
				table.insert(ContentEntries, ContentEntry)
			end
		end
	end
	return ContentEntries
end