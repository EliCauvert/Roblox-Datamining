local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local robloxTranslatorModule = require(parent.RobloxTranslator)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useStyle = UIBloxModule.Core.Style.useStyle
local var1 = robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.WhyThisAd")
local var2 = robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Action.Close")
local interactiveAlert_1 = roactModule.Component:extend("InteractiveAlert")

function interactiveAlert_1.init(p1)
	p1.state = { animating = false, screenSize = Vector2.new(0, 0) }
end

function interactiveAlert_1.renderWithStyle(p1, _)
	-- upvalues: buttonType (ref), var2 (ref), roactModule (ref), interactiveAlert (ref), var1 (ref)
	return roactModule.createFragment({
		Frame = roactModule.createElement("Frame", {
			Selectable = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[roactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: p1 (ref)
				p1:setState({ screenSize = p2.AbsoluteSize })
			end
		}, {
			InteractiveAlert = roactModule.createElement(interactiveAlert, {
				screenSize = p1.state.screenSize,
				title = var1,
				bodyText = p1.props.bodyText,
				buttonStackInfo = {
					buttons = {
						{
							isDefaultChild = true,
							buttonType = buttonType.PrimarySystem,
							props = {
								onActivated = function()
									-- upvalues: p1 (ref)
									p1.props.handler:hidePrompt()
								end,
								text = var2
							}
						}
					}
				}
			})
		})
	})
end

function interactiveAlert_1.render(p1)
	return p1:renderWithStyle(p1.props.style)
end

return function(p1)
	-- upvalues: useStyle (ref), cryoModule (ref), roactModule (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), interactiveAlert_1 (ref)
	return roactModule.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = roactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			WrappedEuDsaPrompt = roactModule.createElement(interactiveAlert_1, cryoModule.Dictionary.join(p1, { style = useStyle() }))
		})
	})
end