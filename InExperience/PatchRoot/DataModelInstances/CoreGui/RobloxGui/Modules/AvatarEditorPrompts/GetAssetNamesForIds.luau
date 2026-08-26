local avatarEditorService = game:GetService("AvatarEditorService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function(p1)
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: avatarEditorService (copy), p1 (ref)
		local ok, status = pcall(function()
			-- upvalues: avatarEditorService (copy), p1 (copy)
			return avatarEditorService:GetBatchItemDetailsAsync(p1, Enum.AvatarItemType.Asset)
		end)
		
		if not ok then
			p3()
			
			return
		end
		local t = {}
		
		for i, v in ipairs(status) do
			t[v.Id] = v.Name
		end
		p2(t)
	end)
end