local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local TencentNoticeModelModule = require(Modules.Luobu.Models.TencentNoticeModel)
local SetTencentNoticeInfoModule = require(Modules.Luobu.Actions.SetTencentNoticeInfo)
local SetTencentNoticeBadgeCountModule = require(Modules.Luobu.Actions.SetTencentNoticeBadgeCount)
local ReadTencentNoticeIdModule = require(Modules.Luobu.Actions.ReadTencentNoticeId)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local TencentNoticeSceneTypeModule = require(Modules.Luobu.Enum.TencentNoticeSceneType)
local TencentNoticeTypeModule = require(Modules.Luobu.Enum.TencentNoticeType)
local FFlagLuobuCJVMorePageShowTencentNoticeModule = require(Modules.Luobu.Flags.FFlagLuobuCJVMorePageShowTencentNotice)
local FFlagLuobuShowTencentNoticePopupModule = require(Modules.Luobu.Flags.FFlagLuobuShowTencentNoticePopup)
local TencentNoticeEventReceiver = require(Modules.Common.Roact).Component:extend("TencentNoticeEventReceiver")

function TencentNoticeEventReceiver.init(p1)
	-- upvalues: TencentNoticeModelModule (copy), TencentNoticeTypeModule (copy), TencentNoticeSceneTypeModule (copy), FFlagLuobuShowTencentNoticePopupModule (copy), FFlagLuobuCJVMorePageShowTencentNoticeModule (copy)
	p1.connections = {
		p1.props.RobloxEventReceiver:observeEvent("SyncTencentNoticeInformation", function(List, AfterLogin)
			-- upvalues: TencentNoticeModelModule (upval), TencentNoticeTypeModule (upval), TencentNoticeSceneTypeModule (upval), p1 (copy), FFlagLuobuShowTencentNoticePopupModule (upval), FFlagLuobuCJVMorePageShowTencentNoticeModule (upval)
			local FromJsonDataResults = {}
			local FromJsonDataResults1 = {}
			local FromJsonDataResults2 = {}
			local Count = 0
			
			for _, value in ipairs(List) do
				local FromJsonDataResult = TencentNoticeModelModule.fromJsonData(value)
				
				if FromJsonDataResult ~= nil then
					table.insert(FromJsonDataResults2, FromJsonDataResult)
					
					if FromJsonDataResult.hasRead == false then
						Count += 1
						
						if FromJsonDataResult.type == TencentNoticeTypeModule.Text or FromJsonDataResult.type == TencentNoticeTypeModule.Image then
							if FromJsonDataResult.scene == TencentNoticeSceneTypeModule.BeforeLogin then
								table.insert(FromJsonDataResults, FromJsonDataResult)
							elseif FromJsonDataResult.scene == TencentNoticeSceneTypeModule.AfterLogin then
								table.insert(FromJsonDataResults1, FromJsonDataResult)
							end
						end
					else
						p1.props.readTencentNoticeId(FromJsonDataResult.noticeId)
					end
				end
			end
			if FFlagLuobuShowTencentNoticePopupModule then
				if AfterLogin == TencentNoticeSceneTypeModule.AfterLogin and #FromJsonDataResults1 > 0 then
					p1.props.openTencentNoticePopup(FromJsonDataResults1)
				elseif AfterLogin == TencentNoticeSceneTypeModule.BeforeLogin and #FromJsonDataResults > 0 then
					p1.props.openTencentNoticePopup(FromJsonDataResults)
				end
			end
			if FFlagLuobuCJVMorePageShowTencentNoticeModule then
				p1.props.setTencentNoticeInfo(FromJsonDataResults2)
				
				if Count > 0 then
					p1.props.setTencentNoticeBadgeCount(Count)
				end
			end
		end)
	}
end

function TencentNoticeEventReceiver:render() end

function TencentNoticeEventReceiver.willUnmount(p2)
	for _, connection in pairs(p2.connections) do
		connection:disconnect()
	end
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy), SetTencentNoticeInfoModule (copy), ReadTencentNoticeIdModule (copy), SetTencentNoticeBadgeCountModule (copy)
	return {
		openTencentNoticePopup = function(NoticeList)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			return Callback(SetCentralOverlayModule(OverlayTypeModule.TencentNoticePopup, { noticeList = NoticeList }))
		end,
		setTencentNoticeInfo = function(p3)
			-- upvalues: Callback (copy), SetTencentNoticeInfoModule (upval)
			return Callback(SetTencentNoticeInfoModule(p3))
		end,
		readTencentNoticeId = function(p3)
			-- upvalues: Callback (copy), ReadTencentNoticeIdModule (upval)
			return Callback(ReadTencentNoticeIdModule(p3))
		end,
		setTencentNoticeBadgeCount = function(p3)
			-- upvalues: Callback (copy), SetTencentNoticeBadgeCountModule (upval)
			return Callback(SetTencentNoticeBadgeCountModule(p3))
		end
	}
end)(TencentNoticeEventReceiver))