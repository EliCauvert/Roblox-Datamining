local Parent = script.Parent.Parent
local PostTypeModule = require(Parent.Enums.PostType)
local _ = require(Parent.Types)

return function(List)
	-- upvalues: PostTypeModule (copy)
	local UploadedAtTimestamp = 1
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, {
			caption = "caption",
			creatorUserId = 1,
			experienceContext = {
				placeId = "456",
				experienceId = value.experienceId or "123"
			},
			postId = value.postId or "123",
			screenshotMetadata = { height = 101, width = 101, fullSizeUrl = "" },
			type = PostTypeModule.Screenshot,
			uploadedAtTimestamp = UploadedAtTimestamp
		})
		UploadedAtTimestamp += 1
	end
	return List1
end