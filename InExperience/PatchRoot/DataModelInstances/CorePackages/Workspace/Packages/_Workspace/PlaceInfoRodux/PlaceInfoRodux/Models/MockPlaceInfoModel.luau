local generateStringId = require(script:FindFirstAncestor("PlaceInfoRodux").Parent.AppCommonLib).GenerateStringId
local placeInfoModelModule = require(script.Parent.PlaceInfoModel)
local t = {
	mock = function()
		-- upvalues: placeInfoModelModule (ref), generateStringId (ref)
		local name = placeInfoModelModule.new()
		name.builder = "builder"
		name.builderId = generateStringId()
		name.description = "description"
		name.imageToken = generateStringId()
		name.isPlayable = true
		name.name = "name"
		name.placeId = generateStringId()
		name.price = 0
		name.reasonProhibited = nil
		name.universeId = generateStringId()
		name.universeRootPlaceId = generateStringId()
		name.url = "url"
		
		return name
	end
}
setmetatable(t, { __index = placeInfoModelModule })

return t