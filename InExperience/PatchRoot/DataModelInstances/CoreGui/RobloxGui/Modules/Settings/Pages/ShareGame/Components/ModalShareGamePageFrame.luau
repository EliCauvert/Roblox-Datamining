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

function modalShareGamePageFrame.init(p0)
	-- upvalues: constantsModule (ref), themeModule (ref), text (ref), roactModule (ref)
	p0.state = { promptMessageFitsFrame = true }
	
	function p0.onCustomTextAreaSizeChange(p1)
		-- upvalues: p0 (ref), constantsModule (copy), themeModule (copy), text (copy)
		local promptMessage = p0.props.promptMessage
		p0:setState({
			promptMessageFitsFrame = promptMessage and text.GetTextWidth(promptMessage, themeModule.font(Enum.Font.SourceSans), themeModule.textSize(constantsModule.LayoutSpecific[p0.props.deviceLayout].PAGE_TITLE_TEXT_SIZE)) < p1.AbsoluteSize.X
		})
	end
	
	p0.customTextAreaRef = roactModule.createRef()
	
	function p0.onClosePage()
		-- upvalues: p0 (ref)
		p0.props.closePage()
		
		if p0.props.onAfterClosePage then
			p0.props.onAfterClosePage()
		end
	end
end

function modalShareGamePageFrame.didMount(p2)
	-- upvalues: getFFlagEnableNewInviteMenuModule (ref), getFFlagEnableNewInviteSendEndpointModule (ref), constantsModule (ref), gameInviteEvents (ref)
	if getFFlagEnableNewInviteMenuModule() and p2.customTextAreaRef.current then
		p2.onCustomTextAreaSizeChange(p2.customTextAreaRef.current)
	end
	if getFFlagEnableNewInviteSendEndpointModule() and p2.props.promptMessage and p2.props.analytics then
		p2.props.analytics:sendEvent(constantsModule.Triggers.DeveloperMultiple, gameInviteEvents.CustomTextShown)
	end
end

function modalShareGamePageFrame.render(p3)
	-- upvalues: getFFlagEnableNewInviteMenuModule (ref), uDim_2 (ref), uDim (ref), constantsModule (ref), uDim_1 (ref), themeModule (ref), roactModule (ref), color (ref), coreGuiService (ref), errorToasterModule (ref), headerModule (ref), backButtonModule (ref), conversationListModule (ref)
	local analytics = p3.props.analytics
	local deviceLayout = p3.props.deviceLayout
	local zIndex = p3.props.zIndex
	local searchAreaActive = p3.props.searchAreaActive
	local searchText = p3.props.searchText
	local isVisible = p3.props.isVisible
	local var18 = getFFlagEnableNewInviteMenuModule()
	local var19 = if var18 then uDim_2 else uDim
	local var20 = var18 and (p3.props.deviceInfo and p3.props.deviceInfo.DeviceLayout == constantsModule.DeviceLayout.PHONE_LANDSCAPE)
	local vector2 = Vector2.new(0.5, 0.5)
	local uDim2 = UDim2.new(var19.Scale, 0, uDim_1.Scale, 0)
	local vector2_1 = Vector2.new(var19.Offset, uDim_1.Offset)
	local uDim2_1 = UDim2.new(0.5, 0, 0.425, 0)
	
	if var20 then
		vector2 = Vector2.new(0.5, 1)
		uDim2 = UDim2.new(var19.Scale, 0, 1, 0)
		vector2_1 = Vector2.new(var19.Offset, 1e999)
		uDim2_1 = UDim2.new(0.5, 0, 1, 4)
	end
	local promptMessage = p3.props.promptMessage
	local var25 = themeModule.textSize(constantsModule.LayoutSpecific[deviceLayout].PAGE_TITLE_TEXT_SIZE)
	local promptMessageFitsFrame = var18 and (promptMessage and p3.state.promptMessageFitsFrame)
	local var27 = if promptMessageFitsFrame then var25 + 10 else 10
	
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
			Padding = if var18 then roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 10) }) else nil,
			Header = roactModule.createElement(headerModule, {
				layoutOrder = 0,
				toggleSearchIcon = true,
				deviceLayout = deviceLayout,
				size = UDim2.new(1, 0, 0, if var18 then 40 else 60),
				zIndex = zIndex,
				closePage = p3.onClosePage,
				searchAreaActive = searchAreaActive,
				iconType = backButtonModule.IconType.Cross
			}),
			CustomText = var18 and roactModule.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, var27),
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = var25,
				TextColor3 = constantsModule.Color.WHITE,
				Font = themeModule.font(Enum.Font.SourceSans),
				BackgroundTransparency = 1,
				Text = if promptMessageFitsFrame then promptMessage else "",
				[roactModule.Change.AbsoluteSize] = p3.onCustomTextAreaSizeChange,
				[roactModule.Ref] = p3.customTextAreaRef
			}),
			ConversationList = roactModule.createElement(conversationListModule, {
				topPadding = 10,
				layoutOrder = 1,
				entryHeight = 62,
				entryPadding = 18,
				analytics = analytics,
				size = UDim2.new(1, 0, 1, -(if var18 then 40 + var27 else 60)),
				zIndex = zIndex,
				searchText = searchText,
				isVisible = isVisible,
				trigger = constantsModule.Triggers.DeveloperMultiple,
				inviteMessageId = p3.props.inviteMessageId,
				launchData = p3.props.launchData
			})
		})
	})
end

return roactRoduxModule.connect(function(p4)
	return { deviceInfo = p4.DeviceInfo }
end)(modalShareGamePageFrame)