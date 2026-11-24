local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(AvatarWorkshop.Utils.createOutfitRequestFromAvatarState)
local OutfitsName: string = `{HttpModule.Url.AVATAR_URL}v4/outfits/create`

local function decodeOutfitId(p1)
	local Id = if p1 then p1.id else nil
	
	return if typeof(Id) == "number" then Id else nil
end

return function(Body, Network)
	-- upvalues: HttpClientModule (copy), OutfitsName (copy), decodeOutfitId (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "POST",
		legacy = true,
		analyticsKey = "avatar.outfits.create.post",
		retry = false,
		network = Network,
		url = OutfitsName,
		body = Body,
		decode = decodeOutfitId
	}))
end