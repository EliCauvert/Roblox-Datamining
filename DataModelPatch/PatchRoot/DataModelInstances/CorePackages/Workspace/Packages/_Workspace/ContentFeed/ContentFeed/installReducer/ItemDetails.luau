local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local GetAssetInfoModule = require(Parent.Utils.getAssetInfo)

return require(Parent1.Rodux).createReducer({}, {
	[require(Parent.App.Networking).NetworkingCurrentlyWearing.GetItemDetails.Succeeded.name] = function(p1, p2)
		-- upvalues: GetAssetInfoModule (copy), CryoModule (copy)
		local FromAssetResults = {}
		
		for _, entry in p2.responseBody.data do
			local FromAssetResult = GetAssetInfoModule.fromAsset(entry)
			FromAssetResults[FromAssetResult.id] = FromAssetResult
		end
		return CryoModule.Dictionary.join(p1, FromAssetResults)
	end
})