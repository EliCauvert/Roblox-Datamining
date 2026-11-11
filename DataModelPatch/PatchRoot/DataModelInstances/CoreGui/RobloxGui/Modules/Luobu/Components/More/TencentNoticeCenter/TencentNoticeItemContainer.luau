local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local MemStorageService = game:GetService("MemStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local _DateTime = require(CorePackages.Workspace.Packages.Time).DateTime
local TimeZone = require(CorePackages.Workspace.Packages.Time).TimeZone
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AppPageModule = require(Modules.LuaApp.AppPage)
local NoticeListCellModule = require(Modules.Luobu.Components.More.TencentNoticeCenter.NoticeListCell)
local DecrementUnreadTencentNoticeCountModule = require(Modules.Luobu.Actions.DecrementUnreadTencentNoticeCount)
local ReadTencentNoticeIdModule = require(Modules.Luobu.Actions.ReadTencentNoticeId)
local TencentNoticeTypeModule = require(Modules.Luobu.Enum.TencentNoticeType)
local MemStorageKeysModule = require(Modules.Luobu.Enum.MemStorageKeys)
local TencentNoticeItemContainer = RoactModule.PureComponent:extend("TencentNoticeItemContainer")
TencentNoticeItemContainer.validateProps = TModule.strictInterface({
	layoutInfo = TModule.table,
	item = TModule.optional(TModule.table),
	dateText = TModule.optional(TModule.string),
	navigateDown = TModule.callback,
	decrementUnreadTencentNoticeCount = TModule.callback,
	readTencentNoticeId = TModule.callback,
	noticeReadStatus = TModule.table
})

local function _(p1)
	-- upvalues: _DateTime (copy), LocalizationService (copy), TimeZone (copy)
	local FromUnixTimestampResult = _DateTime.fromUnixTimestamp(p1)
	
	return (FromUnixTimestampResult:GetLongRelativeTime(FromUnixTimestampResult, TimeZone.Current, LocalizationService.RobloxLocaleId))
end

function TencentNoticeItemContainer.init(p1)
	-- upvalues: TencentNoticeTypeModule (copy), AppPageModule (copy)
	function p1.onActivated()
		-- upvalues: p1 (copy), TencentNoticeTypeModule (upval), AppPageModule (upval)
		local Item = p1.props.item
		
		if Item.type == TencentNoticeTypeModule.Web then
			p1.props.navigateDown({
				name = AppPageModule.GenericWebPage,
				detail = Item.webTypeUrl or Item.noticeUrl,
				extraProps = { title = Item.title }
			})
		else
			p1.props.navigateDown({
				name = AppPageModule.TencentNoticeContent,
				extraProps = { notice = Item, dateText = p1.props.dateText }
			})
		end
		local NoticeReadStatus = p1.props.noticeReadStatus
		
		if (Item.hasRead or (NoticeReadStatus[Item.noticeId] or false)) == false then
			p1:fireNoticeIdHasRead(Item.noticeId, Item.endTime)
		end
	end
end

function TencentNoticeItemContainer.fireNoticeIdHasRead(p1, NoticeId, EndTime)
	-- upvalues: MemStorageService (copy), MemStorageKeysModule (copy), HttpService (copy)
	MemStorageService:Fire(MemStorageKeysModule.TencentNoticeIdReadStatus, HttpService:JSONEncode({ noticeId = NoticeId, endTime = EndTime }))
	p1.props.decrementUnreadTencentNoticeCount()
	p1.props.readTencentNoticeId(NoticeId)
end

function TencentNoticeItemContainer.render(p1)
	-- upvalues: RoactModule (copy), NoticeListCellModule (copy), CryoModule (copy)
	return RoactModule.createElement(NoticeListCellModule, CryoModule.Dictionary.join(p1.props.layoutInfo, {
		item = p1.props.item,
		dateText = p1.props.dateText,
		onActivated = p1.onActivated
	}))
end

return (RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: _DateTime (copy), LocalizationService (copy), TimeZone (copy)
	local StartTime = p2.item and p2.item.startTime or nil
	local t = {}
	local LongRelativeTime = nil
	
	if StartTime then
		local FromUnixTimestampResult = _DateTime.fromUnixTimestamp(StartTime)
		LongRelativeTime = FromUnixTimestampResult:GetLongRelativeTime(FromUnixTimestampResult, TimeZone.Current, LocalizationService.RobloxLocaleId) or nil
	else
		LongRelativeTime = nil
	end
	t.dateText = LongRelativeTime
	t.noticeReadStatus = p1.Luobu.TencentNoticeReadStatus
	
	return t
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), DecrementUnreadTencentNoticeCountModule (copy), ReadTencentNoticeIdModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end,
		decrementUnreadTencentNoticeCount = function()
			-- upvalues: Callback (copy), DecrementUnreadTencentNoticeCountModule (upval)
			return Callback(DecrementUnreadTencentNoticeCountModule())
		end,
		readTencentNoticeId = function(p1)
			-- upvalues: Callback (copy), ReadTencentNoticeIdModule (upval)
			return Callback(ReadTencentNoticeIdModule(p1))
		end
	}
end)(TencentNoticeItemContainer))