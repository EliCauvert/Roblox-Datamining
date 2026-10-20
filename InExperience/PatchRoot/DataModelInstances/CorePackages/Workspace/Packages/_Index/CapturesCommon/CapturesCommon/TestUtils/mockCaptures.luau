local Parent = script.Parent.Parent
local DashModule = require(Parent.Parent.Dash)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local list = {
	{
		contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png",
		filePath = "c://some/path/to/2231221_1818_1234598400000.png",
		type = CaptureTypeModule.Screenshot
	},
	{
		contentId = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png",
		filePath = "c://some/path/to/2231221_14375697_1653030000000.png",
		type = CaptureTypeModule.Screenshot
	}
}
local list1 = {
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

return function(p1, p2)
	-- upvalues: DashModule (copy), list1 (copy), list (copy)
	local JoinDeepResults = {}
	
	if p2 then
		for i = 1, p1 do
			table.insert(JoinDeepResults, (DashModule.joinDeep(list1[i % #list1 + 1], {})))
		end
		return JoinDeepResults
	else
		for i1 = 1, p1 do
			local JoinDeepResult = DashModule.joinDeep(list[i1 % #list + 1], {})
			JoinDeepResult.contentId = "rbxasset://textures/" .. ("/./"):rep((math.floor(i1 / #list))) .. string.sub(JoinDeepResult.contentId, 21)
			table.insert(JoinDeepResults, JoinDeepResult)
		end
		return JoinDeepResults
	end
end