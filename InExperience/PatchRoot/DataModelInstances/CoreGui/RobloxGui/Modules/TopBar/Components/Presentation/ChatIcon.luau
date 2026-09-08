local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local VRService = game:GetService("VRService")
local _ = game:GetService("AppStorageService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local _ = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local withStyle = UIBloxModule.Core.Style.withStyle
local badge = UIBloxModule.App.Indicator.Badge
local badgeStates = UIBloxModule.App.Indicator.Enum.BadgeStates
local images = UIBloxModule.App.ImageSet.Images
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local iconButtonModule = require(script.Parent.IconButton)
local parent = script.Parent.Parent.Parent
local analyticsModule = require(parent.Analytics)
local var1 = require(parent.Flags.GetFFlagEnableTopBarAnalytics)()
local setKeepOutAreaModule = require(parent.Actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(parent.Actions.RemoveKeepOutArea)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local constantsModule = require(parent.Constants)
local _ = require(script.Parent.ChatIconFtuxTooltip)
local getExperienceChatVisualConfig = require(corePackagesService.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local _ = game:DefineFastInt("InExperienceChatTooltipShowDelayMs", 1000)
local _ = game:DefineFastInt("InExperienceChatTooltipDismissDelayMs", 7000)
local gameSettings = UserSettings().GameSettings

local function _()
	return game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService
end

local chatIcon = roactModule.PureComponent:extend("ChatIcon")
chatIcon.validateProps = tModule.strictInterface({
	layoutOrder = tModule.integer,
	chatVisible = tModule.boolean,
	unreadMessages = tModule.integer,
	topBarEnabled = tModule.boolean,
	chatEnabled = tModule.boolean,
	setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback,
	removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback
})

function chatIcon.init(p1)
	-- upvalues: roactModule (ref), chatSelectorModule (ref), gameSettings (ref), var1 (ref), analyticsModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref)
	p1.buttonRef = roactModule.createRef()
	
	function p0.chatIconActivated()
		-- upvalues: chatSelectorModule (copy), gameSettings (copy), var1 (copy), analyticsModule (copy)
		chatSelectorModule:ToggleVisibility()
		gameSettings.ChatVisible = chatSelectorModule:GetVisibility()
		
		if var1 then
			analyticsModule.default:onChatButtonActivated(gameSettings.ChatVisible)
		end
	end
	
	if fFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
end

function chatIcon.render(p1)
	-- upvalues: withStyle (ref), tenFootInterfaceModule (ref), VRService (ref), getExperienceChatVisualConfig (ref), images (ref), fFlagTopBarSignalizeKeepOutAreas (ref), constantsModule (ref), roactModule (ref), iconButtonModule (ref), badge (ref), badgeStates (ref)
	return withStyle(function(_)
		-- upvalues: p1 (ref), tenFootInterfaceModule (copy), VRService (copy), getExperienceChatVisualConfig (copy), images (copy), fFlagTopBarSignalizeKeepOutAreas (copy), constantsModule (copy), roactModule (copy), iconButtonModule (copy), badge (copy), badgeStates (copy)
		local var2 = p1.props.topBarEnabled and (p1.props.chatEnabled and (not tenFootInterfaceModule:IsEnabled() and not VRService.VREnabled))
		local _ = nil
		local _ = nil
		local var3 = getExperienceChatVisualConfig()
		local iconSize = var3.iconSize
		local var4 = if not p1.props.chatVisible then images[var3.icon.off] else images[var3.icon.on]
		
		local var5 = function(p2)
			-- upvalues: var2 (ref), fFlagTopBarSignalizeKeepOutAreas (copy), p1 (copy), constantsModule (copy)
			if var2 and p2 then
				if fFlagTopBarSignalizeKeepOutAreas then
					p1.keepOutAreasStore.setKeepOutArea(constantsModule.ChatIconKeepOutAreaId, p2.AbsolutePosition, p2.AbsoluteSize)
					
					return
				end
				p1.props.setKeepOutArea(constantsModule.ChatIconKeepOutAreaId, p2.AbsolutePosition, p2.AbsoluteSize)
				
				return
			elseif fFlagTopBarSignalizeKeepOutAreas then
				p1.keepOutAreasStore.removeKeepOutArea(constantsModule.ChatIconKeepOutAreaId)
				
				return
			end
			p1.props.removeKeepOutArea(constantsModule.ChatIconKeepOutAreaId)
		end
		
		local var6 = function(p2)
			-- upvalues: p1 (copy), var5 (ref)
			if p2 then
				p1.buttonRef.current = p2
				var5(p1.buttonRef.current)
			end
		end
		
		if p1.buttonRef.current then
			var5(p1.buttonRef.current)
		end
		return roactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Selectable = false,
			Visible = var2,
			Size = UDim2.new(0, 44, 1, 0),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Background = roactModule.createElement(iconButtonModule, {
				icon = var4,
				iconSize = iconSize,
				onActivated = p1.chatIconActivated,
				[roactModule.Change.AbsoluteSize] = var5,
				[roactModule.Change.AbsolutePosition] = var5,
				[roactModule.Ref] = var6
			}),
			BadgeContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = p1.props.unreadMessages > 0 and roactModule.createElement(badge, {
					hasShadow = false,
					position = UDim2.fromOffset(18, if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 6 else 2),
					anchorPoint = Vector2.new(0, 0),
					value = if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then badgeStates.isEmpty else p1.props.unreadMessages
				})
			})
		})
	end)
end

return roactRoduxModule.UNSTABLE_connect2(function(p1)
	return {
		chatVisible = p1.chat.visible,
		unreadMessages = p1.chat.unreadMessages,
		topBarEnabled = p1.displayOptions.topbarEnabled,
		chatEnabled = p1.coreGuiEnabled[Enum.CoreGuiType.Chat]
	}
end, if fFlagTopBarSignalizeKeepOutAreas then nil else function(p1)
	-- upvalues: fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return if fFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(value, p2, p3)
			-- upvalues: p1 (ref), setKeepOutAreaModule (copy)
			return p1(setKeepOutAreaModule(value, p2, p3))
		end,
		removeKeepOutArea = function(p2)
			-- upvalues: p1 (ref), removeKeepOutAreaModule (copy)
			return p1(removeKeepOutAreaModule(p2))
		end
	}
end)(chatIcon)