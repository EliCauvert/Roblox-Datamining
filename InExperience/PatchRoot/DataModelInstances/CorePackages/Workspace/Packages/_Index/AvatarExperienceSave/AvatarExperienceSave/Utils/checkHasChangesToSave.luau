local _ = require(script:FindFirstAncestor("AvatarExperienceSave").Context.AvatarSaveContext)
local GetSaveDictModule = require(script.Parent.getSaveDict)

return function(p1, p2): boolean --[[ Line: 6 | Named "checkHasChangesToSave" ]]
	-- upvalues: GetSaveDictModule (copy)
	for _, value in GetSaveDictModule(p1, p2) do
		if value then
			return true
		end
	end
	return false
end