local parent = script.Parent.Parent
local dashModule = require(parent.Parent.Dash)
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local list = {
	{
		contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png",
		filePath = "c://some/path/to/2231221_1818_1234598400000.png",
		type = captureTypeModule.Screenshot
	},
	{
		contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png",
		filePath = "c://some/path/to/2231221_14375697_1653030000000.png",
		type = captureTypeModule.Screenshot
	}
}
local list_1 = {
	{
		SourceUniverseId = 1,
		SourcePlaceId = 1,
		LocalId = "123",
		CaptureType = Enum.CaptureType.Screenshot,
		CaptureTime = DateTime.fromUnixTimestampMillis(1653030000000)
	},
	{
		SourceUniverseId = 2,
		SourcePlaceId = 2,
		LocalId = "321",
		TimeLength = 10,
		CaptureType = Enum.CaptureType.Video,
		CaptureTime = DateTime.fromUnixTimestampMillis(1653030000000)
	}
}

return function(p0, p1)
	-- upvalues: dashModule (ref), list_1 (ref), list (ref)
	local t = {}
	
	if p1 then
		for i = 1, p0 do
			table.insert(t, dashModule.joinDeep(list_1[i % #list_1 + 1], {}))
		end
		return t
	else
		for i_1 = 1, p0 do
			local var5 = dashModule.joinDeep(list[i_1 % #list + 1], {})
			var5.contentId = "rbxasset://textures/" .. ("/./"):rep(math.floor(i_1 / #list)) .. string.sub(var5.contentId, 21)
			table.insert(t, var5)
		end
		return t
	end
end