local AvatarEditorService = game:GetService("AvatarEditorService")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function(ItemIds) --[[ Line: 6 ]]
	-- upvalues: PromiseModule (copy), AvatarEditorService (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: () -> ()) --[[ Line: 7 ]]
		-- upvalues: AvatarEditorService (upval), ItemIds (copy)
		local Success, Result = pcall(function() --[[ Line: 8 ]]
			-- upvalues: AvatarEditorService (upval), ItemIds (upval)
			return AvatarEditorService:GetBatchItemDetailsAsync(ItemIds, Enum.AvatarItemType.Asset)
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