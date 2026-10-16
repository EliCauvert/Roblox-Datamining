local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ShareGame = Modules.Settings.Pages.ShareGame
local ConstantsModule = require(ShareGame.Constants)
local GameInviteEvents = require(CorePackages.Workspace.Packages.GameInvite).GameInviteEvents
local HeaderModule = require(ShareGame.Components.Header)
local ConversationListModule = require(ShareGame.Components.ConversationList)
local ErrorToasterModule = require(ShareGame.Components.ErrorToaster)
local BackButtonModule = require(ShareGame.Components.BackButton)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local ThemeModule = require(CoreGui:WaitForChild("RobloxGui").Modules.Settings.Theme)
local GetFFlagEnableNewInviteMenuModule = require(Modules.Flags.GetFFlagEnableNewInviteMenu)
local GetFFlagEnableNewInviteSendEndpointModule = require(Modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local _UDim = UDim.new(0.8, 320)
local _UDim1 = UDim.new(0.7, 500)
local _UDim2 = UDim.new(0.8, 440)
local _Color3 = Color3.fromRGB(41, 41, 41)
local ModalShareGamePageFrame = RoactModule.PureComponent:extend("ModalShareGamePageFrame")
ModalShareGamePageFrame.defaultProps = { isVisible = true }

function ModalShareGamePageFrame.init(p1) --[[ Line: 53 ]]
	-- upvalues: ConstantsModule (copy), ThemeModule (copy), Text (copy), RoactModule (copy)
	p1.state = { promptMessageFitsFrame = true }
	
	function p1.onCustomTextAreaSizeChange(Frame) --[[ Line: 58 ]]
		-- upvalues: p1 (copy), ConstantsModule (upval), ThemeModule (upval), Text (upval)
		local PromptMessage = p1.props.promptMessage
		local TextSizeResult = ThemeModule.textSize(ConstantsModule.LayoutSpecific[p1.props.deviceLayout].PAGE_TITLE_TEXT_SIZE)
		p1:setState({
			promptMessageFitsFrame = PromptMessage and Text.GetTextWidth(PromptMessage, ThemeModule.font(Enum.Font.SourceSans), TextSizeResult) < Frame.AbsoluteSize.X
		})
	end
	
	p1.customTextAreaRef = RoactModule.createRef()
	
	function p1.onClosePage() --[[ Line: 71 ]]
		-- upvalues: p1 (copy)
		p1.props.closePage()
		
		if p1.props.onAfterClosePage then
			p1.props.onAfterClosePage()
		end
	end
end

function ModalShareGamePageFrame.didMount(p1) --[[ Line: 79 ]]
	-- upvalues: GetFFlagEnableNewInviteMenuModule (copy), GetFFlagEnableNewInviteSendEndpointModule (copy), ConstantsModule (copy), GameInviteEvents (copy)
	if GetFFlagEnableNewInviteMenuModule() and p1.customTextAreaRef.current then
		p1.onCustomTextAreaSizeChange(p1.customTextAreaRef.current)
	end
	if GetFFlagEnableNewInviteSendEndpointModule() and p1.props.promptMessage and p1.props.analytics then
		p1.props.analytics:sendEvent(ConstantsModule.Triggers.DeveloperMultiple, GameInviteEvents.CustomTextShown)
	end
end

function ModalShareGamePageFrame.render(p1) --[[ Line: 92 ]]
	-- upvalues: GetFFlagEnableNewInviteMenuModule (copy), _UDim2 (copy), _UDim (copy), ConstantsModule (copy), _UDim1 (copy), ThemeModule (copy), RoactModule (copy), _Color3 (copy), CoreGui (copy), ErrorToasterModule (copy), HeaderModule (copy), BackButtonModule (copy), ConversationListModule (copy)
	local Analytics = p1.props.analytics
	local DeviceLayout = p1.props.deviceLayout
	local ZIndex = p1.props.zIndex
	local SearchAreaActive = p1.props.searchAreaActive
	local SearchText = p1.props.searchText
	local IsVisible = p1.props.isVisible
	local FFlagEnableNewInviteMenuModule = GetFFlagEnableNewInviteMenuModule()
	local _UDim3 = if FFlagEnableNewInviteMenuModule then _UDim2 else _UDim
	local _Vector2 = Vector2.new(0.5, 0.5)
	local _UDim2_1 = UDim2.new(_UDim3.Scale, 0, _UDim1.Scale, 0)
	local _Vector2_1 = Vector2.new(_UDim3.Offset, _UDim1.Offset)
	local _UDim2_2 = UDim2.new(0.5, 0, 0.425, 0)
	
	if FFlagEnableNewInviteMenuModule and (p1.props.deviceInfo and p1.props.deviceInfo.DeviceLayout == ConstantsModule.DeviceLayout.PHONE_LANDSCAPE) then
		_Vector2 = Vector2.new(0.5, 1)
		_UDim2_1 = UDim2.new(_UDim3.Scale, 0, 1, 0)
		_Vector2_1 = Vector2.new(_UDim3.Offset, 1e999)
		_UDim2_2 = UDim2.new(0.5, 0, 1, 4)
	end
	local PromptMessage = p1.props.promptMessage
	local TextSizeResult: number = ThemeModule.textSize(ConstantsModule.LayoutSpecific[DeviceLayout].PAGE_TITLE_TEXT_SIZE)
	local PromptMessageFitsFrame = FFlagEnableNewInviteMenuModule and (PromptMessage and p1.state.promptMessageFitsFrame)
	local YOffset: number = if PromptMessageFitsFrame then TextSizeResult + 10 else 10
	
	return RoactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/LuaChat/9-slice/btn-control-sm.png",
		ImageTransparency = 0.1,
		AnchorPoint = _Vector2,
		ImageColor3 = _Color3,
		Modal = IsVisible,
		Position = _UDim2_2,
		Size = _UDim2_1,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(Vector2.new(3, 3), Vector2.new(3, 3))
	}, {
		sizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2_1 }),
		uiPadding2 = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 15),
			PaddingRight = UDim.new(0, 15),
			PaddingBottom = UDim.new(0, 15)
		}),
		content = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			ZIndex = ZIndex
		}, {
			toasterPortal = RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, { Toaster = RoactModule.createElement(ErrorToasterModule) }),
			Layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Padding = if FFlagEnableNewInviteMenuModule then RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }) else nil,
			Header = RoactModule.createElement(HeaderModule, {
				layoutOrder = 0,
				toggleSearchIcon = true,
				deviceLayout = DeviceLayout,
				size = UDim2.new(1, 0, 0, if FFlagEnableNewInviteMenuModule then 40 else 60),
				zIndex = ZIndex,
				closePage = p1.onClosePage,
				searchAreaActive = SearchAreaActive,
				iconType = BackButtonModule.IconType.Cross
			}),
			CustomText = FFlagEnableNewInviteMenuModule and RoactModule.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, YOffset),
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = TextSizeResult,
				TextColor3 = ConstantsModule.Color.WHITE,
				Font = ThemeModule.font(Enum.Font.SourceSans),
				BackgroundTransparency = 1,
				Text = if PromptMessageFitsFrame then PromptMessage else "",
				[RoactModule.Change.AbsoluteSize] = p1.onCustomTextAreaSizeChange,
				[RoactModule.Ref] = p1.customTextAreaRef
			}),
			ConversationList = RoactModule.createElement(ConversationListModule, {
				topPadding = 10,
				layoutOrder = 1,
				entryHeight = 62,
				entryPadding = 18,
				analytics = Analytics,
				size = UDim2.new(1, 0, 1, -(if FFlagEnableNewInviteMenuModule then 40 + YOffset else 60)),
				zIndex = ZIndex,
				searchText = SearchText,
				isVisible = IsVisible,
				trigger = ConstantsModule.Triggers.DeveloperMultiple,
				inviteMessageId = p1.props.inviteMessageId,
				launchData = p1.props.launchData
			})
		})
	})
end

return (RoactRoduxModule.connect(function(p1) --[[ Line: 211 ]]
	return { deviceInfo = p1.DeviceInfo }
end)(ModalShareGamePageFrame))