local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local VRService = game:GetService("VRService")
local gamepadService = game:GetService("GamepadService")
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local withStyle = require(corePackagesService.Packages.UIBlox).Core.Style.withStyle
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local _ = require(robloxGui.Modules.TenFootInterface)
local _ = require(robloxGui.Modules.isNewInGameMenuEnabled)
local _ = require(robloxGui.Modules.InGameMenuConstants)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local menuIcon = roactModule.PureComponent:extend("MenuIcon")
local getFStringVoiceBetaBadgeLearnMoreModule = require(robloxGui.Modules.Flags.GetFStringVoiceBetaBadgeLearnMore)
local getFFlagBetaBadgeLearnMoreLinkFormviewModule = require(robloxGui.Modules.Flags.GetFFlagBetaBadgeLearnMoreLinkFormview)
local parent = script.Parent.Parent.Parent
local setKeepOutAreaModule = require(parent.Actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(parent.Actions.RemoveKeepOutArea)
local constantsModule = require(parent.Constants)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local _ = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(parent.Parent.Chrome.Service) else nil
menuIcon.validateProps = tModule.strictInterface({
	layoutOrder = tModule.integer,
	Analytics = tModule.table,
	setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.optional(tModule.callback),
	removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.optional(tModule.callback)
})
local _ = { FullScreen = 0, FormSheet = 2 }
local uDim2 = UDim2.fromOffset(31, 11)
local uDim = UDim.new(0, 12)
local uDim2_1 = UDim2.fromOffset(330, 185)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local var22 = function() --[[ line: 62 ]] end

function openWebview(p0) --[[ line: 67 ]]
	-- upvalues: httpService (ref), getFFlagBetaBadgeLearnMoreLinkFormviewModule (ref), name (ref), guiService (ref)
	local var23 = httpService:JSONEncode({
		visible = true,
		title = if game:GetEngineFeature("SetWebViewTitle") then "Help Center" else nil,
		presentationStyle = if getFFlagBetaBadgeLearnMoreLinkFormviewModule() then 2 else nil,
		url = p0
	})
	name:debug("Opening Webview with payload {}", var23)
	guiService:BroadcastNotification(var23, 20)
end

function menuIcon.init(p1) --[[ line: 80 ]]
	-- upvalues: roactModule (ref), VRService (ref), gamepadService (ref), default (ref), var22 (ref), getFStringVoiceBetaBadgeLearnMoreModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref)
	p1.buttonRef = roactModule.createRef()
	p1:setState({
		voiceChatServiceConnected = false,
		showPopup = false,
		vrShowMenuIcon = VRService.VREnabled and gamepadService.GamepadCursorEnabled
	})
	
	if game:GetEngineFeature("VoiceChatSupported") then
		default:asyncInit():andThen(function() --[[ line: 91 ]]
			-- upvalues: p1 (ref)
			p1:setState({ voiceChatServiceConnected = true })
		end):catch(var22)
	end
	function p1.menuIconActivated() --[[ line: 99 ]]
		-- upvalues: p1 (ref)
		p1:setState({ showPopup = not p1.state.showPopup })
		p1.props.Analytics.EventStream:setRBXEvent("voiceChat", if not p1.state.showPopup then "openBetaBadge" else "closeBetaBadge")
	end
	
	function p1.learnMore() --[[ line: 109 ]]
		-- upvalues: getFStringVoiceBetaBadgeLearnMoreModule (copy), p1 (ref)
		openWebview(getFStringVoiceBetaBadgeLearnMoreModule())
		p1.props.Analytics.EventStream:setRBXEvent("voiceChat", "clickBetaBadgeLearnMore")
	end
	
	if fFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
end

function menuIcon.render(p2) --[[ line: 121 ]]
	-- upvalues: VRService (ref), fFlagTopBarSignalizeKeepOutAreas (ref), constantsModule (ref), withStyle (ref), roactModule (ref), uDim2_1 (ref), robloxTranslatorModule (ref), uDim (ref), uDim2 (ref), appFonts (ref), gamepadService (ref), externalEventConnection (ref)
	local voiceChatServiceConnected
	if VRService.VREnabled then
		voiceChatServiceConnected = p2.state.vrShowMenuIcon and p2.state.voiceChatServiceConnected
	end
	local var25 = function(p3) --[[ line: 124 ]]
		-- upvalues: voiceChatServiceConnected (ref), fFlagTopBarSignalizeKeepOutAreas (copy), p2 (ref), constantsModule (copy)
		if voiceChatServiceConnected and p3 then
			local vector2 = Vector2.new(p3.AbsolutePosition.X - 2, p3.AbsolutePosition.Y - 2)
			local vector2_1 = Vector2.new(p3.AbsoluteSize.X + 4, p3.AbsoluteSize.Y + 4)
			
			if fFlagTopBarSignalizeKeepOutAreas then
				p2.keepOutAreasStore.setKeepOutArea(constantsModule.VoiceBetaBadgeKeepOutAreaId, vector2, vector2_1)
				
				return
			end
			p2.props.setKeepOutArea(constantsModule.VoiceBetaBadgeKeepOutAreaId, vector2, vector2_1)
			
			return
		elseif fFlagTopBarSignalizeKeepOutAreas then
			p2.keepOutAreasStore.removeKeepOutArea(constantsModule.VoiceBetaBadgeKeepOutAreaId)
			
			return
		end
		p2.props.removeKeepOutArea(constantsModule.VoiceBetaBadgeKeepOutAreaId)
	end
	
	if p2.buttonRef.current then
		var25(p2.buttonRef.current)
	end
	return withStyle(function(p4) --[[ line: 148 ]]
		-- upvalues: roactModule (copy), voiceChatServiceConnected (ref), p2 (ref), uDim2_1 (copy), robloxTranslatorModule (copy), uDim (copy), var25 (ref), uDim2 (copy), appFonts (copy), gamepadService (copy), externalEventConnection (copy), VRService (copy)
		local footer = p4.Font.Footer
		local font = footer.Font
		local var28 = p4.Font.BaseSize * footer.RelativeSize
		local backgroundUIContrast = p4.Theme.BackgroundUIContrast
		local textEmphasis = p4.Theme.TextEmphasis
		
		return roactModule.createFragment({
			PopupWrapper = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Visible = voiceChatServiceConnected and p2.state.showPopup,
				AutomaticSize = Enum.AutomaticSize.XY,
				LayoutOrder = p2.props.layoutOrder + 1
			}, {
				Popup = roactModule.createElement("Frame", {
					Size = uDim2_1,
					Position = UDim2.fromOffset(0, 10),
					BackgroundTransparency = backgroundUIContrast.Transparency,
					BackgroundColor3 = backgroundUIContrast.Color
				}, {
					Layout = roactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 8),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Popup = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						Layout = roactModule.createElement("UIListLayout", {
							Padding = UDim.new(0, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Starter = roactModule.createElement("TextLabel", {
							LayoutOrder = 0,
							BackgroundTransparency = 1,
							Text = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.HeaderList"),
							TextSize = var28,
							Font = font,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = textEmphasis.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						FirstBullet = roactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Text = "\226\128\162 " .. robloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.VoiceChatBullet"),
							TextSize = var28,
							Font = font,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = textEmphasis.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						})
					}),
					Text = roactModule.createElement("TextLabel", {
						LayoutOrder = 0,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Text = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.DisclaimerText2"),
						TextSize = var28,
						Font = font,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = textEmphasis.Color,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					LearnMoreLink = roactModule.createElement("TextButton", {
						Text = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.LearnMoreLink"),
						TextSize = var28,
						Font = font,
						LayoutOrder = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = p4.Theme.TextLink.Color,
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						[roactModule.Event.Activated] = p2.learnMore
					}),
					UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
					UIPadding = roactModule.createElement("UIPadding", {
						PaddingLeft = uDim,
						PaddingRight = uDim,
						PaddingBottom = uDim,
						PaddingTop = uDim
					})
				})
			}),
			Button = roactModule.createElement("Frame", {
				Visible = voiceChatServiceConnected,
				AutomaticSize = Enum.AutomaticSize.XY,
				LayoutOrder = p2.props.layoutOrder,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				[roactModule.Change.AbsoluteSize] = var25,
				[roactModule.Change.AbsolutePosition] = var25,
				[roactModule.Ref] = p2.buttonRef
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ActualButton = roactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					Visible = voiceChatServiceConnected,
					Size = uDim2,
					BackgroundColor3 = Color3.fromRGB(238, 206, 83)
				}, {
					Button = roactModule.createElement("TextButton", {
						Text = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.BadgeText"),
						Font = appFonts.default:getBold(),
						TextSize = 8,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = uDim2,
						TextColor3 = backgroundUIContrast.Color,
						[roactModule.Event.Activated] = p2.menuIconActivated
					}),
					UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) }),
					UIStroke = roactModule.createElement("UIStroke", { Thickness = 2, Color = textEmphasis.Color }),
					VREnabledListener = gamepadService and roactModule.createElement(externalEventConnection, {
						event = gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"),
						callback = function() --[[ line: 282 ]]
							-- upvalues: p2 (copy), VRService (copy), gamepadService (copy)
							p2:setState({
								vrShowMenuIcon = VRService.VREnabled and gamepadService.GamepadCursorEnabled
							})
						end or nil
					})
				})
			})
		})
	end)
end

return if fFlagTopBarSignalizeKeepOutAreas then menuIcon else roactRoduxModule.UNSTABLE_connect2(nil, function(p5) --[[ line: 294 | named "mapDispatchToProps" ]]
	-- upvalues: fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return if fFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(value, p6, p7) --[[ line: 299 ]]
			-- upvalues: p5 (ref), setKeepOutAreaModule (copy)
			return p5(setKeepOutAreaModule(value, p6, p7))
		end,
		removeKeepOutArea = function(p8) --[[ line: 302 ]]
			-- upvalues: p5 (ref), removeKeepOutAreaModule (copy)
			return p5(removeKeepOutAreaModule(p8))
		end
	}
end)(menuIcon)