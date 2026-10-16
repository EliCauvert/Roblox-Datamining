local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local _ = game:GetService("AppStorageService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Badge = UIBloxModule.App.Indicator.Badge
local BadgeStates = UIBloxModule.App.Indicator.Enum.BadgeStates
local Images = UIBloxModule.App.ImageSet.Images
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ChatSelectorModule = require(RobloxGui.Modules.ChatSelector)
local TenFootInterfaceModule = require(RobloxGui.Modules.TenFootInterface)
local IconButtonModule = require(script.Parent.IconButton)
local Parent = script.Parent.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local v1 = require(Parent.Flags.GetFFlagEnableTopBarAnalytics)()
local SetKeepOutAreaModule = require(Parent.Actions.SetKeepOutArea)
local RemoveKeepOutAreaModule = require(Parent.Actions.RemoveKeepOutArea)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local ConstantsModule = require(Parent.Constants)
local _ = require(script.Parent.ChatIconFtuxTooltip)
local GetExperienceChatVisualConfigFunction = require(CorePackages.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local _ = game:DefineFastInt("InExperienceChatTooltipShowDelayMs", 1000)
local _ = game:DefineFastInt("InExperienceChatTooltipDismissDelayMs", 7000)
local GameSettings = UserSettings().GameSettings

local function _(): boolean --[[ Line: 40 | Named "shouldShowEmptyBadge" ]]
	return game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService
end

local ChatIcon = RoactModule.PureComponent:extend("ChatIcon")
ChatIcon.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	chatVisible = TModule.boolean,
	unreadMessages = TModule.integer,
	topBarEnabled = TModule.boolean,
	chatEnabled = TModule.boolean,
	setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback,
	removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback
})

function ChatIcon.init(p1) --[[ Line: 65 ]]
	-- upvalues: RoactModule (copy), ChatSelectorModule (copy), GameSettings (copy), v1 (copy), AnalyticsModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy)
	p1.buttonRef = RoactModule.createRef()
	
	function p1.chatIconActivated() --[[ Line: 68 ]]
		-- upvalues: ChatSelectorModule (upval), GameSettings (upval), v1 (upval), AnalyticsModule (upval)
		ChatSelectorModule:ToggleVisibility()
		GameSettings.ChatVisible = ChatSelectorModule:GetVisibility()
		
		if v1 then
			AnalyticsModule.default:onChatButtonActivated(GameSettings.ChatVisible)
		end
	end
	
	if FFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
end

function ChatIcon.render(p1) --[[ Line: 81 ]]
	-- upvalues: WithStyleFunction (copy), TenFootInterfaceModule (copy), VRService (copy), GetExperienceChatVisualConfigFunction (copy), Images (copy), FFlagTopBarSignalizeKeepOutAreas (copy), ConstantsModule (copy), RoactModule (copy), IconButtonModule (copy), Badge (copy), BadgeStates (copy)
	return WithStyleFunction(function(_) --[[ Line: 82 ]]
		-- upvalues: p1 (copy), TenFootInterfaceModule (upval), VRService (upval), GetExperienceChatVisualConfigFunction (upval), Images (upval), FFlagTopBarSignalizeKeepOutAreas (upval), ConstantsModule (upval), RoactModule (upval), IconButtonModule (upval), Badge (upval), BadgeStates (upval)
		local NoVREnabled: boolean = p1.props.topBarEnabled and (p1.props.chatEnabled and (not TenFootInterfaceModule:IsEnabled() and not VRService.VREnabled))
		local ExperienceChatVisualConfig = GetExperienceChatVisualConfigFunction()
		local IconSize = ExperienceChatVisualConfig.iconSize
		local Image = if p1.props.chatVisible then Images[ExperienceChatVisualConfig.icon.on] else Images[ExperienceChatVisualConfig.icon.off]
		
		local function v34(Frame: Frame) --[[ Line: 98 ]]
			-- upvalues: NoVREnabled (copy), FFlagTopBarSignalizeKeepOutAreas (upval), p1 (upval), ConstantsModule (upval)
			if NoVREnabled and Frame then
				if FFlagTopBarSignalizeKeepOutAreas then
					p1.keepOutAreasStore.setKeepOutArea(ConstantsModule.ChatIconKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
					
					return
				else
					p1.props.setKeepOutArea(ConstantsModule.ChatIconKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
					
					return
				end
			elseif FFlagTopBarSignalizeKeepOutAreas then
				p1.keepOutAreasStore.removeKeepOutArea(ConstantsModule.ChatIconKeepOutAreaId)
				
				return
			else
				p1.props.removeKeepOutArea(ConstantsModule.ChatIconKeepOutAreaId)
			end
		end
		
		local function v35(Current) --[[ Line: 114 ]]
			-- upvalues: p1 (upval), v34 (copy)
			if Current then
				p1.buttonRef.current = Current
				v34(p1.buttonRef.current)
			end
		end
		
		if p1.buttonRef.current then
			v34(p1.buttonRef.current)
		end
		local CreateElementFunction1 = RoactModule.createElement
		local v2 = "TextButton"
		local config = {
			Text = "",
			BackgroundTransparency = 1,
			Selectable = false,
			Visible = NoVREnabled,
			Size = UDim2.new(0, 44, 1, 0),
			LayoutOrder = p1.props.layoutOrder
		}
		local config1 = {
			Background = RoactModule.createElement(IconButtonModule, {
				icon = Image,
				iconSize = IconSize,
				onActivated = p1.chatIconActivated,
				[RoactModule.Change.AbsoluteSize] = v34,
				[RoactModule.Change.AbsolutePosition] = v34,
				[RoactModule.Ref] = v35
			})
		}
		local CreateElementFunction = RoactModule.createElement
		local v3 = "Frame"
		local config2 = {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1)
		}
		local t = {}
		local Element = false
		
		if p1.props.unreadMessages > 0 then
			local IsChatVersionMatch = game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService
			Element = RoactModule.createElement(Badge, {
				hasShadow = false,
				position = UDim2.fromOffset(18, if IsChatVersionMatch then 6 else 2),
				anchorPoint = Vector2.new(0, 0),
				value = game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService and BadgeStates.isEmpty or p1.props.unreadMessages
			})
		end
		t.Badge = Element
		config1.BadgeContainer = CreateElementFunction(v3, config2, t)
		
		return CreateElementFunction1(v2, config, config1)
	end)
end

local function mapDispatchToProps(Callback) --[[ Line: 173 ]]
	-- upvalues: FFlagTopBarSignalizeKeepOutAreas (copy), SetKeepOutAreaModule (copy), RemoveKeepOutAreaModule (copy)
	return if FFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(p1, p2, p3) --[[ Line: 178 ]]
			-- upvalues: Callback (copy), SetKeepOutAreaModule (upval)
			return Callback(SetKeepOutAreaModule(p1, p2, p3))
		end,
		removeKeepOutArea = function(p1) --[[ Line: 181 ]]
			-- upvalues: Callback (copy), RemoveKeepOutAreaModule (upval)
			return Callback(RemoveKeepOutAreaModule(p1))
		end
	}
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1) --[[ Line: 163 | Named "mapStateToProps" ]]
	return {
		chatVisible = p1.chat.visible,
		unreadMessages = p1.chat.unreadMessages,
		topBarEnabled = p1.displayOptions.topbarEnabled,
		chatEnabled = p1.coreGuiEnabled[Enum.CoreGuiType.Chat]
	}
end, if FFlagTopBarSignalizeKeepOutAreas then nil else mapDispatchToProps)(ChatIcon)