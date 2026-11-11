local AvatarEditorService = game:GetService("AvatarEditorService")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function(ItemIds)
	-- upvalues: PromiseModule (copy), AvatarEditorService (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: () -> ())
		-- upvalues: AvatarEditorService (upval), ItemIds (copy)
		local Success, Result = pcall(function()
			-- upvalues: AvatarEditorService (upval), ItemIds (upval)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetBatchItemDetailsAsync(ItemIds, Enum.AvatarItemType.Asset) else AvatarEditorService:GetBatchItemDetails(ItemIds, Enum.AvatarItemType.Asset)
		end)
		
		if not Success then
			Callback()
			
			return
		end
		local Names = {}
		
		for _, value in ipairs(Result) do
			Names[value.Id] = value.Name
		end
		Callback1(Names)
	end)
end