local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local MemStorageService = game:GetService("MemStorageService")
local HttpService = game:GetService("HttpService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local EventConnection = require(CorePackages.Packages.ReactUtils).EventConnection
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local OpenWebviewModule = require(Modules.LuaApp.Thunks.OpenWebview)
local DecrementUnreadTencentNoticeCountModule = require(Modules.Luobu.Actions.DecrementUnreadTencentNoticeCount)
local ReadTencentNoticeIdModule = require(Modules.Luobu.Actions.ReadTencentNoticeId)
local NoticePageControlItemModule = require(Modules.Luobu.Components.TencentNoticePopup.NoticePageControlItem)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local MemStorageKeysModule = require(Modules.Luobu.Enum.MemStorageKeys)
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
local config = { dampingRatio = 1, frequency = 10 }
local NoticePageControl = RoactModule.PureComponent:extend("NoticePageControl")
NoticePageControl.validateProps = TModule.strictInterface({
	noticeList = TModule.table,
	onActivated = TModule.callback,
	settings = TModule.strictInterface({
		widePopupWidth = TModule.number,
		widePopupHeight = TModule.number,
		headerHeight = TModule.number,
		bottomHeight = TModule.number,
		compactHeightToWidthRatio = TModule.number
	}),
	formFactor = TModule.string,
	screenSize = TModule.Vector2,
	openNoticeDetail = TModule.callback,
	decrementUnreadTencentNoticeCount = TModule.callback,
	readTencentNoticeId = TModule.callback
})

function NoticePageControl.checkInsidePage(p1, X: number, Y): boolean
	-- upvalues: FormFactor (copy)
	local X1: number = p1.props.screenSize.X
	local Y1 = p1.props.screenSize.Y
	local BottomHeight = p1.props.settings.bottomHeight
	
	if p1.props.formFactor == FormFactor.WIDE then
		local XRatio = (X1 - p1.props.settings.widePopupWidth) / 2
		local YRatio = (Y1 - p1.props.settings.widePopupWidth) / 2
		
		if X < XRatio or X1 - XRatio < X then
			return false
		elseif Y < YRatio or Y1 - YRatio - BottomHeight < Y then
			return false
		end
	else
		if X < 24 or X1 - 24 < X then
			return false
		end
		local YRatio = (Y1 - p1.topHeight) / 2
		
		if Y < YRatio or Y1 - YRatio - BottomHeight < Y then
			return false
		end
	end
	return true
end

function NoticePageControl.init(p1)
	-- upvalues: RoactModule (copy), MemStorageService (copy), MemStorageKeysModule (copy), HttpService (copy), FormFactor (copy), OtterModule (copy), config (copy)
	p1.state = { selectedValue = 1 }
	p1.positionX, p1.updatePositionX = RoactModule.createBinding(0)
	
	function p1.touchTapCallback(Entry)
		-- upvalues: p1 (copy), MemStorageService (upval), MemStorageKeysModule (upval), HttpService (upval), FormFactor (upval), OtterModule (upval), config (upval)
		local Notice = p1.props.noticeList[p1.state.selectedValue]
		
		if Notice.noticeUrl == nil then return end
		if p1:checkInsidePage(Entry[1].X, Entry[1].Y) == false then return end
		p1.props.openNoticeDetail(Notice.noticeUrl, p1.props.noticeList[p1.state.selectedValue].title)
		
		if Notice.hasRead == false then
			MemStorageService:Fire(MemStorageKeysModule.TencentNoticeIdReadStatus, HttpService:JSONEncode({ noticeId = Notice.noticeId, endTime = Notice.endTime }))
		end
		p1.props.decrementUnreadTencentNoticeCount()
		p1.props.readTencentNoticeId(Notice.noticeId)
		local SelectedValue: number = p1.state.selectedValue
		
		if SelectedValue == #p1.props.noticeList then
			p1.props.onActivated()
			
			return
		else
			local WidePopupWidth = p1.props.settings.widePopupWidth
			local ScaledSelectedValue = (p1.props.formFactor == FormFactor.WIDE and WidePopupWidth or p1.compactWidth) * SelectedValue
			p1:setState({ selectedValue = SelectedValue + 1 })
			p1.motor:setGoal(OtterModule.spring(ScaledSelectedValue, config))
		end
	end
	
	p1.goalLocation = 0
	p1.compactWidth = p1.props.screenSize.X - 48
	
	function p1.touchMoveCallback(p2)
		-- upvalues: p1 (copy), FormFactor (upval), OtterModule (upval), config (upval)
		local X = p2.Position.X
		local Y = p2.Position.Y
		
		if p1.isMoving or p1:checkInsidePage(X, Y) == false then return end
		local WidePopupWidth = p1.props.settings.widePopupWidth
		local WidePopupWidth1 = p1.props.formFactor == FormFactor.WIDE and WidePopupWidth or p1.compactWidth
		
		if math.abs(p2.Delta.X) > 20 then
			local ClampedValue = math.clamp(p1.state.selectedValue - math.sign(p2.Delta.X), 1, #p1.props.noticeList)
			p1:setState({ selectedValue = ClampedValue })
			local ScaledWidePopupWidth = WidePopupWidth1 * (ClampedValue - 1)
			p1.motor:setGoal(OtterModule.spring(ScaledWidePopupWidth, config))
			p1.goalLocation = ScaledWidePopupWidth
			p1.isMoving = true
		end
	end
	
	p1.motor = OtterModule.createSingleMotor(1)
	p1.motor:onStep(function(p2)
		-- upvalues: p1 (copy)
		local Magnitude = math.abs(p2 - p1.goalLocation)
		
		if Magnitude == 0 then return end
		if Magnitude < 1 then
			p1.updatePositionX(p1.goalLocation)
			
			return
		else
			p1.updatePositionX(p2)
		end
	end)
	p1.motor:onComplete(function()
		-- upvalues: p1 (copy)
		p1.isMoving = false
	end)
end

function NoticePageControl.didMount(p1)
	if p1.props.onMounted then
		p1.props.onMounted()
	end
end

function NoticePageControl.willUnmount(p1)
	if p1.motor then
		p1.motor:destroy()
	end
end

function NoticePageControl.render(p1)
	-- upvalues: FormFactor (copy), RoactModule (copy), NoticePageControlItemModule (copy), WithStyleFunction (copy), EventConnection (copy), UserInputService (copy), DEPRECATEDImageSetButtonModule (copy)
	local WidePopupWidth = nil
	local WidePopupHeight = nil
	
	if p1.props.formFactor == FormFactor.WIDE then
		WidePopupWidth = p1.props.settings.widePopupWidth
		WidePopupHeight = p1.props.settings.widePopupHeight
	else
		WidePopupWidth = p1.compactWidth
		WidePopupHeight = WidePopupWidth * p1.props.settings.compactHeightToWidthRatio
	end
	local XOffset = #p1.props.noticeList * WidePopupWidth
	local BottomHeight = p1.props.settings.bottomHeight
	local HeaderHeight = p1.props.settings.headerHeight
	local YOffset = HeaderHeight + WidePopupHeight + BottomHeight
	local HasOneNotice = #p1.props.noticeList == 1
	p1.topHeight = HeaderHeight + WidePopupHeight
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	}
	
	for LayoutOrder, Notice in ipairs(p1.props.noticeList) do
		config["NoticePageControlItem" .. LayoutOrder] = RoactModule.createElement(NoticePageControlItemModule, {
			headerHeight = HeaderHeight,
			contentHeight = WidePopupHeight,
			width = WidePopupWidth,
			notice = Notice,
			layoutOrder = LayoutOrder,
			hasOneNotice = HasOneNotice
		})
	end
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), WidePopupWidth (ref), YOffset (copy), p1 (copy), HeaderHeight (copy), WidePopupHeight (ref), EventConnection (upval), UserInputService (upval), XOffset (copy), config (copy), BottomHeight (copy), DEPRECATEDImageSetButtonModule (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(WidePopupWidth, YOffset),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}, {
			TopFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 0,
				ClipsDescendants = true,
				Size = UDim2.fromOffset(WidePopupWidth, p1.topHeight)
			}, {
				PageIndicator = p1:renderIndicator(Theme, WidePopupWidth, HeaderHeight, WidePopupHeight),
				TouchMoved = RoactModule.createElement(EventConnection, {
					event = UserInputService.TouchMoved,
					callback = p1.touchMoveCallback
				}),
				TouchTap = RoactModule.createElement(EventConnection, {
					ZIndex = 2,
					event = UserInputService.TouchTap,
					callback = p1.touchTapCallback
				}),
				ScrollingList = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					BackgroundColor3 = Theme.BackgroundDefault.Color,
					Size = UDim2.fromOffset(XOffset, HeaderHeight + WidePopupHeight),
					Position = p1.positionX:map(function(p3): UDim2
						return UDim2.fromOffset(-p3, 0)
					end)
				}, config)
			}),
			BottomFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 1),
				Size = UDim2.fromOffset(WidePopupWidth, BottomHeight),
				Position = UDim2.new(0, 0, 1, 0)
			}, {
				CloseButton = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
					Size = UDim2.fromOffset(48, 48),
					Position = UDim2.new(0.5, -24, 0.5, -24),
					Image = "LuaApp/icons/Luobu/close-circle",
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[RoactModule.Event.Activated] = p1.props.onActivated
				})
			})
		})
	end)
end

local function createIndicator(p2, BackgroundTransparency)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(16, 16),
		Position = UDim2.fromOffset(0.5, 0.5)
	}, (RoactModule.createElement("ImageLabel", {
		ZIndex = 3,
		BorderSizePixel = 0,
		BackgroundColor3 = p2.Divider.Color,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = BackgroundTransparency
	}, {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) })
	})))
end

function NoticePageControl.renderIndicator(p2, Theme, XOffset, HeaderHeight, ScaledCompactHeightToWidthRatio)
	-- upvalues: RoactModule (copy), createIndicator (copy)
	local CountNoticeList = #p2.props.noticeList
	
	if CountNoticeList <= 1 then return end
	local List = {}
	table.insert(List, (RoactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Center
	})))
	
	for i = 1, CountNoticeList do
		table.insert(List, (createIndicator(Theme, if i == p2.state.selectedValue then 0 else 0.7)))
	end
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromOffset(XOffset, 48),
		Position = UDim2.fromOffset(0, HeaderHeight + ScaledCompactHeightToWidthRatio - 48)
	}, List)
end

return (RoactRoduxModule.connect(function(p3)
	return { formFactor = p3.FormFactor, screenSize = p3.ScreenSize }
end, function(Callback)
	-- upvalues: OpenWebviewModule (copy), DecrementUnreadTencentNoticeCountModule (copy), ReadTencentNoticeIdModule (copy)
	return {
		openNoticeDetail = function(p3, p4)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			Callback(OpenWebviewModule(p3, p4))
		end,
		decrementUnreadTencentNoticeCount = function()
			-- upvalues: Callback (copy), DecrementUnreadTencentNoticeCountModule (upval)
			return Callback(DecrementUnreadTencentNoticeCountModule())
		end,
		readTencentNoticeId = function(p3)
			-- upvalues: Callback (copy), ReadTencentNoticeIdModule (upval)
			return Callback(ReadTencentNoticeIdModule(p3))
		end
	}
end)(NoticePageControl))