local TModule = require(game:GetService("CorePackages").Packages.t)
local TencentNoticeModelModule = {
	validateJson = TModule.interface({
		NoticeId = TModule.string,
		Scene = TModule.string,
		Type = TModule.string,
		StartTime = TModule.string,
		EndTime = TModule.string,
		Title = TModule.optional(TModule.string),
		HasRead = TModule.optional(TModule.boolean),
		Content = TModule.optional(TModule.string),
		NoticeUrl = TModule.optional(TModule.string),
		WebTypeUrl = TModule.optional(TModule.string),
		LandscapePicUrl = TModule.optional(TModule.string),
		PortraitPicUrl = TModule.optional(TModule.string)
	}),
	new = function()
		return {}
	end
}

function TencentNoticeModelModule.mock()
	-- upvalues: TencentNoticeModelModule (copy)
	local NewTencentNoticeModel = TencentNoticeModelModule.new()
	NewTencentNoticeModel.noticeId = 117617
	NewTencentNoticeModel.scene = "2"
	NewTencentNoticeModel.type = "Image"
	NewTencentNoticeModel.hasRead = false
	NewTencentNoticeModel.startTime = 1605686400
	NewTencentNoticeModel.endTime = 1614499200
	NewTencentNoticeModel.title = "Luobu"
	NewTencentNoticeModel.noticeUrl = "https://www.roblox.cn/"
	
	return NewTencentNoticeModel
end

local function _(p1)
	return if p1 == "" or p1 == " " then nil else p1
end

function TencentNoticeModelModule.fromJsonData(p1)
	-- upvalues: TencentNoticeModelModule (copy)
	assert(TencentNoticeModelModule.validateJson(p1), "Error: TencentNotice JSON file is not valid.")
	local NewTencentNoticeModel = TencentNoticeModelModule.new()
	NewTencentNoticeModel.noticeId = tonumber(p1.NoticeId)
	NewTencentNoticeModel.scene = p1.Scene
	NewTencentNoticeModel.startTime = tonumber(p1.StartTime)
	NewTencentNoticeModel.endTime = tonumber(p1.EndTime)
	NewTencentNoticeModel.hasRead = p1.HasRead
	NewTencentNoticeModel.title = p1.Title
	NewTencentNoticeModel.content = p1.Content
	NewTencentNoticeModel.type = p1.Type
	local NoticeUrl = p1.NoticeUrl
	NewTencentNoticeModel.noticeUrl = if NoticeUrl == "" or NoticeUrl == " " then nil else NoticeUrl
	local WebTypeUrl = p1.WebTypeUrl
	NewTencentNoticeModel.webTypeUrl = if WebTypeUrl == "" or WebTypeUrl == " " then nil else WebTypeUrl
	NewTencentNoticeModel.landscapePicUrl = p1.LandscapePicUrl
	NewTencentNoticeModel.portraitPicUrl = p1.PortraitPicUrl
	
	return NewTencentNoticeModel
end

return TencentNoticeModelModule