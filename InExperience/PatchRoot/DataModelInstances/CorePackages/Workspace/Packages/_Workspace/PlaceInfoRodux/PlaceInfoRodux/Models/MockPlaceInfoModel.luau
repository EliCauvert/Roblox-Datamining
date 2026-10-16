local GenerateStringIdFunction = require(script:FindFirstAncestor("PlaceInfoRodux").Parent.AppCommonLib).GenerateStringId
local PlaceInfoModelModule = require(script.Parent.PlaceInfoModel)
local MockPlaceInfoModelModule = {
	mock = function() --[[ Line: 11 ]]
		-- upvalues: PlaceInfoModelModule (copy), GenerateStringIdFunction (copy)
		local NewPlaceInfoModel = PlaceInfoModelModule.new()
		NewPlaceInfoModel.builder = "builder"
		NewPlaceInfoModel.builderId = GenerateStringIdFunction()
		NewPlaceInfoModel.description = "description"
		NewPlaceInfoModel.imageToken = GenerateStringIdFunction()
		NewPlaceInfoModel.isPlayable = true
		NewPlaceInfoModel.name = "name"
		NewPlaceInfoModel.placeId = GenerateStringIdFunction()
		NewPlaceInfoModel.price = 0
		NewPlaceInfoModel.reasonProhibited = nil
		NewPlaceInfoModel.universeId = GenerateStringIdFunction()
		NewPlaceInfoModel.universeRootPlaceId = GenerateStringIdFunction()
		NewPlaceInfoModel.url = "url"
		
		return NewPlaceInfoModel
	end
}
setmetatable(MockPlaceInfoModelModule, { __index = PlaceInfoModelModule })

return MockPlaceInfoModelModule