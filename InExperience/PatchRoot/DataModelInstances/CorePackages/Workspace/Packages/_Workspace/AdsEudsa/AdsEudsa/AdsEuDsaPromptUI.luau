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
local var5 = robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.WhyThisAd")
local var6 = robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Action.Close")
local interactiveAlert_1 = roactModule.Component:extend("InteractiveAlert")

function interactiveAlert_1.init(p0) --[[ line: 28 ]]
	p0.state = { animating = false, screenSize = Vector2.new(0, 0) }
end

function interactiveAlert_1.renderWithStyle(p1, _) --[[ line: 35 ]]
	-- upvalues: buttonType (ref), var6 (ref), roactModule (ref), interactiveAlert (ref), var5 (ref)
	return roactModule.createFragment({
		Frame = roactModule.createElement("Frame", {
			Selectable = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[roactModule.Change.AbsoluteSize] = function(p2) --[[ line: 55 ]]
				-- upvalues: p1 (ref)
				p1:setState({ screenSize = p2.AbsoluteSize })
			end
		}, {
			InteractiveAlert = roactModule.createElement(interactiveAlert, {
				screenSize = p1.state.screenSize,
				title = var5,
				bodyText = p1.props.bodyText,
				buttonStackInfo = {
					buttons = {
						{
							isDefaultChild = true,
							buttonType = buttonType.PrimarySystem,
							props = {
								onActivated = function() --[[ line: 39 ]]
									-- upvalues: p1 (ref)
									p1.props.handler:hidePrompt()
								end,
								text = var6
							}
						}
					}
				}
			})
		})
	})
end

function interactiveAlert_1.render(p3) --[[ line: 76 ]]
	return p3:renderWithStyle(p3.props.style)
end

return function(p4) --[[ line: 81 ]]
	-- upvalues: useStyle (ref), cryoModule (ref), roactModule (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), interactiveAlert_1 (ref)
	return roactModule.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = roactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			WrappedEuDsaPrompt = roactModule.createElement(interactiveAlert_1, cryoModule.Dictionary.join(p4, { style = useStyle() }))
		})
	})
end