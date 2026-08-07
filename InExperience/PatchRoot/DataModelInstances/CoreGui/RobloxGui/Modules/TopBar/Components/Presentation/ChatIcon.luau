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
local var12 = require(parent.Flags.GetFFlagEnableTopBarAnalytics)()
local setKeepOutAreaModule = require(parent.Actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(parent.Actions.RemoveKeepOutArea)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local constantsModule = require(parent.Constants)
local getFFlagEnableAppChatInExperience = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local _ = require(script.Parent.ChatIconFtuxTooltip)
local getExperienceChatVisualConfig = require(corePackagesService.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
local _ = game:DefineFastInt("InExperienceChatTooltipShowDelayMs", 1000)
local _ = game:DefineFastInt("InExperienceChatTooltipDismissDelayMs", 7000)
local unibarHoldoutChatIconUseNewIconSize = game:DefineFastFlag("UnibarHoldoutChatIconUseNewIconSize", false)
local gameSettings = UserSettings().GameSettings

local function _() --[[ line: 43 | named "shouldShowEmptyBadge" ]]
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

function chatIcon.init(p0) --[[ line: 69 ]]
	-- upvalues: roactModule (ref), chatSelectorModule (ref), gameSettings (ref), var12 (ref), analyticsModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref)
	p0.buttonRef = roactModule.createRef()
	
	function p0.chatIconActivated() --[[ line: 72 ]]
		-- upvalues: chatSelectorModule (copy), gameSettings (copy), var12 (copy), analyticsModule (copy)
		chatSelectorModule:ToggleVisibility()
		gameSettings.ChatVisible = chatSelectorModule:GetVisibility()
		
		if var12 then
			analyticsModule.default:onChatButtonActivated(gameSettings.ChatVisible)
		end
	end
	
	if fFlagTopBarSignalizeKeepOutAreas then
		p0.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
end

function chatIcon.render(p1) --[[ line: 85 ]]
	-- upvalues: withStyle (ref), tenFootInterfaceModule (ref), VRService (ref), getExperienceChatVisualConfig (ref), images (ref), fFlagTopBarSignalizeKeepOutAreas (ref), constantsModule (ref), roactModule (ref), iconButtonModule (ref), getFFlagEnableAppChatInExperience (ref), unibarHoldoutChatIconUseNewIconSize (ref), badge (ref), badgeStates (ref)
	return withStyle(function(_) --[[ line: 86 ]]
		-- upvalues: p1 (ref), tenFootInterfaceModule (copy), VRService (copy), getExperienceChatVisualConfig (copy), images (copy), fFlagTopBarSignalizeKeepOutAreas (copy), constantsModule (copy), roactModule (copy), iconButtonModule (copy), getFFlagEnableAppChatInExperience (copy), unibarHoldoutChatIconUseNewIconSize (copy), badge (copy), badgeStates (copy)
		local var19 = p1.props.topBarEnabled and (p1.props.chatEnabled and (not tenFootInterfaceModule:IsEnabled() and not VRService.VREnabled))
		local _ = nil
		local _ = nil
		local var20 = getExperienceChatVisualConfig()
		local iconSize = var20.iconSize
		local var21 = if not p1.props.chatVisible then images[var20.icon.off] else images[var20.icon.on]
		
		local var22 = function(p2) --[[ line: 102 ]]
			-- upvalues: var19 (ref), fFlagTopBarSignalizeKeepOutAreas (copy), p1 (copy), constantsModule (copy)
			if var19 and p2 then
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
		
		local var23 = function(p3) --[[ line: 118 ]]
			-- upvalues: p1 (copy), var22 (ref)
			if p3 then
				p1.buttonRef.current = p3
				var22(p1.buttonRef.current)
			end
		end
		
		if p1.buttonRef.current then
			var22(p1.buttonRef.current)
		end
		return roactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Selectable = false,
			Visible = var19,
			Size = UDim2.new(0, 44, 1, 0),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Background = roactModule.createElement(iconButtonModule, {
				icon = var21,
				iconSize = if getFFlagEnableAppChatInExperience() or unibarHoldoutChatIconUseNewIconSize then iconSize else 20,
				onActivated = p1.chatIconActivated,
				[roactModule.Change.AbsoluteSize] = var22,
				[roactModule.Change.AbsolutePosition] = var22,
				[roactModule.Ref] = var23
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

return roactRoduxModule.UNSTABLE_connect2(function(p4) --[[ line: 167 | named "mapStateToProps" ]]
	return {
		chatVisible = p4.chat.visible,
		unreadMessages = p4.chat.unreadMessages,
		topBarEnabled = p4.displayOptions.topbarEnabled,
		chatEnabled = p4.coreGuiEnabled[Enum.CoreGuiType.Chat]
	}
end, if fFlagTopBarSignalizeKeepOutAreas then nil else function(p5) --[[ line: 177 | named "mapDispatchToProps" ]]
	-- upvalues: fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return if fFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(value, p6, p7) --[[ line: 182 ]]
			-- upvalues: p5 (ref), setKeepOutAreaModule (copy)
			return p5(setKeepOutAreaModule(value, p6, p7))
		end,
		removeKeepOutArea = function(p8) --[[ line: 185 ]]
			-- upvalues: p5 (ref), removeKeepOutAreaModule (copy)
			return p5(removeKeepOutAreaModule(p8))
		end
	}
end)(chatIcon)