local avatarEditorService = game:GetService("AvatarEditorService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function(p0) --[[ line: 6 ]]
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p1, p2) --[[ line: 7 ]]
		-- upvalues: avatarEditorService (copy), p0 (ref)
		local ok, status = pcall(function() --[[ line: 8 ]]
			-- upvalues: avatarEditorService (copy), p0 (copy)
			return avatarEditorService:GetBatchItemDetailsAsync(p0, Enum.AvatarItemType.Asset)
		end)
		
		if not ok then
			p2()
			
			return
		end
		local t = {}
		
		for i, v in ipairs(status) do
			t[v.Id] = v.Name
		end
		p1(t)
	end)
end