local ContactImporter = script:FindFirstAncestor("ContactImporter")
local Jest = require(ContactImporter.devDependencies).jest
local Promise = require(ContactImporter.dependencies).Promise

return function()
	-- upvalues: Jest (copy), Promise (copy)
	return {
		default = {
			sendSMS = Jest.fn().mockReturnValue(Promise.resolve(true)),
			supportsSMS = Jest.fn().mockReturnValue(Promise.resolve(true))
		}
	}
end