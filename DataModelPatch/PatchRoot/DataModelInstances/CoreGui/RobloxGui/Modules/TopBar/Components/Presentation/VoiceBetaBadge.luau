local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = require(RobloxGui.Modules.TenFootInterface)
local _ = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local _ = require(RobloxGui.Modules.InGameMenuConstants)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local MenuIcon = RoactModule.PureComponent:extend("MenuIcon")
local GetFStringVoiceBetaBadgeLearnMoreModule = require(RobloxGui.Modules.Flags.GetFStringVoiceBetaBadgeLearnMore)
local GetFFlagBetaBadgeLearnMoreLinkFormviewModule = require(RobloxGui.Modules.Flags.GetFFlagBetaBadgeLearnMoreLinkFormview)
local Parent = script.Parent.Parent.Parent
local SetKeepOutAreaModule = require(Parent.Actions.SetKeepOutArea)
local RemoveKeepOutAreaModule = require(Parent.Actions.RemoveKeepOutArea)
local ConstantsModule = require(Parent.Constants)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local Chrome = Parent.Parent.Chrome

if require(CorePackages.Workspace.Packages.Chrome).Enabled() then
	local _ = require(Chrome.Service)
end
MenuIcon.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	Analytics = TModule.table,
	setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.optional(TModule.callback),
	removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.optional(TModule.callback)
})
local _UDim2 = UDim2.fromOffset(31, 11)
local _UDim = UDim.new(0, 12)
local _UDim2_1 = UDim2.fromOffset(330, 185)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)

local function v31() end

function openWebview(Url)
	-- upvalues: HttpService (copy), GetFFlagBetaBadgeLearnMoreLinkFormviewModule (copy), NewResult (copy), GuiService (copy)
	local Json = HttpService:JSONEncode({
		visible = true,
		title = if game:GetEngineFeature("SetWebViewTitle") then "Help Center" else nil,
		presentationStyle = if GetFFlagBetaBadgeLearnMoreLinkFormviewModule() then 2 else nil,
		url = Url
	})
	NewResult:debug("Opening Webview with payload {}", Json)
	GuiService:BroadcastNotification(Json, 20)
end

function MenuIcon.init(p1)
	-- upvalues: RoactModule (copy), VRService (copy), GamepadService (copy), Default (copy), v31 (copy), GetFStringVoiceBetaBadgeLearnMoreModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy)
	p1.buttonRef = RoactModule.createRef()
	p1:setState({
		voiceChatServiceConnected = false,
		showPopup = false,
		vrShowMenuIcon = VRService.VREnabled and GamepadService.GamepadCursorEnabled
	})
	
	if game:GetEngineFeature("VoiceChatSupported") then
		Default:asyncInit():andThen(function()
			-- upvalues: p1 (copy)
			p1:setState({ voiceChatServiceConnected = true })
		end):catch(v31)
	end
	function p1.menuIconActivated()
		-- upvalues: p1 (copy)
		p1:setState({ showPopup = not p1.state.showPopup })
		p1.props.Analytics.EventStream:setRBXEvent("voiceChat", if p1.state.showPopup then "closeBetaBadge" else "openBetaBadge")
	end
	
	function p1.learnMore()
		-- upvalues: GetFStringVoiceBetaBadgeLearnMoreModule (upval), p1 (copy)
		openWebview((GetFStringVoiceBetaBadgeLearnMoreModule()))
		p1.props.Analytics.EventStream:setRBXEvent("voiceChat", "clickBetaBadgeLearnMore")
	end
	
	if FFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
end

function MenuIcon.render(p1)
	-- upvalues: VRService (copy), FFlagTopBarSignalizeKeepOutAreas (copy), ConstantsModule (copy), WithStyleFunction (copy), RoactModule (copy), _UDim2_1 (copy), RobloxTranslatorModule (copy), _UDim (copy), _UDim2 (copy), AppFonts (copy), GamepadService (copy), ExternalEventConnection (copy)
	local VoiceChatServiceConnected = if VRService.VREnabled then p1.state.vrShowMenuIcon and p1.state.voiceChatServiceConnected else p1.state.voiceChatServiceConnected
	
	local function v35(Frame: Frame)
		-- upvalues: VoiceChatServiceConnected (copy), FFlagTopBarSignalizeKeepOutAreas (upval), p1 (copy), ConstantsModule (upval)
		if VoiceChatServiceConnected and Frame then
			local _Vector2 = Vector2.new(Frame.AbsolutePosition.X - 2, Frame.AbsolutePosition.Y - 2)
			local _Vector2_1 = Vector2.new(Frame.AbsoluteSize.X + 4, Frame.AbsoluteSize.Y + 4)
			
			if FFlagTopBarSignalizeKeepOutAreas then
				p1.keepOutAreasStore.setKeepOutArea(ConstantsModule.VoiceBetaBadgeKeepOutAreaId, _Vector2, _Vector2_1)
				
				return
			else
				p1.props.setKeepOutArea(ConstantsModule.VoiceBetaBadgeKeepOutAreaId, _Vector2, _Vector2_1)
				
				return
			end
		elseif FFlagTopBarSignalizeKeepOutAreas then
			p1.keepOutAreasStore.removeKeepOutArea(ConstantsModule.VoiceBetaBadgeKeepOutAreaId)
			
			return
		else
			p1.props.removeKeepOutArea(ConstantsModule.VoiceBetaBadgeKeepOutAreaId)
		end
	end
	
	if p1.buttonRef.current then
		v35(p1.buttonRef.current)
	end
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), VoiceChatServiceConnected (copy), p1 (copy), _UDim2_1 (upval), RobloxTranslatorModule (upval), _UDim (upval), v35 (copy), _UDim2 (upval), AppFonts (upval), GamepadService (upval), ExternalEventConnection (upval), VRService (upval)
		local Footer = p2.Font.Footer
		local FooterFont = Footer.Font
		local ScaledBaseSize = p2.Font.BaseSize * Footer.RelativeSize
		local BackgroundUIContrast = p2.Theme.BackgroundUIContrast
		local TextEmphasis = p2.Theme.TextEmphasis
		
		return RoactModule.createFragment({
			PopupWrapper = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Visible = VoiceChatServiceConnected and p1.state.showPopup,
				AutomaticSize = Enum.AutomaticSize.XY,
				LayoutOrder = p1.props.layoutOrder + 1
			}, {
				Popup = RoactModule.createElement("Frame", {
					Size = _UDim2_1,
					Position = UDim2.fromOffset(0, 10),
					BackgroundTransparency = BackgroundUIContrast.Transparency,
					BackgroundColor3 = BackgroundUIContrast.Color
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 8),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Popup = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						Layout = RoactModule.createElement("UIListLayout", {
							Padding = UDim.new(0, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Starter = RoactModule.createElement("TextLabel", {
							LayoutOrder = 0,
							BackgroundTransparency = 1,
							Text = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.HeaderList"),
							TextSize = ScaledBaseSize,
							Font = FooterFont,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = TextEmphasis.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						FirstBullet = RoactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Text = "• " .. RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.VoiceChatBullet"),
							TextSize = ScaledBaseSize,
							Font = FooterFont,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = TextEmphasis.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						})
					}),
					Text = RoactModule.createElement("TextLabel", {
						LayoutOrder = 0,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Text = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.DisclaimerText2"),
						TextSize = ScaledBaseSize,
						Font = FooterFont,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = TextEmphasis.Color,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					LearnMoreLink = RoactModule.createElement("TextButton", {
						Text = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.Popup.LearnMoreLink"),
						TextSize = ScaledBaseSize,
						Font = FooterFont,
						LayoutOrder = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = p2.Theme.TextLink.Color,
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						[RoactModule.Event.Activated] = p1.learnMore
					}),
					UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
					UIPadding = RoactModule.createElement("UIPadding", {
						PaddingLeft = _UDim,
						PaddingRight = _UDim,
						PaddingBottom = _UDim,
						PaddingTop = _UDim
					})
				})
			}),
			Button = RoactModule.createElement("Frame", {
				Visible = VoiceChatServiceConnected,
				AutomaticSize = Enum.AutomaticSize.XY,
				LayoutOrder = p1.props.layoutOrder,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				[RoactModule.Change.AbsoluteSize] = v35,
				[RoactModule.Change.AbsolutePosition] = v35,
				[RoactModule.Ref] = p1.buttonRef
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ActualButton = RoactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					Visible = VoiceChatServiceConnected,
					Size = _UDim2,
					BackgroundColor3 = Color3.fromRGB(238, 206, 83)
				}, {
					Button = RoactModule.createElement("TextButton", {
						Text = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Badge.BadgeText"),
						Font = AppFonts.default:getBold(),
						TextSize = 8,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = _UDim2,
						TextColor3 = BackgroundUIContrast.Color,
						[RoactModule.Event.Activated] = p1.menuIconActivated
					}),
					UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) }),
					UIStroke = RoactModule.createElement("UIStroke", { Thickness = 2, Color = TextEmphasis.Color }),
					VREnabledListener = GamepadService and RoactModule.createElement(ExternalEventConnection, {
						event = GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"),
						callback = function()
							-- upvalues: p1 (upval), VRService (upval), GamepadService (upval)
							p1:setState({
								vrShowMenuIcon = VRService.VREnabled and GamepadService.GamepadCursorEnabled
							})
						end or nil
					})
				})
			})
		})
	end)
end

local function mapDispatchToProps(Callback)
	-- upvalues: FFlagTopBarSignalizeKeepOutAreas (copy), SetKeepOutAreaModule (copy), RemoveKeepOutAreaModule (copy)
	return if FFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetKeepOutAreaModule (upval)
			return Callback(SetKeepOutAreaModule(p1, p2, p3))
		end,
		removeKeepOutArea = function(p1)
			-- upvalues: Callback (copy), RemoveKeepOutAreaModule (upval)
			return Callback(RemoveKeepOutAreaModule(p1))
		end
	}
end

return if FFlagTopBarSignalizeKeepOutAreas then MenuIcon else RoactRoduxModule.UNSTABLE_connect2(nil, mapDispatchToProps)(MenuIcon)