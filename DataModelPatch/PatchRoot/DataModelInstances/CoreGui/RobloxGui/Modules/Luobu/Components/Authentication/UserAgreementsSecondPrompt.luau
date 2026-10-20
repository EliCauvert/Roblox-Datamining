local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local UserAgreementsSecondPrompt = RoactModule.PureComponent:extend("UserAgreementsSecondPrompt")
UserAgreementsSecondPrompt.validateProps = TModule.strictInterface({
	agreements = TModule.array(TModule.strictInterface({
		id = TModule.string,
		agreementType = TModule.string,
		clientType = TModule.string,
		displayUrl = TModule.string,
		regulationType = TModule.string
	})),
	agreementsListItems = TModule.table,
	screenSize = TModule.Vector2,
	showFirstPrompt = TModule.callback
})

function UserAgreementsSecondPrompt.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.onAck()
		-- upvalues: p1 (copy)
		p1.props.showFirstPrompt(p1.props.agreements)
	end
	
	function p1.renderMiddleContent(p2, p3)
		-- upvalues: p1 (copy), RoactModule (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Agreements = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Prefix = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 12)
				}, {
					PrefixText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, 0),
						Text = p2.bodyTextPart1,
						Font = _Font.CaptionHeader.Font,
						TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) })
				}),
				AgreementsList = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY
				}, p1.props.agreementsListItems),
				Suffix = RoactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 12)
				}, {
					Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 12) }),
					PrefixText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, 0),
						Text = p2.bodyTextPart2,
						Font = _Font.CaptionHeader.Font,
						TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					})
				})
			})
		})
	end
end

function UserAgreementsSecondPrompt.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local ScreenSize = p1.props.screenSize
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), RoactModule (upval), InteractiveAlert (upval), p1 (copy), ButtonType (upval), ScreenSize (copy)
		return WithLocalizationModule({
			title = "Luobu.Authentication.UserAgreementsSecondPrompt.Title",
			bodyTextPart1 = "Luobu.Authentication.UserAgreementsSecondPrompt.BodyText.Part1",
			bodyTextPart2 = "Luobu.Authentication.UserAgreementsSecondPrompt.BodyText.Part2",
			buttonText = "Luobu.Authentication.UserAgreementsSecondPrompt.Button.Acknowledge"
		})(function(p3)
			-- upvalues: RoactModule (upval), InteractiveAlert (upval), p1 (upval), p2 (copy), ButtonType (upval), ScreenSize (upval)
			return RoactModule.createElement(InteractiveAlert, {
				title = p3.title,
				middleContent = function()
					-- upvalues: p1 (upval), p3 (copy), p2 (upval)
					return p1.renderMiddleContent(p3, p2)
				end,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.PrimarySystem,
							props = { onActivated = p1.onAck, text = p3.buttonText }
						}
					}
				},
				position = UDim2.fromScale(0.5, 0.5),
				screenSize = ScreenSize
			})
		end)
	end)
end

return (RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return {
		showFirstPrompt = function(Agreements)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(SetCentralOverlayModule(OverlayTypeModule.UserAgreementsPrompt, {
				agreements = Agreements,
				context = OverlayTypeModule.UserAgreementsSecondPrompt
			}))
		end
	}
end)(UserAgreementsSecondPrompt))