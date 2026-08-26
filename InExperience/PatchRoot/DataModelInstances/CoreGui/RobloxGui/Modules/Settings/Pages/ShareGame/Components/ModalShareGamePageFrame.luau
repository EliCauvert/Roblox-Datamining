local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local modules = coreGuiService.RobloxGui.Modules
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local shareGame = modules.Settings.Pages.ShareGame
local constantsModule = require(shareGame.Constants)
local gameInviteEvents = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteEvents
local headerModule = require(shareGame.Components.Header)
local conversationListModule = require(shareGame.Components.ConversationList)
local errorToasterModule = require(shareGame.Components.ErrorToaster)
local backButtonModule = require(shareGame.Components.BackButton)
local text = require(corePackagesService.Workspace.Packages.AppCommonLib).Text
local themeModule = require(robloxGui.Modules.Settings.Theme)
local getFFlagEnableNewInviteMenuModule = require(modules.Flags.GetFFlagEnableNewInviteMenu)
local getFFlagEnableNewInviteSendEndpointModule = require(modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local uDim = UDim.new(0.8, 320)
local uDim_1 = UDim.new(0.7, 500)
local uDim_2 = UDim.new(0.8, 440)
local color = Color3.fromRGB(41, 41, 41)
local modalShareGamePageFrame = roactModule.PureComponent:extend("ModalShareGamePageFrame")
modalShareGamePageFrame.defaultProps = { isVisible = true }

function modalShareGamePageFrame.init(p1)
	-- upvalues: constantsModule (ref), themeModule (ref), text (ref), roactModule (ref)
	p1.state = { promptMessageFitsFrame = true }
	
	function p0.onCustomTextAreaSizeChange(p2)
		-- upvalues: p1 (ref), constantsModule (copy), themeModule (copy), text (copy)
		local promptMessage = p1.props.promptMessage
		p1:setState({
			promptMessageFitsFrame = promptMessage and text.GetTextWidth(promptMessage, themeModule.font(Enum.Font.SourceSans), themeModule.textSize(constantsModule.LayoutSpecific[p1.props.deviceLayout].PAGE_TITLE_TEXT_SIZE)) < p2.AbsoluteSize.X
		})
	end
	
	p1.customTextAreaRef = roactModule.createRef()
	
	function p0.onClosePage()
		-- upvalues: p1 (ref)
		p1.props.closePage()
		
		if p1.props.onAfterClosePage then
			p1.props.onAfterClosePage()
		end
	end
end

function modalShareGamePageFrame.didMount(p1)
	-- upvalues: getFFlagEnableNewInviteMenuModule (ref), getFFlagEnableNewInviteSendEndpointModule (ref), constantsModule (ref), gameInviteEvents (ref)
	if getFFlagEnableNewInviteMenuModule() and p1.customTextAreaRef.current then
		p1.onCustomTextAreaSizeChange(p1.customTextAreaRef.current)
	end
	if getFFlagEnableNewInviteSendEndpointModule() and p1.props.promptMessage and p1.props.analytics then
		p1.props.analytics:sendEvent(constantsModule.Triggers.DeveloperMultiple, gameInviteEvents.CustomTextShown)
	end
end

function modalShareGamePageFrame.render(p1)
	-- upvalues: getFFlagEnableNewInviteMenuModule (ref), uDim_2 (ref), uDim (ref), constantsModule (ref), uDim_1 (ref), themeModule (ref), roactModule (ref), color (ref), coreGuiService (ref), errorToasterModule (ref), headerModule (ref), backButtonModule (ref), conversationListModule (ref)
	local analytics = p1.props.analytics
	local deviceLayout = p1.props.deviceLayout
	local zIndex = p1.props.zIndex
	local searchAreaActive = p1.props.searchAreaActive
	local searchText = p1.props.searchText
	local isVisible = p1.props.isVisible
	local var1 = getFFlagEnableNewInviteMenuModule()
	local var2 = if var1 then uDim_2 else uDim
	local var3 = var1 and (p1.props.deviceInfo and p1.props.deviceInfo.DeviceLayout == constantsModule.DeviceLayout.PHONE_LANDSCAPE)
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.new(var2.Scale, 0, uDim_1.Scale, 0)
	local vector2_1 = Vector2.new(var2.Offset, uDim_1.Offset)
	local uDim2_1 = UDim2.new(0.5, 0, 0.425, 0)
	
	if var3 then
		vector2 = Vector2.new(0.5, 1)
		uDim2 = UDim2.new(var2.Scale, 0, 1, 0)
		vector2_1 = Vector2.new(var2.Offset, 1e999)
		uDim2_1 = UDim2.new(0.5, 0, 1, 4)
	end
	local promptMessage = p1.props.promptMessage
	local var4 = themeModule.textSize(constantsModule.LayoutSpecific[deviceLayout].PAGE_TITLE_TEXT_SIZE)
	local promptMessageFitsFrame = var1 and (promptMessage and p1.state.promptMessageFitsFrame)
	local var5 = if promptMessageFitsFrame then var4 + 10 else 10
	
	return roactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/LuaChat/9-slice/btn-control-sm.png",
		ImageTransparency = 0.1,
		AnchorPoint = vector2,
		ImageColor3 = color,
		Modal = isVisible,
		Position = uDim2_1,
		Size = uDim2,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(Vector2.new(3, 3), Vector2.new(3, 3))
	}, {
		sizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = vector2_1 }),
		uiPadding2 = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 15),
			PaddingRight = UDim.new(0, 15),
			PaddingBottom = UDim.new(0, 15)
		}),
		content = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			ZIndex = zIndex
		}, {
			toasterPortal = roactModule.createElement(roactModule.Portal, { target = coreGuiService }, { Toaster = roactModule.createElement(errorToasterModule) }),
			Layout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Padding = if var1 then roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }) else nil,
			Header = roactModule.createElement(headerModule, {
				layoutOrder = 0,
				toggleSearchIcon = true,
				deviceLayout = deviceLayout,
				size = UDim2.new(1, 0, 0, if var1 then 40 else 60),
				zIndex = zIndex,
				closePage = p1.onClosePage,
				searchAreaActive = searchAreaActive,
				iconType = backButtonModule.IconType.Cross
			}),
			CustomText = var1 and roactModule.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, var5),
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = var4,
				TextColor3 = constantsModule.Color.WHITE,
				Font = themeModule.font(Enum.Font.SourceSans),
				BackgroundTransparency = 1,
				Text = if promptMessageFitsFrame then promptMessage else "",
				[roactModule.Change.AbsoluteSize] = p1.onCustomTextAreaSizeChange,
				[roactModule.Ref] = p1.customTextAreaRef
			}),
			ConversationList = roactModule.createElement(conversationListModule, {
				topPadding = 10,
				layoutOrder = 1,
				entryHeight = 62,
				entryPadding = 18,
				analytics = analytics,
				size = UDim2.new(1, 0, 1, -(if var1 then 40 + var5 else 60)),
				zIndex = zIndex,
				searchText = searchText,
				isVisible = isVisible,
				trigger = constantsModule.Triggers.DeveloperMultiple,
				inviteMessageId = p1.props.inviteMessageId,
				launchData = p1.props.launchData
			})
		})
	})
end

return roactRoduxModule.connect(function(p1)
	return { deviceInfo = p1.DeviceInfo }
end)(modalShareGamePageFrame)