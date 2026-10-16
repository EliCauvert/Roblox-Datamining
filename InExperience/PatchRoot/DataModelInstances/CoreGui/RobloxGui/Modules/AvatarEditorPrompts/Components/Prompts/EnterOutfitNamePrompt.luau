local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local ButtonType = require(CorePackages.Packages.UIBlox).App.Button.Enum.ButtonType
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local PromptWithTextFieldModule = require(Parent.Prompts.PromptWithTextField)
local SignalCreateOutfitPermissionDeniedModule = require(Parent1.Thunks.SignalCreateOutfitPermissionDenied)
local PerformCreateOutfitModule = require(Parent1.Thunks.PerformCreateOutfit)
local EnterOutfitNamePrompt = RoactModule.PureComponent:extend("EnterOutfitNamePrompt")
EnterOutfitNamePrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	signalCreateOutfitPermissionDenied = TModule.callback,
	performCreateOutfit = TModule.callback
})

function EnterOutfitNamePrompt.init(p1) --[[ Line: 33 ]]
	-- upvalues: RoactModule (copy)
	p1:setState({
		outfitName = "",
		alertPosition = UDim2.fromScale(0.5, 0.5)
	})
	p1.textBoxRef = RoactModule.createRef()
	
	function p1.confirmCreateOutfit() --[[ Line: 41 ]]
		-- upvalues: p1 (copy)
		p1.props.performCreateOutfit(p1.state.outfitName)
	end
	
	function p1.textUpdated(OutfitName) --[[ Line: 45 ]]
		-- upvalues: p1 (copy)
		p1:setState({ outfitName = OutfitName })
	end
end

function EnterOutfitNamePrompt.render(p1) --[[ Line: 52 ]]
	-- upvalues: RoactModule (copy), PromptWithTextFieldModule (copy), RobloxTranslatorModule (copy), ButtonType (copy)
	return RoactModule.createElement(PromptWithTextFieldModule, {
		fieldText = p1.state.outfitName,
		onFieldTextUpdated = p1.textUpdated,
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptTitle"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalCreateOutfitPermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDisabled = p1.state.outfitName == "",
						onActivated = p1.confirmCreateOutfit,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
					}
				}
			}
		}
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 82 | Named "mapStateToProps" ]]
	return { screenSize = p1.screenSize }
end, function(Callback) --[[ Line: 88 | Named "mapDispatchToProps" ]]
	-- upvalues: SignalCreateOutfitPermissionDeniedModule (copy), PerformCreateOutfitModule (copy)
	return {
		signalCreateOutfitPermissionDenied = function() --[[ Line: 90 ]]
			-- upvalues: Callback (copy), SignalCreateOutfitPermissionDeniedModule (upval)
			return Callback(SignalCreateOutfitPermissionDeniedModule)
		end,
		performCreateOutfit = function(p1) --[[ Line: 94 ]]
			-- upvalues: Callback (copy), PerformCreateOutfitModule (upval)
			return Callback(PerformCreateOutfitModule(p1))
		end
	}
end)(EnterOutfitNamePrompt)