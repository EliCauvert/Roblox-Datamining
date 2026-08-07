local _ = require(script:FindFirstAncestor("AvatarExperienceSave").Context.AvatarSaveContext)
local getSaveDictModule = require(script.Parent.getSaveDict)

return function(p0, p1) --[[ line: 6 | named "checkHasChangesToSave" ]]
	-- upvalues: getSaveDictModule (ref)
	for i, v in getSaveDictModule(p0, p1) do
		if v then
			return true
		end
	end
	return false
end