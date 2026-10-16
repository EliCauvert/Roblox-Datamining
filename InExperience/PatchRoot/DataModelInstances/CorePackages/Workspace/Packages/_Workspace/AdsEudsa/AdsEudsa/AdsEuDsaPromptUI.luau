local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
local CoreScriptsRootProvider = require(Parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local RobloxTranslatorModule = require(Parent.RobloxTranslator)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseStyle = UIBloxModule.Core.Style.useStyle
local CoreScriptsAdsLabelWhyThisAd = RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.WhyThisAd")
local CoreScriptsAdsActionClose = RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Action.Close")
local InteractiveAlert1 = RoactModule.Component:extend("InteractiveAlert")

function InteractiveAlert1.init(p1) --[[ Line: 28 ]]
	p1.state = { animating = false, screenSize = Vector2.new(0, 0) }
end

function InteractiveAlert1.renderWithStyle(p1, _) --[[ Line: 35 ]]
	-- upvalues: ButtonType (copy), CoreScriptsAdsActionClose (copy), RoactModule (copy), InteractiveAlert (copy), CoreScriptsAdsLabelWhyThisAd (copy)
	return RoactModule.createFragment({
		Frame = RoactModule.createElement("Frame", {
			Selectable = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 55 ]]
				-- upvalues: p1 (copy)
				p1:setState({ screenSize = Frame.AbsoluteSize })
			end
		}, {
			InteractiveAlert = RoactModule.createElement(InteractiveAlert, {
				screenSize = p1.state.screenSize,
				title = CoreScriptsAdsLabelWhyThisAd,
				bodyText = p1.props.bodyText,
				buttonStackInfo = {
					buttons = {
						{
							isDefaultChild = true,
							buttonType = ButtonType.PrimarySystem,
							props = {
								onActivated = function() --[[ Line: 39 ]]
									-- upvalues: p1 (copy)
									p1.props.handler:hidePrompt()
								end,
								text = CoreScriptsAdsActionClose
							}
						}
					}
				}
			})
		})
	})
end

function InteractiveAlert1.render(p1) --[[ Line: 76 ]]
	return p1:renderWithStyle(p1.props.style)
end

return function(p1) --[[ Line: 81 ]]
	-- upvalues: UseStyle (copy), CryoModule (copy), RoactModule (copy), CoreScriptsRootProvider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), InteractiveAlert1 (copy)
	return RoactModule.createElement(CoreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = RoactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			WrappedEuDsaPrompt = RoactModule.createElement(InteractiveAlert1, (CryoModule.Dictionary.join(p1, { style = UseStyle() })))
		})
	})
end